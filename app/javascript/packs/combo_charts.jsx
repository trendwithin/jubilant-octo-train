import React from 'react';
import ReactDOM from 'react-dom';
import DisplayComboChart from 'ComboCharts';

document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('combo-chart');
  ReactDOM.render(<DisplayComboChart />, element);
})
