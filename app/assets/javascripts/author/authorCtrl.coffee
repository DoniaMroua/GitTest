@app.controller 'AuthorCtrl', ($scope, datacontext) ->
  
  #Get all authors
  $scope.remarque="";
  
  $scope.Author=
    firstname: ""
    secondname: ""
    
  #Refrech list after adding new author
  $scope.$on 'ReloadAuthors', (event, data) ->
    datacontext.getAllAuthors().success (data) ->
      $scope.authors = data
      return
    return
  
  datacontext.getAllAuthors().success((data) ->
    $scope.authors = data
    $scope.remarque="No authors found" if $scope.authors.length == 0
    
  ).error (data, status) ->
    alert 'Error on getting all authors', status, ' ', data
  $scope.addAuthor = ->
    datacontext.createAuthor 
      firstname: $scope.Author.firstname
      secondname: $scope.Author.secondname
    $scope.$broadcast 'ReloadAuthors', 'Some data'
    $scope.Author.firstname=""
    $scope.Author.secondname=""