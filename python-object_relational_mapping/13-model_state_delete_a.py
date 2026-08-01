#!/usr/bin/python3
"""
Deletes all State objects with a name containing the letter a
from the database hbtn_0e_6_usa.
"""
import sys
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from model_state import Base, State

if __name__ == "__main__":
    # Get connection arguments from the command line
    username = sys.argv[1]
    password = sys.argv[2]
    db_name = sys.argv[3]

    # Create the engine to connect to the MySQL server
    engine = create_engine(
        f'mysql+mysqldb://{username}:{password}@localhost:3306/{db_name}',
        pool_pre_ping=True
    )

    # Bind the engine to a session factory
    Session = sessionmaker(bind=engine)

    # Open a session to interact with the database
    session = Session()

    # Query all states containing the letter 'a' (case-sensitive)
    # Use .like('%a%') for matching anywhere in the string
    states_to_delete = session.query(State).filter(State.name.like('%a%')).all()

    # Delete each matching state object from the session
    for state in states_to_delete:
        session.delete(state)

    # Commit the changes to permanently save them to the database
    session.commit()

    # Clean up and close the session
    session.close()
