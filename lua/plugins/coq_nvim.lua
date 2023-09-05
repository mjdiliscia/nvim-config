return {
	"ms-jpq/coq_nvim",
	dependencies = { "ms-jpq/coq.artifacts" },
	priority = 60,
	lazy = true,
	event = { "BufRead *.cpp", "BufRead *.h" },
	enabled = false,
}
