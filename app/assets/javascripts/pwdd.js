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

pwdd.factory('courses', ['$http', function($http) {
  var e = {
    courses: []
  };
  e.getAll = function() {
    return $http.get('/courses.json').success(function(data) {
      angular.copy(data, e.courses);
    });
  };
  return e;
}]);

pwdd.config([
	'$stateProvider', 
	'$urlRouterProvider', 
	function($stateProvider, $urlRouterProvider) {

    $stateProvider
    .state('home', {
        url: '/home',
        templateUrl: 'home/_home.html'
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
    .state('home.courses', {
        url: '/courses',
        templateUrl: 'education/_courses.html',
        controller: 'CoursesCtrl',
        resolve: {
          postPromise: ['courses', function(courses){
              return courses.getAll();
          }]
      }
    });
    $stateProvider
    .state('home.education', {
      url: '/education',
      templateUrl: 'education/_education.html'
    });
    $stateProvider
    .state('home.languages', {
      url: '/languages',
      templateUrl: 'education/_languages.html'
    });
    $stateProvider
    .state('home.simple_resume', {
      url: '/simple_resume',
      templateUrl: 'simple_resume/_simple_resume.html'
    });
    $urlRouterProvider.otherwise("home");
  }]);

pwdd.controller('CategoriesCtrl', [
	'$scope',
	'categories',
	'category',
	function($scope, categories, category) {
		$scope.id = category.id;
		$scope.name = category.name;
    $scope.description = category.description;
    $scope.inheritance = category.inheritance;
    $scope.attr = category.attr;
    $scope.attr_name = category.attr_name;
		$scope.posts = category.posts;
	}
]);

pwdd.controller('CoursesCtrl', [
  '$scope',
  'courses',
  function($scope, courses) {
    $scope.courses = courses.courses;
    $scope.where = courses.where;
  }
]);

pwdd.directive('sidebar', function() {
  return {
    templateUrl: 'home/_sidebar.html'
  };
});