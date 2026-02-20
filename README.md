# 🔩 Weldify

**Weldify** is a powerful drop-in welding solution for Roblox models.  
Just insert the script into any model, and it handles everything automatically.

## ✨ Features

- 🔧 Cleans up old welds (`Weld` and `Motor6D`)
- 🧲 Auto-uses `Motor6D` for characters, `Weld` otherwise
- 📌 Temporarily anchors all parts during welding
- 🚀 Unanchors the model after welding is done

## 🛠️ Usage

**Drag and drop** the script into any model you want welded.  
No configuration, no function calls. It just works.

<div style="display: flex; gap: 20px; justify-content: center; align-items: center; width: 100%; max-width: 720px; margin: 0 auto;">
  <!-- Левая кнопка -->
  <a href="https://github.com/lerman-dev/Weldify/releases/tag/Weldify" target="_blank" style="flex: 1; text-decoration: none;">
    <img src="download.svg" alt="Download .rbxm" width="340" height="75" style="width: 100%; height: auto; max-width: 340px; display: block;" />
  </a>
  
  <!-- Правая кнопка -->
  <a href="https://github.com/lerman-dev/Weldify/releases/tag/Weldify" target="_blank" style="flex: 1; text-decoration: none;">
    <img src="toolbox.svg" alt="Download from Toolbox" width="340" height="75" style="width: 100%; height: auto; max-width: 340px; display: block;" />
  </a>
</div>


## 💥 Smart Behavior

- Detects if the model is a character (via `Humanoid`)
- Uses `PrimaryPart` if available, otherwise falls back to the first part
- Ignores root part for welding to itself
- Automatically unanchors the model after it's ready

## 📜 License

MIT – use, remix, modify, rule the world 🧪

