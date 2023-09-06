// This is import the express
const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
// this is calling the express
const app = express();

dotenv.config();
// conntect MOngogDB
mongoose
  .connect(process.env.MONGO_URL)
  .then(() => console.log("Database Connection is sucessfull"))
  .catch((err) => console.error("Coundnot cconnect to mongodb", err));

//port for out app connection
const port = process.env.PORT;

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
