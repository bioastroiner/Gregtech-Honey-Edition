
#Thanks to Gregicality Cumminity Pack!

// import mods.gregtech.recipe.RecipeMap;
// import mods.gregtech.recipe.RecipeMaps;


// import mods.devtech.machines.RegisterMachine;

// // overlays are in order of: FRONT SIDE TOP
// var electric_apiary = IRecipeMap.recipeMapBuilder("electric_apiary")
//     .minInputs(1)
//     .maxInputs(2)
//     .minOutputs(1)
//     .maxOutputs(9)
//     .minFluidInputs(0)
//     .maxFluidInputs(1)
//     .minFluidOutputs(0)
//     .maxFluidOutputs(1)
//     .setOverlaySlots(OverlaySlot.newOverlaySlot(false, false, false, GUITextures.get("bender_overlay")),
//         OverlaySlot.newOverlaySlot(false, false, true, GUITextures.get("bender_overlay")),
//         OverlaySlot.newOverlaySlot(true, false, false, GUITextures.get("bender_overlay")),
//         OverlaySlot.newOverlaySlot(true, false, false, GUITextures.get("bender_overlay")),
//         OverlaySlot.newOverlaySlot(true, false, false, GUITextures.get("bender_overlay")),
//         OverlaySlot.newOverlaySlot(true, false, true, GUITextures.get("bender_overlay")))         
//     .setProgressBar(TextureArea.fullImage("gregtech:textures/gui/progress_bar/progress_bar_apiary.png"), MoveType.HORIZONTAL)
//     .buildCircuit();
	
// val tiers as string[] = ["ulv", "lv", "mv", "hv", "ev", "iv", "luv", "zpm", "uv"];

// var apiary_textures = OverlayRenderer.newOverlay("machines/electric_apiary", OverlayFace.FRONT, OverlayFace.SIDE, OverlayFace.TOP);

// for i in 1 to 9 {
// 	//RegisterMachine.CreateSimpleMachine(1987, "thingy.lv", RecipeMaps.COMPRESSOR_RECIPES, textures, 1);
//     RegisterMachine.CreateSimpleMachine((5018 + i), "electric_apiary." + tiers[i], electric_apiary, Overlays.get("bee_attractor"), i);
// }