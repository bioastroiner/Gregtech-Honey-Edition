
#Basic ways to get honey
#common ore dict for HoneyComb Blocks
val blockComb = <ore:blockComb>;

blockComb.add(
    <forestry:bee_combs_0>,
    <forestry:bee_combs_0:2>,
    <forestry:bee_combs_0:3>,
    <forestry:bee_combs_0:4>,
    <forestry:bee_combs_0:5>,
    <forestry:bee_combs_0:6>,
    <forestry:bee_combs_0:7>,
    <forestry:bee_combs_0:15>,
    <forestry:bee_combs_1>);
for item in blockComb.items{
	item.addTooltip(format.green("Can be used to make honey early game."));
}
//tools
val softHammer = <gregtech:meta_tool:7>;
val hardHammer = <gregtech:meta_tool:6>;
val wireCutter = <gregtech:meta_tool:13>;
val mortar = <gregtech:meta_tool:12>;
//containers
val refractory = <forestry:refractory>;
val honeyRefactory = <forestry:refractory:1>.withTag({Fluid: {FluidName: "for.honey", Amount: 1000}});
val can = <forestry:can>;
val honeyCan = <forestry:can:1>.withTag({Fluid: {FluidName: "for.honey", Amount: 1000}});
val capsule = <forestry:capsule>;
val honeyCapsule = <forestry:capsule:1>.withTag({Fluid: {FluidName: "for.honey", Amount: 1000}});
val cell = <gregtech:meta_item_1:32762>;
val honey_cell = cell.withTag({Fluid: {FluidName: "for.honey", Amount: 1000}});
val honey_dr = <forestry:honey_drop>;

#some containers for honey
// cell
recipes.addShapedMirrored(cell, [[hardHammer, <ore:plateIron>, wireCutter],[<ore:plateIron>, <ore:paneGlass>, <ore:plateIron>], [null, <ore:plateCurvedIron>, null]]);
recipes.addShapedMirrored(cell * 2, [[hardHammer, <ore:plateDoubleIron>, wireCutter],[<ore:plateIron>, <ore:paneGlassColorless>, <ore:plateIron>], [null, <ore:plateCurvedWroughtIron>, null]]);
// tincan
recipes.addShapedMirrored(can * 3, [[null, wireCutter, <ore:plateTin>],[null, <ore:paneGlass>, hardHammer], [null, null, <ore:paneGlass>]]);
#drop of honey
// from honey
recipes.addShapedMirrored(honey_dr * 40, [[softHammer, null, hardHammer],[honey_cell, wireCutter, honey_cell], [honey_cell, null, honey_cell]]);
recipes.addShapedMirrored(honey_dr * 40, [[softHammer, null, hardHammer],[honeyRefactory, wireCutter, honeyRefactory],[honeyRefactory, null, honeyRefactory]]);
recipes.addShapedMirrored(honey_dr * 40, [[softHammer, null, hardHammer],[honeyCapsule, wireCutter, honeyCapsule], [honeyCapsule, null, honeyCapsule]]);
recipes.addShapedMirrored(honey_dr * 40, [[softHammer, null, hardHammer],[honeyCan, wireCutter, honeyCan], [honeyCan, null, honeyCan]]);
// from combs
recipes.addShapedMirrored(honey_dr * 30, [[blockComb, blockComb, blockComb],[blockComb, blockComb, blockComb], [null, mortar, null]]);
recipes.addShapedMirrored(honey_dr * 30, [[blockComb, blockComb, blockComb],[blockComb, blockComb, blockComb], [null, mortar, null]]);
#liquid honey from combs into cells
recipes.addShapedMirrored(honeyRefactory * 4, [[blockComb, blockComb, blockComb],[blockComb, refractory, refractory], [refractory, refractory, hardHammer]]);
recipes.addShapedMirrored(honeyCapsule * 4, [[blockComb, blockComb, blockComb],[blockComb, capsule, capsule], [capsule, capsule, hardHammer]]);
recipes.addShapedMirrored(cell.withTag({Fluid: {FluidName: "for.honey", Amount: 1000}}) * 4, [[blockComb, blockComb, blockComb],[blockComb, cell, cell], [cell, cell, hardHammer]]);
recipes.addShapedMirrored(honeyCan.withTag({Fluid: {FluidName: "for.honey", Amount: 1000}}) * 4, [[blockComb, blockComb, blockComb],[blockComb, can, can], [can, can, hardHammer]]);
#new beehouse recipes
recipes.addShaped(<forestry:crate> * 10, [[<ore:logWood>, <ore:stickWood>, <ore:plankWood>],[<ore:stickWood>, <ore:slabWood>, <ore:stickWood>], [<ore:plankWood>, <ore:stickWood>, <ore:logWood>]]);
recipes.removeShaped(<forestry:bee_house>, [[<ore:slabWood>, <ore:slabWood>, <ore:slabWood>],[<ore:plankWood>, <ore:beeComb>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
recipes.addShaped(<forestry:bee_house>, [[<forestry:crate>, <forestry:crate>, <forestry:crate>],[<forestry:crate>, <ore:logWood>, <forestry:crate>], [<forestry:crate>, <forestry:crate>, <forestry:crate>]]);
#new Apiarist chest
recipes.remove(<forestry:bee_chest>);
recipes.remove(<forestry:butterfly_chest>);
recipes.remove(<forestry:tree_chest>);
recipes.addShaped(<forestry:bee_chest>, [[<forestry:crate>, <ore:itemBeeswax>, <forestry:crate>],[<forestry:crate>, <ore:chest>, <forestry:crate>], [<forestry:crate>, <ore:chest>, <forestry:crate>]]);
recipes.addShaped(<forestry:butterfly_chest>, [[<forestry:crate>, <minecraft:glass_bottle>, <forestry:crate>],[<forestry:crate>, <ore:chest>, <forestry:crate>], [<forestry:crate>, <ore:chest>, <forestry:crate>]]);
recipes.addShaped(<forestry:tree_chest>, [[<forestry:crate>, <ore:treeSapling>, <forestry:crate>],[<forestry:crate>, <ore:chest>, <forestry:crate>], [<forestry:crate>, <ore:chest>, <forestry:crate>]]);
#easy wax
recipes.addShapeless(<forestry:beeswax>,[<ore:beeComb>,mortar]);
recipes.addShapeless(<forestry:candle>,[<ore:stickWood>,<ore:string>,<ore:itemBeeswax>,wireCutter]);
//normal wax can
recipes.remove(<forestry:capsule>);
recipes.addShapeless(<forestry:capsule>,[<ore:itemBeeswax>,<ore:itemBeeswax>,hardHammer]);
//refactory wax can
recipes.remove(<forestry:refractory>);
recipes.addShapeless(<forestry:refractory>,[<forestry:refractory_wax>,<forestry:refractory_wax>,hardHammer]);