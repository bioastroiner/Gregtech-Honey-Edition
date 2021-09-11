//for debug
import mods.jei.JEI;

//FUll max battery
val full_max_batt = <gtadditions:ga_meta_item:32124>.withTag({Charge: 8999999999996715308 as long, DischargeMode: 1 as byte});

//TODO: remove this at the end!
recipes.addShapeless(full_max_batt, [<ore:dirt>]);
JEI.addItem(full_max_batt);