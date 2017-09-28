var app = angular.module(
    'BsStandard211',
    ['ui.grid', 'ui.grid.grouping', 'ui.router', 'ngCookies', 'ui.bootstrap'],
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
            templateUrl: '/static/partials/standard211view.html',
            controller: 'BsStandard211Controller',
            resolve: {
                std211files: function (InstanceService) {
                    return InstanceService.getInstances();
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


app.factory("InstanceService", ['$http', function ($http) {
    const service = {};
    service.getInstances = function () {
        return $http.get('/std211/api/instances/').then(function (response) {
            return response.data;
        });
    };
    service.getInstance = function (id) {
        return $http.get('/std211/api/instances/' + id + '/').then(function (response) {
            return response.data
        })
    };
    service.importInstance = function (instance_object) {
        return $http.post('/std211/api/instances/', instance_object).then(function (response) {
            return response.data;
        })
    };
    return service;
}]);


app.controller('BsStandard211Controller',
    [
        '$scope',
        '$http',
        '$interval',
        'uiGridConstants',
        'uiGridGroupingConstants',
        'std211files',
        'InstanceService',
        function ($scope, $http, $interval, uiGridConstants, uiGridGroupingConstants, std211files, InstanceService) {

            // scope functions are defined here first, with the actual initialization done at the bottom of this function

            $scope.refreshList = function () {
                InstanceService.getInstances()
                    .then(function (instances) {
                        $scope.std211files = instances;
                    });
            };

            $scope.importStandard211 = function ($fileContent) {
                var new_instance = JSON.parse($fileContent);  // TODO: Error handle
                InstanceService.importInstance(new_instance)
                    .then($scope.refreshList());
            };

            $scope.downloadXML = function (standard211instance) {
                InstanceService.getInstance(standard211instance.id)
                    .then(function (response) {
                        var blob = new Blob([JSON.stringify(response)], {type: "text/json;charset=utf-8"});
                        saveAs(blob, 'buildingsync' + standard211instance.id + ".json");
                    });
            };

            // Now we actually run the initialization process

            $scope.refreshList();

        }
    ]
);
