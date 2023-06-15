import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'

import { Provider } from 'react-redux'
import combineReducers from './reducers/index'
import thunk from 'redux-thunk';
import logger from 'redux-logger'
import { configureStore } from '@reduxjs/toolkit'

import { I18nextProvider } from "react-i18next";
import i18next from "i18next";
import './i18n';

// TODO I dont think I need thunk, investigate this
const store = configureStore({
  reducer: combineReducers,
  middleware: [thunk, logger]
})


ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <Provider store={store}>
      <I18nextProvider i18n={i18next}>
        <App/>
      </I18nextProvider>
    </Provider>
  </React.StrictMode>,
)
