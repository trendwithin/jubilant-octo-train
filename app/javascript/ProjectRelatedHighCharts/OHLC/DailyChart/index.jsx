import axios from 'axios';
import React, { Component } from 'react'
import { render } from 'react-dom'
import LookBackForm from '../../../Forms/IndexLookBackPeriod'
import * as Highcharts from 'highcharts/highstock'
import HighchartsReact from 'highcharts-react-official'

export default class DailyChart extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
    };
  }

  onLookbackSubmit = (lookback) => {
    this.getPriceData(lookback);
  };

  getPriceData = async (lookback) => {
    const lookbackPeriod = lookback.lookback;
    const lookbackIndex = lookback.market_index;
    const data = await axios.get('/data_for_charts/stock_price_data?lookback=' +
      lookbackPeriod + '&market_index=' + lookbackIndex);
    const formattedData = this.formatResponse([...data.data]);
    this.setState({ data: formattedData });
  };

  formatResponse = (data) => {
    const formattedData = [];
    data.forEach((item) => {
      let date = new Date(item.market_close_date).getTime();
      let open = parseFloat(item.open);
      let high = parseFloat(item.high);
      let low = parseFloat(item.low);
      let close = parseFloat(item.close);
      formattedData.push({ x: date, open: open, high: high, low: low, close: close });
    });
    return formattedData;
  };

  componentDidMount() {
    const defaultValue = { lookback: 250, market_index: 'SPY' };
    this.getPriceData(defaultValue);
  }

  render() {
    const options = {
      rangeSelector: {
        selected: 6,
      },

      title: {
        text: 'SPY Stock Price',
      },

      series: [
        {
          type: 'ohlc',
          name: 'SPY Price',
          data: this.state.data,
          dataGrouping: {
            units: [
              [
                'week',
                [1],
              ],
              [
                'month',
                [1, 2, 3, 4, 5, 6],
              ],
            ],
          },
        },
      ],
    };

    return (
      <div>
        <LookBackForm onFormSubmit={this.onLookbackSubmit}/>
        <HighchartsReact
          highcharts={Highcharts}
          constructorType={'stockChart'}
          options = {options}
        />
      </div>
    );
  }
}
