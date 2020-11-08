
#Enterprise repo

ent_RepoGenerator(){

printf "\n>>>>> Updating Enterprise repo >>>>>"

FILE="enterprise_Repo.txt"

if [[ -f "$FILE" ]]; then
    rm enterprise_Repo.txt
fi


wget -q https://www.splunk.com/en_us/download/previous-releases.html

wget -q https://www.splunk.com/en_us/download/splunk-enterprise.html

grep "https://download.splunk.com/products/splunk/releases/" splunk-enterprise.html | grep "Linux" | grep  "tgz" | grep -P 'data-link(.+?)tgz" |data-version(.+?)" ' -o > enterprise_Repo.txt

grep "https://download.splunk.com/products/splunk/releases/" previous-releases.html | grep "Linux" | grep  "tgz" | grep -P 'data-link(.+?)tgz" |data-version(.+?)" ' -o >> enterprise_Repo.txt

rm previous-releases.html
rm splunk-enterprise.html

}


#Universal forwarder repo

uf_RepoGenerator(){

printf "\n>>>>> Updating Universal Forwarder repo >>>>>"

FILE="uf_Repo.txt"

if [[ -f "$FILE" ]]; then
    rm uf_Repo.txt
fi



wget -q https://www.splunk.com/en_us/download/previous-releases/universalforwarder.html

wget -q https://www.splunk.com/en_us/download/universal-forwarder.html

grep "https://download.splunk.com/products/universalforwarder/releases/" universal-forwarder.html | grep "Linux" | grep  "tgz" | grep -P 'data-link(.+?)tgz" |data-version(.+?)" ' -o > uf_Repo.txt

grep "https://download.splunk.com/products/universalforwarder/releases/" universalforwarder.html | grep "Linux" | grep  "tgz" | grep -P 'data-link(.+?)tgz" |data-version(.+?)" ' -o >> uf_Repo.txt

rm universalforwarder.html
rm universal-forwarder.html

}
