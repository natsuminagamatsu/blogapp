window.onload = function() {
  document.getElementById("submit").onclick = function(e) {
    var title = document.getElementById("title").value;
    var body = document.getElementById("body").value;

    httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function() {
      if (httpRequest.readyState == XMLHttpRequest.DONE) {
        if (httpRequest.status == 204) {
          alert("投稿が完了しました");
        }
      }
    }
    httpRequest.open('POST', '/api/articles');
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    httpRequest.send('title=' + encodeURIComponent(title) + '&body=' + encodeURIComponent(body));

    return false;
  }

  setInterval(function() {
    document.getElementById("articles").innerHTML = "";

    getArticles(function(articles) {
      var articlesLength = articles.length;
      for (var i = 0; i < articlesLength; i++) {
        article = articles[i];
        articleElm = document.createElement("div");
        articleElm.className = "article";

        var imgTag = '<img src="/uploads/' + article.user_id + '.jpg" ' + 'width="40px"/>'

        articleElm.innerHTML = imgTag + "<p>" + article.title + "</p>" + "<p>" + article.body + "</p>";
        document.getElementById("articles").appendChild(articleElm);
      }
    });
  }, 5000);
}

function getArticles(callback) {
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = function() {
    if (httpRequest.readyState == XMLHttpRequest.DONE) {
      if (httpRequest.status == 200) {
        var response = JSON.parse(httpRequest.responseText);
        callback(response);
      }
    }
  }
  httpRequest.open('GET', '/api/articles', true);
  httpRequest.send();
}
