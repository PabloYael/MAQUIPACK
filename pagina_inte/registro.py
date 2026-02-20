from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'usuarios'

mysql = MySQL(app)

@app.route('/registro')
def registro():
    return render_template('registro.html')

@app.route('/registrarse', methods=["POST"])
def registrarse():
    nombre = request.form['nombre']
    correo = request.form['correo']
    password = request.form['password']

    cur = mysql.connection.cursor()
    cur.execute(
        "INSERT INTO usuarios(nombre, correo, password) VALUES (%s, %s, %s)",
        (nombre, correo, password)
    )
    mysql.connection.commit()
    cur.close()

    return render_template("inicio.html", mensaje2="Usuario registrado")

if __name__ == '__main__':
    app.run(debug=True)