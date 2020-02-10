
Wifite
======

This repo is a complete re-write of [`wifite`](https://github.com/derv82/wifite), a Python script for auditing wireless networks.

Wifite runs existing wireless-auditing tools for you. Stop memorizing command arguments & switches!

Wifite is designed to use all known methods for retrieving the password of a wireless access point (router).  These methods include:
1. WPS: The [Offline Pixie-Dust attack](https://en.wikipedia.org/wiki/Wi-Fi_Protected_Setup#Offline_brute-force_attack)
1. WPS: The [Online Brute-Force PIN attack](https://en.wikipedia.org/wiki/Wi-Fi_Protected_Setup#Online_brute-force_attack)
2. WPA: The [WPA Handshake Capture](https://hashcat.net/forum/thread-7717.html) + offline crack.
3. WPA: The [PMKID Hash Capture](https://hashcat.net/forum/thread-7717.html) + offline crack.
4. WEP: Various known attacks against WEP, including *fragmentation*, *chop-chop*, *aireplay*, etc.

Run wifite, select your targets, and Wifite will automatically start trying to capture or crack the password.

======

   .               .
 .´  ·  .     .  ·  `.  wifite
 :  :  :  (¯)  :  :  :  automated wireless auditor
 `.  ·  ` /¯\ ´  ·  .´  https://github.com/derv82/wifite2
   `     /¯¯¯\     ´

optional arguments:
  -h, --help             show this help message and exit

SETTINGS:
  -v, --verbose          Shows more options (-h -v). Prints commands and outputs. (default: quiet)
  -i [interface]         Wireless interface to use, e.g. wlan0mon (default: ask)
  -c [channel]           Wireless channel to scan (default: all 2Ghz channels)
  -5, --5ghz             Include 5Ghz channels (default: off)
  -mac, --random-mac     Randomize wireless card MAC address (default: off)
  -p [scan_time]         Pillage: Attack all targets after scan_time (seconds)
  --kill                 Kill processes that conflict with Airmon/Airodump (default: off)
  -b [bssid]             BSSID (e.g. AA:BB:CC:DD:EE:FF) of access point to attack
  -e [essid]             ESSID (e.g. NETGEAR07) of access point to attack
  -E [text]              Hides targets with ESSIDs that match the given text
  --clients-only         Only show targets that have associated clients (default: off)
  --showb                Show BSSIDs of targets while scanning
  --nodeauths            Passive mode: Never deauthenticates clients (default: deauth targets)
  --num-deauths [num]    Number of deauth packets to send (default: 1)

WEP:
  --wep                  Show only WEP-encrypted networks
  --require-fakeauth     Fails attacks if fake-auth fails (default: off)
  --keep-ivs             Retain .IVS files and reuse when cracking (default: off)
  --pps [pps]            Packets-per-second to replay (default: 600 pps)
  --wept [seconds]       Seconds to wait before failing (default: 600 sec)
  --wepca [ivs]          Start cracking at this many IVs (default: 10000 ivs)
  --weprs [seconds]      Restart aireplay if no new IVs appear (default: 11 sec)
  --weprc [seconds]      Restart aircrack after this delay (default: 30 sec)
  --arpreplay            Use ARP-replay WEP attack (default: on)
  --fragment             Use fragmentation WEP attack (default: on)
  --chopchop             Use chop-chop WEP attack (default: on)
  --caffelatte           Use caffe-latte WEP attack (default: on)
  --p0841                Use p0841 WEP attack (default: on)
  --hirte                Use hirte WEP attack (default: on)

WPA:
  --wpa                  Show only WPA-encrypted networks (includes WPS)
  --hs-dir [dir]         Directory to store handshake files (default: hs)
  --new-hs               Captures new handshakes, ignores existing handshakes in hs (default: off)
  --dict [file]          File containing passwords for cracking (default: /usr/share/dict/wordlist-top4800-probable.txt)
  --wpadt [seconds]      Time to wait between sending Deauths (default: 15 sec)
  --wpat [seconds]       Time to wait before failing WPA attack (default: 500 sec)

WPS:
  --wps                  Show only WPS-enabled networks
  --no-wps               Never use WPS PIN & Pixie-Dustattacks on targets (default: off)
  --wps-only             Only use WPS PIN & Pixie-Dust attacks (default: off)
  --pixie                Only use WPS Pixie-Dust attack (do not use PIN attack)
  --no-pixie             Never use WPS Pixie-Dust attack (use PIN attack)
  --bully                Use bully program for WPS PIN & Pixie-Dust attacks (default: reaver)
  --ignore-locks         Do not stop WPS PIN attack if AP becomes locked (default: stop)
  --wps-time [sec]       Total time to wait before failing PixieDust attack (default: 300 sec)
  --wps-fails [num]      Maximum number of WPSFail/NoAssoc errors before failing (default: 100)
  --wps-timeouts [num]   Maximum number of Timeouts before failing (default: 100)

PMKID:
  --pmkid                Only use PMKID capture, avoids other WPS & WPA attacks (default: off)
  --pmkid-timeout [sec]  Time to wait for PMKID capture (default: 30 seconds)

COMMANDS:
  --cracked              Print previously-cracked access points
  --check [file]         Check a .cap file (or all hs/*.cap files) for WPA handshakes
  --crack                Show commands to crack a captured handshake
======

Supported Operating Systems
---------------------------
Wifite is designed specifically for the latest version of [**Kali** Linux](https://www.kali.org/). [ParrotSec](https://www.parrotsec.org/) is also supported.

Other pen-testing distributions (such as BackBox or Ubuntu) have outdated versions of the tools used by Wifite. Do not expect support unless you are using the latest versions of the *Required Tools*, and also [patched wireless drivers that support injection]().

Required Tools
--------------
First and foremost, you will need a wireless card capable of "Monitor Mode" and packet injection (see [this tutorial for checking if your wireless card is compatible](http://www.aircrack-ng.org/doku.php?id=compatible_cards) and also [this guide](https://en.wikipedia.org/wiki/Wi-Fi_Protected_Setup#Offline_brute-force_attack)). There are many cheap wireless cards that plug into USB available from online stores.

Second, only the latest versions of these programs are supported and must be installed for Wifite to work properly:

**Required:**

* `python`: Wifite is compatible with both `python2` and `python3`.
* [`iwconfig`](https://wiki.debian.org/iwconfig): For identifying wireless devices already in Monitor Mode.
* [`ifconfig`](https://en.wikipedia.org/wiki/Ifconfig): For starting/stopping wireless devices.
* [`Aircrack-ng`](http://aircrack-ng.org/) suite, includes:
   * [`airmon-ng`](https://tools.kali.org/wireless-attacks/airmon-ng): For enumerating and enabling Monitor Mode on wireless devices.
   * [`aircrack-ng`](https://tools.kali.org/wireless-attacks/aircrack-ng): For cracking WEP .cap files and WPA handshake captures.
   * [`aireplay-ng`](https://tools.kali.org/wireless-attacks/aireplay-ng): For deauthing access points, replaying capture files, various WEP attacks.
   * [`airodump-ng`](https://tools.kali.org/wireless-attacks/airodump-ng): For target scanning & capture file generation.
   * [`packetforge-ng`](https://tools.kali.org/wireless-attacks/packetforge-ng): For forging capture files.

**Optional, but Recommended:**

* [`tshark`](https://www.wireshark.org/docs/man-pages/tshark.html): For detecting WPS networks and inspecting handshake capture files.
* [`reaver`](https://github.com/t6x/reaver-wps-fork-t6x): For WPS Pixie-Dust & brute-force attacks.
   * Note: Reaver's `wash` tool can be used to detect WPS networks if `tshark` is not found.
* [`bully`](https://github.com/aanarchyy/bully): For WPS Pixie-Dust & brute-force attacks.
   * Alternative to Reaver. Specify `--bully` to use Bully instead of Reaver.
   * Bully is also used to fetch PSK if `reaver` cannot after cracking WPS PIN.
* [`coWPAtty`](https://tools.kali.org/wireless-attacks/cowpatty): For detecting handshake captures.
* [`pyrit`](https://github.com/JPaulMora/Pyrit): For detecting handshake captures.
* [`hashcat`](https://hashcat.net/): For cracking PMKID hashes.
   * [`hcxdumptool`](https://github.com/ZerBea/hcxdumptool): For capturing PMKID hashes.
   * [`hcxpcaptool`](https://github.com/ZerBea/hcxtools): For converting PMKID packet captures into `hashcat`'s format.


Run Wifite
----------
```
git clone https://github.com/derv82/wifite2.git
cd wifite2
sudo ./Wifite.py
```

Install Wifite
--------------
To install onto your computer (so you can just run `wifite` from any terminal), run:

```bash
sudo python setup.py install
```

This will install `wifite` to `/usr/sbin/wifite` which should be in your terminal path.

**Note:** Uninstalling is [not as easy](https://stackoverflow.com/questions/1550226/python-setup-py-uninstall#1550235). The only way to uninstall is to record the files installed by the above command and *remove* those files:

```bash
sudo python setup.py install --record files.txt \
  && cat files.txt | xargs sudo rm \
  && rm -f files.txt
```

Brief Feature List
------------------
* [PMKID hash capture](https://hashcat.net/forum/thread-7717.html) (enabled by-default, force with: `--pmkid`)
* WPS Offline Brute-Force Attack aka "Pixie-Dust". (enabled by-default, force with: `--wps-only --pixie`)
* WPS Online Brute-Force Attack aka "PIN attack". (enabled by-default, force with: `--wps-only --no-pixie`)
* WPA/2 Offline Brute-Force Attack via 4-Way Handshake capture (enabled by-default, force with: `--no-wps`)
* Validates handshakes against `pyrit`, `tshark`, `cowpatty`, and `aircrack-ng` (when available)
* Various WEP attacks (replay, chopchop, fragment, hirte, p0841, caffe-latte)
* Automatically decloaks hidden access points while scanning or attacking.
   * Note: Only works when channel is fixed. Use `-c <channel>`
   * Disable this using `--no-deauths`
* 5Ghz support for some wireless cards (via `-5` switch).
   * Note: Some tools don't play well on 5GHz channels (e.g. `aireplay-ng`)
* Stores cracked passwords and handshakes to the current directory (`--cracked`)
   * Includes information about the cracked access point (Name, BSSID, Date, etc).
* Easy to try to crack handshakes or PMKID hashes against a wordlist (`--crack`)

What's new?
-----------
Comparing this repo to the "old wifite" @ https://github.com/derv82/wifite

* **Less bugs**
   * Cleaner process management. Does not leave processes running in the background (the old `wifite` was bad about this).
   * No longer "one monolithic script". Has working unit tests. Pull requests are less-painful!
* **Speed**
   * Target access points are refreshed every second instead of every 5 seconds.
* **Accuracy**
   * Displays realtime Power level of currently-attacked target.
   * Displays more information during an attack (e.g. % during WEP chopchop attacks, Pixie-Dust step index, etc)
* **Educational**
   * The `--verbose` option (expandable to `-vv` or `-vvv`) shows which commands are executed & the output of those commands.
   * This can help debug why Wifite is not working for you. Or so you can learn how these tools are used.
* More-actively developed.
* Python 3 support.
* Sweet new ASCII banner.

What's gone?
------------
* Some command-line arguments (`--wept`, `--wpst`, and other confusing switches).
   * You can still access some of these obscure options, try `wifite -h -v`

What's not new?
---------------
* (Mostly) Backwards compatible with the original `wifite`'s arguments.
* Same text-based interface everyone knows and loves.

Screenshots
-----------
Cracking WPS PIN using `reaver`'s Pixie-Dust attack, then fetching WPA key using `bully`:
![Pixie-Dust with Reaver to get PIN and Bully to get PSK](https://i.imgur.com/Q5KSDbg.gif)

-------------

Cracking WPA key using PMKID attack:
![PMKID attack](https://i.imgur.com/CR8oOp0.gif)

-------------

Decloaking & cracking a hidden access point (via the WPA Handshake attack):
![Decloaking and Cracking a hidden access point](https://i.imgur.com/F6VPhbm.gif)

-------------

Cracking a weak WEP password (using the WEP Replay attack):
![Cracking a weak WEP password](https://i.imgur.com/jP72rVo.gif)

-------------

Cracking a pre-captured handshake using John The Ripper (via the `--crack` option):
![--crack option](https://i.imgur.com/iHcfCjp.gif)
