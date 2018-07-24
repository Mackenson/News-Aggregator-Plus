function article() {
  fetch("/article/new/random")
  .then(response=>{
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} ${response.statusText}`
      error = new Error(errorMessage)
      throw(error)
    }
  })
  .then(jsonData=>response.json())
  .then(dataObject=>jsonData)
  .then()
}
