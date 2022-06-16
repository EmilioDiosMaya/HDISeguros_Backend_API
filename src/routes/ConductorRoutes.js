const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_Conductor()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
});

router.get('/:idConductor', (req, res) => {
    const { idConductor } = req.params;
    mysqlConnection.query('CALL R_ConductorByID(?)', [idConductor], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
});

router.post('/', (req, res) => {
    const { NombreCompleto, FechaNacimiento, Contrasenia, idTipoUsuario, Telefono, NumeroLicencia } = req.body
    mysqlConnection.query('CALL C_Conductor(?, ?, ?, ?, ?, ?)', [NombreCompleto, FechaNacimiento, Contrasenia, idTipoUsuario, Telefono, NumeroLicencia], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
});

module.exports = router;