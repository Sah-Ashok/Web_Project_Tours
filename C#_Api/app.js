const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const { AddDestinations, upload } = require("./Controllers/addDestinations");
const router = require("./Routes/API_Routes")
const app = express();
const PORT = 3000;
const DB_PATH =
  "mongodb+srv://root:sahashok@aa2.hrda1.mongodb.net/API?retryWrites=true&w=majority&appName=AA2";

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post(
  "/AddDestinations",
  upload.fields([
    { name: "MainImage", maxCount: 1 },
    { name: "GalleryImages", maxCount: 10 },
  ]),
  AddDestinations
);

app.use(router)

mongoose
  .connect(DB_PATH)
  .then(() => {
    console.log("Database Connected");
    app.listen(PORT, () => {
      console.log(`Server is running at http://localhost:${PORT}`);
    });
  })
  .catch((err) => {
    console.log("Error while connecting", err);
  });
