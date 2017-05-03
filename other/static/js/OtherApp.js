var app = angular.module(
    'OtherApp',
    ['ui.router', 'ngCookies'],
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
            templateUrl: '/static/partials/otherView.html',
            controller: 'OtherAppController'
        });
    }
]);

app.factory("ObjectService", ['$http', function ($http) {
    const service = {};
    service.processObject = function (inData) {
        return $http.post('/other/process_object/', {string: inData}).then(function (response) {
            return response.data;
        });
    };
    return service;
}]);

app.controller('OtherAppController',
    [
        '$scope',
        '$http',
        '$interval',
        'ObjectService',
        function ($scope, $http, $interval, ObjectService) {
            $scope.inputData = "";
            $scope.outputData = "";
            $scope.logData = "";
            $scope.processObject = function (inData) {
                ObjectService.processObject(inData)
                    .then(function (response) {
                        console.log(response);
                        $scope.outputData = response.result;
                        $scope.logData = response.log;
                    });
            };
        }
    ]
);
