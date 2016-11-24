var window.logs = [];
var window.dates = [];
var window.values = [];
var window.descriptions = [];


var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://192.168.10.158/logs",
  "method": "GET",
  "headers": {
    "content-type": "application/json",
    "authorization": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0Nzk5ODg3OTJ9.NqphOOMRpr9VL8pqJPo7RcMcvuvxBFzxbaHTwk5oCh0"
  }
}

$.ajax(settings).done(function (response) {
  logs = response;

  logs.forEach(function(item) {

    if (item.value != undefined) {
      window.values.push(item.value);
      window.dates.push(item.updated_at);
      window.descriptions.push(item.description);
    }
  });



});
