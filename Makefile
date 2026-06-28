.PHONY: help tree healthcheck

help:
	@echo "Available commands:"
	@echo "  make tree         - Show project tree"
	@echo "  make healthcheck  - Run local healthcheck"

tree:
	tree -a -L 3

healthcheck:
	./scripts/healthcheck.sh
