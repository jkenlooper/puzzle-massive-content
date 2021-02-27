# Puzzle Massive Content

Content for some pages on the 
[Puzzle Massive website](http://puzzle.massive.xyz/).

The site specific content for Puzzle Massive has been separated out into this
repository in order to support other deployments of the 
[puzzle-massive project](https://github.com/jkenlooper/puzzle-massive/).

This repo is designed to be a git submodule of Puzzle Massive.  See the
'with-content' branch of puzzle-massive.

```bash
# Assuming that the parent directory is the 'with-content' branch of Puzzle Massive.

# Create all the emoji icons
make

# Test run of creating symbolic links. Creates a tmp/ with what would be created
# in the parent directory.
make PATH_TO_PUZZLEMASSIVE_PROJECT_DIR=tmp/ install

# Create symbolic links in the parent directory (../)
make install
```

## Adding Bit Icons

More bit icons can be added by creating PNG image files in the bit-icons
directory.  The naming convention of bit icons is `GROUP-NAME_OF_ICON.png` where
'GROUP' should be lowercase name for the group this bit icon belongs to and
'NAME_OF_ICON' is also lowercase.  A text file named after the 'GROUP' should
also be added to the directory for setting the link and description to use for
those icons. That file should have a name like `source-GROUP.yaml` and be in the
bit-icons directory. See the other source-*.yaml files for an example.

Text bit icons can be created by using the `text-icon.sh` script.  The
`text-icon.sh` script requires imagemagick to be installed on your system and
has only been tested with a Ubuntu 20 distribution.  It is common to use this
script when creating an emoji bit icon.  The
`create-text-bit-icons-from-list.sh` script can be used to create an emoji bit
icon for each line in the [emoji_list text files](emoji_list).

```bash
# use make command to create all emoji bit icons and text bit icons
make
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
