//import React from 'react'
import { Container, Row, Col, Button } from 'react-bootstrap';
import { useDispatch, useSelector } from "react-redux";
import {useTranslation} from "react-i18next";

function Home() {

  const [t] = useTranslation('common');
  // const color = useSelector(state => state.examplesReducer.color);
  const color:any = useSelector((state: { examplesReducer: { color: any; }; }) => state.examplesReducer.color);
  const dispatch = useDispatch();
  
  async function outputChangeHandler(){
    await dispatch({
      type: "CHANGE_CAT_COLOR",
      value: "red"
    })
  }
  console.log(color)
  return (
    <div>
      <Container>
        <Row className="justify-content-md-center">
          <Col xs={12} md={2} lg={2}>
          </Col>
          <Col xs={12} md={8} lg={8}>
            <h1>{t('welcome.title', {framework:'React'})}</h1>
            <h1 style={{display: 'flex', justifyContent: 'center'}}>This is a test</h1>
            <h1 style={{display: 'flex', justifyContent: 'center'}}>About React-Redux</h1>
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
              {color}
            </div>
          </Col>
          <Col xs={12} md={2} lg={2}>
          </Col>
        </Row>
      </Container>
    </div>
  )
}

export default Home
