import React from 'react';
import ReactDOM from 'react-dom';
import FourPercentIndex from 'ComboCharts/FourPercentIndex';

document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('four_percent_index');
  ReactDOM.render(<FourPercentIndex />, element);
})
