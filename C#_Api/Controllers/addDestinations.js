const path = require("path");
const Destination = require("../Models/Destinations");
const multer = require("multer");
const fs = require("fs");


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const uploadPath = path.join(__dirname, "../public/uploads");
    if (!fs.existsSync(uploadPath)) fs.mkdirSync(uploadPath, { recursive: true });
    cb(null, uploadPath);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "_" + file.originalname);
  },
});

const upload = multer({ storage: storage });


const AddDestinations = async (req, res) => {
  try {
    const mainImage = req.files?.MainImage ? req.files.MainImage[0].filename : null;
    const galleryImages = req.files?.GalleryImages
      ? req.files.GalleryImages.map((file) => file.filename)
      : [];

    if (!mainImage) {
      return res.status(400).json({ message: "Main image is required." });
    }

    const { DestName, Tagline, Duration, GroupSize, Region, Description, Included, Price, Category } = req.body;

    if (!DestName || !Description || !Price || !Category) {
      return res.status(400).json({ message: "Required fields are missing." });
    }

    const newDestination = new Destination({
      name: DestName,
      tagline: Tagline,
      duration: Duration,
      groupSize: GroupSize,
      region: Region,
      description: Description,
      included: Included,
      price: Price,
      category: Category,
      mainImage: mainImage,
      images: galleryImages,
    });

    await newDestination.save();

    res.status(200).json({ message: "Destination added successfully!", data: newDestination });
  } catch (err) {
    console.error("Error saving destination:", err);
    res.status(500).json({ message: "Server error, could not add destination." });
  }
};

module.exports = {
  AddDestinations,
  upload,
};
