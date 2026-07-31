import sqlite3

conn = sqlite3.connect("database/superstore.db")

cursor = conn.cursor()

cursor.execute("SELECT COUNT(*) FROM superstore")

print(cursor.fetchone())

conn.close()