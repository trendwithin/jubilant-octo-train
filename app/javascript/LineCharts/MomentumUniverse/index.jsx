import axios from 'axios'
import React from 'react'
import Chart from 'react-google-charts'

class MomentumUniverseLineChart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      chartType: 'LineChart',
      graphId: 'Momentum Universe',
    };
  }

  getChartData = async () => {
    const data = await axios.get('/data_for_charts/momentum_universe');
    const dataCopy = [...data.data];
    this.formatResponse(dataCopy);
  };

  formatResponse = (data) => {
    const headers = ['Date', '3 Month', '6 Month'];
    const collection = [];
    data.forEach((item) => {
      collection.push(this.parseDataItem(item));
    });

    collection.unshift(headers);
    this.setState({ data: collection });
  };

  parseDataItem = (item) => {
    let currentDate = new Date(item.created_at);
    let threeMonth = item.three_month;
    let sixMonth = item.six_month;
    return [currentDate, threeMonth, sixMonth];
  };

  chartOptions = () => {
    const options = {
      title: 'Momentum Universe',
      curveType: 'function',
      vAxis: { title: 'Momentum Universe' },
      hAxis: {
        title: 'Date',
        format: 'dd/MM/yy',
        type: 'date',
      },
      width: 1200,
      height: 900,
    };
    return options;
  };

  componentDidMount () {
    this.getChartData();
  }

  render() {
    return (
      <Chart
        chartType={this.state.chartType}
        options = {this.chartOptions()}
        data={this.state.data}
      />
    );
  }
}

export default MomentumUniverseLineChart;
