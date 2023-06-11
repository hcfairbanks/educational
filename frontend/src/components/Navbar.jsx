import React from "react";
import {Link} from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Nav, Navbar, Dropdown } from 'react-bootstrap';

function Button({text, bg, padding}) {
  return (
    <div>
      <button
        className="btn btn-primary"
      >
        <span>{text}</span>
      </button>
    </div>
  );
}


function Navlist() {
  return (
    <div className="fixed left-0 right-0 top-0 h-16 shadow-md border-b-2 border-gray-100 bg-gray-900">
      <nav className="flex items-center container mx-auto h-full justify-between">
        <h1 className="font-semibold uppercase text-lg text-gray-200">
          🔄 Demo App
        </h1>
        <div>
          <ul className="flex items-center space-x-10 text-sm">
            <li><Link to="/" className="text-gray-400 hover:text-gray-100">Home</Link></li>
            <li><Link to="/about" className="text-gray-400 hover:text-gray-100">About Us</Link></li>
            <li><Link to="/docs" className="text-gray-400 hover:text-gray-100">Docs</Link></li>
          </ul>
        </div>
        <div>
          <Button text="Login" class="btn btn-primary"/>
        </div>
      </nav>
      <Navbar style={{background: "grey"}} expand="lg">
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
        <Nav className="mr-auto" style={{marginLeft: 2 + 'em'}}>
          <Nav.Link href="/home">Home</Nav.Link>
        </Nav>
        <Nav className="mr-auto" style={{marginLeft: 1 + 'em'}}>
          {/* <Nav.Link
            id={'signout'}
            href="#"
            onClick={submitSignOut}>
              Sign Out
          </Nav.Link> */}
        </Nav>
        {/* <Nav className="mr-auto" style={{marginLeft: 1 + 'em'}}>
          <NavDropdown title={<img src={`/languages/${language}.png`} />} id="basic-nav-dropdown">
            <HeaderComponent/>
          </NavDropdown>
        </Nav> */}

        </Navbar.Collapse>
      </Navbar>
    </div>
   
  );
}

export default Navlist;
