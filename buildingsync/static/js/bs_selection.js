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
                    useCaseData: function ($http) {
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
    $scope.columnDefs = [
        {
            name: 'name',
            displayName: 'BuildingSync Attribute',
            width: '50%'
        }
    ];
    angular.forEach(useCaseData, function (value, key) {
        console.log(value);
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
        data: 'schemaData'
    };
}]);
