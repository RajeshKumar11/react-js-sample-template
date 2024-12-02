import React from "react";
import "./ComponentA.css";
import ComponentB from "../ComponentB/ComponentB";

const ComponentA = () => {
  return (
    <div className="component-a">
      <h1>Component A</h1>
      <p>This is Component A, and it uses Component B below:</p>
      <ComponentB />
    </div>
  );
};

export default ComponentA;
