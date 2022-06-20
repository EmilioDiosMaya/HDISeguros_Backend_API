const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');
const bcrypt = require('bcryptjs');


router.post('/', (req, res) => {
    const { NombreUsuario, Contrasenia } = req.body
    bcrypt.hash(Contrasenia, 10, function(err, hash){
        if(hash){
            mysqlConnection.query('CALL LoginUsuario(?, ?)', [NombreUsuario, hash], (err, rows) => {
                if (!err) {
                    if (!rows[0][0].hasOwnProperty('idUsuario')) {
                        res.status(200).json(rows[0][0])
                    } else {
                        res.status(500).json('Error de conexion con el servidor')
                    }
                }
            })
        }else{
            console.log(err)
        }
    })
})

module.exports = router;