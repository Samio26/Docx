const mongoose=require("mongoose");
const uri="mongodb+srv://aissasemi:21021847@cluster0.kmcac3m.mongodb.net/"

mongoose.connect(uri).then(
    ()=>{
        console.log("db connected")
    }
).catch((err)=>{
    console.log(err);
});

module.exports=mongoose;