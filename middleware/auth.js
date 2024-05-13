const jwt=require("jsonwebtoken");

const authMiddleWare=async (req,res,next)=>{
    try{
        const token=req.header("x-auth-token");
        if(!token)
        return res.status(401).json({message:"No token, access denied"});
        const verify=jwt.verify(token,"keypass");
        if(!verify){
            return res.status(401).json({message:"authorization denied"})
        }
        req.user=verify.id; 
        req.token=token;
        next();
    }catch(e){
        return res.status(500).json({message:e.message})
    }
}

module.exports=authMiddleWare;