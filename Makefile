.PHONY: all clean

all:
	stow --verbose --restow */

clean:
	stow --verbose --delete */
