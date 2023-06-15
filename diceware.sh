#!/bin/bash

##
# diceware.sh
#
# Displays 5, 6 or 7 words passphrase with Diceware method
#
# Usage :
# diceware

# Pour un fonctionnement dans le répertoire :
# 1. Commenter 		ligne 16 : #source ~/MyEntranceHall/Maintenance/02-GitBashRC/MyPaths.sh
# 2. Commenter 		ligne 35 : #combination_space_word=`grep ${diceware_combinations} ${myPath009}diceware_fr.txt`
# 3. Décommenter 	ligne 36 : combination_space_word=`grep ${diceware_combinations} diceware_fr.txt`

mainPath="/d/pCloudSync/00-EntranceHall/Maintenance/02-Shell-RC/"
source ${mainPath}Windows-GitBash-bashrc/MyPaths1.sh command 2> /dev/null ||\
source /mnt${mainPath}WSL2-Ubuntu-zshrc/MyPaths2.sh

rollingDices() {
	diceware_combination=""
	for ((i = 1 ; i <= 5 ; i++)); do
		dice=$(($RANDOM%6))
		let dice+=1
		diceware_combination+=${dice}
	done
	# echo ${diceware_combination} équivalent au return ${diceware_combination} qui ne fonctionne pas en Bash
	# les retours de valeurs par les fonctions se faisant par des échos
	echo ${diceware_combination}
}

passPhrase() {
	echo ""
	passphrase=""
	for ((i = 1 ; i <= ${1} ; i++)); do
		diceware_combinations="$(rollingDices)"
		combination_space_word=`grep ${diceware_combinations} ${myPath009}diceware_fr.txt`
		#combination_space_word=`grep ${diceware_combinations} diceware_fr.txt`
		echo "${i} - ${combination_space_word}"
		word=`echo ${combination_space_word:6}` 
		if [[ ${i} -lt ${1} ]]
		then
			passphrase+=${word}"-"
		else
			passphrase+=${word}
		fi
	done

	case $1 in
		5) passphrase_5=${passphrase};;
		6) passphrase_6=${passphrase};;
		7) passphrase_7=${passphrase};;
	esac 

	echo ""
	echo -e "\033[0;40;31mPassPhrase ${1} de mots : \033[0;0;39m"
	echo -e "\033[0;40;32m${passphrase}\033[0;0;39m"
}

passPhrase_2() {
	#echo ""
	passphrase=""
	for ((i = 1 ; i <= ${1} ; i++)); do
		diceware_combinations="$(rollingDices)"
		combination_space_word=`grep ${diceware_combinations} ${myPath009}diceware_fr.txt`
		#combination_space_word=`grep ${diceware_combinations} diceware_fr.txt`
		#echo "${i} - ${combination_space_word}"
		word=`echo ${combination_space_word:6}` 
		if [[ ${i} -lt ${1} ]]
		then
			passphrase+=${word}"-"
		else
			passphrase+=${word}
		fi
	done

	case $1 in
		5) passphrase_5=${passphrase};;
		6) passphrase_6=${passphrase};;
		7) passphrase_7=${passphrase};;
	esac 
}

passPhrasesOnly() {
	echo ""
	echo -e "\033[0;40;31mPassPhrase 5,6 et 7 mots : \033[0;0;39m"
	echo -e "\033[0;40;32m${passphrase_5}\033[0;0;39m"
	echo -e "\033[0;40;32m${passphrase_6}\033[0;0;39m"
	echo -e "\033[0;40;32m${passphrase_7}\033[0;0;39m"
}

passText() {

	echo ""
	echo -e "\033[0;40;31mPassText : \033[0;0;39m"

	# Loop 1
	# \c pour ne pas revenir à la ligne
	echo -e "\033[0;40;32m ${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	
	# Loop 2
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	
	# Loop 3
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	
	# Loop 4
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	
	# Loop 5
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	
	# Loop 6
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	
	# Loop 7
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	
	# Loop 8
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	
	# Loop 9
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7} \c\033[0;0;39m"	
	
	# Final Loop 10
	passPhrase_2 "5"
	passPhrase_2 "6"
	passPhrase_2 "7"
	echo -e "\033[0;40;32m${passphrase_5} ${passphrase_6} ${passphrase_7}\033[0;0;39m"	
}

main() {
	#clear
	echo ""
	echo "******************************"
	echo "Méthode Diceware 5,6 et 7 mots"
	echo "******************************"
	passPhrase "5"
	passPhrase "6"
	passPhrase "7"
	passPhrasesOnly
	passText
}
#echo ${myPath012}
main

echo ""


