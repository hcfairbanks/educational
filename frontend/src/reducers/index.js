import { combineReducers } from 'redux';

import aboutReducer       from './aboutReducer';
import examplesReducer    from './examplesReducer';
import itemsReducer       from './itemsReducer';
import paginationReducer  from './paginationReducer'
import searchItemsReducer from './searchItemsReducer';
import myHomePageReducer  from './myHomePageReducer';
import languageReducer    from './languageReducer';

export default combineReducers ({
  "languageReducer": languageReducer,
  "examplesReducer": examplesReducer,
  "aboutReducer": aboutReducer,
  "itemsReducer": itemsReducer,
  "paginationReducer": paginationReducer,
  "searchItemsReducer": searchItemsReducer,
  "myHomePageReducer": myHomePageReducer
});

