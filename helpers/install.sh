
splunkInstall(){

		source ./helpers/repoGenerator.sh

		if [ $1 = 'UF' ]; then

			printf "\nUniversal Forwarder installation\n"

			uf_RepoGenerator

			printf "\n"
			printf "\n"

			printf "\nSplunk UF Available Versions: \n\n"

			grep "data-version" uf_Repo.txt | uniq | grep -P '\d.+\d' -o | sed '$!N;$!N;s/\n/ <-------> /g'

			printf "\n"
			printf "\n"

			read -p "Enter the Splunk Universal Forwarder version required followed by enter> " versionVar

			printf "\n"
			printf "\n"

			grep -P 'https.+"' uf_Repo.txt -o | grep -w $versionVar | tr '"' '\0'

			printf "\n"
			printf "\n"

			read -p "Enter the Splunk Universal Forwarder arquitecture required from the above followed by enter> " arquitecture

	    printf "\nInstalling Splunk>>>>>\n"

			downloadLink="$(grep -P 'https.+"' uf_Repo.txt -o | grep -w $versionVar | grep -w $arquitecture | tr '"' ' ')"

			file="$(grep -P 'https.+"' uf_Repo.txt -o | grep $versionVar | grep -w $arquitecture | grep -P 'splunk(?!.*splunk).+"' -o |  tr '"' ' ')"

			wget -O ~/$file $downloadLink

			sudo tar xvfz ~/$file  -C /opt/

      sudo chown -R $USER:$USER /opt/splunkforwarder

      /opt/splunkforwarder/bin/splunk start --accept-license

      sudo /opt/splunkforwarder/bin/splunk enable boot-start -user $USER


    	else

    	printf "\n\nEnterprise installation\n"

			ent_RepoGenerator

			printf "\n"
			printf "\n"

			printf "\nSplunk Available Versions: \n\n"

			grep "data-version" enterprise_Repo.txt | grep -P '\d.+\d' -o | sed '$!N;$!N;s/\n/ <-------> /g'

			printf "\n"

			read -p "Enter the Splunk enterprise version required followed by enter> " versionVar

    	printf "\nInstalling Splunk>>>>>\n"

			downloadLink="$(grep -P 'https.+"' enterprise_Repo.txt -o | grep -w $versionVar | tr '"' '\0')"

			file="$(grep -P 'https.+"' enterprise_Repo.txt -o | grep -w $versionVar | grep -P 'splunk(?!.*splunk).+"' -o |  tr '"' ' ')"

		  wget -O ~/$file $downloadLink

    	sudo tar xvfz ~/$file  -C /opt/

    	sudo chown -R $USER:$USER /opt/splunk

    	/opt/splunk/bin/splunk start --accept-license

     	sudo /opt/splunk/bin/splunk enable boot-start -user $USER


     	fi


}


splunkRemove(){

					DIR="/opt/splunkforwarder"

					if [ -d "$DIR" ]; then
    			     printf "\nRemoving current installation>>>>>>>\n"
        			 /opt/splunkforwarder/bin/splunk stop
         			 sudo rm ~/splunkforwarder-*
           		 sudo rm -rf /opt/splunkforwarder
         	else
         			 printf "\nRemoving current installation>>>>>>>\n"
         			 /opt/splunk/bin/splunk stop
   	    			 sudo rm ~/splunk-*
   	    			 sudo rm -rf /opt/splunk
   	    	fi


}
