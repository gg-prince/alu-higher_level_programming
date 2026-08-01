cat << 'EOF' > 0-select_states.py
#!/usr/bin/python3
"""
Script that lists all `states` from the database `hbtn_0e_0_usa`.
Arguments:
    mysql username (str)
    mysql password (str)
    database name (str)
"""

import sys
import MySQLdb

if __name__ == "__main__":
    mySQL_u = sys.argv[1]
    mySQL_p = sys.argv[2]
    db_name = sys.argv[3]

    # By default, it will connect to localhost:3306
    db = MySQLdb.connect(user=mySQL_u, passwd=mySQL_p, db=db_name)
    cursor = db.cursor()

    cursor.execute("SELECT * FROM states ORDER BY id")
    rows = cursor.fetchall()

    for row in rows:
        print(row)
EOF

cat << 'EOF' > 1-filter_states.py
#!/usr/bin/python3
"""
Script that lists all `states` with a name starting
with `N` from the database `hbtn_0e_0_usa`.
Arguments:
    mysql username (str)
    mysql password (str)
    database name (str)
"""

import sys
import MySQLdb

if __name__ == "__main__":
    mySQL_u = sys.argv[1]
    mySQL_p = sys.argv[2]
    db_name = sys.argv[3]

    # By default, it will connect to localhost:3306
    db = MySQLdb.connect(user=mySQL_u, passwd=mySQL_p, db=db_name)
    cur = db.cursor()

    cur.execute("SELECT * FROM states WHERE name LIKE BINARY 'N%' ORDER BY id")
    rows = cur.fetchall()

    for row in rows:
        print(row)
EOF

cat << 'EOF' > 1-filter_states.py
#!/usr/bin/python3
"""
Script that lists all `states` with a name starting
with `N` from the database `hbtn_0e_0_usa`.
Arguments:
    mysql username (str)
    mysql password (str)
    database name (str)
"""

import sys
import MySQLdb

if __name__ == "__main__":
    mySQL_u = sys.argv[1]
    mySQL_p = sys.argv[2]
    db_name = sys.argv[3]

    # By default, it will connect to localhost:3306
    db = MySQLdb.connect(user=mySQL_u, passwd=mySQL_p, db=db_name)
    cur = db.cursor()

    cur.execute("SELECT * FROM states WHERE name LIKE BINARY 'N%' ORDER BY id")
    rows = cur.fetchall()

    for row in rows:
        print(row)
EOF

cat << 'EOF' > 2-my_filter_states.py
#!/usr/bin/python3
"""
Sccript that lists all values in the `states` table of `hbtn_0e_0_usa`
where `name` matches the argument `state name searched`.
Arguments:
    mysql username (str)
    mysql password (str)
    database name (str)
    state name searched (str)
"""

import sys
import MySQLdb

if __name__ == "__main__":
    mySQL_u = sys.argv[1]
    mySQL_p = sys.argv[2]
    db_name = sys.argv[3]

    searched_name = sys.argv[4]

    # By default, it will connect to localhost:3306
    db = MySQLdb.connect(user=mySQL_u, passwd=mySQL_p, db=db_name)
    cur = db.cursor()

    cur.execute(
        "SELECT * FROM states "
        "WHERE name LIKE BINARY '{}' ORDER BY id".format(searched_name)
    )
    rows = cur.fetchall()
    for row in rows:
        print(row)
EOF

cat << 'EOF' > 3-my_safe_filter_states.py
#!/usr/bin/python3
"""
Lists all values in the states tables of a database where name
matches the argument in a safe way
"""
import sys
import MySQLdb

if __name__ == '__main__':
    db = MySQLdb.connect(user=sys.argv[1], passwd=sys.argv[2],
                         db=sys.argv[3], port=3306)
EOF

cat << 'EOF' > 4-cities_by_state.py
#!/usr/bin/python3
"""
Script that lists all `cities` from the database `hbtn_0e_4_usa`.
Arguments:
    mysql username (str)
    mysql password (str)
    database name (str)
"""

import sys
import MySQLdb

if __name__ == "__main__":
    mySQL_u = sys.argv[1]
    mySQL_p = sys.argv[2]
    db_name = sys.argv[3]

    # By default, it will connect to localhost:3306
    db = MySQLdb.connect(user=mySQL_u, passwd=mySQL_p, db=db_name)
    cursor = db.cursor()

    cursor.execute("SELECT c.id, c.name, s.name \
                 FROM cities c INNER JOIN states s \
                 ON c.state_id = s.id \
                 ORDER BY c.id")
    rows = cursor.fetchall()

    for row in rows:
        print(row)
EOF

cat << 'EOF' > 5-filter_cities.py
#!/usr/bin/python3
"""
Script that lists all `cities` in the `cities` table of `hbtn_0e_4_usa`
where the city's state matches the argument `state name`.
Arguments:
    mysql username (str)
    mysql password (str)
    database name (str)
    state name (str)
"""

import sys
import MySQLdb

if __name__ == "__main__":
    mySQL_u = sys.argv[1]
    mySQL_p = sys.argv[2]
    db_name = sys.argv[3]

    state_name = sys.argv[4]

    # By default, it will connect to localhost:3306
    db = MySQLdb.connect(user=mySQL_u, passwd=mySQL_p, db=db_name)
    cursor = db.cursor()

    cursor.execute("SELECT c.name \
                 FROM cities c INNER JOIN states s \
                 ON c.state_id = s.id WHERE s.name = %s\
                 ORDER BY c.id", (state_name, ))
    rows = cursor.fetchall()

    for i in range(len(rows)):
        print(rows[i][0], end=", " if i + 1 < len(rows) else "")
    print("")
EOF

cat << 'EOF' > 7-model_state_fetch_all.py
#!/usr/bin/python3
""" script that lists all State objects from the database hbtn_0e_6_usa
"""


import sys
from model_state import Base, State
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine


if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost/{}'.format(
                        sys.argv[1], sys.argv[2], sys.argv[3]),
                        pool_pre_ping=True
                    )
    Session = sessionmaker(bind=engine)
    Base.metadata.create_all(engine)

    session = Session()

    states = session.query(State).order_by(State.id).all()

    for state in states:
        print(f"{state.id}: {state.name}")

    session.close()
EOF

cat << 'EOF' > 8-model_state_fetch_first.py
#!/usr/bin/python3
""" prints the first State object from the
database hbtn_0e_6_usa"""
import sys
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from model_state import Base, State

if __name__ == "__main__":
    engine = create_engine("mysql+mysqldb://{}:{}@localhost/{}"
                           .format(sys.argv[1], sys.argv[2], sys.argv[3]),
                           pool_pre_ping=True)
    Base.metadata.create_all(engine)

    session = Session(engine)

    record = session.query(State).first()

    if record:
        print("{}: {}".format(record.__dict__['id'], record.__dict__['name']))
    else:
        print("Nothing")

    session.close()
EOF

cat << 'EOF' > 9-model_state_filter_a.py
#!/usr/bin/python3
"""A script that lists all records with letter a"""


import sys
from model_state import Base, State
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine


if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost/{}'.format(
                        sys.argv[1], sys.argv[2], sys.argv[3]),
                        pool_pre_ping=True
                    )
    Session = sessionmaker(bind=engine)

    Base.metadata.create_all(engine)

    session = Session()

    states = session.query(State).filter(State.name.contains('a')).all()

    for state in states:
        print(f'{state.id}: {state.name}')

    session.close()
EOF

cat << 'EOF' > 10-model_state_my_get.py
#!/usr/bin/python3
"""script that prints the State object with the name passed as argument
from the database hbtn_0e_6_usa
"""

import sys
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from model_state import Base, State


if __name__ == "__main__":
    engine = create_engine("mysql+mysqldb://{}:{}@localhost/{}"
                           .format(sys.argv[1], sys.argv[2], sys.argv[3]),
                           pool_pre_ping=True)
    Base.metadata.create_all(engine)
    session = Session(engine)

    state_name = sys.argv[4]

    state = session.query(State).filter(State.name == state_name).first()
    if state is None:
        print("Not found")
    else:
        print(f'{state.id}')

    session.close()
EOF

cat << 'EOF' > 11-model_state_insert.py
#!/usr/bin/python3
"""script that adds the State object
“Louisiana” to the database hbtn_0e_6_usa
"""

import sys
from model_state import Base, State
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine


if __name__ == "__main__":
    engine = create_engine("mysql+mysqldb://{}:{}@localhost/{}"
                           .format(sys.argv[1], sys.argv[2], sys.argv[3]),
                           pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()
    Base.metadata.create_all(engine)

    state = State(name="Louisiana")
    session.add(state)
    session.commit()
    print(state.id)
    session.close()
EOF

cat << 'EOF' > 12-model_state_update_id_2.py
#!/usr/bin/python3
"""script that changes the name of a State object
from the database hbtn_0e_6_usa
"""

import sys
from model_state import Base, State
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine


if __name__ == "__main__":
    engine = create_engine("mysql+mysqldb://{}:{}@localhost/{}"
                           .format(sys.argv[1], sys.argv[2], sys.argv[3]),
                           pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()
    Base.metadata.create_all(engine)

    state = session.query(State).filter(State.id == 2).first()

    state.name = "New Mexico"

    session.commit()
    session.close()
EOF

cat << 'EOF' > 13-model_state_delete_a.py
#!/usr/bin/python3
"""
Deletes all State objects with a name containing the letter a
"""
import sys
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


if __name__ == '__main__':
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.
                           format(sys.argv[1], sys.argv[2], sys.argv[3]),
                           pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    states = session.query(State).filter(State.name.like('%a%')).all()

    for state in states:
        session.delete(state)

    session.commit()
EOF

cat << 'EOF' > 14-model_city_fetch_by_state.py
#!/usr/bin/python3
"""
Prints all City objects from the database hbtn_0e_14_usa
"""
import sys
from model_state import Base, State
from model_city import City
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


if __name__ == '__main__':
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.
                           format(sys.argv[1], sys.argv[2], sys.argv[3]),
                           pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    st_cty = session.query(State, City).filter(State.id == City.state_id).all()

    for state, city in st_cty:
        print("{}: ({}) {}".format(state.name, city.id, city.name))
EOF
