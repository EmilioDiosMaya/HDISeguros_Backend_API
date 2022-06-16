const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_Dictamen()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
});

router.get('/:idDictamen', (req, res) => {
    const { idDictamen } = req.params;
    mysqlConnection.query('CALL R_DictamenByIDReporte(?)', [idDictamen], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
});

router.post('/', (req, res) => {
    const { Descripcion, idReporteSiniestro, idUsuario } = req.body
    mysqlConnection.query('CALL C_Dictamen(?, ?, ?)', [Descripcion, idReporteSiniestro, idUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
});

module.exports = router;