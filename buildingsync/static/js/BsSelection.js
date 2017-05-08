var app = angular.module(
    'BsSelection',
    ['ui.grid', 'ui.grid.grouping', 'ui.router', 'ngCookies'],
    ['$interpolateProvider', function ($interpolateProvider) {
        $interpolateProvider.startSymbol('{$');
        $interpolateProvider.endSymbol('$}');
    }]
);

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

app.run(['$rootScope',
    function ($rootScope) {
        $rootScope._ = window._;
    }
]);

app.factory("SchemaService", ['$http', function ($http) {
    const service = {};
    service.getSchemas = function () {
        return $http.get('/api/schemas/').then(function (response) {
            return response.data;
        });
    };
    service.initSchema = function () {
        return $http.get('/api/schemas/initialize_schema').then(function (response) {
            return response.data.schema;
        })
    };
    return service;
}]);

app.factory("AttributeService", ['$http', function ($http) {
    const service = {};
    service.getAttributes = function () {
        return $http.get('/api/attributes/').then(function (response) {
            return response.data;
        });
    };
    service.addUseCaseNum = function (row_pk, use_case_num) {
        return $http.put('/api/attributes/' + row_pk + '/add_use_case/', {use_case_num: use_case_num})
            .then(function (response) {
                return response.data;
            })
    };
    service.removeUseCaseNum = function (row_pk, use_case_num) {
        return $http.put('/api/attributes/' + row_pk + '/remove_use_case/', {use_case_num: use_case_num})
            .then(function (response) {
                return response.data;
            })
    };
    return service;
}]);

app.factory("UseCaseService", ['$http', function ($http) {
    const service = {};
    service.postUseCase = function (obj) {
        return $http.post("/api/use_cases/", obj).then(function (data) {
            return {
                complete: true,
                data: data
            };
        });
    };
    service.deleteUseCase = function (pk) {
        return $http.delete("/api/use_cases/" + pk + "/").then(function () {
        });
    };
    service.getUseCases = function () {
        return $http.get('/api/use_cases/').then(function (response) {
            return response.data;
        });
    };
    service.updateUseCase = function (pk, obj) {
        return $http.put('/api/use_cases/' + pk + '/', obj).then(function (response) {
            return response.data;
        })
    };
    service.exportUseCase = function (pk) {
        return $http.get('/api/use_cases/' + pk + '/export/').then(function (response) {
            return response.data;
        })
    };
    return service;
}]);

app.factory("UserService", ['$http', function ($http) {
    const service = {};
    service.getCurrentUserId = function () {
        return $http.get('/api/current_user_id/').then(function (response) {
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
        'SchemaService',
        'AttributeService',
        function ($scope, $http, $interval, uiGridConstants, uiGridGroupingConstants, schemas, useCases, attributes, UseCaseService, UserService, SchemaService, AttributeService) {

            // scope functions are defined here first, with the actual initialization done at the bottom of this function
            $scope.rebuildSchemas = function (schemas) {
                $scope.one_schema = undefined;
                $scope.schema_missing = false;
                if (schemas !== undefined && schemas.length != 0) {
                    $scope.one_schema = _.find(schemas, {version: 2});
                }
                if ($scope.one_schema === undefined) {
                    $scope.one_schema = {name: "*No Schema Defined*", id: 1};
                    $scope.schema_missing = true;
                }
                $scope.schema_nickname = $scope.one_schema.name;
                $scope.useCases = useCases;
            };
            $scope.rebuildAttributes = function (attributes) {
                $scope.matching_attributes = _.filter(attributes, {schema: $scope.one_schema.id});
                console.log($scope.matching_attributes);
                angular.forEach($scope.matching_attributes, function (value) {
                    value.$$treeLevel = value.tree_level;  // $$treeLevel isn't allowed as a Django db model field, convert here
                });
            };
            $scope.rebuild_columns = function () {
                $scope.columns = null;
                $scope.columns = [
                    {
                        name: 'id',
                        displayName: 'ID',
                        width: '7%'
                    },
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
                        cellTemplate: '<div ng-click="grid.appScope.toggleAttribute(row.entity, col.colDef.use_case_id)"><input type="checkbox" ng-checked="row.entity.use_cases.indexOf(col.colDef.use_case_id) !== -1" class="no-click"></div>',
                        visible: use_case.show,
                        use_case_id: use_case.id
                    });
                });
            };
            $scope.toggleAttribute = function (row_entity, use_case_num) {
                if (_.includes(row_entity.use_cases, use_case_num)) {
                    console.log("Updating attribute for row with name " + row_entity.name + ", and pk = " + row_entity.id);
                    AttributeService.removeUseCaseNum(row_entity.id, use_case_num);
                    _.pull(row_entity.use_cases, use_case_num);
                } else {
                    console.log("Updating attribute for row with name " + row_entity.name + ", and pk = " + row_entity.id);
                    AttributeService.addUseCaseNum(row_entity.id, use_case_num);
                    row_entity.use_cases.push(use_case_num);
                }
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
                                    cellTemplate: '<div ng-click="grid.appScope.toggleAttribute(row.entity, col.colDef.use_case_id)"><input type="checkbox" ng-checked="row.entity.use_cases.indexOf(col.colDef.use_case_id) !== -1" class="no-click"></div>',
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
                var newUseCaseName = _.uniqueId(originalUseCase.nickname + '_');
                var newUseCaseID = '';
                UserService.getCurrentUserId()
                    .then(function (u_id) {
                        UseCaseService.postUseCase({owner: u_id.id, nickname: newUseCaseName})
                            .then(function (newUseCase) {
                                newUseCaseID = newUseCase.data.data.id;
                            })
                            .then(UseCaseService.getUseCases)
                            .then(function (useCases) {
                                $scope.useCases = useCases;
                            })
                            .then(function () {
                                $scope.columns.push({
                                    name: newUseCaseName,
                                    type: 'boolean',
                                    cellTemplate: '<div ng-click="grid.appScope.toggleAttribute(row.entity, col.colDef.use_case_id)"><input type="checkbox" ng-checked="row.entity.use_cases.indexOf(col.colDef.use_case_id) !== -1" class="no-click"></div>',
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
            $scope.renameUseCase = function (useCase) {
                var id_to_update = useCase.id;  // store this here momentarily instead of passing it through the chain
                var newName = prompt("Enter a new use case name", "Use Case Name");
                if (newName != null && newName != "") {
                    UseCaseService.updateUseCase(useCase.id, {nickname: newName})
                        .then(UseCaseService.getUseCases)
                        .then(function (useCases) {
                            $scope.useCases = useCases;
                        })
                        .then(function () {
                            var column_to_update = _.find($scope.columns, {use_case_id: id_to_update});
                            var column_id = _.indexOf($scope.columns, column_to_update);
                            var new_column_to_update = angular.copy(column_to_update);
                            new_column_to_update.name = newName;
                            $scope.columns.splice(column_id, 1, new_column_to_update);
                        });
                }
            };
            $scope.exportUseCase = function (useCase) {
                UseCaseService.exportUseCase(useCase.id)
                    .then(function (response) {
                        var blob = new Blob([JSON.stringify(response)], {type: "text/json;charset=utf-8"});
                        saveAs(blob, useCase.nickname + ".json");
                    });
                //var thisUseCase = angular.copy(useCase);
                //
                // delete thisUseCase.id;
                // delete thisUseCase.show;
                // delete thisUseCase.owner;
                // delete thisUseCase.$$hashKey;

            };
            $scope.addMissingSchema = function () {
                SchemaService.initSchema()
                    .then(SchemaService.getSchemas)
                    .then(function (schemas) {
                        $scope.rebuildSchemas(schemas);
                    })
                    .then(AttributeService.getAttributes)
                    .then(function (attributes) {
                        $scope.rebuildAttributes(attributes);
                    })
            };

            // Now we actually run the initialization process
            $scope.useCaseName = '';
            $scope.rebuildSchemas(schemas);
            $scope.rebuildAttributes(attributes);
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

        }
    ]
);
