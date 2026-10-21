# load config
require "yaml"
config = YAML.load(File.read("./config.yaml"))

tap "barutsrb/tap", "https://github.com/BarutSRB/homebrew-tap", trusted: { casks: ["omniwm"] }

if !config["work"]
  tap "homebrew/core"
end

# Language Server for Bash
brew "bash-language-server"
# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# Manage your dotfiles across multiple diverse machines, securely
brew "chezmoi"
# GNU File, Shell, and Text utilities
brew "coreutils"
# Debugger for the Go programming language
brew "delve"
# TIFF library and utilities
brew "libtiff"
# Modern, maintained replacement for ls
brew "eza"
# Like neofetch, but much faster because written mostly in C
brew "fastfetch"
# Simple, fast and user-friendly alternative to find
brew "fd"
# Collection of GNU find, xargs, and locate
brew "findutils"
# Command-line fuzzy finder written in Go
brew "fzf"
# GNU awk utility
brew "gawk"
# GitHub command-line tool
brew "gh"
# Distributed revision control system
brew "git"
# Syntax-highlighting pager for git and diff output
brew "git-delta"
# Small git utilities
brew "git-extras"
# Alternative to top/htop
brew "glances"
# Statically typed language for the Erlang VM
brew "gleam"
# GNU implementation of the famous stream editor
brew "gnu-sed"
# GNU version of the tar archiving utility
brew "gnu-tar"
# Task is a task runner/build tool that aims to be simpler and easier to use
brew "go-task"
# Language server for the Go language
brew "gopls"
# GNU grep, egrep and fgrep
brew "grep"
# Post-modern modal text editor
brew "helix"
# Kubernetes package manager
brew "helm"
# User-friendly cURL replacement (command-line HTTP client)
brew "httpie"
# Lightweight and flexible command-line JSON processor
brew "jq"
# Domain specific configuration language for defining JSON data
brew "jsonnet"
# Kubernetes CLI To Manage Your Clusters In Style!
brew "k9s"
# Colorize your kubectl output
brew "kubecolor"
# Tool that can switch between kubectl contexts easily and create aliases
brew "kubectx"
# Kubernetes command-line interface
brew "kubernetes-cli"
# Lazier way to manage everything docker
brew "lazydocker"
# Simple terminal UI for git commands
brew "lazygit"
# Terminal-based SSH manager
brew "lazyssh"
# Curses-based tool for viewing and analyzing log files
brew "lnav"
# Polyglot runtime manager (asdf rust clone)
brew "mise"
# Interactive cheatsheet tool for the command-line
brew "navi"
# Ambitious Vim-fork focused on extensibility and agility
brew "neovim"
# Modern shell for the GitHub era
brew "nushell"
# Prompt theme engine for any shell
brew "oh-my-posh"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Readline wrapper: adds readline support to tools that lack it
brew "rlwrap"
# Interactive find and replace in the terminal
brew "scooter"
# Static analysis and lint tool, for (ba)sh scripts
brew "shellcheck"
# HTML Language Server & Templating Language Library
brew "superhtml"
# TOML toolkit written in Rust
brew "taplo"
# Simplified and community-driven man pages
brew "tlrc"
# TOML formatter, linter and language server
brew "tombi"
# Language Server Protocol implementation for TypeScript wrapping tsserver
brew "typescript-language-server"
# Language servers for HTML, CSS, JavaScript, and JSON extracted from vscode
brew "vscode-langservers-extracted"
#Blazing fast terminal file manager written in Rust, based on async I/O
brew "yazi"
# Process YAML, JSON, XML, CSV and properties documents from the CLI
brew "yq"
# Pluggable terminal workspace, with terminal multiplexer as the base feature
brew "zellij"
# Shell extension to navigate your filesystem faster
brew "zoxide"

if config["work"]
  brew "atlas"
  brew "awscli"
  brew "crane"
  brew "direnv"
  brew "fluxcd"
  brew "helm-docs"
  brew "granted"
  brew "kubelogin"
end

# conditional brews (personal)
if !config["work"]
  # Library for Apple Binary- and XML-Property Lists
  brew "libplist"
  # CLI for out-of-band management of Kubernetes nodes created by Talos
  brew "talosctl"
end

# Application uninstaller
cask "appcleaner", args: { appdir: "/Applications" }
# Web browser
cask "firefox", args: { appdir: "/Applications" }
cask "font-maple-mono"
cask "font-maple-mono-nl-nf-cn"
# Terminal emulator that uses platform-native UI and GPU acceleration
cask "ghostty", args: { appdir: "/Applications" }
# Utility to hide menu bar items
cask "hiddenbar", args: { appdir: "/Applications" }
# HTTP and GraphQL Client
cask "insomnia", args: { appdir: "/Applications" }
# Knowledge base that works on top of a local folder of plain text Markdown files
cask "obsidian", args: { appdir: "/Applications" }
# Tiling window manager
cask "omniwm"
# Tool to reverse the direction of scrolling
cask "scroll-reverser", args: { appdir: "/Applications" }
# Music streaming service
cask "spotify", args: { appdir: "/Applications" }
# Application launcher and command palette
cask "vicinae"
# Multiplayer code editor
cask "zed", args: { appdir: "/Applications" }
# Redis GUI built with Rust and GPUI
cask "zedis"

if config["work"]

end

# personal casks
if !config["work"]
  # Voice and text chat software
  cask "discord", args: { appdir: "/Applications" }
  # Window peeking utility app
  cask "dockdoor"
  # Remote desktop and second display tool
  cask "duet"
  # Replacement for Docker Desktop
  cask "orbstack", args: { appdir: "/Applications" }
  # Instant messaging application focusing on security
  cask "signal", args: { appdir: "/Applications" }
  # CP210x USB to UART Bridge VCP Driver
  cask "silicon-labs-vcp-driver"
  # Mesh VPN based on WireGuard
  cask "tailscale-app"
  # Multimedia player
  cask "vlc", args: { appdir: "/Applications" }
  # Binary releases of VS Code without MS branding/telemetry/licensing
  cask "vscodium"
  # VPN client for secure internet access and private browsing
  cask "windscribe", args: { appdir: "/Applications" }
  # Video communication and virtual meeting platform
  # zoom is installed via mdm on a work system
  cask "zoom", args: { appdir: "/Applications" }
end
vscode "bodil.file-browser"
vscode "catppuccin.catppuccin-vsc"
vscode "esbenp.prettier-vscode"
vscode "golang.go"
vscode "jacobdufault.fuzzy-search"
vscode "kahole.magit"
vscode "vscodevim.vim"
vscode "vspacecode.vspacecode"
vscode "vspacecode.whichkey"
go "cmd/go"
go "cmd/gofmt"
