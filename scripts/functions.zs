import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.recipe.RecipeMap;

#priority 90

function disableItem(item as IItemStack){
  recipes.removeShapeless(item);
  recipes.removeShaped(item);
  item.addTooltip(format.darkRed("Disabled"));
}