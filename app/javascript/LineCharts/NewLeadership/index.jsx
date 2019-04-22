import axios from 'axios'
import React from 'react'
import Chart from 'react-google-charts'
// import { lineChartData } from './data'
import { transformNewLeadership } from '../../helpers/helper_functions'

class NewLeadershipLineChart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      chartType: 'LineChart',
      graphId: 'NewLeadership',
    };
  }

  getChartData = async () => {
    const data = await axios.get('/data_for_charts/new_leadership');
    const dataCopy = [...data.data];
    this.formatResponse(dataCopy);
  };

  formatResponse = (data) => {
    const transformedData = transformNewLeadership(data);
    this.setState({ data: transformedData });
  };

  chartOptions = () => {
    const options = {
      title: 'New Leadership Differential',
      curveType: 'function',
      legend: { position: 'bottom' },
      width: 1200,
      height: 900,
    };
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

export default NewLeadershipLineChart;
