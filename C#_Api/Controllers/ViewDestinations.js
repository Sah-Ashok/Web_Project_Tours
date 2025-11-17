const Destinations = require("../Models/Destinations")
const ViewDesti = async(req,res)=>{
  const Destination = await Destinations.find({})
  console.log(Destination);
  res.json({message:Destination})
}

module.exports = {
  ViewDesti,
}