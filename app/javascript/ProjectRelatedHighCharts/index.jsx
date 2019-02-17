import axios from 'axios';
import React, { Component } from 'react'
import { render } from 'react-dom'
import { barchartChartData } from './data/raw_data';

import * as Highcharts from 'highcharts/highstock'
import HighchartsReact from 'highcharts-react-official'

export default class Barchart extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
    };
  }

  getPriceData = async () => {
    const data = await axios.get('/data_for_charts/stock_price_data');
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
    this.getPriceData();
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
      <HighchartsReact
        highcharts={Highcharts}
        constructorType={'stockChart'}
        options = {options}
      />
    );
  }
}
