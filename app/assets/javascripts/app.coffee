@app = angular.module('GitTest', [
   'ui.router'
  'templates'
  'ui.bootstrap'
  'toaster'
  'ngAnimate'
  'ui.select'
  'Devise'
])
@app.config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
    
    .state "author",
      url: "/author"
      templateUrl: 'author/index.html'
      controller: 'AuthorCtrl'
      
    .state "author.book",
      url: "/author/book/:params"
      templateUrl: 'views/books/index.html.erb'
      controller: 'BookCtrl'
      
    $urlRouterProvider.otherwise "author"
    
