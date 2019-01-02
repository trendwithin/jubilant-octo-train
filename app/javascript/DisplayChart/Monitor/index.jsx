import React from 'react';
import ReactChartkick, { LineChart } from 'react-chartkick';
import Chart from 'chart.js';
ReactChartkick.addAdapter(Chart);

class Monitor extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
    };
  }

  componentDidMount() {
    fetch('/data_for_charts/monitor')
      .then(res => res.json())
      .then(
        (result) => {
        this.setState({
          data: result,
        });
      },

      (error) => {
        this.setState({
          error,
        });
      }
    );
  }

  render() {
    return (
      <div className='chart-display'>
        <LineChart data={'/data_for_charts/monitor'}
                   discrete={false} />
      </div>
    );
  }
}

export default Monitor;
