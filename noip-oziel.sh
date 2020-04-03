#!/bin/bash
# Autor: Robson Vaamonde
# Data de criação: 04/11/2018
# Data de atualização: 10/02/2019
# Versão: 0.06
# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Kernel >= 4.15.x
#
# Debconf - Sistema de configuração de pacotes Debian
# Site: http://manpages.ubuntu.com/manpages/bionic/man7/debconf.7.html
# Debconf-Set-Selections - insere novos valores no banco de dados debconf
# Site: http://manpages.ubuntu.com/manpages/bionic/man1/debconf-set-selections.1.html
#
# Vídeo de instalação do GNU/Linux Ubuntu Server 18.04.x LTS: https://www.youtube.com/watch?v=zDdCrqNhIXI
#
# Variável da Data Inicial para calcular o tempo de execução do script (VARIÁVEL MELHORADA)
# opção do comando date: +%T (Time)
HORAINICIAL=`date +%T`
#
# Variáveis para validar o ambiente, verificando se o usuário e "root", versão do ubuntu e kernel
# opções do comando id: -u (user), opções do comando: lsb_release: -r (release), -s (short), 
# opções do comando uname: -r (kernel release), opções do comando cut: -d (delimiter), -f (fields)
# opção do caracter: | (piper) Conecta a saída padrão com a entrada padrão de outro comando
# opção do shell script: acento crase ` ` = Executa comandos numa subshell, retornando o resultado
# opção do shell script: aspas simples ' ' = Protege uma string completamente (nenhum caractere é especial)
# opção do shell script: aspas duplas " " = Protege uma string, mas reconhece $, \ e ` como especiais
USUARIO=`id -u`
UBUNTU=`lsb_release -rs`
KERNEL=`uname -r | cut -d'.' -f1,2`
#
# Variável do caminho do Log dos Script utilizado nesse curso (VARIÁVEL MELHORADA)
# opções do comando cut: -d (delimiter), -f (fields)
# $0 (variável de ambiente do nome do comando)
LOG="/var/log/$(echo $0 | cut -d'/' -f2)"
#
# Variáveis de configuração do MySQL e liberação de conexão remota para o usuário Root
USER="ozielusa@hotmail.com"
PASSWORD="ozi1977noip"
AGAIN=$PASSWORD
#
# Verificando se o usuário e Root, Distribuição e >=18.04 e o Kernel >=4.15 <IF MELHORADO)
# [ ] = teste de expressão, && = operador lógico AND, == comparação de string, exit 1 = A maioria dos erros comuns na execução
#clear
if [ "$USUARIO" == "0" ] && [ "$UBUNTU" == "18.04" ] && [ "$KERNEL" == "4.15" ]
	then
		echo -e "O usuário e Root, continuando com o script..."
		echo -e "Distribuição e >=18.04.x, continuando com o script..."
		echo -e "Kernel e >= 4.15, continuando com o script..."
		sleep 5
	else
		echo -e "Usuário não e Root ($USUARIO) ou Distribuição não e >=18.04.x ($UBUNTU) ou Kernel não e >=4.15 ($KERNEL)"
		echo -e "Caso você não tenha executado o script com o comando: sudo -i"
		echo -e "Execute novamente o script para verificar o ambiente."
		exit 1
fi
#clear
echo -e "Atualizando as listas do Apt, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	apt update &>> $LOG
echo -e "Listas atualizadas com sucesso!!!, continuando com o script..."
sleep 5
echo
#
echo -e "Atualizando o sistema, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando apt: -y (yes)
	apt -y upgrade &>> $LOG
echo -e "Sistema atualizado com sucesso!!!, continuando com o script..."
sleep 5
echo
#
#			 
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
sleep 5
echo
#
#
#echo -e "Criando o arquivo de teste do PHP phpinfo.php, aguarde..."
	# opção do comando: > (redirecionar a saída padrão)
	# opção do comando chown: -v (verbose)
#	touch /var/www/html/phpinfo.php
#	echo -e "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
#	chown -v www-data.www-data /var/www/html/phpinfo.php &>> $LOG
#echo -e "Arquivo criado com sucesso!!!, continuando com o script..."
#sleep 5
#echo
#
#
echo -e "Instalação do NoIP feito com Sucesso!!!"
	# script para calcular o tempo gasto (SCRIPT MELHORADO, CORRIGIDO FALHA DE HORA:MINUTO:SEGUNDOS)
	echo -e "Tempo gasto para execução do script $0: $TEMPO"
	echo -e "Pressione <Enter> para concluir o processo."
# opção do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
	echo -e "Fim do script $0 em: `date +%d/%m/%Y-"("%H:%M")"`\n" &>> $LOG
	read
	exit
