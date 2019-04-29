import React, { Component } from 'react';

export default class LookBackForm  extends Component {

  state = { lookback: '' };

  onInputChange = (e) => {
    this.setState({ lookback: e.target.value });
  };

  onFormSubmit = (e) => {
    e.preventDefault();
    this.props.onFormSubmit(this.state.lookback);
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
          </div>
        <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}
