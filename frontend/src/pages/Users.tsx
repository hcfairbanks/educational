//import React from 'react'
import { useState, useEffect } from 'react';
import { Table, Container, Row, Col, Button } from 'react-bootstrap';
import axios from 'axios'

import { useDispatch, useSelector } from "react-redux";
import {useTranslation} from "react-i18next";



function Users (){

  const [t] = useTranslation('common');
  // https://github.com/i18next/next-i18next/issues/1917
  // const color = useSelector(state => state.examplesReducer.color);

  type ColorState = {
    examplesReducer: {
      color: string
    }
  }
  const colorSelection: any = useSelector((state: ColorState )=> state.examplesReducer);
  const dispatch = useDispatch();

  async function outputChangeHandler(){
    await dispatch({
      type: "CHANGE_CAT_COLOR",
      value: "red"
    })
      console.log(colorSelection)
  }

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
      console.log("color selected::::",colorSelection)
      setUsers(response.data);
    };
    getUsers();
  }, []);
  
  return (
    <div>
      <h1>{t('welcome.title', {framework:'React'})}</h1>
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
      <div>
      <div style={{display: 'flex', justifyContent: 'center'}}>
              <Button onClick={outputChangeHandler}>Click me</Button>
              <input
                id={"change_color"}
                name={"change_color"}
                type={"text"}
                onChange={e => dispatch({
                  type: "CHANGE_CAT_COLOR",
                  value: e.target.value
                })}
              />
           </div>
            <div style={{display: 'flex', justifyContent: 'center'}}>
              {colorSelection.color}
            </div>
      </div>
    </div>
  )
}

export default Users
