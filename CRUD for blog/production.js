const express = require('express');
//const connnection = require('../connection');
const connection = require('./connection');
const router = express.Router();

//CREATING
router.post('/create', (req, res, next) =>{
    let product = req.body;
    query = "INSERT INTO notes(noteId, startDate, text, guidelineId, projectId) VALUES(?,?,?,?,?)";
    connection.query(query, [product.nodeId, product.startDate, product.text, product.guidelineId, product.projectId], (err, results) =>{
        if(!err){
            return res.status(200).json({message: "Product added successfully!"});

        }else
        return res.status(500).json(err);
    });
});


//READ
router.get('/read', (req, res, next)=>{
    var query = "SELECT * FROM notes";
    connection.query(query, (err, results) =>{
        if(!err){
            return res.status(200).json(results);
        }else{
            return res.status(500).json(err);
        }
    })
})

//UPDATE
router.patch('/update/:id', (req, res, next) =>{
    const id = req.params.id;
    let product = req.body;
    var query = "UPDATE notes SET noteId=?, startDate=?, text=?, guidelineId=?, projectId=?"
    connection.query(query, [product.noteId, product.startDate, product.text, product.guidelineId, product.productId, id], (err, results)=>{
        if(!err){
            if(results.affectedRows==0){
                return res.status(404).json({message: "Product are not found!"});
            }
            return res.status(200).json({message: "Product updated successfully!"}); 
        }
        else{
            return res.status(500).json(err);
        }
    });
});

//DELETE
router.delete('/delete/:id', (req, res, next)=>{
    const id = req.params.id;
    var query = "DELETE FROM notes WHERE id =?";
    connection.query(query,[id], (err, results)=>{
        if(!err){
            if(results.affectedRows==0){
                return res.status(404).json({message: "Product are not found!"});
            }
            return res.status(200).json({message: "Product deleted successfully!"}); 
        }
        else{
            return res.status(500).json(err);   
        }
    })
})

module.exports = router;