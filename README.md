# PuRe_deathtimeout

A lightweight ESX Legacy resource that prevents players from fighting for a configurable time after being revived.

## Features

- Combat lock after revive
- Automatic revive detection fallback
- ox_inventory disarm integration
- Blocks shooting, aiming, melee attacks and weapon hotkeys
- Configurable combat lock duration
- Routing bucket check for FFA, paintball or admin dimensions
- Configurable admin reset command
- Configurable ESX admin groups
- Locale support
- Lightweight idle performance

## Requirements

- ESX Legacy
- ox_inventory

Configuration
Config.Locale = 'de'
Config.ReviveEvent = 'esx_ambulancejob:revive'
Config.CombatBlockTime = 120
Config.OnlyBucketZero = true
Config.ResetCommand = 'timeout_reset'

Config.AllowedGroups = {
    ['owner'] = true,
    ['admin'] = true,
    ['support'] = true
}
Admin Command
/timeout_reset [playerId]

Removes the active combat timeout from a player.

Locales

Default locale:

Config.Locale = 'de'

Available locales:

de
en

## Installation

1. Download or clone the resource.
2. Rename the folder to `PuRe_deathtimeout`.
3. Add it to your `server.cfg` after `ox_inventory`:

```cfg
ensure PuRe_deathtimeout
