const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/:idConductor', async (req, res) => {
    const { idConductor } = req.params;
    mysqlConnection.query('CALL R_VehiculoByIDConductor(?)', [idConductor], (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
});

router.get('/:idVehiculo', (req, res) => {
    const { idVehiculo } = req.params;
    mysqlConnection.query('CALL R_VehiculoByID(?)', [idVehiculo], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
});

router.post('/', (req, res) => {
    const { Modelo, Marca, NumSerie, Color, NumPlacas, Anio, idConductor } = req.body
    mysqlConnection.query('CALL C_Vehiculo(?, ?, ?, ?, ?, ?, ?)', [Modelo, Marca, NumSerie, Color, NumPlacas, Anio, idConductor], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
});

module.exports = router;