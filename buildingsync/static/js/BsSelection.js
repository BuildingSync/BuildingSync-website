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
    }]);

app.controller('BsController', ['$scope', '$http', '$interval', 'uiGridGroupingConstants', 'schemas', 'useCaseData', 'attributesData', function ($scope, $http, $interval, uiGridGroupingConstants, schemas, useCaseData, attributesData) {
    $scope.schemas = schemas;
    var one_schema = _.find(schemas, {version: 2});
    $scope.schema_nickname = one_schema.name;
    $scope.useCases = useCaseData;
    $scope.attributesData = attributesData;
    angular.forEach(attributesData, function (value, key) {
        value.$$treeLevel = value.tree_level;  // $$treeLevel isn't allow as a Django db model field, convert here
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
        data: 'attributesData'
    };
    $scope.addBlankUseCase = function () {
        alert("OK EHELKJE");
    };
}]);
