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

app.directive('onReadFile', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        scope: false,
        link: function (scope, element, attrs) {
            var fn = $parse(attrs.onReadFile);

            element.on('change', function (onChangeEvent) {
                var reader = new FileReader();

                reader.onload = function (onLoadEvent) {
                    scope.$apply(function () {
                        fn(scope, {$fileContent: onLoadEvent.target.result});
                    });
                };

                reader.readAsText((onChangeEvent.srcElement || onChangeEvent.target).files[0]);
            });
        }
    };
}]);

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
    service.addUseCaseNum = function (row_pk, use_case_num, required) {
        return $http.put('/api/attributes/' + row_pk + '/add_use_case/', {
            use_case_num: use_case_num,
            required: required
        })
            .then(function (response) {
                return response.data;
            })
    };
    service.removeUseCaseNum = function (row_pk, use_case_num, required) {
        return $http.put('/api/attributes/' + row_pk + '/remove_use_case/', {
            use_case_num: use_case_num,
            required: required
        })
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
    service.importUseCase = function (use_case_object) {
        return $http.post('/api/use_cases/import/', use_case_object).then(function (response) {
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
                        cellTemplate: 'static/partials/checkboxTemplate.html',
                        visible: use_case.show,
                        use_case_id: use_case.id
                    });
                });
            };
            $scope.toggleAttribute = function (row_entity, use_case_num, required) {
                if (required) {
                    if (_.includes(row_entity.required_use_cases, use_case_num)) {
                        AttributeService.removeUseCaseNum(row_entity.id, use_case_num, required);
                        _.pull(row_entity.required_use_cases, use_case_num);
                    } else {
                        AttributeService.addUseCaseNum(row_entity.id, use_case_num, required);
                        row_entity.required_use_cases.push(use_case_num);
                    }
                } else {
                    if (_.includes(row_entity.optional_use_cases, use_case_num)) {
                        AttributeService.removeUseCaseNum(row_entity.id, use_case_num, required);
                        _.pull(row_entity.optional_use_cases, use_case_num);
                    } else {
                        AttributeService.addUseCaseNum(row_entity.id, use_case_num, required);
                        row_entity.optional_use_cases.push(use_case_num);
                    }
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
                                    cellTemplate: 'static/partials/checkboxTemplate.html',
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
                                    cellTemplate: 'static/partials/checkboxTemplate.html',
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
                        saveAs(blob, useCase.nickname + ".bstool");
                    });
            };
            $scope.importUseCase = function ($fileContent) {
                var new_use_case = JSON.parse($fileContent);  // TODO: Error handle
                var new_name_we_want = new_use_case.nickname;
                var temp_object_name = "";
                UseCaseService.getUseCases()
                    .then(function (current_use_cases) {
                        var found_name_index = _.findIndex(current_use_cases, function (useCase) {
                            return useCase.nickname == new_name_we_want
                        });
                        if (found_name_index == -1) {
                            temp_object_name = new_name_we_want;
                        } else {
                            while (found_name_index >= 0) {
                                temp_object_name = _.uniqueId(new_name_we_want + '_');
                                found_name_index = _.findIndex(current_use_cases, function (useCase) {
                                    return useCase.nickname == temp_object_name
                                });
                            }
                        }
                        new_use_case.nickname = temp_object_name;
                        var newUseCaseID = '';
                        UseCaseService.importUseCase(new_use_case)
                            .then(function (newUseCase) {
                                newUseCaseID = newUseCase.id;
                            })
                            .then(UseCaseService.getUseCases)
                            .then(function (useCases) {
                                $scope.useCases = useCases;
                            })
                            .then(function () {
                                $scope.columns.push({
                                    name: temp_object_name,
                                    type: 'boolean',
                                    cellTemplate: 'static/partials/checkboxTemplate.html',
                                    visible: true,
                                    use_case_id: newUseCaseID
                                });
                                $scope.gridApi.core.notifyDataChange(uiGridConstants.dataChange.COLUMN);
                            })
                            .then(AttributeService.getAttributes)
                            .then(function (attributes) {
                                $scope.rebuildAttributes(attributes);
                                $scope.gridApi.core.notifyDataChange(uiGridConstants.dataChange.ALL);
                            })
                    })
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
