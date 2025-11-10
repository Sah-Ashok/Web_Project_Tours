const mongoose = require("mongoose");

const destinationSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  tagline: {
    type: String
  },
  duration: {
    type: String
  },
  groupSize: {
    type: String
  },
  region: {
    type: String
  },
  description: {
    type: String,
    required: true
  },
  included: {
    type: String
  },
  price: {
    type: Number,
    required: true
  },
  category: {
    type: String,
    required: true
  },
  mainImage: {
    type: String,
    required: true
  },
  images: {
    type: [String],
    default: []
  },
  dateAdded: {
    type: Date,
    default: Date.now
  }
});

module.exports = mongoose.model("Destination", destinationSchema);
