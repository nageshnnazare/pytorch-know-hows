.PHONY: help install test clean format notebook lab check-cuda count-notebooks list-notebooks

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)PyTorch Tutorial Course - Available Commands$(NC)"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"; printf "$(GREEN)Usage:$(NC)\n  make $(YELLOW)<target>$(NC)\n\n$(GREEN)Targets:$(NC)\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  $(YELLOW)%-20s$(NC) %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

install: ## Install all dependencies
	@echo "$(BLUE)Installing PyTorch and dependencies...$(NC)"
	pip3 install --upgrade pip
	pip3 install -r requirements.txt
	@echo "$(GREEN)✓ Installation complete!$(NC)"
	@make check-cuda

check-cuda: ## Check CUDA availability
	@echo "$(BLUE)Checking PyTorch installation...$(NC)"
	@python3 -c "import torch; print(f'PyTorch version: {torch.__version__}')"
	@python3 -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}')"
	@python3 -c "import torch; print(f'CUDA version: {torch.version.cuda}') if torch.cuda.is_available() else None"
	@python3 -c "import torch; print(f'cuDNN version: {torch.backends.cudnn.version()}') if torch.cuda.is_available() else None"
	@python3 -c "import torch; print(f'Number of GPUs: {torch.cuda.device_count()}') if torch.cuda.is_available() else None"

test: ## Run tests on all notebooks (integrity check)
	@echo "$(BLUE)Testing notebooks (integrity)...$(NC)"
	@python3 scripts/verify_notebooks.py

test-execution: ## Run and verify all notebooks (runtime check - may take a while)
	@echo "$(BLUE)Verifying notebook execution...$(NC)"
	@python3 scripts/verify_notebooks.py --execute --timeout 300

count-notebooks: ## Count total notebooks
	@echo "$(BLUE)Counting notebooks...$(NC)"
	@python3 -c "import glob; \
	basics = len(glob.glob('basics/*.ipynb')); \
	inter = len(glob.glob('intermediate/*.ipynb')); \
	adv = len(glob.glob('advanced/*.ipynb')); \
	ml = len(glob.glob('ml_algorithms/*.ipynb')); \
	total = basics + inter + adv + ml; \
	print('Basics: ' + str(basics)); \
	print('Intermediate: ' + str(inter)); \
	print('Advanced: ' + str(adv)); \
	print('ML Algorithms: ' + str(ml)); \
	print('Total: ' + str(total) + ' notebooks')"

list-notebooks: ## List all notebooks with descriptions
	@echo "$(BLUE)Course Notebooks:$(NC)\n"
	@echo "$(GREEN)BASICS$(NC)"
	@ls -1 basics/*.ipynb 2>/dev/null | sed 's/basics\//  /' || echo "  No notebooks found"
	@echo ""
	@echo "$(GREEN)INTERMEDIATE$(NC)"
	@ls -1 intermediate/*.ipynb 2>/dev/null | sed 's/intermediate\//  /' || echo "  No notebooks found"
	@echo ""
	@echo "$(GREEN)ADVANCED$(NC)"
	@ls -1 advanced/*.ipynb 2>/dev/null | sed 's/advanced\//  /' || echo "  No notebooks found"
	@echo ""
	@echo "$(GREEN)ML ALGORITHMS$(NC)"
	@ls -1 ml_algorithms/*.ipynb 2>/dev/null | sed 's/ml_algorithms\//  /' || echo "  No notebooks found"

clean: ## Remove cache and temporary files
	@echo "$(BLUE)Cleaning up...$(NC)"
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name "*.pyo" -delete 2>/dev/null || true
	find . -type f -name ".DS_Store" -delete 2>/dev/null || true
	rm -rf data/processed/* 2>/dev/null || true
	rm -rf models/*.pth 2>/dev/null || true
	rm -rf *.log 2>/dev/null || true
	@echo "$(GREEN)✓ Cleanup complete!$(NC)"

format: ## Format python3 code in notebooks (requires black, nbqa)
	@echo "$(BLUE)Formatting code...$(NC)"
	@if command -v nbqa >/dev/null 2>&1 && command -v black >/dev/null 2>&1; then \
		nbqa black . ; \
		echo "$(GREEN)✓ Formatting complete!$(NC)"; \
	else \
		echo "$(YELLOW)⚠ Install nbqa and black: pip install nbqa black$(NC)"; \
	fi

notebook: ## Start Jupyter Notebook
	@echo "$(BLUE)Starting Jupyter Notebook...$(NC)"
	@echo "$(YELLOW)Press Ctrl+C to stop$(NC)"
	jupyter notebook

lab: ## Start JupyterLab (modern interface)
	@echo "$(BLUE)Starting JupyterLab...$(NC)"
	@echo "$(YELLOW)Press Ctrl+C to stop$(NC)"
	jupyter lab

download-data: ## Download common datasets
	@echo "$(BLUE)Downloading datasets...$(NC)"
	@python3 -c "from torchvision import datasets; \
	datasets.MNIST('./data', download=True); \
	datasets.CIFAR10('./data', download=True); \
	datasets.FashionMNIST('./data', download=True); \
	print('$(GREEN)✓ Datasets downloaded!$(NC)')"

info: ## Display course information
	@echo "$(BLUE)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(BLUE)║     PyTorch Tutorial Course - Complete Guide            ║$(NC)"
	@echo "$(BLUE)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(GREEN)Course Structure:$(NC)"
	@echo "  • Basics (5 notebooks) - Fundamentals"
	@echo "  • Intermediate (6 notebooks) - Practical skills"
	@echo "  • Advanced (7 notebooks) - State-of-the-art"
	@echo "  • ML Algorithms (6 notebooks) - Classical ML"
	@echo ""
	@echo "$(GREEN)Quick Start:$(NC)"
	@echo "  1. make install          # Install dependencies"
	@echo "  2. make check-cuda       # Verify setup"
	@echo "  3. make notebook         # Start learning!"
	@echo ""
	@echo "$(GREEN)Getting Help:$(NC)"
	@echo "  • make help             # All available commands"
	@echo "  • Open COURSE_INDEX.md  # Detailed course guide"
	@echo "  • Open QUICK_REFERENCE.md  # PyTorch cheat sheet"
	@echo ""
	@make count-notebooks

verify: ## Verify course integrity
	@echo "$(BLUE)Verifying course files...$(NC)"
	@test -f README.md && echo "$(GREEN)✓$(NC) README.md" || echo "$(RED)✗$(NC) README.md missing"
	@test -f COURSE_INDEX.md && echo "$(GREEN)✓$(NC) COURSE_INDEX.md" || echo "$(RED)✗$(NC) COURSE_INDEX.md missing"
	@test -f QUICK_REFERENCE.md && echo "$(GREEN)✓$(NC) QUICK_REFERENCE.md" || echo "$(RED)✗$(NC) QUICK_REFERENCE.md missing"
	@test -f requirements.txt && echo "$(GREEN)✓$(NC) requirements.txt" || echo "$(RED)✗$(NC) requirements.txt missing"
	@test -d basics && echo "$(GREEN)✓$(NC) basics/" || echo "$(RED)✗$(NC) basics/ missing"
	@test -d intermediate && echo "$(GREEN)✓$(NC) intermediate/" || echo "$(RED)✗$(NC) intermediate/ missing"
	@test -d advanced && echo "$(GREEN)✓$(NC) advanced/" || echo "$(RED)✗$(NC) advanced/ missing"
	@test -d ml_algorithms && echo "$(GREEN)✓$(NC) ml_algorithms/" || echo "$(RED)✗$(NC) ml_algorithms/ missing"
	@echo ""
	@make count-notebooks

requirements-update: ## Update requirements.txt with latest versions
	@echo "$(BLUE)Updating requirements...$(NC)"
	pip3 install --upgrade pip-tools
	pip-compile --upgrade requirements.txt
	@echo "$(GREEN)✓ Requirements updated!$(NC)"

# Default target
.DEFAULT_GOAL := info

