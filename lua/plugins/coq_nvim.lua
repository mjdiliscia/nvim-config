return {
	"ms-jpq/coq_nvim",
	dependencies = { "ms-jpq/coq.artifacts" },
	priority = 60,
	lazy = true,
	event = { "BufEnter *.cpp", "BufEnter *.h" },
	enabled = false,
}