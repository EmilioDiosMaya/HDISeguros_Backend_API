const express = require('express');
const app = express();
const morgan = require('morgan');

// Configuraciones
app.set('port', process.env.PORT || 3000);
app.set('json spaces', 2);

// Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

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

// Empezando el servidor
app.listen(3000, () => {
    console.log(`Server on port ${app.get('port')}`);
});