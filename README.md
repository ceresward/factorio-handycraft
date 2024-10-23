# factorio-handycraft
Source repository for the Factorio mod [HandyCraft](https://mods.factorio.com/mod/HandyCraft)

## Description

Handycraft is a mod for the video game [Factorio](https://factorio.com/).  It adds key sequences for quickly adding to the handcrafting queue 1 or 5 crafts of a held item or selected entity.

## Features

- Press ALT + Q to queue up 5 item crafts, or ALT + SHIFT + Q to queue up a single item craft (key sequences can be modified)
- When holding an item or item ghost in hand, that item will be crafted.  Otherwise, if a buildable entity or entity ghost is selected, then the item for that entity will be crafted.   

## How It Works

The mod creates two new configurable key sequences (default ALT+Q, SHIFT+ALT+Q) for adding 5 or 1 crafts (respectively) of an item to the hand-crafting queue.  The item to be crafted depends on what's in the player's hand (aka cursor):

- When the player's hand has a craftable item or item ghost in it, that is the item which will be crafted
- When the player's hand is empty, if the player has selected an entity (aka hovered the mouse over it), if the entity is buildable by a craftable item, then that item will be crafted instead
- In all other circumstances, the key sequence will be ignored

## Roadmap

### 1.0

- Initial release!
- Quick-craft key sequences

### 1.1

- Selection tool for adding items to the handcrafting queue as needed to build all ghosts in the selected area?

## Release Notes

See https://mods.factorio.com/mod/HandyCraft/changelog