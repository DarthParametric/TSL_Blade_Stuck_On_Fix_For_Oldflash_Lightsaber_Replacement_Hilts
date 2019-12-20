# [TSL] Blade Stuck On Fix For Oldflash's "Lightsaber Replacement Hilts" and ""Short Lightsaber Replacement Hilts Mods

This is a patch for the turquoise bladed hilt (w_lghtsbr_008) and the bronze bladed short hilt (w_shortsbr_006) in Oldflash's [Lightsaber Replacement Hilts](https://www.gamefront.com/games/knights-of-the-old-republic-ii/file/lightsaber-replacement-hilts) and [Short Lightsaber Replacement Hilts](https://www.gamefront.com/games/knights-of-the-old-republic-ii/file/short-lightsaber-replacement-hilts) (respectively) mods. The have the same issue that the original turquoise hilt in K1 had, where the blade would be stuck on/activated when transitioning to a new module until the player performed a flourish, engaged in combat, or otherwise triggered a lightsaber animation that reset the blade. This is due to Bioware misconfiguring the original model, created for the Yavin DLC for K1, where the scale on the blade planes was erroneously set to 1 instead of 0. 

Because making recompiled models available would require permission from Oldflash, instead I have created binary difference patches using [HDiffPatch](https://github.com/sisong/HDiffPatch) which can be applied to the original models to fix the issue without the need for redistributing any of Oldflash's work.

## Instructions
For Windows users:
* Download and install Oldflash's mods.
* Download [the fix patch](https://github.com/DarthParametric/TSL_Blade_Stuck_On_Fix_For_Oldflash_Lightsaber_Replacement_Hilts/releases/latest).
* Extract the patch archive into your TSL Override folder.
* Double-click `OLDFLASH_SABER_FIX.BAT` to apply the patch.
* A command window will show the patch process. Press any key when it is complete to exit.

For Linux/Mac users:
* Download and install Oldflash's mods.
* Download [the fix patch](https://github.com/DarthParametric/TSL_Blade_Stuck_On_Fix_For_Oldflash_Lightsaber_Replacement_Hilts/releases/latest).
* Extract the patch archive into your TSL Override folder.
* Download [HDiffPatch](https://github.com/sisong/HDiffPatch/releases/latest) and extract the appropriate hpatchz binary for your OS, or compile from source.
* Put the hpatchz binary in your Override folder alongside the patch contents.
* Run the following commands in a terminal:
```
hpatchz -f w_lghtsbr_008.mdl oldflashpatch008a w_lghtsbr_008.mdl
hpatchz -f w_lghtsbr_008.mdx oldflashpatch008b w_lghtsbr_008.mdx
hpatchz -f w_shortsbr_006.mdl oldflashpatchs006a w_shortsbr_006.mdl
hpatchz -f w_shortsbr_006.mdx oldflashpatchs006b w_shortsbr_006.mdx
```
