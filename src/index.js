const express = require('express');
const app = express();
const morgan = require('morgan');

// Configuraciones
app.set('port', process.env.PORT || 3000);
app.set('json spaces', 2);

// Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

// Rutas
app.use(require('./routes/ajustador')); 
app.use('/api/ajustadores',require('./routes/ajustador'));

// Empezando el servidor
app.listen(3000, () => {
    console.log(`Server on port ${app.get('port')}`);
});