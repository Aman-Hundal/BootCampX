const { Pool } = require('pg')
const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// above connects our bootcampx db using pool to our JS server (node). In the terms of our server/back end JS and DB via postgres. The postgreSQL is the server and the 
// back end JS (node) is our client

//NODE QUERY that can be made as we set up node-postgress and as we connected our DB above

const cohortName = process.argv[2];
const limit = process.argv[3];
const values = [`%${cohortName}%`, limit];
const queryString = `
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

pool.query(queryString,values)
.then(res => {
  // console.log(res)
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
}).catch(err => console.error('query error', err.stack));

// pool.query is a func that accepts an sql query as a JS string. backticks help make the sql string look nicer 
//the pool.queyr function returns a promise object with a result that we unwrap and use the resutl in the .then (if promise is successful if not error is caught)
// the result from the promise (res) is a object that contains DB data. LOOK AT THE ROWS PROPERTY
//rows property in the DB OBJ contain an array of the expected results from the query
// the key thing of having the SQL query result in JS vs SQL is that the query of the data is an ARRAY OF  OBJ -> now we can apply JS on it

// FOR SELECT SQL TO WORK IN JS -> we have to give them AS/aliases!! OR JS WIL BOTHC IT


