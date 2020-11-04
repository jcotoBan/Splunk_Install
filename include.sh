#header functions for more modularity. Suggestion from bran1501


splunkInstall(){


		if [ $1 = 'UF' ]; then

		printf "\nUniversal Forwarder installation\n"

	    printf "\nInstalling Splunk>>>>>\n"

        wget -O ~/splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.6&product=universalforwarder&filename=splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz&wget=true'

        sudo tar xvfz ~/splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz  -C /opt/

        sudo chown -R $USER:$USER /opt/splunkforwarder

        /opt/splunkforwarder/bin/splunk start --accept-license

        sudo /opt/splunkforwarder/bin/splunk enable boot-start -user $USER


    	else

    	printf "\nEnterprise installation\n"

    	printf "\nInstalling Splunk>>>>>\n"

		wget -O ~/splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.6&product=splunk&filename=splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz&wget=true' -P ~/

    	sudo tar xvfz ~/splunk-8.0.6-152fb4b2bb96-Linux-x86_64.tgz  -C /opt/

    	sudo chown -R $USER:$USER /opt/splunk

    	/opt/splunk/bin/splunk start --accept-license

     	sudo /opt/splunk/bin/splunk enable boot-start -user $USER


     	fi


}


splunkRemove(){


    		if [ $1 = 'UF' ]; then
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