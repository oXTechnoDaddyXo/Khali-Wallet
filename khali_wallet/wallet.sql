CREATE TABLE IF NOT EXISTS khali_wallet (
    id INT NOT NULL AUTO_INCREMENT,
    charidentifier INT NOT NULL,
    money INT NOT NULL DEFAULT 0,
    name VARCHAR(50) DEFAULT 'Wallet',
    PRIMARY KEY (id)
);