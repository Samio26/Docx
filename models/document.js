const mongoose=require("mongoose");

const documentSchema=mongoose.Schema({
    title:{
        type:String,
        required:true
    },
    uid:{
        type:String,
        required:true
    },
    content:{
        type:Array,
        default:[]
    },
    

},{timestamps:true});

const Document=mongoose.model("Document",documentSchema);

module.exports=Document;