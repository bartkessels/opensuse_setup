var interval
var randomText = function () {
  var random = Math.floor(Math.random() * 7) + 1;
  var tips = document.querySelectorAll('.pm-loader-text li')
  for (var i = 0 ; i < tips.length ; i++) {
    tips[i].style.display = 'none';
    tips[i].style.opacity = '0';
  }
  document.querySelector('.pm-loader-text li:nth-child(' + random + ')').style.display = 'inline-block';

  setTimeout(function () {
    document.querySelector('.pm-loader-text li:nth-child(' + random + ')').style.opacity = '1';
  }, 10)

  if (document.querySelector('.pm-loader').className.match('/is-hidden/g')) {
    clearInterval(interval)
  };
}

randomText()
interval = setInterval(randomText, 3000)
