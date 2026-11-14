param([int]$Stage)
function Add-Mod($m) {
  packwiz mr add $m
  if ($LASTEXITCODE -ne 0) {
    packwiz cf add $m
    if ($LASTEXITCODE -ne 0) { Add-Content FAILED.txt $m }
  }
}
$stages = @{
  1 = @('lithium','ferrite-core','modernfix','spark','chunky')
  2 = @('sodium','sodium-extra','reeses-sodium-options','entityculling','iris','distanthorizons','entity-model-features','entitytexturefeatures','sound-physics-remastered','ambientsounds')
  3 = @('minecolonies','stylecolonies','towntalk','minecolonies compatibility addon','mapcolonies')
  4 = @('cobblemon','cobbreeding','cobbledollars','radical cobblemon trainers','cobblemon farmers delight tweaks','cobblemon biome expanded spawns')
  5 = @('create','create-enchantment-industry','create slice and dice','ars-nouveau','ars-creo','farmers-delight')
  6 = @('sophisticated-backpacks','sophisticated-storage','storage-drawers','toms simple storage','sophisticated backpacks create integration','sophisticated backpacks ars compat','sophisticated storage ars compat')
  7 = @('terralith','tectonic','lithostitched','towns-and-towers','yungs-better-dungeons','yungs-better-mineshafts','yungs-better-strongholds','yungs better temples','explorify','waystones','xaeros-minimap','xaeros-world-map','natures-compass','comforts')
  8 = @('automodpack','simple-voice-chat','not-enough-revives','graves-og','lootr','exposure','etched','emotecraft','watut')
  9 = @('macaws-bridges','macaws-doors','macaws-fences-and-walls','macaws-windows','macaws-furniture','macaws-lights-and-lamps','macaws-trapdoors','macaws-stairs','supplementaries','every-compat','jei','jade','jade-addons','polymorph','appleskin','controlling')
}
foreach ($m in $stages[$Stage]) { Add-Mod $m }
if ($Stage -eq 4) { packwiz cf add https://www.curseforge.com/minecraft/mc-mods/dragonss }
if ($Stage -eq 9) {
  packwiz mr add complementary-reimagined --meta-folder shaderpacks
  packwiz mr add fresh-animations --meta-folder resourcepacks
}
