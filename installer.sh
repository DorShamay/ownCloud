#!/bin/bashd
#Creator : DorShamay
#Porpuse of the script : Install ownCloud
#version : 0.0.1

line = *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

echo "Welcome to DorShamay's ownCloud Installation script"

Checkroot()
{
if [ $(id -u) != "0" ]; then
		echo "You are not root , Exiting"
		exit 1;
	fi
}

MainMenu()
{
  echo "Please pick distro from the list"
  select distro "Centos-RedHat" "Debian" "Quit"
    do
      case $distro in
        "Centos-Redhat")
				Centos_Check
        ;;
        "Debian"
				Debian_Check
        ;;
        "Quit")
        exit 0
        ;;
        *)
          echo "Please enter a valid selection"
        ;;
      esac
    done
}

Debian_Check()
{
  var=$(cat /etc/*-release |grep 'ID='|grep -v 'VERSION*'|awk -F= '{ print $2}')
    if [[ $var = debian|ubuntu ]]; then
      WelcomeDebCloud
    else
      echo "Are you sure your using Debian distro?"
    fi
}

Centos_Check()
{
  cat /etc/*-release |grep 'ID='|grep -v 'VERSION*'|awk -F= '{ print $2}'
  if [[ $var = centos ]]; then
    WelcomeCentCloud
  else
    echo "Are you sure your using Centos Distro?"
  fi
}

WelcomeDebCloud()
{
 printf $line
 echo "Welcome to the Debian ownCloud Installation script"
 printf $line
}
