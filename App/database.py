from tkinter import messagebox
import mysql.connector
from tkinter import *
import os
def menu_pantalla():
    global pantalla
    pantalla=Tk()
    pantalla.geometry("300x380")#DIMENSIONES DE LA VENTANA
    pantalla.title("Login con tkinter")#TITULO DE LA VENTANA

    Label(text="Escoja su opción", bg="LightGreen", width="300", height="2", font=("Calibri", 13)).pack()#ETIQUETA CON TEXTO
    Label(text="").pack()
    Button(text="Iniciar sesion", height="2", width="30", command=inicio_sesion).pack() #BOTÓN "Acceder"
    Label(text="").pack()
    Button(text="Registrarse", height="2", width="30", command=registrar).pack() #BOTÓN "Registrarse".
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

    Button(pantalla1, text="Iniciar sesion").pack() #BOTÓN "Iniciar sesion"

def registrar():
    global pantalla2
    pantalla2 = Toplevel(pantalla)
    pantalla2.title("Registro")
    pantalla2.geometry("400x250")

    global nombreusuario_entry
    global contrasena_entry
 
    nombreusuario_entry = StringVar()
    contrasena_entry = StringVar()

    Label(pantalla2, text="Cree un usuario y contraseña").pack()
    Label(pantalla2, text="").pack()
 
    Label(pantalla2, text="Usuario").pack()
    nombreusuario_entry= Entry(pantalla2)
    nombreusuario_entry.pack()
    Label(pantalla2).pack()
    Label(pantalla2, text="Contraseña").pack()
    contrasena_entry = Entry(pantalla2,show="*")
    contrasena_entry.pack()
    Label(pantalla2).pack()
    Button(pantalla2, text="Registrar",command=inserta_datos).pack()

def inserta_datos():
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="database"
    )
    mycursor = mydb.cursor()
    sql="INSERT INTO usuarios (email,contraseña) VALUES ('{0}','{1}')".format(nombreusuario_entry.get(), contrasena_entry.get())
    #sql ="INSERT INTO usuarios (email,contraseña) VALUES (%s,%s)"
    #val = (nombreusuario_entry.get(), contrasena_entry.get())
    try:
        mycursor.execute(sql)
        mydb.commit()
        messagebox.showinfo(message="Registro Exitoso", title="Aviso")
    except:
        mydb.rollback()
        messagebox.showinfo(message="No registrado", title="Aviso")  
    mydb.close()    

menu_pantalla()
