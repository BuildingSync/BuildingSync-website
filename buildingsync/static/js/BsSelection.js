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
        $stateProvider
            .state('main', {
                url: '/',
                templateUrl: '/static/partials/view.html',
                controller: 'BsController',
                resolve: {
                    schemas: function ($http) {
                        return $http.get('/bs/api/schemas/').then(function (response) {
                            return response.data;
                        });
                    },
                    useCaseData: function ($http) {
                        return $http.get('/bs/api/use_cases/').then(function (response) {
                            return response.data;
                        })
                    },
                    attributesData: function ($http) {
                        return $http.get('/bs/api/attributes/').then(function (response) {
                            return response.data;
                        })
                    }
                }
            });
    }
]);

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
    service.deleteUseCase = function (obj, pk) {
        return $http.delete("/bs/api/use_cases/pk", obj).then(function (data) {
            return {
                complete: true,
                data: data
            };
        });
    };
    return service;
}]);

app.controller('BsController',
    ['$scope', '$http', '$interval', 'uiGridGroupingConstants', 'schemas', 'useCaseData', 'attributesData', 'UseCaseService',
        function ($scope, $http, $interval, uiGridGroupingConstants, schemas, useCaseData, attributesData, UseCaseService) {
            var one_schema = _.find(schemas, {version: 2});
            $scope.schema_nickname = one_schema.name;
            $scope.useCases = useCaseData;
            $scope.attributesData = attributesData;
            $scope.matching_attributes = _.filter(attributesData, {schema: one_schema.pk});
            console.log($scope.matching_attributes.length);
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
            angular.forEach(useCaseData, function (value, key) {
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
                UseCaseService.postUseCase({name: $scope.useCaseName});
            };
        }
    ]
);
