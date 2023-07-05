import { render, screen } from '@testing-library/react';
import Users from '../pages/Users'
import axios from 'axios';
import AxiosMock from 'axios-mock-adapter';
//import { axe } from 'jest-axe';

const axiosMock = new AxiosMock(axios);

describe('<Users />', () => {
  test('should render text', async () => {
    axiosMock.onGet('http://127.0.0.1:3000/users').reply(200, {
      data:{
        id: 1,
        first_name: "bob",
        last_name:"boberson"
      }
    });

    render(<Users />);
    expect(await screen.getByText('Users Index')).not.toBeNull();
    expect(await screen.getByText('bob')).not.toBeNull();
    const users = await screen.findAllByRole('listitem');
    expect(users).toHaveLength(14);

    // const { getByText } = await renderComponent();
    // expect(getByText('Users Index')).not.toBeNull();
    // expect(getByText('bob')).not.toBeNull();
    // expect(getByText('fuck')).not.toBeNull();

  });
});

// https://cultivate.software/useeffect/
// https://www.youtube.com/watch?v=niqiP_5MrRA&ab_channel=Codevolution