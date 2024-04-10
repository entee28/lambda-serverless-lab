const serverless = require("serverless-http");
const express = require("express");

const app = express();

app.get("/", (req, res, next) => {
  return res.status(200).json({
    message: "Good bye from root!",
  });
});

app.get("/path", (req, res, next) => {
  return res.status(200).json({
    message: "Good bye from path!",
  });
});

app.use((req, res, next) => {
  return res.status(404).json({
    error: "Not Found",
  });
});

module.exports.handler = serverless(app);
