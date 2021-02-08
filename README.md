# Puzzle Massive Content

Content for some pages on the 
[Puzzle Massive website](http://puzzle.massive.xyz/).

The site specific content for Puzzle Massive has been separated out into this
repository in order to support other deployments of the 
[puzzle-massive project](https://github.com/jkenlooper/puzzle-massive/).

This repo is designed to be a git submodule of Puzzle Massive.  Checkout the
'with-content' branch of puzzle-massive and then run the
[create-links-in-parent-dir.sh](create-links-in-parent-dir.sh) script.

```bash
# Assuming that the parent directory is the 'with-content' branch of Puzzle Massive.
./create-links-in-parent-dir.sh
```

## Adding Bit Icons

More bit icons can be added by creating PNG image files in the bit-icons
directory.  The naming convention of bit icons is `GROUP-NAME_OF_ICON.png` where
'GROUP' should be lowercase name for the group this bit icon belongs to and
'NAME_OF_ICON' is also lowercase.  A text file named after the 'GROUP' should
also be added to the directory for setting the link and description to use for
those icons. That file should have a name like `source-GROUP.txt` and be in the
bit-icons directory. The first line is the link and the second line is for the
name or description.

Text bit icons can be created by using the `text-icon.sh` script.  The
`text-icon.sh` script requires imagemagick to be installed on your system and
has only been tested with a Ubuntu 20 distribution.  It is common to use this
script when creating an emoji bit icon.  The
`create-text-bit-icons-from-list.sh` script can be used to create an emoji bit
icon for each line in the [emoji_list text files](emoji_list).

```bash
./create-text-bit-icons-from-list.sh emoji_list/activities.txt emoji_activities
./create-text-bit-icons-from-list.sh emoji_list/animals_nature.txt emoji_animals_nature
./create-text-bit-icons-from-list.sh emoji_list/flags.txt emoji_flags
./create-text-bit-icons-from-list.sh emoji_list/food_drink.txt emoji_food_drink
./create-text-bit-icons-from-list.sh emoji_list/objects.txt emoji_objects
./create-text-bit-icons-from-list.sh emoji_list/people_body.txt emoji_people_body
./create-text-bit-icons-from-list.sh emoji_list/sky_weather.txt emoji_sky_weather
./create-text-bit-icons-from-list.sh emoji_list/smileys_emotion.txt emoji_smileys_emotion
./create-text-bit-icons-from-list.sh emoji_list/symbols.txt emoji_symbols
./create-text-bit-icons-from-list.sh emoji_list/time.txt emoji_time
./create-text-bit-icons-from-list.sh emoji_list/travel_places.txt emoji_travel_places

./create-text-bit-icons-from-list.sh text-list.txt text
```

Bit icons created from running the above command are set to be ignored by git
and won't be included in this repository.

## License

Puzzle Massive Content.
Copyright (C) 2021 Jake Hickenlooper

The content included in this puzzle-massive-content repository is licensed under the
[Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/)
License.

Included [bit icon images](bit-icons/) are copyright of the original author
which can be found in the respective bit-icons/sources-*.txt files.

Scripts used to manage this included content are licensed under the 
[MIT](https://choosealicense.com/licenses/mit/) License.
