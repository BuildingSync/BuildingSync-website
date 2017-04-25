var app = angular.module('app', ['ngAnimate', 'ngTouch', 'ui.grid', 'ui.grid.grouping', 'ngRoute']);

app.config(function ($routeProvider) {
    $routeProvider
        .when("/", {
            templateUrl: "grid-view.html",
            controller: "MainCtrl",
            resolve: {
                data: function ($http) {
                    return $http.get('/bs/get_schema').then(function (response) {
                        return response.data.data;
                    });
                }
            }
        });
});

app.controller('MainCtrl', ['$scope', '$http', '$interval', 'uiGridGroupingConstants', 'data', function ($scope, $http, $interval, uiGridGroupingConstants, data) {
    $scope.schemaData = data;
    console.log(data);
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
