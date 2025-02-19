const express = require('express');
const app = express();
const {PrismaClient} = require('@prisma/client');
const prisma = new PrismaClient();
app.use(express.json())

app.get('/api/flowers',  async  (req, res)  => {
    const data = await prisma.aruk.findMany();
    res.status(200).json(data);
});

app.get('/api/flowers/:id', async (req, res) => {
    const id = Number(req.params.id);
    const data = await prisma.aruk.findUnique({
        where: {
            id: id
        }
    });
    if(res.status(200)){
        res.status(200).json(data);
    }else{
        res.status(404).json({message: `Flower with id ${id} not found`});
    }
});

app.post('/api/flowers', async (req, res) => {
    const {id, nev, leiras, ar, keszlet} = req.body;
    const data = await prisma.aruk.create({
        data: {
            id: id,
            nev: nev,
            leiras: leiras,
            ar: ar,
            keszlet: keszlet
        }
    });

    res.status(201).json(data);
});

app.delete('/api/flowers/:id', async (req, res) => {
    const id = Number(req.params.id);
    try{

    const data = await prisma.aruk.delete({
        where: {
            id: id
        }

        });
        res.status(200).json(data);
    }catch (e) {
        res.status(404).json({message: `Flower with id ${id} not found`});
    }


});

app.get('api/categories', async (req, res) => {
    const data = await prisma.kategoriak.findMany();
    res.status(200).json(data);
});




const server = app.listen(3000, () => {
    console.log(`Server running on http://localhost:3000`);
});