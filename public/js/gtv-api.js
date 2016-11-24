var logs = [];
var dates = [];
var values = [];
var descriptions = [];


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

  dates = logs.forEach(function(item) {
    // do something with `item`
    if (item.value === undefined) {
      dates.push(0)
    } else {
      dates.push(item.updated_at)
    }  });

  values = logs.forEach(function(item) {
    // do something with `item`
    if (item.value === undefined) {
      dates.push(0)
    } else {
      dates.push(item.value)
    }

  });

  descriptions = logs.forEach(function(item) {
    // do something with `item`
    if (item.value === undefined) {
      dates.push("ERROR")
    } else {
      dates.push(item.description)
    }  });

});
