var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://192.168.10.158:3000/logs",
  "method": "GET",
  "headers": {
    "content-type": "application/json",
    "authorization": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0Nzk5ODg3OTJ9.NqphOOMRpr9VL8pqJPo7RcMcvuvxBFzxbaHTwk5oCh0"
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});