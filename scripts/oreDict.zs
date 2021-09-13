import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

static gt as string = "gregtech";

static ores as string[IOreDictEntry] = {
    <ore:dustCertusQuartz> : gt,
    <ore:dustNetherQuartz> : gt,
    <ore:dustEnderPearl> : gt,

    <ore:ingotBronze> : gt,
    <ore:plateBronze> : gt,
    <ore:blockBronze> : gt,
    <ore:dustBronze> : gt,
    <ore:nuggetBronze> : gt,
    <ore:gearBronze> : gt,

    <ore:ingotCopper> : gt,
    <ore:plateCopper> : gt,
    <ore:blockCopper> : gt,
    <ore:dustCopper> : gt,
    <ore:nuggetCopper> : gt,
    <ore:gearCopper> : gt,

    /*<ore:ingotConstantan> : gt,
    <ore:plateConstantan> : gt,
    <ore:blockConstantan> : gt,
    <ore:dustConstantan> : gt,
    <ore:nuggetConstantan> : gt,
    <ore:gearConstantan> : gt,*/

    <ore:gearDiamond> : gt,

    <ore:ingotElectrum> : gt,
    <ore:plateElectrum> : gt,
    <ore:blockElectrum> : gt,
    <ore:dustElectrum> : gt,
    <ore:nuggetElectrum> : gt,
    <ore:gearElectrum> : gt,

    <ore:ingotEnderium> : gt,
    <ore:plateEnderium> : gt,
    <ore:blockEnderium> : gt,
    <ore:dustEnderium> : gt,
    <ore:nuggetEnderium> : gt,
    <ore:gearEnderium> : gt,

    <ore:plateGold> : gt,
    <ore:dustGold> : gt,
    <ore:gearGold> : gt,

    <ore:ingotInvar> : gt,
    <ore:plateInvar> : gt,
    <ore:blockInvar> : gt,
    <ore:dustInvar> : gt,
    <ore:nuggetInvar> : gt,
    <ore:gearInvar> : gt,

    <ore:ingotIridium> : gt,
    <ore:plateIridium> : gt,
    <ore:blockIridium> : gt,
    <ore:dustIridium> : gt,
    <ore:nuggetIridium> : gt,
    <ore:gearIridium> : gt,

    <ore:plateIron> : gt,
    <ore:dustIron> : gt,
    <ore:gearIron> : gt,

    <ore:ingotLead> : gt,
    <ore:plateLead> : gt,
    <ore:blockLead> : gt,
    <ore:dustLead> : gt,
    <ore:nuggetLead> : gt,
    <ore:gearLead> : gt,

    <ore:ingotNickel> : gt,
    <ore:plateNickel> : gt,
    <ore:blockNickel> : gt,
    <ore:dustNickel> : gt,
    <ore:nuggetNickel> : gt,
    <ore:gearNickel> : gt,

    <ore:ingotPlatinum> : gt,
    <ore:platePlatinum> : gt,
    <ore:blockPlatinum> : gt,
    <ore:dustPlatinum> : gt,
    <ore:nuggetPlatinum> : gt,
    <ore:gearPlatinum> : gt,

    <ore:gemRuby> : gt,

    <ore:gemSapphire> : gt,

    <ore:ingotSilver> : gt,
    <ore:plateSilver> : gt,
    <ore:blockSilver> : gt,
    <ore:dustSilver> : gt,
    <ore:nuggetSilver> : gt,
    <ore:gearSilver> : gt,

    <ore:ingotSteel> : gt,
    <ore:plateSteel> : gt,
    <ore:blockSteel> : gt,
    <ore:dustSteel> : gt,
    <ore:nuggetSteel> : gt,
    <ore:gearSteel> : gt,

    <ore:ingotTin> : gt,
    <ore:plateTin> : gt,
    <ore:blockTin> : gt,
    <ore:dustTin> : gt,
    <ore:nuggetTin> : gt,
    <ore:gearTin> : gt,

    <ore:gearWood> : gt
};

/* Special oredicts for chisel-able blocks */
for i in <ore:blockCopper>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniCopper>.add(i);
  }
}

for i in <ore:blockTin>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniTin>.add(i);
  }
}

for i in <ore:blockBronze>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniBronze>.add(i);
  }
}

for i in <ore:blockLead>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniLead>.add(i);
  }
}

for i in <ore:blockSilver>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniSilver>.add(i);
  }
}

for i in <ore:blockAluminium>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniAluminium>.add(i);
  }
}

for i in <ore:blockSteel>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniSteel>.add(i);
  }
}

for i in <ore:blockInvar>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniInvar>.add(i);
  }
}

for i in <ore:blockElectrum>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniElectrum>.add(i);
  }
}

for i in <ore:blockNickel>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniNickel>.add(i);
  }
}

for i in <ore:blockPlatinum>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniPlatinum>.add(i);
  }
}

for i in <ore:blockCobalt>.items {
  if (i.definition.owner != "chisel") {
    <ore:blockUniCobalt>.add(i);
  }
}