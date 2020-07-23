#!/bin/bash
#Script Auto Creating The SSH User
#Script By Khairul SHVPN
clear
echo ""
echo "----------------------"
echo "Which customer is it?"
echo ""
echo "1) Digi"
echo "2) Others"
echo "3) Exit"
echo ""
echo "----------------------"
echo ""
read -p "No [1 - 3]: " option
        until [[ "$option" =~ ^[1-3]$ ]]; do
                echo "$option: invalid selection."
                read -p "Option: " option
        done
        case "$option" in
                1)
                cd
                bash digi.sh
                exit
                ;;
                2)
                cd
                bash ovpn.sh
                exit
                ;;
                3)
                exit
                ;;
        esac

