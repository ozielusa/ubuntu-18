 # Variavel com o host DDNS criado no no-ip"
 DOMINIO='ozihost.ddns.net'
 echo -e "Acessando o diretorio de destino do download, aguarde..."
    cd /usr/local/src
	sleep 3
echo -e "Realizando o download do arquivo de instalacao, aguarde..."
    wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
echo -e "Descompactando o arquivo, aguarde..."
    tar xf noip-duc-linux.tar.gz
echo -e "Acessando o diretorio de instalacao, aguarde..."	
    cd noip-2.1.9-1
echo -e "Instalando, aguarde..."
    make install
#echo -e "Abrindo configuracoes de login, aguarde..."
#    /usr/local/bin/noip2 -C
#
clear
echo -e "Reinicializando os serviços do NoIP, aguarde..."
	/usr/local/bin/noip2
echo -e "Serviço reinicializado com sucesso!!!"
echo -e "Checando o resolvimento do DDNS..."
	nslookup $DOMINIO
	sleep 4
echo -e "Acessando o diretorio do arquido de Inicializacao Automatica, aguarde..."
cd /etc/init.d
echo -e "Abrindo o arquido de Inicializacao para edicao,"
echo -e "Edite o arquivo colando o script para inicializar o no-ip junto com o sistema"
	read
	sleep 3
	nano noip.sh
echo -e "Arquivo atualizado com sucesso!!!, continuando com a Configuracao..."
	sleep 4
echo -e "Atribuindo permissao ao arquivo de inicializacao, aguarde..."	
	chmod +x /etc/init.d/noip.sh
	chmod 0755 /etc/init.d/noip.sh
	cd /etc/init.d
	update-rc.d noip.sh defaults
	echo -e "Tudo concluido! Obrigado."
	exit 1