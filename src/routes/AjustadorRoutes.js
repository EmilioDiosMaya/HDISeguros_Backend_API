const { Router } = require('express');
const router = Router();
const mysqlConnection = require('../database');

router.get('/', async (req, res) => {
    mysqlConnection.query('CALL R_Usuario()', (err, rows, fields) => {
        if (!err) {
            res.json(rows[0])
        } else {
            res.status(500)
        }
    })

    return res.status(200).json("Este es el GET de ajustadores que trae a todos los ajustadores");
});

router.get('/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('CALL R_UsuarioByID(?)', [id], (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0][0])
        } else {
            res.status(500).json(err)
        }
    })
    return res.status(200).json("Este es el GET de ajustadores que trae a un solo ajustador");
});

router.post('/', (req, res) => {
    const { idUsuario, Nombre, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Email, NombreUsuario, Password, idTipoUsuario } = req.body
    mysqlConnection.query('CALL CU_Usuario(?, ?, ?, ?, ?, ?, ?)', [idUsuario, NombreCompleto, FechaNacimiento, contrasenia, NombreUsuario, FechaRegistro, idTipoUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el POST de ajustadores");
});

router.put('/:id', (req, res) => {
    const { idUsuario } = req.params;
    mysqlConnection.query('CALL CU_Usuario(?, ?, ?, ?, ?, ?, ?)', [idUsuario, NombreCompleto, FechaNacimiento, contrasenia, NombreUsuario, FechaRegistro, idTipoUsuario], (err, rows, fields) => {
        if (!err) {
            res.status(201).json(rows[0][0])
        } else {
            console.log(err)
        }
    })
    return res.status(200).json("Este es el PUT de ajustadores");
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
    return res.status(200).json("Este es el DELETE de ajustadores");
})

module.exports = router;