const mysql = require('mysql2')

const mysqlConnection = mysql.createConnection({
  host: 'maisonbleue2020.ddns.net',
  user: 'luis',
  password: '100Carbajal',
  database: 'luis_webdev'
})

mysqlConnection.connect(function (err) {
  if (err) {
    console.log(err)
  } else {
    console.log('BD Conectada')
  }
})

module.exports = mysqlConnection