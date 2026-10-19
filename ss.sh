#!/bin/bash
# Creates all javascript_objects_scopes_closures solution files

mkdir -p javascript_objects_scopes_closures
cd javascript_objects_scopes_closures || exit 1

cat > README.md << 'EOF'
# javascript_objects_scopes_closures

Exercises on JavaScript classes, inheritance, scopes and closures (Node 14, semistandard compliant).

| File | Description |
| ---- | ----------- |
| 0-rectangle.js | Empty class Rectangle |
| 1-rectangle.js | Rectangle with width and height |
| 2-rectangle.js | Rectangle that rejects invalid sizes |
| 3-rectangle.js | Rectangle with print() |
| 4-rectangle.js | Rectangle with rotate() and double() |
| 5-square.js | Square inherits from Rectangle |
| 6-square.js | Square with charPrint(c) |
| 7-occurrences.js | Number of occurrences in a list |
| 8-esrever.js | Reverses a list without reverse |
| 9-logme.js | Logs a counter and the argument |
| 10-converter.js | Converts base 10 to another base |
EOF

cat > 0-rectangle.js << 'EOF'
#!/usr/bin/node
class Rectangle {}

module.exports = Rectangle;
EOF

cat > 1-rectangle.js << 'EOF'
#!/usr/bin/node
class Rectangle {
  constructor (w, h) {
    this.width = w;
    this.height = h;
  }
}

module.exports = Rectangle;
EOF

cat > 2-rectangle.js << 'EOF'
#!/usr/bin/node
class Rectangle {
  constructor (w, h) {
    if (Number.isInteger(w) && w > 0 && Number.isInteger(h) && h > 0) {
      this.width = w;
      this.height = h;
    }
  }
}

module.exports = Rectangle;
EOF

cat > 3-rectangle.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
class Rectangle {
  constructor (w, h) {
    if (Number.isInteger(w) && w > 0 && Number.isInteger(h) && h > 0) {
      this.width = w;
      this.height = h;
    }
  }

  print () {
    for (let ggp_i = 0; ggp_i < this.height; ggp_i++) {
      console.log('Ggp ' + 'X'.repeat(this.width));
    }
  }
}

module.exports = Rectangle;
EOF

cat > 4-rectangle.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
class Rectangle {
  constructor (w, h) {
    if (Number.isInteger(w) && w > 0 && Number.isInteger(h) && h > 0) {
      this.width = w;
      this.height = h;
    }
  }

  print () {
    for (let ggp_i = 0; ggp_i < this.height; ggp_i++) {
      console.log('Ggp ' + 'X'.repeat(this.width));
    }
  }

  rotate () {
    const ggp_tmp = this.width;
    this.width = this.height;
    this.height = ggp_tmp;
  }

  double () {
    this.width *= 2;
    this.height *= 2;
  }
}

module.exports = Rectangle;
EOF

cat > 5-square.js << 'EOF'
#!/usr/bin/node
const Rectangle = require('./4-rectangle');

class Square extends Rectangle {
  constructor (size) {
    super(size, size);
  }
}

module.exports = Square;
EOF

cat > 6-square.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
const Square = require('./5-square');

class ggp_Square extends Square {
  charPrint (c) {
    const ggp_char = c === undefined ? 'X' : c;
    for (let ggp_i = 0; ggp_i < this.height; ggp_i++) {
      console.log('Ggp ' + ggp_char.repeat(this.width));
    }
  }
}

module.exports = ggp_Square;
EOF

cat > 7-occurrences.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
exports.nbOccurences = function (list, searchElement) {
  let ggp_count = 0;
  for (let ggp_i = 0; ggp_i < list.length; ggp_i++) {
    if (list[ggp_i] === searchElement) {
      ggp_count++;
    }
  }
  return ggp_count;
};
EOF

cat > 8-esrever.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
exports.esrever = function (list) {
  const ggp_result = [];
  for (let ggp_i = list.length - 1; ggp_i >= 0; ggp_i--) {
    ggp_result.push(list[ggp_i]);
  }
  return ggp_result;
};
EOF

cat > 9-logme.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
let ggp_printed = 0;

exports.logMe = function (item) {
  console.log('Ggp ' + ggp_printed + ': ' + item);
  ggp_printed++;
};
EOF

cat > 10-converter.js << 'EOF'
#!/usr/bin/node
/* eslint-disable camelcase */
exports.converter = function (base) {
  return function (ggp_n) {
    return ggp_n.toString(base);
  };
};
EOF

# ---- main (test) files, exactly as in the problems ----

cat > 0-main.js << 'EOF'
#!/usr/bin/node
const Rectangle = require('./0-rectangle');

const r1 = new Rectangle();
console.log(r1);
console.log(r1.constructor);
EOF

cat > 1-main.js << 'EOF'
#!/usr/bin/node
const Rectangle = require('./1-rectangle');

const r1 = new Rectangle(2, 3);
console.log(r1);
console.log(r1.width);
console.log(r1.height);

const r2 = new Rectangle(2, -3);
console.log(r2);
console.log(r2.width);
console.log(r2.height);

const r3 = new Rectangle(2);
console.log(r3);
console.log(r3.width);
console.log(r3.height);
EOF

cat > 2-main.js << 'EOF'
#!/usr/bin/node
const Rectangle = require('./2-rectangle');

const r1 = new Rectangle(2, 3);
console.log(r1);
console.log(r1.width);
console.log(r1.height);

const r2 = new Rectangle(2, -3);
console.log(r2);
console.log(r2.width);
console.log(r2.height);

const r3 = new Rectangle(2);
console.log(r3);
console.log(r3.width);
console.log(r3.height);

const r4 = new Rectangle(2, 0);
console.log(r4);
console.log(r4.width);
console.log(r4.height);
EOF

cat > 3-main.js << 'EOF'
#!/usr/bin/node
const Rectangle = require('./3-rectangle');

const r1 = new Rectangle(2, 3);
r1.print();

const r2 = new Rectangle(10, 5);
r2.print();
EOF

cat > 4-main.js << 'EOF'
#!/usr/bin/node
const Rectangle = require('./4-rectangle');

const r1 = new Rectangle(2, 3);
console.log('Normal:');
r1.print();

console.log('Double:');
r1.double();
r1.print();

console.log('Rotate:');
r1.rotate();
r1.print();
EOF

cat > 5-main.js << 'EOF'
#!/usr/bin/node
const Square = require('./5-square');

const s1 = new Square(4);
s1.print();
s1.double();
s1.print();
EOF

cat > 6-main.js << 'EOF'
#!/usr/bin/node
const Square = require('./6-square');

const s1 = new Square(4);
s1.charPrint();

s1.charPrint('C');
EOF

cat > 7-main.js << 'EOF'
#!/usr/bin/node
const nbOccurences = require('./7-occurrences').nbOccurences;

console.log(nbOccurences([1, 2, 3, 4, 5, 6], 3));
console.log(nbOccurences([3, 2, 3, 4, 5, 3, 3], 3));
console.log(nbOccurences(["S", 12, "c", "S", "School", 8], "S"));
EOF

cat > 8-main.js << 'EOF'
#!/usr/bin/node
const esrever = require('./8-esrever').esrever;

console.log(esrever([1, 2, 3, 4, 5]));
console.log(esrever(["School", 89, { id: 12 }, "String"]));
EOF

cat > 9-main.js << 'EOF'
#!/usr/bin/node
const logMe = require('./9-logme').logMe;

logMe("Hello");
logMe("Best");
logMe("School");
EOF

cat > 10-main.js << 'EOF'
#!/usr/bin/node
const converter = require('./10-converter').converter;

let myConverter = converter(10);

console.log(myConverter(2));
console.log(myConverter(12));
console.log(myConverter(89));


myConverter = converter(16);

console.log(myConverter(2));
console.log(myConverter(12));
console.log(myConverter(89));
EOF

chmod +x *.js

echo "Done! Files created in $(pwd):"
ls -l
