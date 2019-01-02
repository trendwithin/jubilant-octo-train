import React from 'react';
import Chart from 'react-google-charts';
import Spx from './spx';

class GoogleDisplayChart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
    };
  }

  render() {
    return (
      <div className='chart-display'>
        <h1>Display</h1>
        <Spx />
      </div>
    );
  }
}

export default GoogleDisplayChart;
