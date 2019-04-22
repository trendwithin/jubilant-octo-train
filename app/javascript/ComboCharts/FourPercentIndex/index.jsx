import axios from 'axios';
import React from 'react';
import Chart from 'react-google-charts';

class FourPercentIndex extends React.Component {
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
      hAxis: {
        title: 'Date',
        format: 'dd/MM/yy',
        type: 'date',
      },
      seriesType: 'bars',
      series: {
        0: {
          type: 'bars',
          targetAxisIndex: 0,
          color: 'green',
        },
        1: {
          type: 'bars',
          targetAxisIndex: 0,
          color: 'red',
        },
        2: {
          type: 'line',
          targetAxisIndex: 1,
          color: 'blue',
        },
      },
      height: 900,
    };
    return options;
  };

  getChartData = async () => {
    const data = await axios.get('/data_for_charts/four_percent_index_chart_data');
    const dataCopy = [...data.data];
    this.formatResponse(dataCopy);
  };

  formatResponse = (data) => {
    const headers = ['Date', 'Four Pct Up', 'Four Pct Down', 'Spy Close'];
    const modifiedArray = data.map(function (cell) {
      cell[3] = parseFloat(cell[3]);
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
export default FourPercentIndex;
