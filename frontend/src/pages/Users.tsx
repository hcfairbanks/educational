//import React from 'react'
import { useState, useEffect } from 'react';
import { Table, Container, Row, Col } from 'react-bootstrap';
import axios from 'axios'


function Users (){

  //const [users, setUsers] = useState<string[]>([])
  const [users, setUsers] = useState(
    [
      {
        id:"",
        first_name: "",
        last_name:"",
        email:"",
      }
    ]
  )

  useEffect(() => {
    async function getUsers() {
      const response = await axios.get('http://127.0.0.1:3000/users')
      console.log("Use Effect Call:::",response.data)
      setUsers(response.data);
    };
    getUsers();
  }, []);
  
  return (
    <div>
      <h1 key="users_index_key">Users Index</h1>
      <span id="users">
      { users.map((user)=>{
        return (
          <ul key={`list_${user.id}`}>
            <li key={`id_${user.id}`}>{user.id}</li>
            <li key={`firstName_${user.id}`}>{user.first_name}</li>
          </ul>
      )})}
      </span>
    </div>
  )
}

export default Users
