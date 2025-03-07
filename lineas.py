import mysql.connector

# Función para conectar a la base de datos
def conectar():
    try:
        conexion = mysql.connector.connect(
            host="localhost",
            user="root",
            password="OrsoeR22",
            database="dbtaller"
        )
        if conexion.is_connected():
            print("Conexión exitosa a la base de datos dbtaller")
        return conexion
    except mysql.connector.Error as error:
        print("Error al conectar a la base de datos:", error)
        return None

# CRUD para lineas de investigación
def crear_lineainv(conexion, clavein, nombre):
    try:
        cursor = conexion.cursor()
        sql = "INSERT INTO lineainv (clavein, nombre) VALUES (%s, %s)"
        cursor.execute(sql, (clavein, nombre))
        conexion.commit()
        print(f"Línea de investigación insertada: {clavein} - {nombre}")
    except mysql.connector.Error as error:
        print("Error al insertar:", error)
    finally:
        cursor.close()

def leer_lineainv(conexion):
    try:
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM lineainv")
        registros = cursor.fetchall()
        for linea in registros:
            print(f"Clave: {linea[0]}, Nombre: {linea[1]}")
    except mysql.connector.Error as error:
        print("Error al consultar:", error)
    finally:
        cursor.close()

def actualizar_lineainv(conexion, clavein, nuevo_nombre):
    try:
        cursor = conexion.cursor()
        sql = "UPDATE lineainv SET nombre = %s WHERE clavein = %s"
        cursor.execute(sql, (nuevo_nombre, clavein))
        conexion.commit()
        print(f"Registro actualizado: {clavein} -> {nuevo_nombre}")
    except mysql.connector.Error as error:
        print("Error al actualizar:", error)
    finally:
        cursor.close()

def eliminar_lineainv(conexion, clavein):
    try:
        cursor = conexion.cursor()
        sql = "DELETE FROM lineainv WHERE clavein = %s"
        cursor.execute(sql, (clavein,))
        conexion.commit()
        print(f"Registro eliminado: {clavein}")
    except mysql.connector.Error as error:
        print("Error al eliminar:", error)
    finally:
        cursor.close()

# CRUD para tipo de proyecto
def crear_tipoproyecto(conexion, clave, nombre):
    try:
        cursor = conexion.cursor()
        sql = "INSERT INTO tipoproyecto (clave, nombre) VALUES (%s, %s)"
        cursor.execute(sql, (clave, nombre))
        conexion.commit()
        print(f"Tipo de proyecto insertado: {clave} - {nombre}")
    except mysql.connector.Error as error:
        print("Error al insertar tipo de proyecto:", error)
    finally:
        cursor.close()

def leer_tipoproyecto(conexion):
    try:
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM tipoproyecto")
        registros = cursor.fetchall()
        for tipo in registros:
            print(f"Clave: {tipo[0]}, Nombre: {tipo[1]}")
    except mysql.connector.Error as error:
        print("Error al consultar tipos de proyecto:", error)
    finally:
        cursor.close()

def actualizar_tipoproyecto(conexion, clave, nuevo_nombre):
    try:
        cursor = conexion.cursor()
        sql = "UPDATE tipoproyecto SET nombre = %s WHERE clave = %s"
        cursor.execute(sql, (nuevo_nombre, clave))
        conexion.commit()
        print(f"Tipo de proyecto actualizado: {clave} -> {nuevo_nombre}")
    except mysql.connector.Error as error:
        print("Error al actualizar tipo de proyecto:", error)
    finally:
        cursor.close()

def eliminar_tipoproyecto(conexion, clave):
    try:
        cursor = conexion.cursor()
        sql = "DELETE FROM tipoproyecto WHERE clave = %s"
        cursor.execute(sql, (clave,))
        conexion.commit()
        print(f"Tipo de proyecto eliminado: {clave}")
    except mysql.connector.Error as error:
        print("Error al eliminar tipo de proyecto:", error)
    finally:
        cursor.close()

def main():
    conexion = conectar()
    if conexion:
        # Pruebas con tipo de proyecto
        print("\nCreando tipo de proyecto...")
        crear_tipoproyecto(conexion, "TP001", "Desarrollo de Software")
        
        print("\nConsultando tipos de proyecto...")
        leer_tipoproyecto(conexion)
        
        print("\nActualizando tipo de proyecto TP001...")
        actualizar_tipoproyecto(conexion, "TP001", "Investigación Científica")
        
        print("\nConsultando después de actualizar...")
        leer_tipoproyecto(conexion)
        
        print("\nEliminando tipo de proyecto TP001...")
        eliminar_tipoproyecto(conexion, "TP001")
        
        print("\nConsultando después de eliminar...")
        leer_tipoproyecto(conexion)
        
        conexion.close()
        print("\nConexión cerrada.")

if __name__ == "__main__":
    main()
