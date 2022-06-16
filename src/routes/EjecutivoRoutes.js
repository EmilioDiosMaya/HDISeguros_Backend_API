const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_Usuario()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
});

router.get('/:idUsuario', (req, res) => {
    const { idUsuario } = req.params;
    mysqlConnection.query('CALL R_UsuarioByID(?)', [idUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
});

router.post('/', (req, res) => {
    const { NombreCompleto, FechaNacimiento, Contrasenia, NombreUsuario, idTipoUsuario } = req.body
    mysqlConnection.query('CALL C_Usuario(?, ?, ?, ?, ?)', [NombreCompleto, FechaNacimiento, Contrasenia, NombreUsuario, idTipoUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
});

module.exports = router;