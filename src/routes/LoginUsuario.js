const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.post('/', (req, res) => {
    const { Telefono, NombreUsuario, Contraseña } = req.body
    mysqlConnection.query('CALL LoginUsuario(?, ?, ?)', [Telefono, NombreUsuario, Contraseña], (err, rows) => {
        if (!err) {
            if (!rows[0][0].hasOwnProperty('idUsuario')) {
                res.status(200).json(rows[0][0])
            } else {
                res.status(500).json('Error de conexion con el servidor')
            }
        }
    })
})

module.exports = router;