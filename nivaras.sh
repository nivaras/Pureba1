#!/bin/bash
echo
echo "Bienvenido a la Administarcion de usuarios y grupos"
echo
echo "Opciones"
echo "---------"
echo " 1. Crear Usuario "
echo " 2. Eliminar usuario "
echo " 3. Crear Grupo "
echo " 4. Agregar usario a un Grupo"
echo " 5. Eliminar Usuario de un Grupo"
echo " 6. Salir"
echo
echo -n " Ingresa la opcion que deseas: "
read option
if [ $option = 1 ]; 
	then
	echo " Ingresa el nombre del usuario que vas a crear"
	read user1
	echo "¿ Deseas agregar tu usuario a grupos especificos ?"
	echo -n " ¿ si o no ? "
	read esp1
	if [ $esp1 != no ];
		then
		echo " Ingresa el nombre del grupo secundario para tu usurio "
		read gru2
		groupadd $gru2
		echo " Ingresa el nombre del grupo primario para tu usurio "
		read gru1
		groupadd $gru1
	fi
	echo " ¿ Estas seguro de crear a $user1 ? "
	echo -n " ¿ si o no ? "
		read confirma
			if [ $confirma != no ]
				then
				useradd $user1
				echo " El usuario $user1 ha sido creado "
			fi
				if [ $esp1 = si ];
				then
				usermod $user1 -g $gru1 -G $gru2 
				echo " El usuario $user1 ha sido creado "
				fi
fi
if [ $option = 2 ];
	then
	echo " ¿ Que usuario que desea eliminar ? "	
	read user2
	echo " ¿Estas seguro de eliminar a $user2 ? "
	echo -n " ¿ si o no ? "
	read opcion
	if [ $opcion = si ];
		then
		userdel -f $user2
		echo " El usuario $user2 fue eliminado "
	fi
	if [ $opcion = no ]
		then
		echo " No se elimino a el usuario $user2 "
		fi
fi
if [ $option = 3 ];
	then
	echo " Ingrese el nombre del grupo a crear "
	read grupo
	echo " Esta seguro que quiere crear a $grupo (si o no)? "
	read op
	if [ $op = si ];
		then 
		groupadd $grupo
		echo " El grupo $grupo fue creado "
	fi
	if [ $op = no ];
		then
		echo " El grupo $grupo no fue creado"
		exit
	fi
fi
if [ $option = 4 ];
        then
        echo " Ingrese el nombre del usuario que quiera agregar al grupo "
        read us1
	echo " Ingrese el nombre del grupo al que quiera meter el usuario $us1 "
	read gr1
        echo " Esta seguro que quiere añadir el usario $us1 al grupo $gr1 (si o no)? "
        read op
        if [ $op = si ];
                then
                usermod $us1 -g $gr1
                echo " El usuario $us1 fue añadido al grupo $gr1 "
        fi
        if [ $op = no ];
                then
		echo " El usuario $us1 no fue añadido al grupo $gr1 "
		exit
		fi
fi
if [ $option = 5 ];
	then
	echo " ¿Que Usuario de que grupo desea remover? "
	echo " Nombre del Usuario "
	read user3
	echo " Nombre del Grupo "
	read gru4
	echo " ¿Desea sacar al Usuario del grupo, si o no? "
	read ans
	if  [ $ans = si ];
	then
		gpasswd -d $user3 $gru4
		echo " El usuario $user3 fue removido del grupo $gru4 "
	fi
	if [ $ans = no ];
		then
		echo " El usuario $user3 no fue removido del grupo $gru4 "
		exit
		fi
fi
if [ $option = 6 ];
	then
		echo "¿Desea salir del script? ¿Si o no? "
read salir
	if [ $salir = si ]
then
	echo "Gracias por usar el script"
	sleep 5
	exit
	else [ $salir = no ]
	sh nivaras.sh
fi
fi
