const {Router} = require('express');
const router = Router();

// const fetch = require('node-fetch');

router.get('/', async (req,res) => {
    // const response = await fetch('');
    // const users = await response.json();
    // res.json(users);

    return res.status(200).json("Este es el GET de conductores que trae a todos los conductores");
});

router.get('/:id',(req,res) =>{
    return res.status(200).json("Este es el GET de conductores que trae a un solo conductor");
});

router.post('/',(req,res)=>{
    return res.status(200).json("Este es el POST de conductores");
});

router.put('/:id',(req,res) =>{
    return res.status(200).json("Este es el PUT de conductores");
});

router.delete('/:id',(req,res)=>{
    return res.status(200).json("Este es el DELETE de conductores");
})

module.exports = router;