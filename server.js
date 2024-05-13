const express=require("express");
const mongoose=require("./configdb/mongoose");
const http=require("http");
const cors=require("cors")
const authRouter=require("./router/auth.js")
const documentRouter=require("./router/document.js");
const port=process.env.port| 3001;

const app=express();
var server=http.createServer(app);
var io=require("socket.io")(server);

app.use(express.json());
mongoose.mongoose;

app.use(authRouter);
app.use(documentRouter);

io.on("connected",(socket)=>{
    socket.on("joined ",(documentId)=>{
        socket.join(documentId);
    });
    console.log("socket connected "+socket.id);
})

server.listen(port,"0.0.0.0",()=>{
    console.log("server is running");
});