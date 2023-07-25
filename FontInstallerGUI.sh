#!/bin/bash
ans=$(zenity --info --title 'Linux Font Installer' \
      --text 'Select the font file you want to install.' \
      --ok-label Quit \
      --extra-button Select File \
	)
if [[ $ans = "Select" ]]
  then
        LOCATION=$(zenity --file-selection --file-filter='Font files (ttf,otf,fnt,woff,eot,ps) | *.ttf *.otf *.fnt *.woff *.eot *.ps' --file-filter='All files | *' --title="Select font to install")
	
if zenity --question --text="Would you like to see a preview of the font?"
	then 
    	display $LOCATION
		if zenity --question --text="Would you like to install the font?"
			then
				mkdir -p ~/.local/share/fonts
				cp $LOCATION ~/.local/share/fonts					
				fc-cache -f -v
				zenity --info --text="Successfully installed! You may need to restart any programs that are asking for fonts."
		fi
	fi
if zenity --question --text="Would you like to install the font?"
				then
					mkdir -p ~/.local/share/fonts
					cp $LOCATION ~/.local/share/fonts					
					fc-cache -f -v
				fi
fi