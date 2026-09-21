-- Yazi plugin setup. Plugins themselves are pinned in package.toml
-- and installed with `ya pkg install`.

-- Full border around the panes.
require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

-- Git status as a linemode sign in the file list.
require("git"):setup({
	order = 1500,
})
