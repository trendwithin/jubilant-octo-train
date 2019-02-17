import React from 'react'
import ReactDOM from 'react-dom'
import Barchart from 'ProjectRelatedHighCharts'

document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('barchart');
  ReactDOM.render(<Barchart />, element);
});
