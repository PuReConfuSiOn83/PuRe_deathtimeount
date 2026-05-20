Locales = {}

Locales['de'] = {
    combat_disabled_timer = 'KAMPFUNFÄHIG: %ss',
    combat_ready_again = 'Du fühlst dich wieder stark genug.',

    reset_success = 'Kampfsperre für ID %s aufgehoben.',
    reset_usage = 'Benutzung: /%s [ID]',
    reset_no_permission = 'Du hast keine Berechtigung für diesen Befehl.',
    player_not_found = 'Spieler nicht gefunden.'
}

Locales['en'] = {
    combat_disabled_timer = 'COMBAT DISABLED: %ss',
    combat_ready_again = 'You feel strong enough again.',

    reset_success = 'Combat timeout for ID %s has been removed.',
    reset_usage = 'Usage: /%s [ID]',
    reset_no_permission = 'You do not have permission to use this command.',
    player_not_found = 'Player not found.'
}

function _L(key, ...)
    local locale = Config and Config.Locale or 'de'
    local lang = Locales[locale] or Locales['de']

    local text = lang[key] or Locales['de'][key] or key

    if ... then
        return string.format(text, ...)
    end

    return text
end