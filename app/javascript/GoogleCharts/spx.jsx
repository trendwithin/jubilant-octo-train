import React from 'react';
import Chart from 'react-google-charts';

class Spx extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      options: {},
      chartType: 'ComboChart',
    };
  }

  chartOptions =  () => {
    let options = {
      val: null,
    };
    return options;
  };

  modifyJsonToGoogleFormat = (array) => {
    const headers = ['Date', 'Four Pct', 'Spy Close'];
    let modArray = array.map(function (cell) {
      cell[0] = new Date(cell[0]);
      cell[2] = parseFloat(cell[2]);
      return cell;
    });

    modArray.unshift(headers);
    return modArray;
  };

  chartOptions = () => {
    let options = {
      vAxes: [
        {
          title: '4%',
          minValue: 0,
          maxValue: 2500,
        },
        {
          title: 'Spy',
          minValue: 0,
          maxValue: 300,
        },
      ],

      hAxis: {
        title: 'Date',
      },
      curveType: 'function',

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
    };
    return options;
  };

  componentDidMount () {
    fetch('/data_for_charts/googs')
    .then(res => res.json())
    .then((result) => {
      const data = this.modifyJsonToGoogleFormat(result);
      const options = this.chartOptions();

      this.setState({
        data: data,
        options: options,
      });
    });
  }

  render() {
    return (
      <Chart
        chartType={this.state.chartType}
        data={this.state.data}
        options={this.state.options}
        chartPackages={['corechart', 'controls']} />
    );
  }
}
export default Spx;
