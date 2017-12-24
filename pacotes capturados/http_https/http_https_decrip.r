    ## http x https

## Programa usado para capturar os pacotes
    wireshark

## http
    http://unionmangas.net/

## https
    https://www.facebook.com/

## site with https "grátis"
    https://saikoanimes.net/

## CA "grátis"
    https://letsencrypt.org/

## WPA2 desciptografia
    ## Necessário capturar os 4-way handshake (EAPoL)

    ## Abra o arquivo cap no wireshark (wpa2_decrip.cap)

    ## É preciso a chave PSK ou nome da rede e o senha para decriptografar os dados

    ## PSK da rede capturada:
    d494a04654c0922aaed4ea24facc9903b03820149d79e4fe9ce7e8fb35fea3f0

    ## Adicione ela no wireshark
    ​Edit -> Preferences -> IEEE 802.11

    ​## Marque Enable decryption

    ## Aplique o filtro http no wireshark
