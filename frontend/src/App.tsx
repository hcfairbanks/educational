import React from 'react';
import Navbar from './components/Navbar';
import {BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Home from './pages/Home';
import About from './pages/About';
import Docs from './pages/Docs';

// https://www.youtube.com/watch?v=K_Qc_c6GH0g&ab_channel=0xVivek



function App() {
  return (
    <Router>
    <div className="pt-20">
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />}/>
        <Route path="/about" element={<About />} />
        <Route path="/docs" element={<Docs />} />
      </Routes>
    </div>
    </Router>
  )
}

export default App
