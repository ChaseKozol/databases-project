var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_kozolc',
  password        : 'Djr3267cc7623rjD',
  database        : 'cs340_kozolc'
});
module.exports.pool = pool;
