import { CHANGE_LANGUAGE } from '../constants/index';

const languageReducer = (state = {language: "english"}, action) =>{
  switch (action.type) {
    case CHANGE_LANGUAGE:
      let newState = {}
      newState['language'] = action.value;
      return newState;
    default:
      return state;
  }
};

export default languageReducer;


// import { CHANGE_CAT_COLOR } from '../constants/index';

// const languageReducer = (state = {color: "brown" }, action) =>{
//   switch (action.type) {
//     case CHANGE_CAT_COLOR:
//       let newState = {};
//       newState['color'] = action.value;
//     return newState;
//     default:
//       return state;
//   }
// };

// export default languageReducer;