Proyecto de Visión Computacional
================================

Para el proyecto visión computacional se nos pide realizar un 
sistema que utilice las técnicas aprendidas durante el semestre, 
es por eso que estuve trabajando en la combinación de tratamiento 
de imágenes y los dispositivos móviles para realizar un juego 
donde el usuario debe dibujar lo más igual posible, una imagen 
que se le muestra al principio de manera que contra el tiempo, 
luego de un proceso con la imagen dibujada y la original, 
realizar filtros para obtener un porcentaje de igualdad de imagenes.


Plataforma y prerrequisitos
---------------------------

Para la elaboración de este proyecto usé XCode v4, Python 2.7.3 y PHP 5.3
con el sistema operativo Mac OS X Mountain Lion. 

Es necesario contar con Tk inter dependencias que no estan incluidas en la librería estandar de Python.

[Xcode 4](https://developer.apple.com/xcode/)

[PHP](http://php.net)

[Python](http://www.python.org)

[Tkinter](http://wiki.python.org/moin/TkInter)

Diseño de software
------------------

El software está orientado a diferentes campos, primero que nada tenemos una 
aplicación móvil desarrollada en el lenguaje de programación Objective-C 
en donde tenmos diferentes vistas, de manera que tenemos una vista principal 
en donde se la bienvenida al usuario en el juego y tiene que seleccionar 
si desea continuar jugando.

Durante 4 segundos aparece una imagen que se carga desde el servidor, 
luego se pasa a la siguiente vista para que el usuario mediante un canvas
pueda capturar el dibujo y después de 10 segundos, esta imágen se mande 
al servidor donde por medio de una aplicación WEB desarrollada en PHP 
lo guarde y establesca conexión con el puerto 6699 creado mediante un 
socket en python, de esta manera, al momento de mandar un mensaje a este 
socket se crea una conexión independiente mediante un hilo y se empieza 
a procesar la imágen para dar como regreso un promedio de cuanta cantidad 
de imagen es igual o semejante a la capturada por el usuario, para esta 
a su vez responder a la aplicación WEB de PHP y retornar un mensaje por HTTP 
a la aplicación móvil mediante una alerta.


Ejecución
---------

Es necesario pasar la carpeta Servidor a tu servidor local que 
este corriendo PHP y darle permisos suficientes a la carpeta uploads 
para que pueda crear la imagen

Luego se ejecuta el comando

    ~$ python Servidor.py

El programa dirá que esta listo a escuchar en el puerto, el proyecto
Xcode QTigual.xcodeproj se carga en el programa y se selecciona Build

El programa carga en un simulador (probado en version iOS 6)

Modo de uso
-----------

El sistema se divide en diferentes partes importantes:

La aplicación móvil la cual captura mediante un canvas el dibujo 
hecho por el usuario para mandarlo a la aplicación WEB.

Aplicación WEB en PHP que guarda la captura y hace una llamada 
al puerto que contiene el procesamiento de los filtros.

Socket que hace todas las imagenes de tratamiento para 
devolver el porcentaje de semejanza con la imagen.

Acerca de
---------

El programa fue elaborado como proyecto para la clase de Visión Computacional de la carrera de Ingeniero en Tecnología de Software de la Facultad de Ingeniería Mecánica y Eléctrica, impartida por la Dra. Elisa Schaeffer.

Página de la clase:
http://elisa.dyndns-web.com/~elisa/teaching/comp/vision/2013.html

Puedes encontrar el reporte final de este proyecto en el siguiente enlace:
http://roberto-mtz.blogspot.mx/2013/05/proyecto-qtigual.html