const express = require('express');
const app = express();
const cors = require('cors');

// Configuraciones
app.set('puerto', process.env.PORT || 3000);

// Middlewares
app.use(express.json());
app.use(cors());


// Rutas
app.use('/', require('./routes/routes'));
app.use('/ajustadores', require('./routes/AjustadorRoutes'));
app.use('/ejecutivos', require('./routes/EjecutivoRoutes'));
app.use('/conductores', require('./routes/ConductorRoutes'));
app.use('/polizaseguro', require('./routes/PolizaSeguroRoutes'));
app.use('/reportesiniestro', require('./routes/ReporteSiniestro'));
app.use('/imagenes', require('./routes/ImagenRoutes'));
app.use('/vehiculos', require('./routes/VehiculoRoutes'));
app.use('/dictamenes', require('./routes/DictamenRoutes'));
app.use('/loginconductor', require('./routes/LoginConductor'));
app.use('/loginusuario', require('./routes/LoginUsuario'));
app.use('/usuarios', require('./routes/UsuarioRoutes'));


// Empezando el servidor
app.listen(app.get('puerto'), () => {
    console.log('SERVIDOR EN PUERTO', app.get('puerto'))
})