    ## Generate Wordlist ##
## Para gerar um wordlist com no mínimo 5 caracteres e no máximo 6 e utilizando os caracteres "senha"
    # crunch min max caracteres
    crunch 5 6 senha

    # -o salvar em um arquivo de saída
    crunch 5 6 senha -o wordlist.txt

## wordlist com 8 caracteres e de todos caracteres
    crunch 8 8 senha -o wordlist.txt

## wordlist com todas combinações de número com 8 caracteres
    crunch 8 8 1234567890 -o wordlist.txt

## wordlist completo. De 8 até 63 caracteres
    crunch 8 63 -o wordlist.txt

## Good links
http://www.wirelessdomination.com/how-to-crack-wpa2-wifi-password-using-reaver-wpa2/
https://pentestlab.wordpress.com/2012/07/12/creating-wordlists-with-crunch/
