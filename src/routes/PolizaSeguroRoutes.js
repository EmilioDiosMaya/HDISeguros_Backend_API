const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_Poliza()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
});

router.get('/:idPolizaSeguro', (req, res) => {
    const { idPolizaSeguro } = req.params;
    mysqlConnection.query('CALL R_PolizaByIDVehiculo(?)', [idPolizaSeguro], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
});

router.post('/', (req, res) => {
    const { AniosCobertura, Precio, idVehiculo, idTipoCobertura } = req.body
    mysqlConnection.query('CALL C_Poliza(?, ?, ?, ?)', [AniosCobertura, Precio, idVehiculo, idTipoCobertura], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
});

module.exports = router;