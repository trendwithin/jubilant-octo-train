import axios from 'axios';
import React from 'react';
import Chart from 'react-google-charts';

class DisplayComboChart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      chartType: 'ComboChart',
    };
    this.dataRef = React.createRef();
  }

  chartOptions = () => {
    const options = {
      packages: ['corechart'],
      title: '4% Breakouts',
      vAxis: { title: '4% BO' },
      hAxis: { title: 'Month' },
      seriesType: 'bars',
      series: {
        0: {
          type: 'bars',
          targetAxisIndex: 0,
          color: 'blue',
        },
        1: {
          type: 'line',
          targetAxisIndex: 1,
          color: 'green',
        },
      },
      height: 900,
    };
    return options;
  };

  getChartData = async () => {
    const data = await axios.get('/data_for_charts/googs');
    const dataCopy = [...data.data];
    this.formatResponse(dataCopy);
  };

  formatResponse = (data) => {
    const headers = ['Date', 'Four Pct', 'Spy Close'];
    const modifiedArray = data.map(function (cell) {
      cell[0] = new Date(cell[0]);
      cell[2] = parseFloat(cell[2]);
      return cell;
    });

    modifiedArray.unshift(headers);
    this.setState({ data: modifiedArray });
  };

  componentDidMount () {
    this.getChartData();
  }

  render() {
    return (
      <Chart
        chartType={this.state.chartType}
        options = {this.chartOptions()}
        loader={ <span className="text-muted">Loading...</span> }
        data={this.state.data}
      />
    );
  }
}
export default DisplayComboChart;
