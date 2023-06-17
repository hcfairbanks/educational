// import React from 'react';
import { render, screen} from '@testing-library/react';
// import '@testing-library/jest-dom/extend-expect'
import Home from '../pages/Home'

describe('<Toggle />', () => {
    it('should render ON when clicked', () => {
        render(<Home />);

        expect(screen.getByText(/This is a test/)).toBeInTheDocument(); // check if the ON string to be rendered after clicked
    });
});