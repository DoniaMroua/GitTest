@app.controller 'AuthorCtrl', ($scope, datacontext) ->
  
  #Get all authors
  $scope.remarque="";
  $scope.remarqueBook="";
  
  $scope.Author=
    firstname: ""
    secondname: ""
    age:""
    
   $scope.Book=
    title: ""
    price: 0
    age:0
    authorId: ""
  
  $scope.authors = []
  $scope.books = []
  
  #Refrech list after adding new author
  $scope.$on 'ReloadAuthors', (event, data) ->
    datacontext.getAllAuthors().success (data) ->
      $scope.authors = data
      return
    return
    
  #Refrech list after adding new book
  $scope.$on 'ReloadBooks', (event, data) ->
    datacontext.getAllBooks().success (data) ->
      $scope.books = data
      $scope.Book.authorId=$scope.books[0].id
      return
    return
    
  datacontext.getAllBooks().success((data) ->
    $scope.books = data
    $scope.Book.authorId=$scope.books[0].id
    $scope.remarqueBook="No books found" if $scope.books.length == 0
    
  ).error (data, status) ->
    alert 'Error on getting all books'
  
  
  datacontext.getAllAuthors().success((data) ->
    $scope.authors = data
    $scope.remarque="No authors found" if $scope.authors.length == 0
    
  ).error (data, status) ->
    alert 'Error on getting all authors', status, ' ', data
    
    
  $scope.addAuthor = ->
    datacontext.createAuthor 
      firstname: $scope.Author.firstname
      secondname: $scope.Author.secondname
      age: $scope.Author.age
    $scope.$broadcast 'ReloadAuthors', 'Some data'
    $scope.Author.firstname=""
    $scope.Author.secondname=""
    $scope.Author.age=""
    
  $scope.addBook = ->
    datacontext.createBook 
      title: $scope.Book.title
      age: $scope.Book.title
      price: $scope.Book.price
      author_id: parseInt($scope.Book.authorId)
    $scope.$broadcast 'Reloadbooks', 'Some data'
    $scope.Book.title=""
    $scope.Book.price=""
    $scope.Book.authorId=""