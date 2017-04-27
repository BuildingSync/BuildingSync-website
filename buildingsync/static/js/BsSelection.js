var app = angular.module('BsSelection', ['ui.grid', 'ui.grid.grouping', 'ui.router', 'ngCookies'], ['$interpolateProvider', function ($interpolateProvider) {
    $interpolateProvider.startSymbol('{$');
    $interpolateProvider.endSymbol('$}');
}]);

app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', '$httpProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) {
        $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
        $httpProvider.defaults.xsrfCookieName = 'csrftoken';
        $locationProvider.hashPrefix('');
        $urlRouterProvider.otherwise('/');
        $stateProvider.state('main', {
            url: '/',
            templateUrl: '/static/partials/view.html',
            controller: 'BsController',
            resolve: {
                schemas: function (SchemaService) {
                    return SchemaService.getSchemas();
                },
                useCases: function (UseCaseService) {
                    return UseCaseService.getUseCases();
                },
                attributes: function (AttributeService) {
                    return AttributeService.getAttributes();
                }
            }
        });
    }
]);

app.factory("SchemaService", ['$http', function ($http) {
    const service = {};
    service.getSchemas = function () {
        return $http.get('/bs/api/schemas/').then(function (response) {
            return response.data;
        });
    };
    return service;
}]);

app.factory("AttributeService", ['$http', function ($http) {
    const service = {};
    service.getAttributes = function () {
        return $http.get('/bs/api/attributes/').then(function (response) {
            return response.data;
        });
    };
    return service;
}]);

app.factory("UseCaseService", ['$http', function ($http) {
    const service = {};
    service.postUseCase = function (obj) {
        return $http.post("/bs/api/use_cases/", obj).then(function (data) {
            return {
                complete: true,
                data: data
            };
        });
    };
    service.deleteUseCase = function (pk) {
        return $http.delete("/bs/api/use_cases/" + pk + "/").then(function () {
        });
    };
    service.getUseCases = function () {
        return $http.get('/bs/api/use_cases/').then(function (response) {
            return response.data;
        });
    };
    return service;
}]);

app.controller('BsController',
    [
        '$scope',
        '$http',
        '$interval',
        'uiGridGroupingConstants',
        'schemas',
        'useCases',
        'attributes',
        'UseCaseService',
        function ($scope, $http, $interval, uiGridGroupingConstants, schemas, useCases, attributes, UseCaseService) {
            var one_schema = _.find(schemas, {version: 2});
            $scope.schema_nickname = one_schema.name;
            $scope.useCases = useCases;
            $scope.attributesData = attributes;
            $scope.matching_attributes = _.filter(attributes, {schema: one_schema.pk});
            angular.forEach($scope.matching_attributes, function (value, key) {
                value.$$treeLevel = value.tree_level;  // $$treeLevel isn't allowed as a Django db model field, convert here
            });
            $scope.columnDefs = [
                {
                    name: 'name',
                    displayName: 'BuildingSync Attribute',
                    width: '50%'
                }
            ];
            angular.forEach(useCases, function (value, key) {
                $scope.columnDefs.push({
                    name: value.nickname,
                    displayName: value.nickname,
                    type: 'boolean',
                    cellTemplate: '<input type="checkbox">',
                    visible: value.show
                });
            });
            $scope.gridOptions = {
                treeRowHeaderAlwaysVisible: false,
                showTreeExpandNoChildren: false,
                enableRowSelection: false,
                enableRowHeaderSelection: true,
                columnDefs: $scope.columnDefs,
                onRegisterApi: function (gridApi) {
                    $scope.gridApi = gridApi;
                },
                data: 'matching_attributes'
            };
            $scope.addBlankUseCase = function () {
                UseCaseService.postUseCase({nickname: $scope.useCaseName}).then(UseCaseService.getUseCases).then(function(useCases) {
                    $scope.useCases = useCases;
                });
            };
            $scope.deleteUseCase = function (x) {
                UseCaseService.deleteUseCase(x.id).then(UseCaseService.getUseCases).then(function (useCases) {
                    $scope.useCases = useCases;

                });
            };
            $scope.copyUseCase = function (x) {
                UseCaseService.postUseCase({nickname: x.nickname}).then(UseCaseService.getUseCases).then(function(useCases) {
                    $scope.useCases = useCases;
                })
            }
        }
    ]
);
