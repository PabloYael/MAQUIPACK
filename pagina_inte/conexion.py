import mysql.connector

def conexion():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="usuarios"
    )

conn = conexion()
print("Conectado correctamente")
conn.close()
   
   