#!/bin/bash

#==========================================
# Prosty to-do list
# Napisany przez: Anastasiia Andrushkevych
#==========================================

clear

#Variables
QUIT=0

#Sprawdzanie czy użytkownik ma tasks.txt, jak niezbędny plik dla aplikacji.
TASKS=~/Programs/BASH/To-Do-List/tasks.txt
if test -f "$TASKS"; then
	echo ""
else
	echo "tasks.txt nie znaleziono! Tworzenie tasks.txt..."
	touch tasks.txt
	echo "Stworzono tasks.txt!"
fi

#aktualna lista zadań 
while [ $QUIT -eq 0 ]; do 
	echo "Twoja obecna lista zadań:"
	cat -n tasks.txt

	echo "------------------------"
	echo "Chciałbyś/łabyś dodać nowe zadanie (d), usunąć stare (u) albo wyjść z aplikacji (w)? (d/u/w)"
	read LETTER
	case $LETTER in
		d|1)
			echo "Proszę dodać nowe zadanie:"
			read ENTRY
			echo "$ENTRY" >> tasks.txt
			echo "Dodano '$ENTRY' do listy."
			clear
			echo "------------------------"
			;;
		u|2)
			echo "Jakie zadanie chciałbyś/łabyś usunąć? (wybierz numer)"
			read DELETE
			sed -i "${DELETE}d" tasks.txt
			echo "Usunięte zadanie  $DELETE."
			clear
			echo "------------------------"
			;;
		w|3)
			QUIT=1
			clear
			;;
	esac
done
