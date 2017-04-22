#!/bin/sh
sudo apt-get install aria -y
sudo pacman -S aria2 -y
clear #Limpa a tela do bash para execução mais limpa
echo 'Bem vindo ao script_action_V1'
echo 'Você deseja limpar a lista de download? y=sim, n=não'
read LIMP #lê a opção para limpar ou não a lista de links
if [ $LIMP = 'y' ]; then #se a LIMP for igua a y ele limpa a lista de links
    echo > uris.txt #limpa a lista de links sem excluir o arquivo
fi
echo 'Que horas deseja que eu inicie o download?'
read HORA # lê a hora em que deseja-se fazer o download
echo 'Quantos links você quer adicionar?'
read TIMES #lê a quantidade de links a serem adicionados ao uris.txt
for (( i = 0; i < $TIMES; i++ )); do #loop que é executado quantas vezes for setada na variável TIMES
    echo 'Digite o(s) links'
    read LINKS #Lê um link de cada vêz
    echo $LINKS>> uris.txt #armazena um link de cada vêz na lista de download
done

for (( a = 1; a > 0; a++ )); do # Loop para rodar o script todo o tempo
  	TEMPO=$(date +%H) #Armazena a hora dentro da variável TEMPO
  	sleep 4 #Executar o script a cada 5 segundos
  	echo "Rodada $a" # Mostra o número de vezes que o script já rodou
  	echo $TEMPO # Monitor para verificar se a hora está sendo colhida corretamente
	  echo "Ainda Não São $HORA Horas!!!"
    if [ $TEMPO = $HORA ];then # Condição executada quando a hora for a configurada para o download
        aria2c -i uris.txt # Faz o download dos links da lista
        exit
	  fi
done
