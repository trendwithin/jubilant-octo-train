import React, { Component } from 'react';

export default class IndexLookBackForm  extends Component {

  state = { lookback: '250',
            market_index: 'SPY',
          };

  onInputChange = (e) => {
    this.setState({ lookback: e.target.value });
  };

  onIndexInputChange = (e) => {
    this.setState({ market_index: e.target.value });
  };

  onFormSubmit = (e) => {
    e.preventDefault();
    this.props.onFormSubmit(this.state);
  };

  render() {
    return (
      <div className='lookback-period'>
        <form action='' onSubmit={this.onFormSubmit} className='lookback-form'>
          <div className='react-field'>
            <label>Look Back Period</label>
            <input
              type='text'
              value={this.state.lookback}
              onChange={this.onInputChange}
            />
            <label>Comparison</label>
            <input
             type='text'
             value={this.state.market_index}
             onChange={this.onIndexInputChange}
            />
          </div>
        <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}
