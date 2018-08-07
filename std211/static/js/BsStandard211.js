var app = angular.module(
    'BsStandard211',
    ['ui.grid', 'ui.grid.grouping', 'ui.router', 'ngCookies', 'ui.bootstrap', 'ngFileUpload'],
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

app.factory("InstanceService", ['$http', '$q', 'Upload', function ($http, $q, Upload) {
    const service = {};
    service.getInstances = function () {
        return $http.get('/std211/api/instances/').then(function (response) {
            return response.data;
        });
    };

    service.getInstance = function (id) {
        return $http.get('/std211/api/instances/' + id + '/').then(function (response) {
            return response.data;
        });
    };

    service.importInstance = function (instance_object) {
      const deferred = $q.defer();

      Upload.upload({
            url: '/std211/api/instances/',
            data: instance_object
        }).then(function (resp) {
            deferred.resolve(resp.data);
            console.log('Success ' + resp.config.data.file.name + 'uploaded. Response: ' + resp.data);
        }, function (resp) {
            deferred.reject(resp.status);
            console.log('Error status: ' + resp.status);
        });

        return deferred.promise;
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

            $scope.importStandard211 = function (file) {
                /// For some reason the ngf-select causes this to be called on click.
                /// Check to make sure that the file is defined before calling importInstance
                if (file) {
                  console.log(file)
                  var new_instance = {
                    filename: file.name,
                    file: file
                  };
                  InstanceService.importInstance(new_instance)
                      .then(function () {
                        $scope.refreshList();
                      });
                }
            };

            $scope.downloadXML = function (standard211instance) {
                InstanceService.getInstance(standard211instance.id)
                    .then(function (response) {
                        if (response.status === 'success') {
                            var blob = new Blob([response.data], {type: "application/xml;charset=utf-8"});
                            saveAs(blob, 'buildingsync_' + standard211instance.id + ".xml");
                        } else {
                            console.log('BuildingSync Error ' + response);
                        }
                    });
            };

            // Now we actually run the initialization process

            $scope.refreshList();

        }
    ]
);
