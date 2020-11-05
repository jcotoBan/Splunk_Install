# Splunk_Install
A little Linux script to automate Splunk installation.

# Description

It provides an automated way of installing Splunk Universal Forwarders and Enteprise versions plus preparing some of the environment's work.


# How it works

Basically you just run it on your Linux Box. After that the funcionality breaks on the following steps:

1-Ask the user for the type of deployment that is required to be installed. Valid options are UF(universal forwarder) or ENT(enterprise)

2-Check if the there is a current Splunk deployment running and ask if remove it and proceed with a fresh installation or cancel.

3-Download Splunk tgz file from splunk.com.

4-Adjust any user permissions on $SPLUNK_HOME required.

5-Start Splunk (it will prompt for the admin user and password), *license will be accepted automatically.

6-Enable boot-start with the current user.

# notes

Unfortunately for now, there is no direct way to download the latest splunk version, working for now on how to add a feature that allows you to specify the url more interactively.

It downloads latest Splunk version as of 11/03/20.

It has been tested on ubuntu and CentOS. * On ubuntu run as bash splunkInstall.sh rather than sh splunkInstall.sh.

*Check that $user env variable is set accordingly.

*Make sure splunkInstall.sh and include.sh are both on the same directory.


# Contribute

If you want to contribute with a feature, request a new feature for enhancement or fix any bug just write an email to jcotsan@gmail.com, on the subject line please set "SPLUNK INSTALL REPO - CONTRIBUTE", otherwise your message will be ignored.You can send your pull requests directly as well.




