# MILADI

Acronimo de: "My Installer for Linux Arch Distribution". Lo ideal sería que termine en "y", pero de momento no se me ha ocurrido nada.

La idea es aprender a hacer una distribución basada en [Arch Linux](https://archlinux.org/), con los paquetes que me interese tener de serie. Para que el usuario final pueda instalar la ISO quiero usar [Calamares](https://calamares.io/).

## Bases para el proyecto

La idea es usar:

- [Archiso](https://gitlab.archlinux.org/archlinux/archiso): sisema utilizado por ArchLinux para crear su propia ISO.

- Otros proyectos para ver cómo hacen ellos sus distribuciones. Por ejemplo:
  - [EndeavourOS-ISO](https://github.com/endeavouros-team/EndeavourOS-ISO)
  - [Athena](https://github.com/Athena-OS/athena)
  - [Arconet](https://github.com/arconetpro/arconet-iso) y su web [Arcolinux](https://www.arcolinux.info/)
  - [ALG-Gnome](https://github.com/arch-linux-gui/alg-gnome) del proyecto [Arch Linux Gui](https://arch-linux-gui.github.io/web/)



## Crear la ISO
Para crear la ISO, se necesita el paquete [archiso](https://archlinux.org/packages/extra/any/archiso/). Lo más fácil es usar una distribución de Arch o desde un contenedor. Para crear un contenedor de Arch:

```
sudo podman run --privileged -it --entrypoint /bin/bash -v "$(pwd):/workdir"   archlinux/archlinux:latest
```

Y se necesita tener instalado el paquete: `pacman -Syu archiso`

Y para crear la ISO, estando en el directorio del proyecto:

```
mkarchiso -v iso
```

Este comando:
- Usa el contenido del directori `iso` para generar la ISO.
- Crea el contenido `work`, donde se va realizando el trabajo de crear la ISO.
- La iso se generará en el directorio `out`.