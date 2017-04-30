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

app.factory("UserService", ['$http', function ($http) {
    const service = {};
    service.getCurrentUserId = function () {
        return $http.get('/bs/api/current_user_id/').then(function (response) {
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
        'uiGridConstants',
        'uiGridGroupingConstants',
        'schemas',
        'useCases',
        'attributes',
        'UseCaseService',
        'UserService',
        function ($scope, $http, $interval, uiGridConstants, uiGridGroupingConstants, schemas, useCases, attributes, UseCaseService, UserService) {
            var one_schema = _.find(schemas, {version: 2});
            $scope.schema_nickname = one_schema.name;
            $scope.useCases = useCases;
            $scope.attributesData = attributes;
            $scope.matching_attributes = _.filter(attributes, {schema: one_schema.id});
            angular.forEach($scope.matching_attributes, function (value) {
                value.$$treeLevel = value.tree_level;  // $$treeLevel isn't allowed as a Django db model field, convert here
            });
            $scope.rebuild_columns = function () {
                $scope.columns = null;
                $scope.columns = [
                    {
                        name: 'name',
                        displayName: 'BuildingSync Attribute',
                        width: '40%'
                    }
                ];
                angular.forEach(useCases, function (use_case) {
                    $scope.columns.push({
                        name: use_case.nickname,
                        type: 'boolean',
                        cellTemplate: '<input type="checkbox">',
                        visible: use_case.show,
                        use_case_id: use_case.id
                    });
                });
            };
            $scope.rebuild_columns();
            $scope.gridOptions = {
                treeRowHeaderAlwaysVisible: false,
                showTreeExpandNoChildren: false,
                enableRowSelection: false,
                enableRowHeaderSelection: true,
                onRegisterApi: function (gridApi) {
                    $scope.gridApi = gridApi;
                },
                data: 'matching_attributes',
                columnDefs: $scope.columns
            };
            $scope.addBlankUseCase = function () {
                var newUseCaseID = null;
                UserService.getCurrentUserId()
                    .then(function (u_id) {
                        UseCaseService.postUseCase({owner: u_id.id, nickname: $scope.useCaseName})
                            .then(function (newUseCase) {
                                newUseCaseID = newUseCase.data.data.id;
                            })
                            .then(UseCaseService.getUseCases)
                            .then(function (useCases) {
                                $scope.useCases = useCases;
                            })
                            .then(function () {
                                $scope.columns.push({
                                    name: $scope.useCaseName,
                                    type: 'boolean',
                                    cellTemplate: '<input type="checkbox">',
                                    visible: true,
                                    use_case_id: newUseCaseID
                                });
                                $scope.gridApi.core.notifyDataChange(uiGridConstants.dataChange.COLUMN);
                            });
                    })
            };
            $scope.deleteUseCase = function (x) {
                if (!confirm("Delete the Use Case?")) {
                    return;
                }
                var deletedUseCaseID = x.id;
                UseCaseService.deleteUseCase(deletedUseCaseID)
                    .then(UseCaseService.getUseCases)
                    .then(function (useCases) {
                        $scope.useCases = useCases;
                    })
                    .then(function () {
                        var deleted_index = $scope.columns.findIndex(function (element) {
                            return element.use_case_id == deletedUseCaseID;
                        });
                        $scope.columns.splice(deleted_index, 1);
                        $scope.gridApi.core.notifyDataChange(uiGridConstants.dataChange.COLUMN);
                    });
            };
            $scope.copyUseCase = function (originalUseCase) {
                var newUseCaseName = null;
                for (var i = 2; i < 10; i++) {
                    newUseCaseName = originalUseCase.nickname + i;
                    var indexOfThis = $scope.columns.findIndex(function (element) {
                        return element.name == newUseCaseName;
                    });
                    if (indexOfThis == -1) {
                        break;
                    }
                }
                UserService.getCurrentUserId()
                    .then(function (u_id) {
                        UseCaseService.postUseCase({owner: u_id.id, nickname: newUseCaseName})
                            .then(function (newUseCase) {
                                newUseCaseID = newUseCase.id;
                            })
                            .then(UseCaseService.getUseCases)
                            .then(function (useCases) {
                                $scope.useCases = useCases;
                            })
                            .then(function () {
                                $scope.columns.push({
                                    name: newUseCaseName,
                                    type: 'boolean',
                                    cellTemplate: '<input type="checkbox">',
                                    visible: true,
                                    use_case_id: newUseCaseID
                                });
                                $scope.gridApi.core.notifyDataChange(uiGridConstants.dataChange.COLUMN);
                            });
                    });
            };
            $scope.updateSelection = function (useCase) {
                var id_to_update = useCase.id;  // store this here momentarily instead of passing it through the chain
                UseCaseService.updateUseCase(useCase.id, {show: useCase.show})
                    .then(function (useCase) {
                        var column_to_update = _.find($scope.columns, {use_case_id: id_to_update});
                        column_to_update.visible = useCase.show;
                        $scope.gridApi.core.notifyDataChange(uiGridConstants.dataChange.COLUMN);
                    });
            };
        }
    ]
);
