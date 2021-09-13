import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.forestry.Carpenter;
import crafttweaker.item.IIngredient;
import mods.gregtech.recipe.RecipeMap;

# Remove OredictEntries for forestry items
<ore:ingotCopper>.remove(<forestry:ingot_copper>);
<ore:ingotTin>.remove(<forestry:ingot_tin>);
<ore:ingotBronze>.remove(<forestry:ingot_bronze>);
<ore:gemApatite>.remove(<forestry:apatite>);
<ore:gearBronze>.remove(<forestry:gear_bronze>);
<ore:gearCopper>.remove(<forestry:gear_copper>);
<ore:gearTin>.remove(<forestry:gear_tin>);
<ore:dustAsh>.remove(<forestry:ash>);

# Removals
val forestryToRemove = [
    <forestry:ingot_copper>,
    <forestry:ingot_tin>,
    <forestry:ingot_bronze>,
    <forestry:apatite>,
    <forestry:resource_storage>,
    <forestry:resource_storage:1>,
    <forestry:resource_storage:2>,
    <forestry:resource_storage:3>,
    <forestry:wood_pulp>,
    <forestry:gear_bronze>,
    <forestry:gear_copper>,
    <forestry:gear_tin>,
    <forestry:ash>,
    <forestry:resources>,
    <forestry:resources:1>,
    <forestry:resources:2>,
    <forestry:scoop>,
    <morebees:dustiron>,
    <morebees:dustcopper>,
    <morebees:dusttin>,
    <morebees:dustgold>] as IItemStack[] ;

for r in forestryToRemove{
    scripts.functions.disableItem(r);
    JEI.hide(r);
}

#Apatit can come from bees
recipes.addShapeless(<gregtech:meta_item_1:8226>, [<forestry:apatite>]);
recipes.addShapeless(<gregtech:meta_item_1:2089>, [<forestry:ash>]);

#fix dust/pulp wood nonsense
<ore:pulpWood>.remove(<forestry:wood_pulp>);
<ore:pulpWood>.add(<gregtech:meta_item_1:2196>);
Carpenter.removeRecipe(<forestry:wood_pulp>);
Carpenter.removeRecipe(<forestry:letters>);
Carpenter.addRecipe(<forestry:letters>,[[<ore:pulpWood>,<ore:pulpWood>,<ore:pulpWood>]],30,<liquid:water> * 250);

#MoreBees dust
val MoreBeesDust = [
    <morebees:dustiron>,
    <morebees:dustcopper>,
    <morebees:dusttin>,
    <morebees:dustgold>
] as IItemStack[];

for dust in MoreBeesDust{
    Carpenter.removeRecipe(dust);
}
Carpenter.removeRecipe(<gregtech:meta_item_1:2047>);

#Fixing Creates
val allCrates as IItemStack[IItemStack] = {
    <forestry:crated.forestry.ash.0> : <gregtech:meta_item_1:10095>,
    <forestry:crated.ingotcopper> : <gregtech:meta_item_1:2089>,
    <forestry:crated.ingottin> : <gregtech:meta_item_1:10018>,
    <forestry:crated.forestry.apatite.0> : <gregtech:meta_item_1:8226>,
    <forestry:crated.ingotbronze> : <gregtech:meta_item_1:10071>
};
Carpenter.removeRecipe(<forestry:ingot_copper>);
Carpenter.removeRecipe(<forestry:ingot_tin>);
Carpenter.removeRecipe(<forestry:ingot_bronze>);
Carpenter.removeRecipe(<forestry:apatite>);

for crate,item in allCrates{
    Carpenter.removeRecipe(crate);
    Carpenter.addRecipe(crate,[[item,item,item],[item,item,item],[item,item,item]],10,<liquid:water> * 100,<forestry:crate>);
    Carpenter.addRecipe(item * 9,[null,[null,crate,null],null],10);
}


// These are covered by GT meta tools
recipes.remove(<forestry:bronze_pickaxe>);
recipes.remove(<forestry:bronze_shovel>);

// function forestry_recipes(){
    
//     // Gears
//     recipes.remove(<forestry:gear_bronze>);
//     recipes.addShaped("it3_forestry_gear_bronze", <ore:gearBronze>.firstItem, [
//     [<ore:stickBronze>, <ore:plateBronze>, <ore:stickBronze>], 
//     [<ore:plateBronze>, craftingToolScrewdriverEmptyTag, <ore:plateBronze>], 
//     [<ore:stickBronze>, <ore:plateBronze>, <ore:stickBronze>]]);

//     recipes.remove(<forestry:gear_copper>);
//     recipes.addShaped("it3_forestry_gear_copper", <ore:gearCopper>.firstItem, [
//     [<ore:stickCopper>, <ore:plateCopper>, <ore:stickCopper>], 
//     [<ore:plateCopper>, craftingToolScrewdriverEmptyTag, <ore:plateCopper>], 
//     [<ore:stickCopper>, <ore:plateCopper>, <ore:stickCopper>]]);
    
//     recipes.remove(<forestry:gear_tin>);
//     recipes.addShaped("it3_forestry_gear_tin", <ore:gearTin>.firstItem, [
//     [<ore:stickTin>, <ore:plateTin>, <ore:stickTin>], 
//     [<ore:plateTin>, craftingToolScrewdriverEmptyTag, <ore:plateTin>], 
//     [<ore:stickTin>, <ore:plateTin>, <ore:stickTin>]]);  

//     //MACHINES
//     recipes.remove(engineBiogas);
//     recipes.addShaped("it3_forestry_biogas_engine", engineBiogas, [
//         [plateBronze, plateBronze, plateBronze],
//         [craftingToolHardHammerEmptyTag, blockGlass, craftingToolWrenchEmptyTag],
//         [gearBronze, frameBronze, gearBronze]]);

//     recipes.remove(engineClock);
//     recipes.addShaped("it3_forestry_clockwork", engineClock, [
//         [plateCopper, plateCopper, plateCopper],
//         [craftingToolHardHammerEmptyTag, <ore:stickLongBronze>, craftingToolWrenchEmptyTag],
//         [gearCopper, frameIron, gearCopper]]);

//     recipes.remove(enginePeat);
//     recipes.addShaped("it3_forestry_peat_eng", enginePeat, [
//         [plateCopper, plateCopper, plateCopper],
//         [craftingToolHardHammerEmptyTag, blockGlass, craftingToolWrenchEmptyTag],
//         [gearCopper, frameIron, gearCopper]]);

//     recipes.remove(carpenter);
//     recipes.addShaped("it3_forestry_carpenter", carpenter, [
//         [plateCopper, gtBronzeTank, plateCopper],
//         [gearGtSmallSteel, sturdyCasing, gearGtSmallSteel],
//         [plateCopper, gearGtSmallSteel, plateCopper]]);

//     recipes.remove(fermenter);
//     recipes.addShaped("it3_forestry_fermenter", fermenter, [
//         [plateCopper, tinRotor, plateCopper],
//         [gtBronzeTank, sturdyCasing, gtBronzeTank],
//         [gearGtSmallSteel, electricMotorLV, gearGtSmallSteel]]);

//     recipes.remove(moistener);
//     recipes.addShaped("it3_forestry_moistener", moistener, [
//         [plateCopper, gtBronzeTank, plateCopper],
//         [tinRotor, sturdyCasing, tinRotor],
//         [gearGtSmallSteel, electricMotorLV, gearGtSmallSteel]]);

//     recipes.remove(rainMaker);
//     recipes.addShaped("it3_forestry_rainmaker", rainMaker, [
//         [plateCupronickel, sensorMV, plateCupronickel],
//         [electricPistonMV, hardenedCasing, electricPistonMV],
//         [gearGtSmallAluminium, emitterMV, gearGtSmallAluminium]]);

//     recipes.remove(rainTank);
//     recipes.addShaped("it3_forestry_raintank", rainTank, [
//         [plateIron, ringIron, plateIron],
//         [plateIron, craftingToolHardHammerEmptyTag, plateIron],
//         [plateIron, cauldron, plateIron]]);

//     recipes.remove(thermionicFabricator);
//     mods.forestry.Carpenter.addRecipe(thermionicFabricator, [[steelScrew, gtBronzeTank, steelScrew],[gaCoil, sturdyCasing, gaCoil],[steelScrew, electricMotorLV, steelScrew]], 300, moltenRedstone * 1008, worktable);

//     // STURDY CASINGS.  
//     // We have both a Steel and a pre-Steel version (which requires a bit of pneumaticraft)
//     recipes.remove(sturdyCasing);
//     recipes.addShaped("it3_forestry_sturdy_casing", sturdyCasing, [
//         [plateBronze, steelScrew, plateBronze],
//         [steelScrew, steelCasing, steelScrew],
//         [plateBronze, steelScrew, plateBronze]]);
    
//     recipes.addShaped("it3_forestry_sturdy_casing_2", sturdyCasing, [
//         [plateCompressedWroughtIron, screwCompressedWroughtIron, plateCompressedWroughtIron],
//         [screwCompressedWroughtIron, invarCasing, screwCompressedWroughtIron],
//         [plateCompressedWroughtIron, screwCompressedWroughtIron, plateCompressedWroughtIron]]);  

//     assembler.recipeBuilder()
//         .inputs(steelCasing *1, plateBronze *4)
//         .outputs(sturdyCasing)
//         .duration(400)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(invarCasing *1, plateCompressedWroughtIron *4)
//         .outputs(sturdyCasing)
//         .duration(400)
//         .EUt(2)
//         .buildAndRegister();
    
//     //Electron Tubes
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:1>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:2>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:4>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:5>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:6>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:7>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:9>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:10>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:11>);
//     mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:12>);


//     val forestryTubes = [tubeCopper, tubeTin, tubeBronze, tubeGold, tubeDiamond, tubeEmerald, tubeLapis] as IItemStack[];
//     val rods = [ <ore:stickCopper>, <ore:stickTin>, <ore:stickBronze>, <ore:stickGold>, <ore:stickDiamond>, <ore:stickEmerald>, <ore:stickLapis>] as IIngredient[];
//     val bolts = [ <ore:boltCopper>, <ore:boltTin>, <ore:boltBronze>, <ore:boltGold>, <ore:boltDiamond>, <ore:boltEmerald>, <ore:boltLapis>] as IIngredient[];

//     for j, b in rods {
//     assembler.recipeBuilder()
//         .inputs(b * 2, bolts[j] * 1, <ore:dustSmallRedstone> * 2)
//         .fluidInputs([<liquid:glass> * 72])
//         .outputs(forestryTubes[j] * 1)
//         .duration(300)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(b * 4, bolts[j] * 2, <ore:dustRedstone> * 1)
//         .fluidInputs([<liquid:glass> * 144])
//         .outputs(forestryTubes[j] * 2)
//         .duration(450)
//         .EUt(2)
//         .buildAndRegister();
//     }

//     assembler.recipeBuilder()
//         .inputs(<ore:dustObsidian> * 2, <ore:dustSmallObsidian> * 2, <ore:dustSmallRedstone> * 2)
//         .fluidInputs([<liquid:glass> * 72])
//         .outputs(tubeObsidian * 1)
//         .duration(300)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(<ore:dustObsidian> * 5, <ore:dustRedstone> * 1)
//         .fluidInputs([<liquid:glass> * 144])
//         .outputs(tubeObsidian * 2)
//         .duration(450)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(<ore:dustBlaze> * 2, <ore:dustSmallBlaze> * 2, <ore:dustSmallRedstone> * 2)
//         .fluidInputs([<liquid:glass> * 72])
//         .outputs(tubeBlaze * 1)
//         .duration(300)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(<ore:dustBlaze> * 5, <ore:dustRedstone> * 1)
//         .fluidInputs([<liquid:glass> * 144])
//         .outputs(tubeBlaze * 2)
//         .duration(450)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(<ore:gemApatite> * 2, <ore:dustSmallApatite> * 2, <ore:dustSmallRedstone> * 2)
//         .fluidInputs([<liquid:glass> * 72])
//         .outputs(tubeApatine * 1)
//         .duration(300)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(<ore:gemApatite> * 5, <ore:dustRedstone> * 1)
//         .fluidInputs([<liquid:glass> * 144])
//         .outputs(tubeApatine * 2)
//         .duration(450)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(<ore:dustEndstone> * 2, <ore:dustSmallEndstone> * 2, <ore:dustEnderEye> * 1)
//         .fluidInputs([<liquid:glass> * 72])
//         .outputs(tubeEnder * 1)
//         .duration(300)
//         .EUt(2)
//         .buildAndRegister();

//     assembler.recipeBuilder()
//         .inputs(<ore:dustEndstone> * 5, <ore:dustEnderEye> * 2)
//         .fluidInputs([<liquid:glass> * 144])
//         .outputs(tubeEnder * 2)
//         .duration(450)
//         .EUt(2)
//         .buildAndRegister();

//     // GT Style block crafting

//     recipes.remove(blockApatite);

//     compressor.recipeBuilder()
//         .inputs(<ore:gemApatite> * 9)
//         .outputs(blockApatite)
//         .duration(400).EUt(2)
//         .buildAndRegister();

//     recipes.remove(blockCopper);
//     recipes.remove(blockTin);
//     recipes.remove(blockBronze);
//     recipes.remove(<forestry:charcoal>);

//     // Disable forestry scoop in lieue of GT version
//     scripts.functions.disableItem(<forestry:scoop>);

//     // Smoker requires flint and steel
//     recipes.remove(smoker);
//     recipes.addShaped("forestry_smoker", smoker, [[<ore:leather>, <ore:stickWood>, <ore:stickTin>], [<ore:leather>, <forestry:ash>, <ore:plateTin>], [<ore:plateTin>, <ore:plateTin>, <ore:plateTin>]]);

//     //Worktable
//     recipes.remove(worktable);
//     recipes.addShaped("forestry_worktable", worktable, [
//     [<ore:screwIron>, <minecraft:book>, <ore:screwIron>],
//     [craftingToolSawEmptyTag, <minecraft:crafting_table>, craftingToolScrewdriverEmptyTag],
//     [<ore:screwIron>, <ore:chestWood>, <ore:screwIron>]]);

//     //Remove bronze recipe
//     recipes.removeByRecipeName("forestry:bronze_ingot");

//     // WOOD PILES
//     var woodPile = <forestry:wood_pile>;

//     recipes.remove(woodPile);
//     recipes.addShapeless("it3_forestry_woodpile", woodPile, [<ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>]);

//     //Charcoal pile

//     mods.forestry.CharcoalWall.removeWall(<minecraft:dirt>);
//     mods.forestry.CharcoalWall.removeWall(<minecraft:clay>);
//     mods.forestry.CharcoalWall.removeWall(<forestry:loam>);
//     mods.forestry.CharcoalWall.removeWall(<minecraft:end_stone>);
//     mods.forestry.CharcoalWall.removeWall(<minecraft:end_bricks>);
//     mods.forestry.CharcoalWall.removeWall(<minecraft:gravel>);
//     mods.forestry.CharcoalWall.removeWall(<minecraft:netherrack>);
//     mods.forestry.CharcoalWall.removeWall(<forestry:ash_brick>);

//     mods.forestry.CharcoalWall.addWall(<minecraft:dirt>, 5);
//     mods.forestry.CharcoalWall.addWall(<minecraft:gravel>, 6);
//     mods.forestry.CharcoalWall.addWall(<minecraft:nether_brick>, 6);
//     mods.forestry.CharcoalWall.addWall(<forestry:ash_brick>, 7);
//     mods.forestry.CharcoalWall.addWall(<forestry:loam>, 7);
//     mods.forestry.CharcoalWall.addWall(<minecraft:end_bricks>, 9);
//     mods.forestry.CharcoalWall.addWall(bricksBronze, 10);



//     // //Fluid extract honey drops
//     // fluid_extractor.recipeBuilder().inputs([<ore:dropHoney> * 1]).fluidOutputs([<liquid:for.honey> * 150 ]).duration(240).EUt(12).buildAndRegister();

//     //Replace multi farm block recipes

//     val farmStoneVariants = [
//     <minecraft:stonebrick>, 
//     <minecraft:stonebrick:1>, 
//     <minecraft:stonebrick:2>, 
//     <minecraft:brick_block>, 
//     <minecraft:sandstone:2>, 
//     <minecraft:sandstone:1>, 
//     <minecraft:nether_brick>, 
//     <minecraft:stonebrick:3>, 
//     <minecraft:quartz_block>, 
//     <minecraft:quartz_block:1>, 
//     <minecraft:quartz_block:2>] as IItemStack[];

//     for i in 0 to 10 {
//     recipes.remove(farmBlock.withTag({FarmBlock: i}));
//     recipes.remove(<forestry:ffarm:2>.withTag({FarmBlock: i}));
//     recipes.remove(<forestry:ffarm:3>.withTag({FarmBlock: i}));
//     recipes.remove(<forestry:ffarm:4>.withTag({FarmBlock: i}));
//     recipes.remove(<forestry:ffarm:5>.withTag({FarmBlock: i}));
    
//     mods.forestry.Carpenter.addRecipe(farmBlock.withTag({FarmBlock: i}), [[steelScrew, foilCopper, steelScrew],[foilCopper, tubeTin, foilCopper],[steelScrew, foilCopper, steelScrew]], 80, moltenRedstone * 144, farmStoneVariants[i]);
//     mods.forestry.Carpenter.addRecipe(gearFarm.withTag({FarmBlock: i}), [[null, gearGtSmallSteel, null],[gearGtSmallSteel, electricMotorLV, gearGtSmallSteel],[null, gearGtSmallSteel, null]], 200, moltenRedstone * 144, farmStoneVariants[i]);
//     mods.forestry.Carpenter.addRecipe(hatchFarm.withTag({FarmBlock: i}), [[null, gearGtSmallSteel, null],[conveyorLV, electricMotorLV, conveyorLV],[null, <minecraft:hopper>, null]], 200, moltenRedstone * 144, farmStoneVariants[i]);
//     mods.forestry.Carpenter.addRecipe(valveFarm.withTag({FarmBlock: i}), [[null, gearGtSmallSteel, null],[pumpLV, electricMotorLV, pumpLV],[null, <ore:ringRubber>, null]], 200, moltenRedstone * 144, farmStoneVariants[i]);
//     mods.forestry.Carpenter.addRecipe(controlFarm.withTag({FarmBlock: i}), [[null, gearGtSmallSteel, null],[<ore:circuitBasic>, electricMotorLV, <ore:circuitBasic>],[null, <ore:cableGtSingleTin>, null]], 420, moltenRedstone * 144, farmStoneVariants[i]);
//     }

//     //Impregnated casing
//     mods.forestry.Carpenter.removeRecipe(<forestry:impregnated_casing>);
//     assembler.recipeBuilder()
//         .inputs(<ore:logWood> * 8)
//         .fluidInputs([<liquid:seed.oil> * 250])
//         .outputs(<forestry:impregnated_casing> * 1)
//         .duration(160)
//         .EUt(16)
//         .buildAndRegister();

//     //Pulsating mesh
//     recipes.remove(meshPulsating);

//     assembler.recipeBuilder()
//         .inputs(propolisPulsating * 5)
//         .property("circuit", 5)
//         .outputs(meshPulsating * 1)
//         .duration(160)
//         .EUt(16)
//         .buildAndRegister();

//     //Silk wisp
//     mods.forestry.Centrifuge.removeRecipe(wisp);
//     centrifuge.recipeBuilder()
//         .inputs(propolisSilk * 1)
//         .chancedOutput(wisp, 3000, 300)
//         .chancedOutput(propolisCom, 600, 100)
//         .duration(200)
//         .EUt(32)
//         .buildAndRegister();

//     //Woven silk
//     mods.forestry.Carpenter.removeRecipe(meshSilk);
//     assembler.recipeBuilder()
//         .inputs(wisp * 8)
//         .property("circuit", 8)
//         .outputs(meshSilk * 1)
//         .duration(400)
//         .EUt(16)
//         .buildAndRegister();

//     //Hardened casing
//     mods.forestry.Carpenter.removeRecipe(hardenedCasing);
//     assembler.recipeBuilder()
//         .inputs(sturdyCasing * 1, <minecraft:diamond> * 4)
//         .fluidInputs([<liquid:water> * 5000])
//         .outputs(hardenedCasing * 1)
//         .duration(450)
//         .EUt(32)
//         .buildAndRegister();

//     //Forestry circuits
//     mods.forestry.Carpenter.removeRecipe(forestryCircuitT1);
//     mods.forestry.Carpenter.removeRecipe(forestryCircuitT2);
//     mods.forestry.Carpenter.removeRecipe(forestryCircuitT3);
//     mods.forestry.Carpenter.removeRecipe(forestryCircuitT4);

//     mods.forestry.Carpenter.addRecipe(forestryCircuitT1, [[ironScrew, ironFoil, ironScrew],[<ore:circuitBasic>, wireIron, <ore:circuitBasic>],[ironScrew, ironFoil, ironScrew]], 300, moltenRedstone * 1152, <metaitem:board.phenolic>);
//     mods.forestry.Carpenter.addRecipe(forestryCircuitT2, [[bronzeScrew, bronzeFoil, bronzeScrew],[<ore:circuitBasic>, wireBronze, <ore:circuitBasic>],[bronzeScrew, bronzeFoil, bronzeScrew]], 300, moltenRedstone * 1152, <metaitem:board.phenolic>);
//     mods.forestry.Carpenter.addRecipe(forestryCircuitT3, [[steelScrew, steelFoil, steelScrew],[<ore:circuitGood>, wireSteel, <ore:circuitGood>],[steelScrew, steelFoil, steelScrew]], 300, moltenRedstone * 1152, <metaitem:board.plastic>);
//     mods.forestry.Carpenter.addRecipe(forestryCircuitT4, [[electrumScrew, electrumFoil, electrumScrew],[<ore:circuitGood>, wireElectrum, <ore:circuitGood>],[electrumScrew, electrumFoil, electrumScrew]], 300, moltenRedstone * 1152, <metaitem:board.plastic>);

//     // Wood pile tooltip
//     <forestry:wood_pile>.addTooltip(format.darkRed("See JEI for different Wall options and their relative impacts."));

//     // Remove forestry glistering melon recipe due to gold exploit
//     recipes.removeByRecipeName("forestry:honey_melon");

//     // Forestry 4 Planks -> 2 Planks
//     recipes.removeShapeless(<forestry:planks.1:12> * 4, [<forestry:logs.7>]);
//     recipes.addShapeless("it3_forestry_planks", <forestry:planks.1:12> * 2, [<forestry:logs.7>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:4> * 4, [<forestry:logs.fireproof.5>]);
//     recipes.addShapeless("it3_forestry_planks1", <forestry:planks.fireproof.1:4> * 2, [<forestry:logs.fireproof.5>]);
//     recipes.removeShapeless(<forestry:planks.0:3> * 4, [<forestry:logs.0:3>]);
//     recipes.addShapeless("it3_forestry_planks2", <forestry:planks.0:3> * 2, [<forestry:logs.0:3>]);
//     recipes.removeShapeless(<forestry:planks.0:13> * 4, [<forestry:logs.3:1>]);
//     recipes.addShapeless("it3_forestry_planks3", <forestry:planks.0:13> * 2, [<forestry:logs.3:1>]);
//     recipes.removeShapeless(<forestry:planks.0:2> * 4, [<forestry:logs.0:2>]);
//     recipes.addShapeless("it3_forestry_planks4", <forestry:planks.0:2> * 2, [<forestry:logs.0:2>]);
//     recipes.removeShapeless(<forestry:planks.0:5> * 4, [<forestry:logs.1:1>]);
//     recipes.addShapeless("it3_forestry_planks5", <forestry:planks.0:5> * 2, [<forestry:logs.1:1>]);
//     recipes.removeShapeless(<forestry:planks.0:9> * 4, [<forestry:logs.2:1>]);
//     recipes.addShapeless("it3_forestry_planks6", <forestry:planks.0:9> * 2, [<forestry:logs.2:1>]);
//     recipes.removeShapeless(<forestry:planks.vanilla.fireproof.0:4> * 4, [<forestry:logs.vanilla.fireproof.1>]);
//     recipes.addShapeless("it3_forestry_planks7", <forestry:planks.vanilla.fireproof.0:4> * 2, [<forestry:logs.vanilla.fireproof.1>]);
//     recipes.removeShapeless(<forestry:planks.vanilla.fireproof.0:2> * 4, [<forestry:logs.vanilla.fireproof.0:2>]);
//     recipes.addShapeless("it3_forestry_planks8", <forestry:planks.vanilla.fireproof.0:2> * 2, [<forestry:logs.vanilla.fireproof.0:2>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:10> * 4, [<forestry:logs.fireproof.2:2>]);
//     recipes.addShapeless("it3_forestry_planks9", <forestry:planks.fireproof.0:10> * 2, [<forestry:logs.fireproof.2:2>]);
//     recipes.removeShapeless(<forestry:planks.1:9> * 4, [<forestry:logs.6:1>]);
//     recipes.addShapeless("it3_forestry_planks10", <forestry:planks.1:9> * 2, [<forestry:logs.6:1>]);
//     recipes.removeShapeless(<forestry:planks.0:8> * 4, [<forestry:logs.2>]);
//     recipes.addShapeless("it3_forestry_planks11", <forestry:planks.0:8> * 2, [<forestry:logs.2>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:6> * 4, [<forestry:logs.fireproof.1:2>]);
//     recipes.addShapeless("it3_forestry_planks12", <forestry:planks.fireproof.0:6> * 2, [<forestry:logs.fireproof.1:2>]);
//     recipes.removeShapeless(<forestry:planks.0:6> * 4, [<forestry:logs.1:2>]);
//     recipes.addShapeless("it3_forestry_planks13", <forestry:planks.0:6> * 2, [<forestry:logs.1:2>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:12> * 4, [<forestry:logs.fireproof.3>]);
//     recipes.addShapeless("it3_forestry_planks14", <forestry:planks.fireproof.0:12> * 2, [<forestry:logs.fireproof.3>]);
//     recipes.removeShapeless(<forestry:planks.1:7> * 4, [<forestry:logs.5:3>]);
//     recipes.addShapeless("it3_forestry_planks15", <forestry:planks.1:7> * 2, [<forestry:logs.5:3>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:2> * 4, [<forestry:logs.fireproof.4:2>]);
//     recipes.addShapeless("it3_forestry_planks16", <forestry:planks.fireproof.1:2> * 2, [<forestry:logs.fireproof.4:2>]);
//     recipes.removeShapeless(<forestry:planks.0:1> * 4, [<forestry:logs.0:1>]);
//     recipes.addShapeless("it3_forestry_planks17", <forestry:planks.0:1> * 2, [<forestry:logs.0:1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0> * 4, [<forestry:logs.fireproof.0>]);
//     recipes.addShapeless("it3_forestry_planks18", <forestry:planks.fireproof.0> * 2, [<forestry:logs.fireproof.0>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:11> * 4, [<forestry:logs.fireproof.2:3>]);
//     recipes.addShapeless("it3_forestry_planks19", <forestry:planks.fireproof.0:11> * 2, [<forestry:logs.fireproof.2:3>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:1> * 4, [<forestry:logs.fireproof.4:1>]);
//     recipes.addShapeless("it3_forestry_planks20", <forestry:planks.fireproof.1:1> * 2, [<forestry:logs.fireproof.4:1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:11> * 4, [<forestry:logs.fireproof.6:3>]);
//     recipes.addShapeless("it3_forestry_planks21", <forestry:planks.fireproof.1:11> * 2, [<forestry:logs.fireproof.6:3>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:14> * 4, [<forestry:logs.fireproof.3:2>]);
//     recipes.addShapeless("it3_forestry_planks22", <forestry:planks.fireproof.0:14> * 2, [<forestry:logs.fireproof.3:2>]);
//     recipes.removeShapeless(<forestry:planks.vanilla.fireproof.0:5> * 4, [<forestry:logs.vanilla.fireproof.1:1>]);
//     recipes.addShapeless("it3_forestry_planks23", <forestry:planks.vanilla.fireproof.0:5> * 2, [<forestry:logs.vanilla.fireproof.1:1>]);
//     recipes.removeShapeless(<forestry:planks.0:14> * 4, [<forestry:logs.3:2>]);
//     recipes.addShapeless("it3_forestry_planks24", <forestry:planks.0:14> * 2, [<forestry:logs.3:2>]);
//     recipes.removeShapeless(<forestry:planks.0:4> * 4, [<forestry:logs.1>]);
//     recipes.addShapeless("it3_forestry_planks25", <forestry:planks.0:4> * 2, [<forestry:logs.1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:7> * 4, [<forestry:logs.fireproof.1:3>]);
//     recipes.addShapeless("it3_forestry_planks26", <forestry:planks.fireproof.0:7> * 2, [<forestry:logs.fireproof.1:3>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:10> * 4, [<forestry:logs.fireproof.6:2>]);
//     recipes.addShapeless("it3_forestry_planks27", <forestry:planks.fireproof.1:10> * 2, [<forestry:logs.fireproof.6:2>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:12> * 4, [<forestry:logs.fireproof.7>]);
//     recipes.addShapeless("it3_forestry_planks28", <forestry:planks.fireproof.1:12> * 2, [<forestry:logs.fireproof.7>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:6> * 4, [<forestry:logs.fireproof.5:2>]);
//     recipes.addShapeless("it3_forestry_planks29", <forestry:planks.fireproof.1:6> * 2, [<forestry:logs.fireproof.5:2>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:3> * 4, [<forestry:logs.fireproof.4:3>]);
//     recipes.addShapeless("it3_forestry_planks30", <forestry:planks.fireproof.1:3> * 2, [<forestry:logs.fireproof.4:3>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:8> * 4, [<forestry:logs.fireproof.6>]);
//     recipes.addShapeless("it3_forestry_planks31", <forestry:planks.fireproof.1:8> * 2, [<forestry:logs.fireproof.6>]);
//     recipes.removeShapeless(<forestry:planks.vanilla.fireproof.0:1> * 4, [<forestry:logs.vanilla.fireproof.0:1>]);
//     recipes.addShapeless("it3_forestry_planks32", <forestry:planks.vanilla.fireproof.0:1> * 2, [<forestry:logs.vanilla.fireproof.0:1>]);
//     recipes.removeShapeless(<forestry:planks.0:10> * 4, [<forestry:logs.2:2>]);
//     recipes.addShapeless("it3_forestry_planks33", <forestry:planks.0:10> * 2, [<forestry:logs.2:2>]);
//     recipes.removeShapeless(<forestry:planks.1:6> * 4, [<forestry:logs.5:2>]);
//     recipes.addShapeless("it3_forestry_planks34", <forestry:planks.1:6> * 2, [<forestry:logs.5:2>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:1> * 4, [<forestry:logs.fireproof.0:1>]);
//     recipes.addShapeless("it3_forestry_planks35", <forestry:planks.fireproof.0:1> * 2, [<forestry:logs.fireproof.0:1>]);
//     recipes.removeShapeless(<forestry:planks.1:2> * 4, [<forestry:logs.4:2>]);
//     recipes.addShapeless("it3_forestry_planks36", <forestry:planks.1:2> * 2, [<forestry:logs.4:2>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:8> * 4, [<forestry:logs.fireproof.2>]);
//     recipes.addShapeless("it3_forestry_planks37", <forestry:planks.fireproof.0:8> * 2, [<forestry:logs.fireproof.2>]);
//     recipes.removeShapeless(<forestry:planks.1:10> * 4, [<forestry:logs.6:2>]);
//     recipes.addShapeless("it3_forestry_planks38", <forestry:planks.1:10> * 2, [<forestry:logs.6:2>]);
//     recipes.removeShapeless(<forestry:planks.0:15> * 4, [<forestry:logs.3:3>]);
//     recipes.addShapeless("it3_forestry_planks39", <forestry:planks.0:15> * 2, [<forestry:logs.3:3>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:3> * 4, [<forestry:logs.fireproof.0:3>]);
//     recipes.addShapeless("it3_forestry_planks40", <forestry:planks.fireproof.0:3> * 2, [<forestry:logs.fireproof.0:3>]);
//     recipes.removeShapeless(<forestry:planks.1:4> * 4, [<forestry:logs.5>]);
//     recipes.addShapeless("it3_forestry_planks41", <forestry:planks.1:4> * 2, [<forestry:logs.5>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1> * 4, [<forestry:logs.fireproof.4>]);
//     recipes.addShapeless("it3_forestry_planks42", <forestry:planks.fireproof.1> * 2, [<forestry:logs.fireproof.4>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:9> * 4, [<forestry:logs.fireproof.6:1>]);
//     recipes.addShapeless("it3_forestry_planks43", <forestry:planks.fireproof.1:9> * 2, [<forestry:logs.fireproof.6:1>]);
//     recipes.removeShapeless(<forestry:planks.vanilla.fireproof.0:3> * 4, [<forestry:logs.vanilla.fireproof.0:3>]);
//     recipes.addShapeless("it3_forestry_planks44", <forestry:planks.vanilla.fireproof.0:3> * 2, [<forestry:logs.vanilla.fireproof.0:3>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:4> * 4, [<forestry:logs.fireproof.1>]);
//     recipes.addShapeless("it3_forestry_planks45", <forestry:planks.fireproof.0:4> * 2, [<forestry:logs.fireproof.1>]);
//     recipes.removeShapeless(<forestry:planks.1:8> * 4, [<forestry:logs.6>]);
//     recipes.addShapeless("it3_forestry_planks46", <forestry:planks.1:8> * 2, [<forestry:logs.6>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:15> * 4, [<forestry:logs.fireproof.3:3>]);
//     recipes.addShapeless("it3_forestry_planks47", <forestry:planks.fireproof.0:15> * 2, [<forestry:logs.fireproof.3:3>]);
//     recipes.removeShapeless(<forestry:planks.1:5> * 4, [<forestry:logs.5:1>]);
//     recipes.addShapeless("it3_forestry_planks48", <forestry:planks.1:5> * 2, [<forestry:logs.5:1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:13> * 4, [<forestry:logs.fireproof.3:1>]);
//     recipes.addShapeless("it3_forestry_planks49", <forestry:planks.fireproof.0:13> * 2, [<forestry:logs.fireproof.3:1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:5> * 4, [<forestry:logs.fireproof.1:1>]);
//     recipes.addShapeless("it3_forestry_planks50", <forestry:planks.fireproof.0:5> * 2, [<forestry:logs.fireproof.1:1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.0:9> * 4, [<forestry:logs.fireproof.2:1>]);
//     recipes.addShapeless("it3_forestry_planks51", <forestry:planks.fireproof.0:9> * 2, [<forestry:logs.fireproof.2:1>]);
//     recipes.removeShapeless(<forestry:planks.vanilla.fireproof.0> * 4, [<forestry:logs.vanilla.fireproof.0>]);
//     recipes.addShapeless("it3_forestry_planks52", <forestry:planks.vanilla.fireproof.0> * 2, [<forestry:logs.vanilla.fireproof.0>]);
//     recipes.removeShapeless(<forestry:planks.1:1> * 4, [<forestry:logs.4:1>]);
//     recipes.addShapeless("it3_forestry_planks53", <forestry:planks.1:1> * 2, [<forestry:logs.4:1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:5> * 4, [<forestry:logs.fireproof.5:1>]);
//     recipes.addShapeless("it3_forestry_planks54", <forestry:planks.fireproof.1:5> * 2, [<forestry:logs.fireproof.5:1>]);
//     recipes.removeShapeless(<forestry:planks.fireproof.1:7> * 4, [<forestry:logs.fireproof.5:3>]);
//     recipes.addShapeless("it3_forestry_planks55", <forestry:planks.fireproof.1:7> * 2, [<forestry:logs.fireproof.5:3>]);
//     recipes.removeShapeless(<forestry:planks.0:12> * 4, [<forestry:logs.3>]);
//     recipes.addShapeless("it3_forestry_planks56", <forestry:planks.0:12> * 2, [<forestry:logs.3>]);
//     recipes.removeShapeless(<forestry:planks.0> * 4, [<forestry:logs.0>]);
//     recipes.addShapeless("it3_forestry_planks57", <forestry:planks.0> * 2, [<forestry:logs.0>]);
//     recipes.removeShapeless(<forestry:planks.0:11> * 4, [<forestry:logs.2:3>]);
//     recipes.addShapeless("it3_forestry_planks58", <forestry:planks.0:11> * 2, [<forestry:logs.2:3>]);
//     recipes.removeShapeless(<forestry:planks.1> * 4, [<forestry:logs.4>]);
//     recipes.addShapeless("it3_forestry_planks59", <forestry:planks.1> * 2, [<forestry:logs.4>]);
//     recipes.removeShapeless(<forestry:planks.0:7> * 4, [<forestry:logs.1:3>]);
//     recipes.addShapeless("it3_forestry_planks60", <forestry:planks.0:7> * 2, [<forestry:logs.1:3>]);
//     recipes.removeShapeless(<forestry:planks.1:11> * 4, [<forestry:logs.6:3>]);
//     recipes.addShapeless("it3_forestry_planks61", <forestry:planks.1:11> * 2, [<forestry:logs.6:3>]);
//     recipes.removeShapeless(<forestry:planks.1:3> * 4, [<forestry:logs.4:3>]);
//     recipes.addShapeless("it3_forestry_planks62", <forestry:planks.1:3> * 2, [<forestry:logs.4:3>]);

//     // Allow automation of Wood piles
//     // Requested by user.  Deprecated by any auto-crafting mechanism
//     compressor.recipeBuilder().inputs(<ore:logWood> * 8).outputs(<forestry:wood_pile>).duration(50).EUt(3).buildAndRegister();
// }