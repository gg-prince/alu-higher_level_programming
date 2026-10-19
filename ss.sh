#!/bin/bash
# Creates all javascript-web_scraping solution files

mkdir -p javascript-web_scraping
cd javascript-web_scraping || exit 1

cat > README.md << 'EOF'
# javascript-web_scraping

Web scraping exercises in JavaScript (Node 10, semistandard compliant).

Requires the `request` module:

    sudo npm install request --global
    export NODE_PATH=/usr/lib/node_modules

| File | Description |
| ---- | ----------- |
| 0-readme.js | Reads and prints the content of a file |
| 1-writeme.js | Writes a string to a file |
| 2-statuscode.js | Displays the status code of a GET request |
| 3-starwars_title.js | Prints the title of a Star Wars movie by ID |
| 4-starwars_count.js | Counts movies where Wedge Antilles is present |
| 5-request_store.js | Stores the body of a webpage in a file |
| 6-completed_tasks.js | Counts completed tasks by user id |
EOF

cat > 0-readme.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_fs = require('fs');

ggp_fs.readFile(process.argv[2], 'utf8', function (ggp_err, ggp_data) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    console.log(ggp_data);
  }
});
EOF

cat > 1-writeme.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_fs = require('fs');

ggp_fs.writeFile(process.argv[2], process.argv[3], 'utf8', function (ggp_err) {
  if (ggp_err) {
    console.log(ggp_err);
  }
});
EOF

cat > 2-statuscode.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');

ggp_request.get(process.argv[2], function (ggp_err, ggp_response) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    console.log('code: ' + ggp_response.statusCode);
  }
});
EOF

cat > 3-starwars_title.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');
const ggp_url = 'https://swapi-api.alx-tools.com/api/films/' + process.argv[2];

ggp_request(ggp_url, function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    console.log(JSON.parse(ggp_body).title);
  }
});
EOF

cat > 4-starwars_count.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');

ggp_request(process.argv[2], function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    const ggp_films = JSON.parse(ggp_body).results;
    let ggp_count = 0;
    for (let ggp_i = 0; ggp_i < ggp_films.length; ggp_i++) {
      const ggp_characters = ggp_films[ggp_i].characters;
      for (let ggp_j = 0; ggp_j < ggp_characters.length; ggp_j++) {
        if (ggp_characters[ggp_j].includes('/people/18/')) {
          ggp_count++;
          break;
        }
      }
    }
    console.log(ggp_count);
  }
});
EOF

cat > 5-request_store.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');
const ggp_fs = require('fs');

ggp_request(process.argv[2], function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    ggp_fs.writeFile(process.argv[3], ggp_body, 'utf8', function (ggp_err2) {
      if (ggp_err2) {
        console.log(ggp_err2);
      }
    });
  }
});
EOF

cat > 6-completed_tasks.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');

ggp_request(process.argv[2], function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    const ggp_todos = JSON.parse(ggp_body);
    const ggp_counts = {};
    for (let ggp_i = 0; ggp_i < ggp_todos.length; ggp_i++) {
      if (ggp_todos[ggp_i].completed) {
        const ggp_id = ggp_todos[ggp_i].userId;
        ggp_counts[ggp_id] = (ggp_counts[ggp_id] || 0) + 1;
      }
    }
    console.log(ggp_counts);
  }
});
EOF

chmod +x *.js

echo "Done! Files created in $(pwd):"
ls -l
