myApp = angular.module 'myApp',['ui.router','ngSanitize','ngAnimate']

myApp.config ['$locationProvider','$stateProvider', '$urlRouterProvider', ($locationProvider, $stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/course"
  $locationProvider.html5Mode false
  $locationProvider.hashPrefix "!"
  $stateProvider
    .state 'course',
      abstract: true
      url: "/"
      templateUrl: "views/course.html"
      controller: "CourseCtrl"
    .state 'course.about',
      url: 'about'
      templateUrl: "views/course.about.html"
    .state 'course.intro',
      url: 'course'
      templateUrl: "views/course.intro.html"
    .state 'course.speaker',
      url: 'speaker'
      templateUrl: "views/course.speaker.html"
    .state 'course.lesson',
      url: 'lesson'
      templateUrl: "views/course.lesson.html"
]


myApp.controller 'CourseCtrl',['$scope','$location', ($scope, $location) ->
  $scope.currentRoute = $location.path()
  $scope.$on '$locationChangeSuccess', ->
    $scope.currentRoute = $location.path()
]

disableSubmit = ->
  console.log('submit')
  $('#ss-submit').attr('disabled', 'disabled')