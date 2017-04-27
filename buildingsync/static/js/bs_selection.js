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
    }]);

app.controller('BsController', ['$scope', '$http', '$interval', 'uiGridGroupingConstants', 'schemaData', 'useCaseData', 'attributesData', function ($scope, $http, $interval, uiGridGroupingConstants, schemaData, useCaseData, attributesData) {
    $scope.schemaData = schemaData;
    $scope.useCases = useCaseData;
    $scope.attributesData = attributesData;
    // need to convert the attributes because of the $$treeLevel key;  # TODO: Figure out how to serialize to a different key name in Django and now transformation will be necessary
    $scope.gridData = [];
    angular.forEach(attributesData, function (value, key) {
        $scope.gridData.push({
            name: value.name,
            $$treeLevel: value.tree_level
        })
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
        data: 'gridData'
    };
    $scope.addBlankUseCase = function () {
        alert("OK EHELKJE");
    };
}]);
