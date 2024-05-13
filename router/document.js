const express=require("express");
const docs=require("../controller/document.js")
const authMiddleWare=require("../middleware/auth.js")
const docRouter=express.Router();

docRouter.post("/api/v1/createDocument",authMiddleWare,docs.createDocument);
docRouter.get("/api/v1/getMyDocuments",authMiddleWare,docs.getMyDocuments);
docRouter.post("/api/v1/updateTitleDocument",authMiddleWare,docs.updateTitleDoc);
docRouter.get("/api/v1/getDocumentById/:id");
module.exports=docRouter;
