[Release] Pure_Deathtimeout | Combat-Lock after Revive (ESX & Ox_Inventory) Hallo zusammen,

ich möchte heute mein Skript Pure_Deathtimeout mit der Community teilen. Es wurde entwickelt, um das RP zu fördern und "Revenge-Killing" oder unrealistisches Verhalten direkt nach einer Wiederbelebung zu verhindern.

🌟 Was macht das Skript? Nach einem Revive wird der Spieler für eine festgelegte Zeit (Standard 120 Sek.) in einen "Kampfunfähig"-Status versetzt.

Ox_Inventory Integration: Das Skript arbeitet Hand in Hand mit ox_inventory. Es nutzt den offiziellen :disarm Trigger und blockiert Hotkeys, lässt aber das Inventar für Items (Essen/Medizin) offen!

Dauerhafte Kontrolle: Versucht der Spieler eine Waffe über das Inventar zu ziehen, wird diese sofort automatisch wieder geholstert.

Intelligente Erkennung: Neben dem Standard-Event verfügt das Skript über einen Sicherheits-Check, der Wiederbelebungen auch erkennt, falls Events durch Dritthersteller-Scripts (Medicsysteme) blockiert werden.

Routing Bucket Support: Die Sperre kann so konfiguriert werden, dass sie in anderen Dimensionen (z. B. FFA, Paintball, Admin-Zonen) automatisch deaktiviert ist.

Admin-Support: Admins können die Sperre jederzeit manuell mit einem Befehl aufheben.

🛠️ Features Live-Countdown: Schlanker, roter Timer direkt im HUD.

Sperren: Schießen, Zielen, Schlagen und Waffen-Hotkeys sind deaktiviert.

Performance: Optimiert auf 0.00ms im Idle und ca. 0.01ms während der Sperre.

Benachrichtigung: Informiert den Spieler, sobald er wieder kampfbereit ist.

📋 Konfiguration (Config.lua) 
Config = {} Config.ReviveEvent = 'esx_ambulancejob:revive' 
Config.CombatBlockTime = 120
Config.OnlyBucketZero = true
Config.Debug = false


📥 Installation Den Ordner in PuRe_deathtimeout benennen.

Sicherstellen, dass die Config.lua vorhanden ist.

In der server.cfg nach ox_inventory eintragen: ensure PuRe_deathtimeout.

🔗 Support & Community Bei Fragen, Fehlern oder Verbesserungsvorschlägen könnt ihr gerne auf meinen Discord kommen: 👉 Discord: https://discord.gg/E4FQTcbXWm

Viel Spaß mit dem Skript! Ich freue mich über euer Feedback.

PREVIEW : https://www.youtube.com/watch?v=9DfcpP4zzyc
