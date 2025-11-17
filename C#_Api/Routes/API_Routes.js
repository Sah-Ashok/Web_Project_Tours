const express = require('express')
const route = express.Router();
const welcomeController  = require("../Controllers/welcome")
const DestinationsController = require("../Controllers/addDestinations")
const ViewController = require("../Controllers/ViewDestinations")

route.get("/View",ViewController.ViewDesti)
route.get("/",welcomeController.welcome)
route.post("/AddDestinations",DestinationsController.AddDestinations)


module.exports= route