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
    return res.status(200).json("Este es el GET de Dictamen que trae a todos los Dictamenes");
});

router.get('/:idDictamen', (req, res) => {
    const { idDictamen } = req.params;
    mysqlConnection.query('CALL R_DictamenByID(?)', [idDictamen], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
    return res.status(200).json("Este es el GET de Dictamen que trae a un solo Dictamen");
});

router.post('/', (req, res) => {
    const { idDictamen, Descripcion, FechaCreacion, idReporteSiniestro, idUsuario } = req.body
    mysqlConnection.query('CALL CU_Dictamen(?, ?, ?, ?, ?)', [idDictamen, Descripcion, FechaCreacion, idReporteSiniestro, idUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el POST de Dictamen");
});

module.exports = router;