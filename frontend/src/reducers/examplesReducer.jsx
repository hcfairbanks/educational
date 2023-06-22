import { CHANGE_CAT_COLOR } from '../constants/index';

const examplesReducer = (state = {color: "brown" }, action) => {
  switch (action.type) {
    case CHANGE_CAT_COLOR:
      let newState = {};
      newState['color'] = action.value;
    return newState;
    default:
      return state;
  }
};

export default examplesReducer;