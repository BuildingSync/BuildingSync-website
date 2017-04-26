var app = angular.module('BsSelection', ['ui.grid', 'ui.grid.grouping', 'ui.router'], ['$interpolateProvider', function ($interpolateProvider) {
    $interpolateProvider.startSymbol('{$');
    $interpolateProvider.endSymbol('$}');
}]);

app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
    function ($stateProvider, $urlRouterProvider, $locationProvider) {

        $locationProvider.hashPrefix('');
        $urlRouterProvider.otherwise('/');

        $stateProvider
            .state('main', {
                url: '/',
                templateUrl: '/static/partials/view.html',
                controller: 'BsController',
                resolve: {
                    schemaData: function ($http) {
                        return $http.get('/bs/get_schema').then(function (response) {
                            return response.data.data;
                        });
                    },
                    useCaseData: function($http) {
                        return $http.get('/bs/use_cases/').then(function (response) {
                            return response.data;
                        })
                    }
                }
            });
    }]);

app.controller('BsController', ['$scope', '$http', '$interval', 'uiGridGroupingConstants', 'schemaData', 'useCaseData', function ($scope, $http, $interval, uiGridGroupingConstants, schemaData, useCaseData) {
    $scope.schemaData = schemaData;
    $scope.useCases = useCaseData;
    // $scope.useCases = [{id: 1, nickname: 'my use case', show: true}, {
    //     id: 2,
    //     nickname: 'my other use case',
    //     show: true
    // }];
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
