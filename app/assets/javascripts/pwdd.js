var pwdd = angular.module('pwdd', ['ui.router', 'templates']);

pwdd.factory('categories', ['$http', function($http) {
	var o = {
		categories: []
	};
	o.get = function (id) {
    return $http.get('/categories/' + id + '.json').then(function (res) {
      return res.data;
  });
  };
  return o;
}]);

pwdd.config([
	'$stateProvider', 
	'$urlRouterProvider', 
	function($stateProvider, $urlRouterProvider) {

    $stateProvider
    .state('home', {
        url: '/home',
        templateUrl: 'home/_home.html',
        controller: 'MainCtrl',
    });
    $stateProvider
    .state('home.categories', {
        url: '/categories/:categoryId',
        templateUrl: 'categories/_categories.html',
        controller: 'CategoriesCtrl',
        resolve: {
            category: ['$stateParams', 'categories', function($stateParams, categories) {
                return categories.get($stateParams.categoryId);
            }]
        }
    });
    $stateProvider
    .state('home.simple_resume', {
      url: '/simple_resume',
      templateUrl: 'simple_resume/_simple_resume.html'
    });
    $urlRouterProvider.otherwise("home");
  }]);


pwdd.controller('MainCtrl', function ($state) {
  $state.includes('home.categories');
});

pwdd.controller('CategoriesCtrl', [
	'$scope',
	'categories',
	'category',
	function($scope, categories, category) {
		$scope.id = category.id;
		$scope.name = category.name;
    $scope.inheritance = category.inheritance;
    $scope.attr = category.attr;
    $scope.attr_name = category.attr_name;
		$scope.posts = category.posts;
	}
]);
