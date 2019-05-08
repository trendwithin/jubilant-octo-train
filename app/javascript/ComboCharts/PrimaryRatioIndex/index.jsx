import axios from 'axios';
import React from 'react';
import Chart from 'react-google-charts';

import IndexLookBackForm from '../../Forms/IndexLookBackPeriod';

class PrimaryRatioIndex extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      chartType: 'ComboChart',
    };
    this.dataRef = React.createRef();
  }

  onLookbackSubmit = (lookback) => {
    this.getChartData(lookback);
  };

  chartOptions = () => {
    const options = {
      packages: ['corechart'],
      title: 'Primary Ratio',
      vAxis: { title: 'Primary Values' },
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

  getChartData = async (lookback) => {
    const lookbackPeriod = lookback.lookback;
    const lookbackIndex = lookback.market_index;

    const data = await axios.get
      ('/data_for_charts/primary_ratio_chart_data?lookback='
        + lookbackPeriod + '&market_index=' + lookbackIndex);
    const dataCopy = [...data.data];
    this.formatResponse(dataCopy);
  };

  formatResponse = (data) => {
    const headers = ['Date', '25% + 3 Months', '25%- 3 Months', 'Index Close'];
    const modifiedArray = data.map(function (cell) {
      cell[3] = parseFloat(cell[3]);
      return cell;
    });

    modifiedArray.unshift(headers);
    this.setState({ data: modifiedArray });
  };

  componentDidMount () {
    const defaultValue = { lookback: 250, market_index: 'SPY' };
    this.getChartData(defaultValue);
  }

  render() {
    return (
      <div>
        <IndexLookBackForm onFormSubmit={this.onLookbackSubmit}/>
        <Chart
          chartType={this.state.chartType}
          options = {this.chartOptions()}
          loader={ <span className="text-muted">Loading...</span> }
          data={this.state.data}
        />
      </div>
    );
  }
}
export default PrimaryRatioIndex;
