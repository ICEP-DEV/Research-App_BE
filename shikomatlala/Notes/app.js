const express = require('express');
const bodyparser = require('body-parser');
const cors= require('cors');
const mysql = require('mysql');
const wordCounter = require('word-counting');
const { process_params } = require('express/lib/router');
const getWords = require('get-words');

const app = express();
app.use(cors());
app.use(bodyparser.json());


//DATABASE CONNECTION
const researcherdna = mysql.createConnection({
    host:       'localhost',
    user:       'root', 
    password:   '',
    database:   'researcherdna'
});
researcherdna.connect(err=>{
    if(err) {console.log(err, ' ResearcherDNA Error');}
    console.log('Database connected');
});


//POST THE DATA - 
//But before we post the data we need to make sure that all our users and everyone else exists.
//We need to get the user ID stored somewhere.
// app.use(getUser)


app.post('/blog/insert', (req, res)=>{
    let testData = {
        title: "What are your post PhD job prospects, 2 years into the pandemic?",
        post: "As regular readers will know, I am a working researcher with an interest in post PhD employability. For nearly 10 years now my research focus has been on job advertisements for researchers. this post is a detailed update on the academic and non-academic job market, 2 years into the pandemic. If you don’t want to read a whole blog post, you can download our latest report or come along to our public lecture on the 23rd of March at 7pm AEDT. I hope you’ll stick with the blog post though! As data, job advertisements are fascinating because they are a wish list from an employer for a person who probably doesn’t exist. By looking closely at job ad texts, and counting the ads themselves, you can get a good idea of the size and extent of a job market. Job ads also tell you what kind of person employers are looking for: their skills, capabilities and attitudes. As an educator, it’s possible to work backwards from job ads to what you teach in the classroom. Of course, universities shouldn’t just teach what employers want – but we shouldn’t ignore them either. I use my research on job ad data to inform the content in my writing and presentation workshops and to help ANU decide what kind of professional development it offers to candidates. My early work on academic job ads was done in collaboration with Dr Rachael Pitt, resulting in my most downloaded (and cited) paper Academic Superheroes. Since 2017 I have collaborated with ANU colleagues A/Prof Hanna Suominen and A/Prof Will Grant looking at non-academic job ads through the PostAc project. We’ve even released an app: PostAc is a job searching platform designed just for researchers. We use machine learning and natural language processing to analyse large data sets – and by large I mean millions of job ads – to see what different industries might be looking for researchers. With the processing power of the technology underpinning the PostAc app, we can produce visualisations of each industry job distribution ‘finger print’. The one below is of manufacturing, transport and logistics using every job from Seek.com in 2015:",
        userId: 1,
        dateCreated: "current_timestamp()"
    };
    let blog = {title: "",
                post: "",
                userId:0,
                dateCreated: "current_timestamp()"};
    blog.title = encodeURI(req.body.title);
    blog.post = encodeURI(req.body.post);
    blog.userId = req.body.userId;
    let sql = `INSERT INTO \`blog\` (\`title\`, \`post\`, \`userId\`, \`dateCreated\`) VALUES ( "${blog.title}", "${blog.post}", ${blog.userId}, ${blog.dateCreated})`;
    console.log(sql);
    researcherdna.query(sql, (err, result)=>{
        if(err) throw err;
        res.send(result);
        console.log("Blog Created");
    });
    //We are not going to ensure that we have the user
});

app.post('/blog/delete', (req, res)=>{
    let testData = {
        blogId: 0,
    };
    let blog = {blogId: 0};
    blog.blogId = req.body.blogId;
    let sql = `DELETE FROM \`blog\` WHERE blogId = ${blog.blogId}`;
    researcherdna.query(sql, (err, result)=>{
        if(err) throw err;
        console.log(sql);
        res.send(result);
    })
})

//Select *
app.get('/blog/getAll', (req, res)=>{
    //We just want a select - but we also want to select where...
    let sql = `SELECT * FROM blog`;
    researcherdna.query(sql, (err, result)=>{
        if(err) throw err;
        console.log("Data Retrieved");
        res.send(result);
    })
})
//Select by Department
app.get('/blog/getAll', (req, res)=>{
    //The department is based upon the person that created the blog.
    //But what if I am creating a blog for everyone - but then who will the information be relevant to?
    let sql = "SELECT * FROM blog"
})

app.post('/insert', (req, res)=>{
    let note = {

        text : "Become an Oracle Learning Explorer\nFree Training & Accreditation\nThe Oracle Learning Explorer program offers entry-level training courses and accreditation for Oracle's entire product portfolio. It was designed to empower professionals across the globe to begin cultivating valuable IT skills. Start your journey today.",
        guidelineId : 2, 
        projectId : 1,
        updatedAt : "current_timestamp()",
        title : ""
    
    }
    //Check if the user exists
    //The one thing that we can do is to post a script where we are going to have the user information.
    //Now what is that script that we are going to post.
    //I can create a cookie where I am going to find this information

    let sql = `SELECT * FROM users WHERE userId = 1`;
    researcherdna.query(sql, (err, result)=>{
        if(err) throw err;
        if(result.length > 0){
            //If this is the case then it means that the user exists
            //Now let us check if the project ID exists
            //First of all 
            let sql = `SELECT * FROM projects WHERE userId = 1 AND projectId= 1`;
            researcherdna.query(sql, (err, result)=>{
                if(err) throw err;
                if(result.length > 0){
                    //Now let us create the notes - 
                    let startDate = "current_timestamp()";
                    let updatedAt = "current_timestamp()";
                    let text = req.body.text;
                    // let text = req.body.text.replace(/"/g, "\"").replace(/'/g, "\'").replace(/`/g, "\`");
                    // text =  text.replace(/"/g, "\"").replace(/'/g, "\'").replace(/`/g, "\`");
                    
                    text = encodeURI(text);
                    console.log(text);
                    let guidelineId = req.body.guidelineId;
                    let guidelineIdFied = "";
                    if(req.body.guidelineId =="")
                    {
                        guidelineId = "";
                        guidelineIdFied = "";
                    }
                    else
                    {
                        //The idea is to omit the guideline - but if I omit the guideline I also need to make sure that I omit the fieldName
                        guidelineIdFied = "\`guidelineId\`,";
                        guidelineId += ",";
                    }
                    let projectId = req.body.projectId;
                    //Now let us create the title - if the title is empty.
                    let title = "";
                    if(req.body.title == "")
                    {
                        // let words = getWords(req.body.text);
                        let words = req.body.text.split(' ');
                        //The title is empty.
                        const stopCount = 5;
                        for(let x =0; x < stopCount; x++)
                        {
                            if(words[x] != undefined)
                                title += " " + words[x];
                            else
                                x = stopCount;
                        }
                        title += "...";
                    }
                    else
                    {
                        title = req.body.title; 
                    }
                    title = encodeURI(title);
                    let wordCount = wordCounter(text).wordsCount;
                    // let sql = `INSERT INTO \`notes\` ( \`startDate\`, \`text\`, ${guidelineIdFied} \`projectId\`, \`title\`, \`updatedAt\`, \`wordCount\`) VALUES ( ${startDate}, ${text}, ${guidelineId} 1, "${title}", ${updatedAt}, ${wordCount});`;
                    
                    let sql = `INSERT INTO \`notes\` ( \`startDate\`, \`text\`, ${guidelineIdFied} \`projectId\`, \`title\`, \`updatedAt\`, \`wordCount\`) VALUES ( ${startDate}, "${text}", ${guidelineId} 1, "${title}", ${updatedAt}, ${wordCount});`;
                    console.log(sql);
                    researcherdna.query(sql, (err,result)=>{
                        if(err) throw err;
                        res.send(result);
                    })
                }
                else
                {
                    res.send(`<h1>Error</h1>
                    <p>Project Does not exits</p>`)
                }
            })
        }
        else
        {
            res.send(`<h1>Error</h1>
            <p>Please log in first</p>`)
            // res.status(200).json({
            //     status: 'success',
            //     user: req.user
            // })
        }
    });
});

app.post('/update', (req, res)=>{
    //Check if the user exists
    //The one thing that we can do is to post a script where we are going to have the user information.
    //Now what is that script that we are going to post.
    //I can create a cookie where I am going to find this information
    let note = {
        text : "Java SE 11 Developer\nGet a complete view of Java SE 11 technology and prepare for the certification exam.\n\nWelcome to the Java SE 11 Developer learning path!\nIf you're completely new to programming, try the course Java SE 11: Programming Complete.\nYou'll also find resources on Java certification preparation, new features, and developing Java applications for Oracle Cloud Infrastructure.\nThe Java SE: Programmer I (1Z0-815) and Java SE: Programmer II (1Z0-816) exams have been retired. They are replaced by the new exam Java SE 11 Developer (1Z0-819).",
        title : ""
    }
    let noteId = req.body.guidelineId;

    let sql = `SELECT * FROM users WHERE userId = 1`;
    researcherdna.query(sql, (err, result)=>{
        if(err) throw err;
        if(result.length > 0){
            //If this is the case then it means that the user exists
            //Now let us check if the project ID exists
            //First of all 
            let sql = `SELECT * FROM projects WHERE userId = 1 AND projectId= 1`;
            researcherdna.query(sql, (err, result)=>{
                if(err) throw err;
                if(result.length > 0){
                    //Now let us create the notes - 
                    let text = req.body.text;
                    //Now let us create the title - if the title is empty.
                    //During the part of the update, we do not want to mess up with the title - we but the user might want to change the title, so we need to keep it here incase we need to change it.
                    
                    let title = "";
                    if(req.body.title == "")
                    {
                        let words = getWords(req.body.text);
                        //The title is empty.
                        for(let x =0; x < 5; x++)
                        {
                            title += " " + words[x];
                        }
                        title += "...";
                    }
                    else
                    {
                        title = req.body.title;
                    }
                    let wordCount = wordCounter(text).wordsCount;
                    //NB:
                    //!!!!NOTE ID IS REQUIRED FROM THE SYSTEM
                    let sql = `UPDATE \`notes\` SET  text = "${text}", title = "${title}", updatedAt = current_timestamp(), wordCount = ${wordCount} WHERE noteId = ${noteId}`;//But the noteId needs to exist first, if it does not exist we cannot add the note.
                    researcherdna.query(sql, (err, result)=>{
                        if(err) throw err;
                        res.send(result);
                        // res.send(`<h1>Update Success</h1>
                        // <p>Notes saved - ${title}</p><br>${sql}`);
                    })
                }
                else
                {
                    res.send(`<h1>Error</h1>
                    <p>Project Does not exits</p>`)
                }
            })
        }
        else
        {
            res.send(`<h1>Error</h1>
            <p>Please log in first</p>`)
        }
    });
});

app.post('/delete', (req, res)=>{
    //Check if the user exists
    //The one thing that we can do is to post a script where we are going to have the user information.
    //Now what is that script that we are going to post.
    //I can create a cookie where I am going to find this information

    let sql = `SELECT * FROM users WHERE userId = 1`;
    researcherdna.query(sql, (err, result)=>{
        if(err) throw err;
        if(result.length > 0){
            //If this is the case then it means that the user exists
            //Now let us check if the project ID exists
            //First of all 
            let sql = `SELECT * FROM projects WHERE userId = 1 AND projectId= 1`;
            researcherdna.query(sql, (err, result)=>{
                if(err) throw err;
                if(result.length > 0){
                    let noteId = req.body.noteId;
                    //NB:
                    //!!!!NOTE ID IS REQUIRED FROM THE SYSTEM
                    let sql = `DELETE FROM \`notes\` WHERE noteId = ${noteId}`;
                    researcherdna.query(sql, (err, result)=>{
                        if(err) throw err;
                        res.send(result);
                    });
                }
                else
                {
                    res.send(result)
                }
            })
        }
        else
        {
            res.send(result)
        }
    });
});

//Now select becomes important when we want to order our information.
//We now need to make sure that a user can select based upon the note Id - 
app.get('/select', (req,res)=>{
    //This needs to be a proper 
    let sql = "SELECT * FROM notes WHERE projectId = 1 ORDER BY updatedAt DESC";
    researcherdna.query(sql, (err, result)=>{
        if(err) throw err;
        if(result.length > 0)
        {
            res.send({message: "All Notes", data:result});
            console.log(result);
        }
        else
        {
            res.send(result);
        }
    });
});

app.listen(3000, ()=>{
	console.log('Server running');
});