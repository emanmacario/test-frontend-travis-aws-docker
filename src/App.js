import React, { useState } from 'react';
import logo from './logo.svg';
import './App.css';
import axios from 'axios';
import { Button, Input, Typography } from 'antd';
import 'antd/dist/antd.css';

const { Title } = Typography;

function App() {
  const [input, setInput] = useState(null);
  const [reversed, setReversed] = useState(null);

  const handleClick = async () => {
    const response = await axios.get(`http://localhost:5000/${input}`);
    console.log(response);
    setReversed(response.data);
  }

  return (
    <div className="App">
      <Title level={1}>String Reverser</Title>
      <Input 
        placeholder="Enter string" 
        value={input}
        onChange={(e) => setInput(e.target.value)}
      />
      <Button 
        type="primary"
        onClick={() => handleClick()}
      >
        Submit
      </Button>

      <Title level={4}>{reversed}</Title>
    </div>
  );
}

export default App;
