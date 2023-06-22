// import React from 'react';
// import { render, screen} from '@testing-library/react';
import { render } from '@testing-library/react';
// import '@testing-library/jest-dom/extend-expect'
import Home from '../pages/Home'

import { Provider } from 'react-redux'

import { configureStore } from '@reduxjs/toolkit'

const CHANGE_CAT_COLOR = "brown"

const examplesReducer:any = (state = {color: "brown" }, action: any) =>{
  switch (action.type) {
    case CHANGE_CAT_COLOR:
      let newState:any = {};
      newState['color'] = action.value;
    return newState;
    default:
      return state;
  }
};

const preloadedState = {
  examplesReducer: {
    state: {
      color: "blue",
      action: "CHANGE_CAT_COLOR"
     },
    // color: "Red",
    // value: "Green",
    // type: 'CHANGE_CAT_COLOR',
  }
}

const store = configureStore({
  reducer: examplesReducer,
  preloadedState
})

// const store = configureStore({
//   reducer: examplesReducer
// })


describe('<Home />', () => {

  it('should render text', () => {
    console.log(store.getState())
    const { getByText } = render(<Provider store={store}><Home /></Provider>)
    expect(getByText('This is a test')).not.toBeNull()
    //expect(screen.getByText(/This is a test/)).toBeInTheDocument();
    });
});


//////////////////////
/////////// https://redux.js.org/usage/writing-tests


///////////////////   https://medium.com/@lucksp_22012/dont-use-mock-store-use-your-real-store-b319d7e4e22e

// preload
// https://stackoverflow.com/questions/68572170/how-to-use-redux-toolkits-preloadedstate-and-createslice-together-properly