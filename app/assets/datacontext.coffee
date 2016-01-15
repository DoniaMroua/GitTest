@app.factory 'datacontext', [
  '$http'
  'toaster'
  ($http, toaster) ->
  
  # datacontext service body
    
  service = 
    authors: []
    books: []

  service.getAllAuthors = ->
    $http.get('/authors.json').success (data) ->
      angular.copy data, service.authors
      return

  service.createAuthor = (author) ->
    $http.post('/authors.json', author).success((data) ->
      service.recipes.push data
      toaster.pop 'success', 'Success', 'Adding ' + data.fisrtname+' '+data.secondname+ ' successfully'
      return
    ).error (data) ->
      toaster.pop 'error', 'Error', 'Error on Adding ' + author.title
      return

  service
]
