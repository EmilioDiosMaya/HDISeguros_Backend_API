const { Router } = require('express');
const router = Router();

//Aquí van los endpoitns
router.get('/', (req, res) => {
    res.status(200).json({
        "message": "HDI Seguros",
        "version": "1.0.0"
    })
});

module.exports = router;