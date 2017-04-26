var app = angular.module('BsSelection', ['ui.grid', 'ui.grid.grouping', 'ngRoute']);

app.config(function ($routeProvider) {
    $routeProvider
        .when("/", {
            template: '<div id="grid1" ui-grid="gridOptions" ui-grid-grouping ui-grid-selection class="grid"></div>',
            controller: "BsController",
            resolve: {
                data: function ($http) {
                    return $http.get('/bs/get_schema').then(function (response) {
                        return response.data.data;
                    });
                }
            }
        });
});

app.controller('BsController', ['$scope', '$http', '$interval', 'uiGridGroupingConstants', 'data', function ($scope, $http, $interval, uiGridGroupingConstants, data) {
    var get_schema_url = $scope.get_schema_url;  // TODO: Can I get a scope variable to the router?
    $scope.schemaData = data;
    $scope.useCases = [{id: 1, nickname: 'my use case', show: true}, {id: 2, nickname: 'my other use case', show: true}];
    $scope.gridOptions = {
        treeRowHeaderAlwaysVisible: false,
        showTreeExpandNoChildren: false,
        enableRowSelection: false,
        enableRowHeaderSelection: true,
        columnDefs: [
            {
                name: 'name',
                displayName: 'BuildingSync Attribute',
                width: '50%'
            },
            {
                name: 'required',
                displayName: 'Required for this Use Case',
                type: 'boolean',
                cellTemplate: '<input type="checkbox">'
            },
            {
                name: 'optional',
                displayName: 'Optional for this Use Case',
                type: 'boolean',
                cellTemplate: '<input type="checkbox">'
            },
            {
                name: 'auditor',
                displayName: 'Used by Auditor',
                type: 'boolean',
                cellTemplate: '<input type="checkbox">'
            },
            {
                name: 'energymodeler',
                displayName: 'Used by Energy Model',
                type: 'boolean',
                cellTemplate: '<input type="checkbox">'
            }
        ],
        onRegisterApi: function (gridApi) {
            $scope.gridApi = gridApi;
        },
        data: 'schemaData'
    };
}]);
