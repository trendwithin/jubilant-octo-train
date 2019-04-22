import React from 'react';
import ReactDOM from 'react-dom';
import NewLeadershipLineChart from 'LineCharts/NewLeadership';

document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('new-leadership-chart');
  ReactDOM.render(<NewLeadershipLineChart />, element);
})
