const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_PolizaSeguro()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
    return res.status(200).json("Este es el GET de Poliza de Seguro que trae a todas las Polizas de Seguro");
});

router.get('/:idPolizaSeguro', (req, res) => {
    const { idPolizaSeguro } = req.params;
    mysqlConnection.query('CALL R_PolizaSeguroByID(?)', [idPolizaSeguro], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
    return res.status(200).json("Este es el GET de Poliza de Seguro que trae a una sola Poliza de Seguro");
});

router.post('/', (req, res) => {
    const { idPolizaSeguro, AniosCobertura, FechaCompra, Precio, idVehiculo, idTipoCobertura } = req.body
    mysqlConnection.query('CALL C_PolizaSeguro(?, ?, ?, ?, ?, ?)', [idPolizaSeguro, AniosCobertura, FechaCompra, Precio, idVehiculo, idTipoCobertura], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el POST de Poliza de Seguro");
});

module.exports = router;