const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_Fotografia()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })
    return res.status(200).json("Este es el GET de Imagen que trae a todas las Imagenes");
});

router.get('/:idImagen', (req, res) => {
    const { idImagen } = req.params;
    mysqlConnection.query('CALL R_FotografiaByID(?)', [idImagen], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
    return res.status(200).json("Este es el GET de Imagen que trae a una sola Imagen");
});

router.post('/', (req, res) => {
    const { Url, idReporteSiniestro } = req.body
    mysqlConnection.query('CALL C_Fotografia(?, ?)', [Url, idReporteSiniestro], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el POST de Imagen");
});

module.exports = router;