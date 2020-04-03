echo -e "Vamos agora configurar para que o no-ip inicialize junto com o servidor automaticamente..."
	sleep 4
echo -e "Atribuindo permissao ao arquivo de inicializacao, aguarde..."	
	chmod +x etc/init.d/noip.sh
	chmod 0755 etc/init.d/noip.sh
	cd /etc/init.d
	update-rc.d noip.sh defaults
    echo -e "Checando o resolvimento do DDNS..."
	nslookup $DOMINIO
	sleep 7

  echo -e "Tudo Pronto! Reinicie o servidor para certificar-se que o no-ip inicializou automaticamente."
    sleep 4
    exit 1