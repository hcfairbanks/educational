import combineReducers from './reducers/index'
import thunk from 'redux-thunk';
import logger from 'redux-logger'
import { configureStore } from '@reduxjs/toolkit'


const store = configureStore({
  reducer: combineReducers,
  middleware: [thunk, logger]
})




export default store