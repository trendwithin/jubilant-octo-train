import React from 'react'
import ReactDOM from 'react-dom'
import HighLowLineChart from 'LineCharts'


document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('line-chart');
  ReactDOM.render(<HighLowLineChart />, element);
});
