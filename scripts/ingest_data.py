import argparse
import pandas as pd
from sqlalchemy import create_engine
import json

def ingest_data(user, password, host, port, db, tables):
    try:
        # Create database engine
        engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}')
        for table in tables:
            table_name = table['table_name']
            url = table['url']
            # Read data from URL with low_memory=False to avoid DtypeWarning
            df = pd.read_csv(url, low_memory=False)
            # Insert data into the database
            df.to_sql(table_name, engine, if_exists='replace', index=False)
            print(f"Data ingested into table {table_name}")
    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    
    parser = argparse.ArgumentParser(description='Ingest data into PostgreSQL database.')
    parser.add_argument('--user', required=True, help='Database user')
    parser.add_argument('--password', required=True, help='Database password')
    parser.add_argument('--host', required=True, help='Database host')
    parser.add_argument('--port', required=True, help='Database port')
    parser.add_argument('--db', required=True, help='Database name')
    parser.add_argument('--config', required=True, help='Path to the JSON configuration file')
    
    args = parser.parse_args()

    # Load the configuration file
    with open(args.config, 'r') as f:
        tables = json.load(f)

    # Log the parsed arguments
    print(f"Parsed arguments: {args}")
    print(f"Tables: {tables}")
    
    # Check for missing values and raise an error if any are found
    if not all([args.user, args.password, args.host, args.port, args.db, tables]):
        print("One or more arguments are missing.")
    else:
        ingest_data(user=args.user, password=args.password, host=args.host, 
                    port=args.port, db=args.db, tables=tables)
