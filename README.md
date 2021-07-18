# Equipo de Modelos para el Proyecto PASCAL

Robot de servicio desarrollado en el *Semillero de Robótica ASIMOV* de la **Universidad EIA** para interactuar con personas en el campus y desplazarse a través de este. Este equipo se encarga de modelar el movimiento del robot cinemática y dinamicamente para construir algoritmos inteligentes que le permitan al sistema desplazarse en un entorno que posee diversos obstáculos por medio de sensores. 

# Tabla de Contenido
* [Comenzando 🚀](https://github.com/Semillero-ASIMOV/asimov-modelo#comenzando)
    * [Pre-requisitos 📋]()
    * [Instalación 🔧]()
    * [Ejecutando las pruebas ⚙️]()
        * [Solo Matlab]()
        * [Matlab + CoppeliaSim]()
* [Construido con 🛠️]()
* [Contribuyendo 🖇️]()
* [Previsualizar Markdown en VS Code](https://github.com/Semillero-ASIMOV/asimov-modelo#previsualizar-markdown-en-visual-studio-code)
* [Usar LaTeX en VS Code](https://github.com/Semillero-ASIMOV/asimov-modelo#previsualizar-markdown-en-visual-studio-code)
* [Informe PDF](https://github.com/Semillero-ASIMOV/asimov-modelo/blob/main/informe/build/informe.pdf)
* [Elementos necesarios para el próximo semestre](https://github.com/Semillero-ASIMOV/asimov-modelo#elementos-necesarios-para-el-próximo-semestre)

# Comenzando 🚀
### Pre-requisitos 📋
1. [Matlab]
2. [CoppeliaSim edu]

### Instalación 🔧
Se puede clonar el repositorio con Git para tener los archivos en el entorno local
```sh
$ git clone https://github.com/Semillero-ASIMOV/asimov-modelo.git
```
### Ejecutando las pruebas ⚙️
#### Solo Matlab
1. Usar `matlab` para abrir `main.m` presente en la carpeta `'Matlab simulation'`.
2. Ejecutar el código.
3. Analizar resultados.
#### Matlab + CoppeliaSim
1. Usar `'CoppeliaSim Edu'` para abrir `r_sim.ttt` presente en la carpeta `coppelia_matlab`. 
> File > Open Scene... > Open
2. Usar `matlab` para abrir `coppeliaSim_main.m` presente en la carpeta `coppelia_matlab`.
3. Iniciar la simulación en `CoppeliaSim Edu`. Botón *Start/resume simulation*.
4. Ejecutar el código abierto en *punto 2*.
5. Es posible que la simulación en *CoppeliaSim Edu* se detenga automáticamente, entonces, iniciarla de nuevo.
6. Analizar los resultados de la simulación.
7. La ejecución en *Matlab* se detiene automáticamente cuando el algoritmo termina.
8. Detener la simulación en *CoppeliaSim Edu*.

## Elementos necesarios para el próximo semestre
- [x] Cámara de profundidad Orbbec Astra. :camera:
- [x] LiDAR A1M8-R6.
- [ ] IMU.
- [ ] Base robótica con ruedas tipo Mecanum.
- [x] Odroid XU-4 + Tarjeta SD + Adaptador. :computer:
- [ ] Sensores de proximidad que aún están por definirse.

# Construido con 🛠️
* [Matlab] - "una plataforma de programación y cálculo numérico".
* [CoppeliaSim Edu](https://coppeliarobotics.com) - Un simulador físico de robots.
# Contribuyendo 🖇️
## Previsualizar Markdown en Visual Studio Code

Se puede obtener una previsualización del README.md con el comando `Ctrl+Shift+V`.

Fuente: [Markdown and Visual Studio Code][markdown]

## Como usar LaTeX con Visual Studio Code

Para editar el informe directamente en Visual Studio Code y realizar push a GitHub, se puede usar la extensión [LaTeX Workshop][latex-workshop] y seguir [este video][latex-video-install] para realizar la adecuada instalación.

Una vez en Visual Studio Code y aprovechando Git, se puede editar el informe y obtener una vista previa del mismo; luego se puede hacer push para llevarlo a GitHub.

>Nota: Si se modifica el informe en otro recurso, modificar el archivo `informe.tex`.

# Créditos

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job.)

[latex-workshop]: <https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop>
[latex-video-install]: <https://www.youtube.com/watch?v=fLP0QVFaeAU>
[markdown]: <https://code.visualstudio.com/Docs/languages/markdown>
[matlab]: <https://la.mathworks.com/products/matlab.html>
[CoppeliaSim edu]: <https://coppeliarobotics.com/downloads>