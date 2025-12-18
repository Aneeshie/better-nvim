function ColorMyPencils(color) 
	color = color or "mars"
	
	vim.o.background = "dark"
	
	-- Try to set the colorscheme, fallback to default if it fails
	local status, _ = pcall(vim.cmd.colorscheme, color)
	if not status then
		vim.cmd.colorscheme("default")
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
