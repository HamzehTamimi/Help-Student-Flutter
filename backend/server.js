require("dotenv").config();
const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const authRoutes = require("./routes/auth");

const app = express();
app.use(cors());
app.use(bodyParser.json());

// this is used to connect to our Database
mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
}).then(() => console.log("MongoDB Connected"))
  .catch(err => console.error(err));

app.use("/auth", authRoutes);

const SpecialtySchema = new mongoose.Schema({
  name: { type: String, required: true },
  subjectsByYearSemester: {
    type: Map,
    of: [new mongoose.Schema({ name: String, credits: Number })],
  },
});

const Specialty = mongoose.model("Specialty", SpecialtySchema);

// this is used to POST the specialties
app.post('/specialties', async (req, res) => {
  try {
    const { name, subjectsByYearSemester } = req.body;

    if (!name || !subjectsByYearSemester) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    const specialty = new Specialty({ name, subjectsByYearSemester });
    await specialty.save();
    res.status(201).json(specialty);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});
 
// this is used to GET the specialties
app.get('/specialties', async (req, res) => {
  try {
    const specialties = await Specialty.find({}, 'name subjectsByYearSemester');
    res.status(200).json(specialties);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

app.listen(process.env.PORT, () => console.log(`Server running on port ${process.env.PORT}`));