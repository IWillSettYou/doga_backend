-- CreateTable
CREATE TABLE `aruk` (
    `id` INTEGER NOT NULL,
    `nev` TEXT NOT NULL,
    `kategoriaId` INTEGER NULL,
    `leiras` TEXT NULL,
    `keszlet` INTEGER NULL,
    `ar` INTEGER NULL,
    `keUrl` TEXT NULL,

    INDEX `kategoriaId`(`kategoriaId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kategoriak` (
    `id` INTEGER NOT NULL,
    `nev` TEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `aruk` ADD CONSTRAINT `aruk_ibfk_1` FOREIGN KEY (`kategoriaId`) REFERENCES `kategoriak`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
