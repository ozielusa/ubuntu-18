 echo -e "Acessando o diretorio de destino, aguarde..."
    cd /usr/local/src/
echo -e "Realizando o download do arquivo de instalacao, aguarde..."
    wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
    tar xf noip-duc-linux.tar.gz
echo -e "Descompactando o arquivo, aguarde..."
    cd noip-2.1.9-1/
echo -e "Instalando, aguarde..."
    make install
echo -e "Abrindo configuracoes de login, aguarde..."
    /usr/local/bin/noip2 -C
#
echo -e "Reinicializando os serviços do NoIP, aguarde..."
	/usr/local/bin/noip2
echo -e "Serviço reinicializado com sucesso!!!"