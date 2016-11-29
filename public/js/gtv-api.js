var windologs = [];
var dates = [];
var values = [];
var descriptions = [];


var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://192.168.10.158/api/logs",
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
      values.push(item.value);
      dates.push(item.updated_at);
      descriptions.push(item.description);
    }
  });



});
