#!/bin/bash

printf "\n"
read -p "Enter a deployment type (UF for universal forwarder or ENT for Enterprise version) followed by enter> " deployVar

deployVar=`printf "${deployVar}" | tr '[a-z]' '[A-Z]'`

 if [ $deployVar = "UF" ]; then
    printf "\nUniversal Forwarder installation\n"


    if (( $(ps -ef | grep -v grep | grep splunkd | wc -l) > 0 )); then

    printf "\n"
    read -p "A splunk instance is already running, do you want to replace it? (y or n): " conf

    conf=`printf "${conf}" | tr '[A-Z]' '[a-z]'`

      if [ $conf = 'y' ]; then

        printf "\nRemoving current installation>>>>>>>\n"

        /opt/splunkforwarder/bin/splunk stop
         sudo rm ~/splunkforwarder-*
         sudo rm -rf /opt/splunkforwarder


        printf "\nInstalling Splunk>>>>>\n"


        wget -O ~/splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.6&product=universalforwarder&filename=splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz&wget=true'

        sudo tar xvfz ~/splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz  -C /opt/

        sudo chown -R $USER:$USER /opt/splunkforwarder

        /opt/splunkforwarder/bin/splunk start --accept-license

        sudo /opt/splunkforwarder/bin/splunk enable boot-start -user $USER

     else
          printf "\nExiting.....\n"

      fi

    else

      printf "\nInstalling Splunk>>>>>\n"


      wget -O ~/splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.6&product=universalforwarder&filename=splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz&wget=true' -P ~/

      sudo tar xvfz ~/splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz  -C /opt/

      sudo chown -R $USER:$USER /opt/splunkforwarder

      /opt/splunkforwarder/bin/splunk start --accept-license

      sudo /opt/splunkforwarder/bin/splunk enable boot-start -user $USER


   fi



 elif [ $deployVar = "ENT" ]; then
    printf "\nEnterprise installation\n"

    if (( $(ps -ef | grep -v grep | grep splunkd | wc -l) > 0 )); then


    printf "\n"
    read -p 'A splunk instance is already running, do you want to replace it? (y or n): ' conf

    conf=`printf "${conf}" | tr '[A-Z]' '[a-z]'`

      if [ $conf = 'y' ]; then

        printf "\nRemoving current installation>>>>>>>\n"

        /opt/splunk/bin/splunk stop
   	    sudo rm ~/splunk-*
   	    sudo rm -rf /opt/splunk

        printf "\nInstalling Splunk>>>>>\n"


        wget -O ~/splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.6&product=splunk&filename=splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz&wget=true' -P ~/

        sudo tar xvfz ~/splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz  -C /opt/

        sudo chown -R $USER:$USER /opt/splunk

        /opt/splunk/bin/splunk start --accept-license

        sudo /opt/splunk/bin/splunk enable boot-start -user $USER


      else
          printf "\nExiting.....\n"

      fi

    else

      printf "\nInstalling Splunk>>>>>\n"


      wget -O ~/splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.6&product=splunk&filename=splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz&wget=true' -P ~/

      sudo tar xvfz ~/splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz  -C /opt/

      sudo chown -R $USER:$USER /opt/splunk

      /opt/splunk/bin/splunk start --accept-license

      sudo /opt/splunk/bin/splunk enable boot-start -user $USER

   fi


 else
    printf "\nEnter a valid deployment\n"
 fi
