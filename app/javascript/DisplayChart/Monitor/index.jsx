import React from 'react';
import ReactChartkick, { LineChart } from 'react-chartkick';
import Chart from 'chart.js';
ReactChartkick.addAdapter(Chart);

class Monitor extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [
        // {"name":"Workout", "data": {"2017-01-01": 3, "2017-01-02": 4 }},
        // {"name":"Call parents", "data": {"2017-01-01": 5, "2017-01-02": 3 }}
      ],
    };
  }
  componentDidMount() {
    fetch("/data_for_charts/monitor")
      .then(res => res.json())
      .then(
        (result) => {
          // this.setState({
          //   isLoaded: true,
          //   items: result.items
          // });
          this.setState({
            data: result,
          })
          console.log(result)
        },
        // Note: it's important to handle errors here
        // instead of a catch() block so that we don't swallow
        // exceptions from actual bugs in components.
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
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
