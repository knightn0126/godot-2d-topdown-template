# Godot 2D Top-Down Template

<img src="https://alchemy-pot.web.app/res/2d-topdown-template-godot4.png" width="100%">

A comprehensive game template designed for Godot 4, providing everything you need to kickstart your 2D top-down game development journey.

[![Godot Engine](https://img.shields.io/badge/Godot-4.4%2B-brightgreen)](https://godotengine.org)
[![GitHub](https://img.shields.io/badge/GitHub-Repo-blue)](https://github.com/stesproject/godot-2d-topdown-template)

## 🎮 Web Demo

[Play the web demo](https://alchemy-pot.web.app/files/godot-2d-topdown-template/play) to get a grasp of the available features.

## ⚙️ Features

- Character Controller (basic movement + run, jump, attack, flash)
- Health Controller with optional health bars
- Interaction System
- State Management using State Machines
- Save/Load System
- Inventory Management
- ...and more!

## ⚠️ Notice

I am gradually releasing more in-depth documentation on my site.
For sections that are already completed I will link to the updated documentation page;
for other sections, in the meantime, I will leave the documentation here.

In general, to learn more about a specific topic, you can directly check the code. All the important properties and functions are fully documented.
You can also try the template launching the web demo from the link above, or download and launch the project from the Godot editor (F5).
When you start working on your project, you can safely delete all the scenes that start with "playground\_" and configure your starting level in the `start_level` property of the `start_screen.tscn` scene.

## [Character Controller](https://alchemy-pot.web.app/godot-2d-topdown-template/character-controller)

Take full control of your characters: make them move, run, attack, jump, and flash while managing their states seamlessly.

## [Interaction System](https://alchemy-pot.web.app/godot-2d-topdown-template/interaction-system)

Enable your characters to interact with the game world. Trigger actions such as opening a chest, activating switches, or unlocking doors using the flexible interaction system.

## Inventory

The inventory manages all the items owned by a player. The project provides a simple node (`Inventory.tscn`) assigned as a child of the player, which shows all the items owned by him. You can delete this inventory and create your own according to your preferences. Press _ESC_ on your keyboard to open/close the inventory.

## [Save/Load System](https://alchemy-pot.web.app/godot-2d-topdown-template/save-load-system)

Easily save and load game progress, including player data, entity positions, and the current state of state machines. Saved data persists across levels and can be stored in a file for later retrieval, allowing players to continue from where they left off.

## [State Management](https://alchemy-pot.web.app/godot-2d-topdown-template/state-machines)

State machines form the backbone of this template, controlling characters, NPCs, enemies, objects, and more. Each state focuses on a single behavior, allowing you to decide when and how states are activated.

## Scenes Transition

Transition between scenes is managed by `SceneManager.gd` from [baconandgames](https://github.com/baconandgames). For more information check out the [official repository](https://github.com/baconandgames/godot4-game-template).

## User Prefs

User preferences (like music settings or language) are also managed by scripts from [baconandgames](https://github.com/baconandgames). For more information check out the [Godot 4 Game Template](https://github.com/baconandgames/godot4-game-template). In the project, you can access them through the `SettingsMenu` (`settings_menu.gd`).

## Dialogue System

Dialogues are managed by the plugin `DialogueManager` (version 3.0) from [nathanhoad](https://github.com/nathanhoad). For more information check out the [official repository](https://github.com/nathanhoad/godot_dialogue_manager).

## Tilemaps

To easily manage TileMap terrains, the plugin `TileBitTools` from [dandeliondino](https://github.com/dandeliondino) has been added to the project. To find out how to set up Terrains, check out the [official repository](https://github.com/dandeliondino/tile_bit_tools).

## Debugger

Debugging is managed by the Autoload `Debugger`. Check out the `debugger.gd` script to find out what offers and add your debugging methods.

## Localization

Localization is managed by the default localization system of Godot. The project offers two already configured languages: _English_ (en) and _Italian_ (it). Check out the `local` folder to find out all the translated strings.
To manage the list of languages you can check the constant `LANGUAGES` in `Const.gd` and remove or add new languages there. Then, you have to create a corresponding `.translation` file in the `local` folder and add (or remove) it in _Project Settings -> Localization_.

## Levels

A level is a game area where playable characters, NPCs, any enemies, and props are present. The base node for levels is `Level.tscn`, which has attached the script `level.gd`. The Level node can be used as a starting node for creating new levels. It already has a structure of nodes within it, making it fully functional. Exploring the present nodes, we find:

- Shaker
- GameCamera2D
- Layers
- Props
- Entities
- Transfers
- Events

#### Shaker

Useful to shake the screen. To shake the screen just call the method `play_shake` on the node using a `StateCallable`.

#### GameCamera2D

The main `GameCamera2D` of the level. It has the script `game_camera.gd` attached, useful to define a camera's target to follow:

- `target_player_id`: you can set a value corresponding to the `player_id` of the player to follow (see PlayerEntity). Setting a value greater than 0 will search within the level for the player with the corresponding `player_id`. Setting the value to 0 will not search for any player, and only the `target` field will be checked.
- `target`: if you want the camera to follow any node (that is not a player), you can assign the node to follow in this field.

#### Layers

This is the parent node that hosts all the `TileMapLayer` nodes of the level. `TileMapLayer` nodes are used to draw a level using tiles.
Regarding the tileset, to facilitate the definition of Terrain Sets, the `TileBitTools` plugin has been added. For information on how TileBitTools works, refer to its [repository](https://github.com/dandeliondino/tile_bit_tools).

#### Props

You can use this node as a parent to keep the props you add to the level. Props can be interactive elements or simple non-interactive decorations in the level.

#### Entities

You can use this node as a parent to keep the entities you add to the level. Entities are the game’s characters.
Here you can add `Marker2D` nodes with a `player_instantiator.gd` script to indicate the spawn position of each player. The `player_instantiator.gd` script will handle instantiating a player at the `Marker2D` position with the defined `player_id`.

#### Transfers

You can use this node as a parent to keep the transfers you add to the level. A Transfer allows the player to move from one level to another. Check the `transfer.gd` script to learn more.

#### Events

You can use this node as a parent to keep the events you add to the level. Events are state machines that trigger a sequence of states, useful for creating cutscenes or automated character movements.

### Transfer

Parent node that contains the script `transfer.gd` that performs the transfer, with the following parameters:

- `level_path`: the path of the level to transfer to. Leave empty if you want to move within the same level
- `destination_name`: the name of the node to use as a reference to set the destination position. This node should have assigned the "destination" group to work properly
- `facing`: changes the facing direction of the player, forcing it to face the direction configured here. Useful if the starting Transfer is East, so the player is facing right when interacting with it, but the destination is North, so the player will need to face down upon arriving.

## 🤝 Contributing

Contributions are welcome. Feel free to submit issues or pull requests on the [GitHub repository](https://github.com/stesproject/godot-2d-topdown-template).

## 📄 License

This template is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ in Italy
