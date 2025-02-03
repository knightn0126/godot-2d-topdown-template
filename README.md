# Godot 2D Top-Down Template

<img src="https://alchemy-pot.web.app/res/2d-topdown-template-godot4.png" width="100%">

A comprehensive game template designed for Godot 4, providing everything you need to kickstart your 2D top-down game development journey.

[![Godot Engine](https://img.shields.io/badge/Godot-4.3%2B-brightgreen)](https://godotengine.org)
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

## [Inventory System](https://alchemy-pot.web.app/godot-2d-topdown-template/inventory-system)

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

## [Tilemaps and Levels](https://alchemy-pot.web.app/godot-2d-topdown-template/tilemaps-and-levels)

If you plan to use Tilemaps and the pre-built Level scene to build your levels, here you can discover some useful tips to create new levels and setting up autotiles in no time.

## Debugger

Debugging is managed by the Autoload `Debugger`. Check out the `debugger.gd` script to find out what offers and add your debugging methods.

## Localization

Localization is managed by the default localization system of Godot. The project offers two already configured languages: _English_ (en) and _Italian_ (it). Check out the `local` folder to find out all the translated strings.
To manage the list of languages you can check the constant `LANGUAGES` in `Const.gd` and remove or add new languages there. Then, you have to create a corresponding `.translation` file in the `local` folder and add (or remove) it in _Project Settings -> Localization_.

## 🤝 Contributing

Contributions are welcome. Feel free to submit issues or pull requests on the [GitHub repository](https://github.com/stesproject/godot-2d-topdown-template).

## 🙏 Credits

- **nathanhoad** for [Godot Dialogue Manager](https://github.com/nathanhoad/godot_dialogue_manager)
- **baconandgames** for [Godot4 Game Template](https://github.com/baconandgames/godot4-game-template)
- **dandeliondino** for [Tile Bit Tools](https://github.com/dandeliondino/tile_bit_tools)

## 📄 License

This template is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ in Italy
