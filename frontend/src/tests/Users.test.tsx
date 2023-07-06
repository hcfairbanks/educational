import { render, screen,act } from '@testing-library/react';
import Users from '../pages/Users'
import axios from 'axios';
import AxiosMock from 'axios-mock-adapter';
//import { axe } from 'jest-axe';

const axiosMock = new AxiosMock(axios);

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
      color: "blue",
      action: "CHANGE_CAT_COLOR"
    // color: "Red",
    // value: "Green",
    // type: 'CHANGE_CAT_COLOR',
  }
}

const store = configureStore({
  reducer: examplesReducer,
  preloadedState
})

describe('<Users />', () => {
  test('should render text', async () => {
    axiosMock.onGet('http://127.0.0.1:3000/users').reply(200, [
      {
        id: 1,
        first_name: "bob",
        last_name: "doug"
      },
      {
        id: 2,
        first_name: "joe",
        last_name:"smith"
      }
    ]);

    await act( async () => 
      render(<Provider store={store}><Users /></Provider>)
    );
    expect(await screen.getByText('Users Index')).not.toBeNull();
    expect(await screen.getByText('bob')).not.toBeNull();
    expect(await screen.getByText('blue')).not.toBeNull();
    const users = await screen.findAllByRole('listitem');
    expect(users).toHaveLength(4);

    // const { getByText } = await renderComponent();
    // expect(getByText('Users Index')).not.toBeNull();
    // expect(getByText('bob')).not.toBeNull();

  });
});

// https://cultivate.software/useeffect/
// https://www.youtube.com/watch?v=niqiP_5MrRA&ab_channel=Codevolution