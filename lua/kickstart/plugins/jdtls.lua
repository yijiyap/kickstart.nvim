return {
  {
    'mfussenegger/nvim-jdtls',
    ft = 'java', -- still lazy-loads on Java files
    dependencies = { 'neovim/nvim-lspconfig' },
    config = false, -- don't auto-run setup
  },
}
