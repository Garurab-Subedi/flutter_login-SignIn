// This file will Describe our user
const mongoose = require("mongoose");

// create a model for the user
const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      dafault: "",
    },
    email: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },

    profilePicture: {
      type: String,
      dafault: "",
    },
    coverPicture: {
      type: String,
      dafault: "",
    },
  },
  { timestamps: true }
);
