const {Router} = require('express');
const router = Router();

// const fetch = require('node-fetch');

router.get('/', async (req,res) => {
    // const response = await fetch('');
    // const users = await response.json();
    // res.json(users);

    return res.status(200).json("Este es el GET de ejecutivos que trae a todos los ejecutivos");
});

router.get('/:id',(req,res) =>{
    return res.status(200).json("Este es el GET de ejecutivos que trae a un solo ejecutivo");
});

router.post('/',(req,res)=>{
    return res.status(200).json("Este es el POST de ejecutivos");
});

router.put('/:id',(req,res) =>{
    return res.status(200).json("Este es el PUT de ejecutivos");
});

router.delete('/:id',(req,res)=>{
    return res.status(200).json("Este es el DELETE de ejecutivos");
})

module.exports = router;