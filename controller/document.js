const Document=require("../models/document");


const createDocument =async(req, res) => {
    try {
        const newDocument = new Document({
            title: "Untitled document",
            uid: req.user,

        });
        const savedDocument = await newDocument.save();
        return res.status(201).json(savedDocument);
    } catch (e) {
        return res.status(500).json({ message: e.message });
    }
}

const getMyDocuments=async(req,res)=>{
    try{
        const documents= await Document.find({uid:req.user});
        return res.status(200).json({payload:documents});
    }catch(e){
        return res.status(500).json({message:e.message});
    }
}

const updateTitleDoc=async(req,res)=>{
    try{
        const {id,title}=req.body;
        const document=await Document.findByIdAndUpdate(id,{title});
        return res.json({payload:document});
    }catch(e){
        return res.status(500).json({message:e.message});

    }
}

const getDocumentById=async(req,res)=>{
    try{
        let document=await Document.findById(req.params.id);
        return res.status(200).json({payload:document});
    }catch(e){
        return res.status(500).json({message:e.message});
    }
}

module.exports={createDocument,getMyDocuments,updateTitleDoc,getDocumentById};