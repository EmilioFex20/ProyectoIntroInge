from tkinter import messagebox
import mysql.connector
from tkinter import *
import os
def menu_pantalla():
    global pantalla
    pantalla=Tk()
    pantalla.geometry("300x380")
    pantalla.title("Login con tkinter")

    Label(text="Escoja su opción", bg="LightGreen", width="300", height="2", font=("Calibri", 13)).pack()
    Label(text="").pack()
    Button(text="Iniciar sesion", height="2", width="30", command=inicio_sesion).pack() 
    Label(text="").pack()
    Button(text="Registrarse", height="2", width="30", command=registrar).pack()
    Label(text="").pack()
    pantalla.mainloop()
def inicio_sesion():
    global pantalla1
    pantalla1 = Toplevel(pantalla)
    pantalla1.title("Inicio de sesion")
    pantalla1.geometry("300x250")   

    Label(pantalla1, text="Porfavor ingrese su usuario y contrasena").pack()
    Label(pantalla1, text=" ").pack()

    global nombreusuario_verify
    global contrasenausuario_verify

    nombreusuario_verify= StringVar()
    contrasenausuario_verify= StringVar()

    global nombre_usuario_entry
    global contrasena_usuario_entry
 
    Label(pantalla1, text="Usuario", bg="LightGreen").pack()
    nombre_usuario_entry = Entry(pantalla1, textvariable=nombreusuario_verify)
    nombre_usuario_entry.pack()
    Label(pantalla1).pack()

    Label(pantalla1, text="Contraseña", bg="LightGreen").pack()
    contrasena_usuario_entry = Entry(pantalla1, show="*", textvariable=contrasenausuario_verify)
    contrasena_usuario_entry.pack()
    Label(pantalla1).pack()

    Button(pantalla1, text="Iniciar sesion").pack()

def registrar():
    global pantalla2
    pantalla2 = Toplevel(pantalla)
    pantalla2.title("Registro")
    pantalla2.geometry("400x250")

    global correo_entry
    global contrasena_entry
    global usuario_entry
 
    correo_entry = StringVar()
    contrasena_entry = StringVar()
    usuario_entry = StringVar()

    Label(pantalla2, text="Cree un usuario y contraseña").pack()
    Label(pantalla2, text="").pack()
 
    Label(pantalla2, text="Correo").pack()
    correo_entry= Entry(pantalla2)
    correo_entry.pack()
    Label(pantalla2).pack()
    Label(pantalla2, text="Contraseña").pack()
    contrasena_entry = Entry(pantalla2,show="*")
    contrasena_entry.pack()
    Label(pantalla2, text="Usuario").pack()
    usuario_entry= Entry(pantalla2)
    usuario_entry.pack()
    Label(pantalla2).pack()
    Button(pantalla2, text="Registrar",command=inserta_datos).pack()

#Coneccion a base de datos para insertar datos de cuenta(registro)
def inserta_datos():
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Daba.2295",
    port="3306",
    database="database"
    )
    try:
        mycursor = mydb.cursor()
        sql = "INSERT INTO usuario (correo,contrasena,usuario) VALUES (%s,%s,%s)"
        mycursor.execute(sql,(correo_entry.get(),contrasena_entry.get(),usuario_entry.get()))
        mydb.commit()
        messagebox.showinfo(message="Registro Exitoso", title="Aviso")
    except:
        mydb.rollback()
        messagebox.showinfo(message="Registro Erroneo", title="Aviso")

menu_pantalla()
