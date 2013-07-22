require "fileutils"

alias :L :lambda

Joiner = L { |base| L { |*others| File.join(base, *others) } }
Link   = L { |from, to| FileUtils.ln_s(from, to) rescue puts("#{to} exists.") }

Cwd    = Joiner[ File.expand_path(File.dirname(__FILE__)) ]
Home   = Joiner[ File.expand_path("~") ]

Link[ Cwd['.irbrc'], Home['.irbrc'] ]
Link[ Cwd['.zshrc'], Home['.zshrc'] ]
Link[ Cwd['.zsh.d'], Home['.zsh.d'] ]
Link[ Cwd['.tmux.conf'], Home['.tmux.conf'] ]
Link[ Cwd['.gemrc'], Home['.gemrc'] ]
