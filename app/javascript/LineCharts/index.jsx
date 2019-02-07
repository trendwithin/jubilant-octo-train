import axios from 'axios'
import React from 'react'
import Chart from 'react-google-charts'
import { lineChartData } from './data'
import { transformHighLowData } from '../helpers/helper_functions';

class HighLowLineChart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      chartType: 'LineChart',
      graphId: 'HighLows'
    };
  }

  getChartData = async () => {
    const data = await axios.get('/data_for_charts/high_low_data');
    const dataCopy = [...data.data];
    this.formatResponse(dataCopy);
  };

  formatResponse = (data) => {
    const transformedData = transformHighLowData(data);
    this.setState({ data: transformedData });
  };

  chartOptions = () => {
    const options = {
      title: 'New High :: New Low Differential',
      curveType: 'function',
      legend: { position: 'bottom' },
      width: 900,
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
        graph_id="{this.state.graphId}"
        data={this.state.data}

      />
    );
  }
}

export default HighLowLineChart;
