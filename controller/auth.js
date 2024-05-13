
const User=require("../models/user");
const jwt=require("jsonwebtoken");
const bcrypt=require("bcryptjs")

const  authRegister=async(req,res)=>{
    try{

        const {name,email,profilePic}=req.body;
        let existUser=await User.findOne({email});

        if(existUser){
           return res.status(400).json({messqge:"user already exists with this email"});
        }
        const salt= await bcrypt.genSalt(10);

        req.body.password=await bcrypt.hash(req.body.password,salt);
             existUser=new User(
                {
                    name,
                    password:req.body.password,
                    email,
                    profilePic,
                    
                }
            );
            existUser=await existUser.save();
            const token= jwt.sign({id:existUser._id},"keypass");
            const {password,...payload}=existUser._doc;

           return res.status(200).json({token,payload});
    }catch(e){
            return  res.status(500).json({error:e.message})
    }
}
  
const authLogin=async(req,res)=>{
    try{
        let existUser=await User.findOne({email:req.body.email});
        if(!existUser){
            return res.status(400).json({message:"please verify your credentials"})
        }
        const isPasswordMatch=await bcrypt.compare(req.body.password,existUser.password);
        if(!isPasswordMatch){
            return res.status(400).json({message:"please verify your credentials"})
        }
        const {password,...payload}=existUser._doc;
            const token=jwt.sign({id:existUser._id},"keypass");
            return res.status(200).json({payload,token});
        
    }catch(e){
        return res.status(500).json({message:e.message})
    }
}


const getUser=async(req,res)=>{
    try{
        let user=await User.findById(req.user);
        return res.status(200).json({user,token:req.token});
    }catch(e){
        return res.status(500).json({message:e.message})
    }
}

module.exports={authRegister,authLogin,getUser};
