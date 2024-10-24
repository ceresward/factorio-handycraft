# factorio-handycraft
Source repository for the Factorio mod [HandyCraft](https://mods.factorio.com/mod/HandyCraft)

## Description

Handycraft is a mod for the video game [Factorio](https://factorio.com/).  It adds key sequences for quickly adding to the handcrafting queue one, five, or all crafts of a held item or selected entity.

## Features

- Press ALT + Q to queue a single item craft, SHIFT + ALT + Q to queue five item crafts, or CONTROL + SHIFT + ALT + Q to queue all item crafts (key sequences can be customized)
- When holding an item or item ghost in hand, then that item will be crafted.  Otherwise, if a hand-craftable entity or entity ghost is selected, then the item used to place that entity will be crafted.  

## How It Works

The mod creates three new configurable key sequences for queueing one, five, or all handcrafts of a selected item or entity (default sequences: ALT+Q, SHIFT+ALT+Q, CONTROL+SHIFT+ALT+Q).  The item to be crafted depends on what's in the player's hand (aka cursor):

- When the player's hand has a craftable item or item ghost in it, that is the item which will be crafted
- When the player's hand is empty, if the player has selected an entity (aka hovered the mouse over it), if the entity is buildable by a craftable item, then that item will be crafted instead
- In all other circumstances, the key sequence will be ignored

## Roadmap

### 1.0

- Initial release!
- Quick-craft key sequences
- Cursed thumbnail image...

### 1.1

- Selection tool for adding items to the handcrafting queue as needed to build all ghosts in the selected area?
- Config setting to customize the "craft multiple" size?
- Patch the base game issue where the ghost cursor doesn't refresh after handcrafting completes?

## Release Notes

See https://mods.factorio.com/mod/HandyCraft/changelog