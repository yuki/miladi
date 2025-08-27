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
- Usa el contenido del directorio `iso` para generar la ISO.
- Crea el contenido `work`, donde se va realizando el trabajo de crear la ISO.
- La ISO se generará en el directorio `out`.


# Tareas

Las tareas a cumplimentar para realizar el proyecto:

- [x] Generar la configuración de [Calamares](https://calamares.io/)
  - [x] Usar la configuración y creado repositorio [miladi-calamares-config](https://github.com/yuki/miladi-calamares-config)
  - [ ] Poder elegir entre distintos grupos de programas
  - [ ] ¿Poner un tema propio?
- [ ] ¿Qué escritorio usar?
  - [ ] [Gnome](https://www.gnome.org/), [XFCE](https://xfce.org/), [Mate](https://mate-desktop.org/), [Cinnamon](https://github.com/linuxmint/cinnamon)
  - [ ] No me convence [Plasma](https://kde.org/es/plasma-desktop/) pero igual es la mejor opción
  - [ ] ¿Posibilidad de elegir uno en el instalador?
- [ ] ¿Crear un tema propio de escritorio?
  - [ ] Al menos para poner fondo de escritorio propio
- [ ] Crear una aplicación de "primer arranque"
  - [ ] Que tenga opción de lanzar el instalador, acceder a una web con información/wiki...
  - Ejemplos que pueden servir:
    - [Arcolinux Welcome app](https://github.com/arcolinux/arcolinux-welcome-app)
    - [Garuda Linux Welcome](https://gitlab.com/garuda-linux/applications/garuda-welcome)
- [ ] ¿Usar [chaotic repository](https://aur.chaotic.cx/)?
- [ ] Crear tema para Grub/arranque de la ISO


# PROCESOS

read_profile ->  _set_overrides -> _validate_options -> _build -> _build_buildmode_iso -> _build_iso_base

_run_once _make_work_dir
_run_once _make_pacman_conf
_run_once _make_custom_airootfs
_run_once _make_packages
_run_once _make_version
_run_once _make_customize_airootfs
_run_once _make_pkglist
_run_once _check_if_initramfs_has_ucode
  
  _run_once _make_boot_on_iso9660  ||    _make_bootmodes

_run_once _cleanup_pacstrap_dir
_run_once _prepare_airootfs_image


_build_iso_image
