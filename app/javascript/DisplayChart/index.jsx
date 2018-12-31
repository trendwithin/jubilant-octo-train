import React from 'react';
import ReactChartkick, { LineChart } from 'react-chartkick';
import Monitor from './Monitor/index.jsx';
import Chart from 'chart.js';
ReactChartkick.addAdapter(Chart);

class DisplayChart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
    };
  }

  render() {
    return (
      <div className='chart-display'>
        <LineChart data={"/data_for_charts/thirteen_percent"} />
        <Monitor />
      </div>
    );
  }
}

export default DisplayChart;
