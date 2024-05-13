const express=require("express");
const authRegister=require("../controller/auth.js")
const authMiddleWare=require("../middleware/auth.js")
const authRouter=express.Router();

authRouter.post("/api/v1/signup",authRegister.authRegister);
authRouter.post("/api/v1/login",authRegister.authLogin);
authRouter.get("/",authMiddleWare,authRegister.getUser)
module.exports=authRouter;
