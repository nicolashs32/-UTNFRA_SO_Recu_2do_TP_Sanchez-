#!/bin/bash

# --- Comandos del 2do TP de Recuperatorio ---

# 1. Crear los 4 roles
cd ~/UTNFRA_SO_Recu_2do_TP_Sanchez/202411/ansible/roles
ansible-galaxy init 2PRecuperatorio
ansible-galaxy init Crea_Carpetas_sanchez
ansible-galaxy init Cambia_Propiedad_sanchez
ansible-galaxy init Sudoers_sanchez

# 2. Contenido de playbook.yml:
# El playbook llama a los 4 roles en el orden requerido.
# [Contenido YAML de roles no se pega en el script, solo se documenta su creación.]

# 3. Ajuste del inventario:
# Se configuró 'localhost ansible_connection=local' en inventory/hosts.

# 4. Ejecución del Playbook
# Se usa 'sudo' para forzar la ejecución como root y evitar el error de permisos.
cd ..
sudo ansible-playbook playbook.yml -i inventory/hosts

# --- Verificación Final ---
echo "--- Verificación de Usuarios, Grupos, Carpetas y Sudoers ---"
id Alumno
id Profesor
ls -ld /UTN/Alumno /UTN/Profesor
sudo -l -U Profesor
























