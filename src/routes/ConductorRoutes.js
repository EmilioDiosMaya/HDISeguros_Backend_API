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
    return res.status(200).json("Este es el GET de conductores que trae a todos los conductores");
});

router.get('/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('CALL R_ConductorByID(?)', [id], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
    return res.status(200).json("Este es el GET de conductores que trae a un solo conductor");
});

router.post('/', (req, res) => {
    const { idConductor, Telefono, NumeroLicencia, idUsuario } = req.body
    mysqlConnection.query('CALL CU_Conductor(?, ?, ?, ?)', [idConductor, Telefono, NumeroLicencia, idUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el POST de conductores");
});

router.put('/:id', (req, res) => {
    const { idUsuario } = req.params;
    mysqlConnection.query('CALL CU_Usuario(?, ?, ?, ?, ?, ?, ?)', [idConductor, Telefono, NumeroLicencia, idUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el PUT de conductores");
});

router.delete('/:id', (req, res) => {
    const { idUsuario } = req.params;
    mysqlConnection.query('CALL D_Usuario(?)', [idUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500)
        }
    })
    return res.status(200).json("Este es el DELETE de conductores");
})

module.exports = router;