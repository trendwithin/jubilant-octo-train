import axios from 'axios';
import React from 'react';
import Chart from 'react-google-charts';
import { dataForCandlestick } from './data';

class CandlestickCharts extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      chartType: 'CandlestickChart',
    };
  }

  getChartData = async () => {
    const data = await axios.get('/data_for_charts/stock_price_data');
    const dataCopy = [...data.data];
    const formatted = this.formatResponse(dataCopy);
    return this.chartData();
  };

  formatResponse = (data) => {
    let transformedData = [];
    data.forEach((item) => {
      let date = new Date(item.market_close_date).toLocaleDateString('en-US');
      let open = parseFloat(item.open);
      let high = parseFloat(item.high);
      let low = parseFloat(item.low);
      let close = parseFloat(item.close);
      transformedData.push([date, open, high, low, close]);
    });
    return transformedData;
  };

  chartOptions = () => {
    const options = {
      legend: 'none',
    };
    return options;
  };

  chartData = () => {
    const chartData = [
    [
      {
        type: "string",
        id: "Date"
      },
      {
        type: "number",
        label: "Something"
      },
      {
        type: "number",
        label: "Something"
      },
      {
        type: "number",
        label: "Something"
      },
      {
        type: "number",
        label: "Something"
      }
    ],
    ["Mon", 20, 28, 38, 45],
    ["Tue", 31, 38, 55, 66],
    ["Wed", 50, 55, 77, 80],
    ["Thu", 77, 77, 66, 50],
    ["Fri", 68, 66, 22, 15]
  ];

  return chartData;
};

  componentDidMount () {
    const fetchedChartData = this.getChartData();
    this.setState({ data: fetchedChartData });
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

export default CandlestickCharts;
