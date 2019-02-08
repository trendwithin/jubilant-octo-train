import React from 'react'
import ReactDOM from 'react-dom'
import CandlestickChart from 'CandlestickCharts';


document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('candlestick-charts');
  ReactDOM.render(<CandlestickChart />, element);
});
