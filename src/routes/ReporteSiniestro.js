const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_ReporteSiniestro()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
    return res.status(200).json("Este es el GET de Reporte de Siniestro que trae a todos los Reportes de Siniestros");
});

router.get('/:idReporteSiniestro', (req, res) => {
    const { idReporteSiniestro } = req.params;
    mysqlConnection.query('CALL R_ReporteSiniestro(?)', [idReporteSiniestro], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
    return res.status(200).json("Este es el GET de Reporte de Siniestro que trae a un solo Reporte de Siniestro");
});

router.post('/', (req, res) => {
    const { Latitud, Longitud, idVehiculo } = req.body
    mysqlConnection.query('CALL C_ReporteSiniestro(?, ?, ?)', [Latitud, Longitud, idVehiculo], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el POST de Reporte de Siniestro");
});

router.put('/:idReporteSiniestro', (req, res) => {
    const { idReporteSiniestro } = req.params;
    mysqlConnection.query('CALL U_ReporteSiniestro(?, ?, ?)', [Latitud, Longitud, idVehiculo], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el PUT de Reporte de Siniestro");
});

module.exports = router;