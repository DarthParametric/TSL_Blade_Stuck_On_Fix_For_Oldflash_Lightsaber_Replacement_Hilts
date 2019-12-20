@echo off

Title "[TSL] Blade Fix For Oldflash Hilts v1.1"

echo:
echo   Applying fix for the extended blade issue in Oldflash's lightsaber hilts.
echo:
echo   Patching done using housisong's HDiffPatch: https://github.com/sisong/HDiffPatch
echo   with hash-checking elements taken from Vasil Arnaudov's sha1.bat: 
echo   https://github.com/npocmaka/batch.scripts/blob/master/fileUtils/sha1.bat
echo:
echo   Refer to HDiffPatch_License.txt and SHA1_Batch_License.txt
echo:
echo   ----------------------------------------------------------------------------------
echo:

setlocal enableDelayedExpansion

set "sabera=w_lghtsbr_008.mdl"
set "saberb=w_lghtsbr_008.mdx"
set "saberc=w_shortsbr_006.mdl"
set "saberd=w_shortsbr_006.mdx"

rem Check that CertUtil exists on the current version of Windows
for %%# in (certutil.exe) do (
	if not exist "%%~f$PATH:#" (
		echo no certutil installed
		echo for Windows XP professional and Windows 2003
		echo you need Windows Server 2003 Administration Tools Pack
		echo https://www.microsoft.com/en-us/download/details.aspx?id=3725
		exit /b 4
	)
)

echo    Checking %sabera% . . .
echo:

if exist %sabera% (
	
	if exist %saberb% (
		
		rem Call CertUtil to obtain the SHA1 hash of the first MDL
		set "dphasha="
		for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "%sabera%" SHA1') do (
			if not defined dphasha (
				for %%Z in (%%#) do set "dphasha=!dphasha!%%Z"
			)
		)
		
		rem Compare the SHA1 hash of the first MDL to the expected value
		if "!dphasha!" equ "c553ce52258eb441852da73d371eb488c4fa1676" (
			
			echo    %sabera% is valid.
			echo:
			echo    Checking %saberb% . . .
			echo:
			
			rem Call CertUtil to obtain the SHA1 hash of the first MDX
			set "dphashb="
			for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "%saberb%" SHA1') do (
				if not defined dphashb (
					for %%Z in (%%#) do set "dphashb=!dphashb!%%Z"
				)
			)
			
			rem Compare the SHA1 hash of the first MDX to the expected value
			if "!dphashb!" equ "b18a2217a87a993eddedb2740b2b1a37d25bc5e9" (
				
				echo    %saberb% is valid.
				echo:
				echo    File hashes match.
				echo:
				echo    Patching w_lghtsbr_008 from "Lightsaber Replacement Hilts":
				echo:
				
				hpatchz -f %sabera% oldflashpatch008a %sabera%
				hpatchz -f %saberb% oldflashpatch008b %saberb%
				
				echo:
				echo    Patching of %sabera% and %saberb% is complete.
				echo:
				echo    ----------------------------------------------------------------------------------
				echo:
			) else (
				  echo    File hash for %saberb% does not match^^! Skipping . . .
			)
		) else (
			  echo    File hash for %sabera% does not match^^! Skipping . . .
		)
	) else (
			echo    %saberb% isn't present, skipping . . .
	)
) else (
		echo    %sabera% isn't present, skipping . . .
)

echo:

echo    Checking %saberc% . . .
echo:

if exist %saberc% (
	
	if exist %saberd% (
		
		rem Call CertUtil to obtain the SHA1 hash of the second MDL
		set "dphashc="
		for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "%saberc%" SHA1') do (
			if not defined dphashc (
				for %%Z in (%%#) do set "dphashc=!dphashc!%%Z"
			)
		)
		
		rem Compare the SHA1 hash of the second MDL to the expected value
		if "!dphashc!" equ "deca3644fa48f6bc8545d9c768dd60560f5f48db" (
			
			echo    %saberc% is valid.
			echo:
			echo    Checking %saberd% . . .
			echo:
			
			rem Call CertUtil to obtain the SHA1 hash of the second MDX
			set "dphashd="
			for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "%saberd%" SHA1') do (
				if not defined dphashd (
					for %%Z in (%%#) do set "dphashd=!dphashd!%%Z"
				)
			)
			
			rem Compare the SHA1 hash of the second MDX to the expected value
			if "!dphashd!" equ "540a044fbe5d46777b7621c60f6ea438b0c5f98a" (
				
				echo    %saberd% is valid.
				echo:
				echo    File hashes match.
				echo:
				echo    Patching w_shortsbr_006 from "Short Lightsaber Replacement Hilts":
				echo:
				
				hpatchz -f %saberc% oldflashpatchs006a %saberc%
				hpatchz -f %saberd% oldflashpatchs006b %saberd%
				
				echo:
				echo    Patching of %saberc% and %saberd% is complete.
				echo:
				echo    ----------------------------------------------------------------------------------
				echo:
			) else (
				  echo    File hash for %saberd% does not match^^! Skipping . . .
			)
		) else (
			  echo    File hash for %saberc% does not match^^! Skipping . . .
		)
	) else (
			echo    %saberd% isn't present, skipping . . .
	)
) else (
		echo    %saberc% isn't present, skipping . . .
)

echo:

endlocal

pause
