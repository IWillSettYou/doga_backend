/*
  Warnings:

  - You are about to drop the column `keUrl` on the `aruk` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `aruk` DROP COLUMN `keUrl`,
    ADD COLUMN `kepUrl` TEXT NULL,
    MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT;
