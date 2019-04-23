import React from 'react';
import ReactDOM from 'react-dom';
import MomentumUniverseLineChart from 'LineCharts/MomentumUniverse';

document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('momentum_universe_chart');
  ReactDOM.render(<MomentumUniverseLineChart />, element);
})
