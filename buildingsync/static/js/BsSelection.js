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
    service.updateUseCase = function (pk, obj) {
        return $http.put('/bs/api/use_cases/' + pk + '/', obj).then(function (response) {
            return response.data;
        })
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
            angular.forEach($scope.matching_attributes, function (value) {
                value.$$treeLevel = value.tree_level;  // $$treeLevel isn't allowed as a Django db model field, convert here
            });
            $scope.gridOptions = {
                treeRowHeaderAlwaysVisible: false,
                showTreeExpandNoChildren: false,
                enableRowSelection: false,
                enableRowHeaderSelection: true,
                onRegisterApi: function (gridApi) {
                    $scope.gridApi = gridApi;
                },
                data: 'matching_attributes'
            };
            $scope.gridOptions.columnDefs = [
                {
                    name: 'name',
                    displayName: 'BuildingSync Attribute',
                    width: '50%'
                }
            ];
            angular.forEach(useCases, function (use_case) {
                $scope.gridOptions.columnDefs.push({
                    name: use_case.nickname,
                    displayName: use_case.nickname,
                    type: 'boolean',
                    cellTemplate: '<input type="checkbox">',
                    visible: use_case.show,
                    use_case_id: use_case.id
                });
            });
            $scope.addBlankUseCase = function () {
                UseCaseService.postUseCase({nickname: $scope.useCaseName})
                    .then(UseCaseService.getUseCases)
                    .then(function (useCases) {
                        $scope.useCases = useCases;
                    })
            };
            $scope.deleteUseCase = function (x) {
                UseCaseService.deleteUseCase(x.id)
                    .then(UseCaseService.getUseCases)
                    .then(function (useCases) {
                        $scope.useCases = useCases;
                    })
            };
            $scope.copyUseCase = function (x) {
                UseCaseService.postUseCase({nickname: x.nickname})
                    .then(UseCaseService.getUseCases)
                    .then(function (useCases) {
                        $scope.useCases = useCases;
                    })
            };
            $scope.updateSelection = function (useCase) {
                var id_to_update = useCase.id;  // store this here momentarily instead of passing it through the chain
                UseCaseService.updateUseCase(useCase.id, {show: useCase.show})
                    .then(function (useCase) {
                        var column_to_update = _.find($scope.gridOptions.columnDefs, {use_case_id: id_to_update});
                        column_to_update.visible = useCase.show;
                    });
            };
        }
    ]
);
