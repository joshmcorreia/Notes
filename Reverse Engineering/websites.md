# Reverse engineering websites

## Using Firefox script overrides
Go to the Debugger tab then select the `.js` file that you want to reverse engineer. Right click the file and select "Add script override". This will allow you to save the script to your computer, and you can make updates to that local copy and they will be reflected on the website. I find this particularly useful for files that have been minified; you can put them in a JavaScript formatter and then paste the output back into the file. This will make it so you can set proper breakpoints instead of having all of the minified JS on a single line, and you can also use this to rename variables as you reverse engineer the script.
