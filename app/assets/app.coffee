@app = angular.module('GitTest', [
  'ui.router'
  'templates'
  'ui.bootstrap'
])
@app.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('author',
      url: '/author'
      templateUrl: 'views/authors/show.html.erb'
      controller: 'AuthorCtrl')
      
      .state('author.book',
      url: '/author/book/:params'
      templateUrl: 'views/books/show.html.erb'
      controller: 'BookCtrl')  
      
    $urlRouterProvider.otherwise 'author'
    return
]