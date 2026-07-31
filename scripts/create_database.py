import pandas as pd
import sqlite3

# Load CSV
df = pd.read_csv("data/raw/superstore.csv")

# Create/connect to SQLite database
conn = sqlite3.connect("database/superstore.db")

# Write dataframe to SQLite
df.to_sql(
    "superstore",
    conn,
    if_exists="replace",
    index=False
)

conn.commit()
conn.close()

print("Database created successfully!")