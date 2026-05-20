Config = {}

-- Das Event deines Medicsystems (standardmäßig esx_ambulancejob:revive)
Config.ReviveEvent = 'esx_ambulancejob:revive'

-- Sprache wechseln:
-- 'de' = Deutsch
-- 'en' = Englisch
Config.Locale = 'de'

-- Kampfunfähigkeit in Sekunden
Config.CombatBlockTime = 120

-- Nur in Dimension 0 aktiv (Hauptwelt). Wenn false, gilt es überall.
Config.OnlyBucketZero = true

-- Gruppen, die den Command nutzen dürfen
Config.AllowedGroups = {
    ['owner'] = true,
    ['admin'] = true,
    ['support'] = true
}

-- Debug-Modus für F8-Konsole
Config.Debug = false