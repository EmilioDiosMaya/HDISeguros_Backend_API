const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.post('/', (req, res) => {
    const { NombreUsuario, Contrasenia } = req.body
    mysqlConnection.query('CALL LoginUsuario(?, ?)', [NombreUsuario, Contrasenia], (err, rows) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        }else{
            res.status(500).json('Error de conexion con el servidor')
        }
    })
})

module.exports = router;