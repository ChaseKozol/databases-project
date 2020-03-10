var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit     : 10,
  host                : 'classmysql.engr.oregonstate.edu',
  user                : 'cs340_smitale2',
  password            : '2829',
  database            : 'cs340_smitale2',
  multipleStatements  : true
});
module.exports.pool = pool;
