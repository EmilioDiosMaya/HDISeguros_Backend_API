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

router.get('/:id', (req, res) => {
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
    const { idReporteSiniestro, FechaReporte, Latitud, Longitud, EsDictaminado } = req.body
    mysqlConnection.query('CALL CU_ReporteSiniestro(?, ?, ?, ?, ?)', [idReporteSiniestro, FechaReporte, Latitud, Longitud, EsDictaminado], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el POST de Reporte de Siniestro");
});

router.put('/:id', (req, res) => {
    const { idReporteSiniestro } = req.params;
    mysqlConnection.query('CALL CU_ReporteSiniestro(?, ?, ?, ?, ?)', [idReporteSiniestro, FechaReporte, Latitud, Longitud, EsDictaminado], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el PUT de Reporte de Siniestro");
});

router.delete('/:id', (req, res) => {
    const { idReporteSiniestro } = req.params;
    mysqlConnection.query('CALL D_ReporteSiniestro(?)', [idReporteSiniestro], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500)
        }
    })
    return res.status(200).json("Este es el DELETE de Reporte de Siniestro");
})

module.exports = router;