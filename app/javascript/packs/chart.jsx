import React from 'react'
import ReactDOM from 'react-dom'
import DisplayChart from 'DisplayChart'


document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('chart');
  ReactDOM.render(<DisplayChart />, element);
});
