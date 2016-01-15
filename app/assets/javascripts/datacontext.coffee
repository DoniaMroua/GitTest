@app.factory 'datacontext', ($http, toaster) ->
  
  #datacontext service body
    
  service = 
    authors: []
    books: []

  service.getAllAuthors = ->
    $http.get('/authors.json').success (data) ->
      angular.copy data, service.authors
      

  service.createAuthor = (author) ->
    $http.post('/authors.json', author).success((data) ->
      service.authors.push data
      toaster.pop( 'success', 'Success', 'Adding ' + data.firstname+' '+data.secondname+ ' successfully')
      return
      
    ).error (data) ->
      toaster.pop 'error' , 'Error' , 'Error on Adding ' + author.firstname+' '+data.secondname
      return
      

  service