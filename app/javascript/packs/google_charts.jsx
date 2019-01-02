import React from 'react';
import ReactDOM from 'react-dom'
import GoogleDisplayChart from 'GoogleCharts';

document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('google-chart');
  ReactDOM.render(<GoogleDisplayChart />, element);
})
