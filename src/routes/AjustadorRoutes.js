const {Router} = require('express');
const router = Router();

// const fetch = require('node-fetch');

router.get('/', async (req,res) => {
    // const response = await fetch('');
    // const users = await response.json();
    // res.json(users);

    return res.status(200).json("Este es el GET de ajustadores que trae a todos los ajustadores");
});

router.get('/:id',(req,res) =>{
    return res.status(200).json("Este es el GET de ajustadores que trae a un solo ajustador");
});

router.post('/',(req,res)=>{
    return res.status(200).json("Este es el POST de ajustadores");
});

router.put('/:id',(req,res) =>{
    return res.status(200).json("Este es el PUT de ajustadores");
});

router.delete('/:id',(req,res)=>{
    return res.status(200).json("Este es el DELETE de ajustadores");
})

module.exports = router;