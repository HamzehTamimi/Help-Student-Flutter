const express = require("express");
const router = express.Router();
const User = require("../models/User");
const bcrypt = require("bcryptjs");

router.post("/login", async (req, res) => {
    const { username, password } = req.body;

    console.log("Login attempt:", { username, password });

    // Check if the user exists
    const user = await User.findOne({ username });
    console.log("Stored user password hash:", user ? user.password : "No user found");

    // If the user doesn't exist or password doesn't match, return invalid credentials
    if (!user || user.password !== password) {
        return res.status(401).json({ message: "Invalid credentials" });
    }

    // Return a success message if login is successful
    res.json({ message: "Login successful" });
});

router.post("/register", async (req, res) => {
    const { username, password } = req.body;

    // Check if user already exists
    const existingUser = await User.findOne({ username });
    if (existingUser) {
        return res.status(400).json({ message: "User already exists" });
    }

    // Register new user
    const newUser = new User({ username, password });
    await newUser.save();

    res.json({ message: "User registered successfully" });
});

module.exports = router;