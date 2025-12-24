# Getting Started with PyTorch Tutorial Course

Welcome! This guide will help you get started with the PyTorch tutorial course.

## ⚡ Quick Start (5 minutes)

```bash
# 1. Navigate to the course directory
cd torch

# 2. Install dependencies
pip install -r requirements.txt

# 3. Start Jupyter
jupyter notebook

# 4. Open basics/01_tensors.ipynb and start learning!
```

## 📋 Prerequisites

### Required
- **Python 3.8+**: Check with `python --version`
- **pip**: Package manager (usually comes with Python)
- **8GB RAM**: Minimum for comfortable learning
- **10GB disk space**: For course materials and datasets

### Recommended
- **GPU**: NVIDIA GPU with CUDA support (optional but recommended)
- **16GB RAM**: For advanced topics
- **50GB disk space**: For large datasets and models

### Knowledge Prerequisites
- **Python basics**: Variables, loops, functions, classes
- **NumPy basics**: Arrays, basic operations (helpful but not required)
- **Math basics**: Linear algebra, calculus (helpful for understanding theory)

## 🛠️ Installation Guide

### Option 1: Using pip (Recommended)

```bash
# Create virtual environment
python -m venv pytorch_env
source pytorch_env/bin/activate  # On Windows: pytorch_env\\Scripts\\activate

# Install PyTorch and dependencies
pip install -r requirements.txt

# Verify installation
python -c "import torch; print(f'PyTorch {torch.__version__} installed!')"
```

### Option 2: Using conda

```bash
# Create conda environment
conda create -n pytorch_course python=3.10
conda activate pytorch_course

# Install PyTorch (CPU version)
conda install pytorch torchvision torchaudio cpuonly -c pytorch

# Or GPU version (CUDA 11.8)
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia

# Install other dependencies
pip install jupyter matplotlib pandas scikit-learn tqdm
```

### Option 3: Google Colab (No Installation)

If you don't want to install anything locally:

1. Go to [Google Colab](https://colab.research.google.com/)
2. Upload notebooks from this course
3. PyTorch is pre-installed!
4. Free GPU access available

## 🎯 Learning Path

### For Complete Beginners

**Week 1-2: Basics**
- Day 1-2: `01_tensors.ipynb` (understand tensors)
- Day 3-4: `02_autograd.ipynb` (gradients)
- Day 5-6: `03_datasets.ipynb` (data loading)
- Day 7-9: `04_neural_networks.ipynb` (build networks)
- Day 10-14: `05_training_basics.ipynb` (train models)

**Week 3-4: Intermediate**
- Start with `intermediate/01_cnn.ipynb`
- Complete one notebook per 2-3 days
- Build projects as you learn

**Week 5+: Advanced & Specialization**
- Choose topics based on interest
- Work on personal projects
- Read research papers

### For Those with ML Background

**Fast Track (2 weeks)**
- Day 1: Basics 01-03 (skim if comfortable)
- Day 2-3: Basics 04-05 (focus on PyTorch specifics)
- Day 4-7: All intermediate notebooks
- Day 8-14: Selected advanced topics

### For Quick Reference

If you just need a quick lookup:
1. Open `QUICK_REFERENCE.md`
2. Search for the topic
3. Copy-paste code examples

## 📚 Course Structure

```
BASICS (15-20 hours)
├── 01_tensors.ipynb         ⭐ Start here!
├── 02_autograd.ipynb        ⭐ Critical for understanding
├── 03_datasets.ipynb
├── 04_neural_networks.ipynb
└── 05_training_basics.ipynb ⭐ Build your first model

INTERMEDIATE (25-30 hours)
├── 01_cnn.ipynb             ⭐ For computer vision
├── 02_rnn.ipynb             ⭐ For sequences/NLP
├── 03_advanced_training.ipynb
├── 04_transfer_learning.ipynb
├── 05_evaluation.ipynb
└── 06_data_advanced.ipynb

ADVANCED (40-50 hours)
├── 01_transformers.ipynb    ⭐ Modern NLP
├── 02_gans.ipynb           ⭐ Generative models
├── 03_architectures.ipynb
├── 04_custom_modules.ipynb
├── 05_distributed.ipynb    ⭐ For large models
├── 06_optimization.ipynb   ⭐ For production
└── 07_reinforcement_learning.ipynb

ML ALGORITHMS (15-20 hours)
├── 01_linear_models.ipynb
├── 02_trees.ipynb
├── 03_svm.ipynb
├── 04_clustering.ipynb
├── 05_dimensionality_reduction.ipynb
└── 06_ensembles.ipynb
```

## 💡 Study Tips

### 1. Type the Code

**Don't just read!** Type every example yourself. This builds muscle memory and understanding.

### 2. Experiment

After each section:
- Change hyperparameters
- Try different architectures
- Use different datasets
- Break things and fix them

### 3. Do the Exercises

Every notebook has practice exercises. **Do them!** They reinforce learning.

### 4. Build Projects

Apply what you learn:
- **After Basics**: Build a simple classifier
- **After Intermediate**: Build a CNN for your own images
- **After Advanced**: Build something novel

### 5. Take Notes

Keep a personal cheat sheet of:
- Common patterns
- Things that confused you
- Useful code snippets

### 6. Join Communities

- [PyTorch Forums](https://discuss.pytorch.org/)
- [r/MachineLearning](https://reddit.com/r/MachineLearning)
- [r/pytorch](https://reddit.com/r/pytorch)
- Discord servers for ML

## 🐛 Troubleshooting

### "ImportError: No module named 'torch'"

```bash
pip install torch torchvision
```

### "CUDA out of memory"

```python
# Reduce batch size
train_loader = DataLoader(dataset, batch_size=32)  # Try 16 or 8

# Clear cache
torch.cuda.empty_cache()

# Use CPU instead
device = 'cpu'
```

### "Notebook kernel keeps dying"

- Close other applications
- Reduce batch size
- Use smaller models for testing
- Add more RAM/swap space

### "Training is very slow"

- Check if GPU is being used: `torch.cuda.is_available()`
- Use DataLoader with `num_workers=4`
- Use mixed precision training (advanced)
- Reduce model size for testing

## 🎓 Completion Checklist

Track your progress:

### Basics ✅
- [ ] Understand tensors and operations
- [ ] Can explain autograd
- [ ] Know how to load data
- [ ] Can build simple networks
- [ ] Trained at least one model

### Intermediate ✅
- [ ] Built a CNN
- [ ] Built an RNN/LSTM
- [ ] Implemented advanced training techniques
- [ ] Used transfer learning
- [ ] Evaluated models properly

### Advanced ✅
- [ ] Understand transformers
- [ ] Built a GAN
- [ ] Implemented custom layers
- [ ] Trained on multiple GPUs (if available)
- [ ] Optimized a model for production

### Projects ✅
- [ ] Built image classifier
- [ ] Built text classifier
- [ ] Implemented paper from scratch
- [ ] Deployed model to production
- [ ] Contributed to open source

## 📖 What's Next?

After completing this course:

1. **Read Papers**: [Papers with Code](https://paperswithcode.com/)
2. **Kaggle Competitions**: Apply skills to real problems
3. **Open Source**: Contribute to PyTorch ecosystem
4. **Specialization**: Focus on vision, NLP, or RL
5. **Research**: Push the boundaries of AI

## 🆘 Getting Help

1. **Check QUICK_REFERENCE.md** first
2. **Search in COURSE_INDEX.md** for specific topics
3. **Look at notebook examples**
4. **Google the error message**
5. **Ask on PyTorch forums**

## 🎉 Ready to Start?

```bash
# Let's go!
cd torch
jupyter notebook
# Open basics/01_tensors.ipynb
```

**Happy Learning! 🚀**

---

*Remember: Everyone was a beginner once. Take your time, ask questions, and enjoy the journey!*

