const mongoose=require("mongoose");

const userSchema=mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    password:{
        type:String,
        required:true,
        trim:true
    },
    email:{
        type:String,
        required:true,
    },
    profilePic:{
        type:String,
        required:true
    },
    
},
{timestamps:true});

const User=mongoose.model("User",userSchema);
module.exports=User;