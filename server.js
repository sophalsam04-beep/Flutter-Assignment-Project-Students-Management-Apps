const express = require('express');
const cors = require('cors');


const app = express();

app.use(cors());
app.use(express.json());

let students = [
    {
        id : 101,
        name : "Sam sophal",
        email : "sophal123@gmail.com",
    },
    {
        id : 102,
        name : "Un virak",
        email : "virakuhs@gmail.com",
    }


];

            // Get All students
app.get("/students", (_req, res)=>{
    res.json(students);

});

// Get students By id
app.get("/students/:id", (req, res)=> {
    const student = students.find(s => s.id == req.params.id);
    res.json(student);
});


// Create Students
app.post("/students", (req, res)=> {
    const student = {
        id: Date.now(),
        name: req.body.name,
        email: req.body.email,
    };

    students.push(student);

    res.status(201).json(student);
});

// Update students
app.put("/students/:id", (req, res)=> {
    const index = students.findIndex(s=> s.id == req.params.id);

    if (index === -1) {
        return res.status(404).json({ message: "Student not found" });
    }

    students[index] = {
        ...students[index],
        ...req.body,
    };

    res.json(students[index]);


});

// Delete students
app.delete("/students/:id", (req, res)=> {
    students = students.filter(s=> s.id != req.params.id);

    res.json({
        message: "Student Delete...!",
    });
});


// display result
app.listen(3000, ()=> {
    console.log("Server Running...!");
})

