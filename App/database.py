import mysql.connector

def inserta_datos():
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Daba.2295",
    database="database"
    )
    
    mycursor = mydb.cursor()
    sql="INSERT INTO usuario (email,contraseña,nombre,licencia) VALUES ('{0}','{1}','{2}','{3}')".format(email_entry.get(), contrasena_entry.get())

    try:
        mycursor.execute(sql)
        mydb.commit()
        #messagebox.showinfo(message="Registro Exitoso", title="Aviso")
    
    except:
        mydb.rollback()
        #messagebox.showinfo(message="No registrado", title="Aviso")  

    mydb.close()    

