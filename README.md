💰 Khali Wallet System (RedM | VORP Core)

A lightweight and immersive Western-style Wallet UI system for RedM using VORP Core.

This script replaces the standard money interaction with a fully custom NUI wallet interface, designed in an old-west leather style with smooth animations and simple usability.
<img width="1672" height="941" alt="prev" src="https://github.com/user-attachments/assets/23a869b0-a597-469c-ad78-bd19d952a77b" />



🪶 Features
💼 Custom Wallet UI (Western Leather Theme)
✍️ Rename Wallet (e.g. “Company Funds”, “Saloon Cash”, etc.)
💸 Deposit & Withdraw money directly from wallet
💾 Persistent storage (MySQL / oxmysql)
🔗 Fully integrated with VORP Core currency system
🎮 Item-based usage (usable wallet item)
⚡ Clean NUI design (no external images used)
🧠 Simple and optimized client/server structure

🎨 UI Design
Old Western leather-inspired interface
Warm gold & brown color palette
Clean typography (Cinzel + Rye fonts)
Minimalistic layout focused on usability
Responsive buttons with hover effects
No unnecessary clutter or notifications

🧾 Database

The script uses a simple table:
🧾 Database
CREATE TABLE IF NOT EXISTS khali_wallet (
    id INT NOT NULL AUTO_INCREMENT,
    charidentifier INT NOT NULL,
    money INT NOT NULL DEFAULT 0,
    name VARCHAR(50) DEFAULT 'Wallet',
    PRIMARY KEY (id)
);

⚙️ Requirements
VORP Core
vorp_inventory
oxmysql
RedM server (latest recommended build)

📦 Installation
Add khali_wallet to your resources folder
Import the SQL file into your database
Add to server.cfg:
ensure khali_wallet
Add usable item in your inventory system:
wallet

🔒 Notes
Fully server-side validated transactions
No exploit-based client money handling
Lightweight and optimized for RP servers
Designed for immersion and realism
