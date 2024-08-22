import mongoose from "mongoose";
const connectToMongoDB = async () => {
	try {
		const MONGO_DB_URI='mongodb://localhost:27017/'; 
		await mongoose.connect(MONGO_DB_URI);
		console.log("Connected to MongoDB");
	} catch (error) {
		console.log("Error connecting to MongoDB", error.message);
	}
};

export default connectToMongoDB;
