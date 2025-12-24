# PyTorch Tutorial Course - Complete Guide

<div align="center">

![PyTorch](https://img.shields.io/badge/PyTorch-2.1+-EE4C2C?logo=pytorch&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.8+-3776AB?logo=python&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Notebooks](https://img.shields.io/badge/Notebooks-24-orange.svg)

**A comprehensive, hands-on PyTorch course from basics to advanced topics**

[Getting Started](#getting-started) • [Course Structure](#course-structure) • [Installation](#installation) • [Usage](#usage)

</div>

---

## 📚 About This Course

This is a **complete PyTorch tutorial course** designed to take you from beginner to advanced practitioner. The course includes:

- ✅ **24 comprehensive Jupyter notebooks**
- ✅ **Detailed explanations** with ASCII diagrams
- ✅ **Hands-on code examples** you can run immediately
- ✅ **Practice exercises** at the end of each notebook
- ✅ **Real-world projects** and implementations
- ✅ **ML algorithms** implemented in PyTorch
- ✅ **Best practices** and common pitfalls

## 🎯 Who Is This For?

- **Beginners**: Start with basics, no prior PyTorch knowledge required
- **Intermediate**: Deepen your understanding with CNN, RNN, and training techniques
- **Advanced**: Master transformers, GANs, and distributed training
- **ML Engineers**: Learn to implement classical ML algorithms in PyTorch
- **Researchers**: Understand cutting-edge architectures and techniques

## 📖 Course Structure

The course is organized into four main sections:

### 🟢 Basics (5 notebooks)

Master the fundamentals of PyTorch:

1. **Tensors and Operations** - Core data structure and operations
2. **Autograd** - Automatic differentiation engine
3. **Datasets and DataLoaders** - Efficient data loading
4. **Neural Network Basics** - Building blocks (layers, activations, loss)
5. **Training Basics** - Complete training pipeline

**Time**: ~15-20 hours | **Prerequisites**: Basic Python

### 🟡 Intermediate (6 notebooks)

Build practical deep learning skills:

1. **CNN** - Convolutional Neural Networks
2. **RNN** - Recurrent Neural Networks (LSTM, GRU)
3. **Advanced Training** - LR scheduling, regularization, mixed precision
4. **Transfer Learning** - Pretrained models and fine-tuning
5. **Evaluation** - Metrics, confusion matrices, ROC curves
6. **Advanced Data** - Custom augmentation, imbalanced data

**Time**: ~25-30 hours | **Prerequisites**: Basics section

### 🔴 Advanced (7 notebooks)

Master state-of-the-art techniques:

1. **Transformers** - Attention mechanisms, BERT, GPT concepts
2. **GANs** - Generative Adversarial Networks
3. **Advanced Architectures** - ResNet, DenseNet, U-Net
4. **Custom Modules** - Hooks, custom autograd functions
5. **Distributed Training** - Multi-GPU, DDP
6. **Model Optimization** - Quantization, pruning, TorchScript
7. **Reinforcement Learning** - DQN, policy gradients

**Time**: ~40-50 hours | **Prerequisites**: Intermediate section

### 🤖 ML Algorithms (6 notebooks)

Classical ML with PyTorch:

1. **Linear Models** - Regression, classification
2. **Tree-Based Models** - Decision trees, random forests
3. **SVM** - Support vector machines
4. **Clustering** - K-means, DBSCAN, deep clustering
5. **Dimensionality Reduction** - PCA, t-SNE, autoencoders
6. **Ensemble Methods** - Bagging, boosting, stacking

**Time**: ~15-20 hours | **Prerequisites**: Basics section

## 🚀 Getting Started

### Prerequisites

- Python 3.8 or higher
- Basic understanding of Python programming
- Familiarity with NumPy (helpful but not required)
- Linear algebra basics (vectors, matrices)

### Installation

1. **Clone or download this repository**
2. **Create a virtual environment** (recommended)
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```
3. **Install dependencies**
```bash
make install
```
4. **Download datasets**
```bash
make download-data
```
5. **Verify installation**
```bash
make check-cuda
```

## 💻 Usage

### Start Jupyter

```bash
jupyter notebook
# or
jupyter lab
```

### Run Notebooks in Order

Start with `basics/01_tensors.ipynb` and progress through each section.

### Run Tests (Automatic Integrity Check)
```bash
make test
```
This script verifies that all 24 notebooks are valid and can be loaded correctly.

### Quick Reference

Keep `QUICK_REFERENCE.md` open while coding - it contains all essential PyTorch commands!

## 📂 Repository Structure

```
torch/
├── README.md                          # This file
├── COURSE_INDEX.md                    # Detailed course index
├── QUICK_REFERENCE.md                 # PyTorch quick reference
├── requirements.txt                   # Python dependencies
├── Makefile                           # Automation tasks
│
├── basics/                            # Fundamentals
│   ├── 01_tensors.ipynb
│   ├── 02_autograd.ipynb
│   ├── 03_datasets.ipynb
│   ├── 04_neural_networks.ipynb
│   └── 05_training_basics.ipynb
│
├── intermediate/                      # Practical skills
│   ├── 01_cnn.ipynb
│   ├── 02_rnn.ipynb
│   ├── 03_advanced_training.ipynb
│   ├── 04_transfer_learning.ipynb
│   ├── 05_evaluation.ipynb
│   └── 06_data_advanced.ipynb
│
├── advanced/                          # State-of-the-art
│   ├── 01_transformers.ipynb
│   ├── 02_gans.ipynb
│   ├── 03_architectures.ipynb
│   ├── 04_custom_modules.ipynb
│   ├── 05_distributed.ipynb
│   ├── 06_optimization.ipynb
│   └── 07_reinforcement_learning.ipynb
│
├── ml_algorithms/                     # Classical ML
│   ├── 01_linear_models.ipynb
│   ├── 02_trees.ipynb
│   ├── 03_svm.ipynb
│   ├── 04_clustering.ipynb
│   ├── 05_dimensionality_reduction.ipynb
│   └── 06_ensembles.ipynb
│
└── scripts/                           # Utility scripts
    └── verify_notebooks.py            # Notebook integrity checker
```

## 🎓 Learning Path

### Path 1: Complete Beginner → Expert (Recommended)

1. Start with `basics/` (in order)
2. Complete `intermediate/` (in order)
3. Choose specialization from `advanced/`
4. Supplement with `ml_algorithms/` as needed

**Duration**: 95-120 hours

### Path 2: Computer Vision Specialist

1. Basics → Intermediate 01 (CNN) → Advanced 02 (GANs), 03 (Architectures)
2. **Projects**: Image classification, object detection, style transfer

**Duration**: 50-60 hours

### Path 3: Natural Language Processing

1. Basics → Intermediate 02 (RNN) → Advanced 01 (Transformers)
2. **Projects**: Text classification, language modeling, machine translation

**Duration**: 50-60 hours

### Path 4: Production ML Engineer

1. Basics → All Intermediate → Advanced 05 (Distributed), 06 (Optimization)
2. **Focus**: Deployment, optimization, scalability

**Duration**: 60-70 hours

## 📊 What You'll Build

Throughout the course, you'll implement:

- ✅ MNIST digit classifier
- ✅ CIFAR-10 image classifier
- ✅ Text sentiment analyzer
- ✅ Image-to-image translator (GAN)
- ✅ Transformer for sequence modeling
- ✅ Object detector
- ✅ Autoencoder for anomaly detection
- ✅ Reinforcement learning agent

## 🌟 Key Features

### Comprehensive Coverage

- From basic tensors to advanced transformers
- Theory + implementation for every topic
- Real-world examples and best practices

### Hands-On Learning

- Every concept illustrated with code
- Interactive Jupyter notebooks
- Practice exercises with solutions

### Visual Learning

- ASCII diagrams for architecture
- Visualization of training progress
- Feature maps and attention weights

### Production-Ready

- Best practices throughout
- Model optimization techniques
- Deployment considerations

## 🛠️ Makefile Commands

```bash
make help          # Show all available commands
make install       # Install dependencies
make test          # Run all tests
make clean         # Clean up cache files
make format        # Format code
make notebook      # Start Jupyter notebook
make lab           # Start JupyterLab
```

## 📚 Additional Resources

### Official Documentation

- [PyTorch Documentation](https://pytorch.org/docs/)
- [PyTorch Tutorials](https://pytorch.org/tutorials/)
- [PyTorch Forums](https://discuss.pytorch.org/)

### Papers and Research

- [Papers with Code](https://paperswithcode.com/)
- [arXiv](https://arxiv.org/list/cs.LG/recent)

### Community

- [PyTorch GitHub](https://github.com/pytorch/pytorch)
- [PyTorch Examples](https://github.com/pytorch/examples)
- [PyTorch Lightning](https://www.pytorchlightning.ai/)

## 🤝 Contributing

This is a learning resource. Feel free to:

- Report issues or errors
- Suggest improvements
- Add more examples
- Translate to other languages

## 📝 License

This course is provided for educational purposes. All code is available under the MIT License.

## ⭐ Acknowledgments

This course synthesizes knowledge from:

- PyTorch official tutorials
- Research papers and textbooks
- Community best practices
- Real-world production experience

## 📧 Contact & Support

Questions? Suggestions?

- Open an issue
- Check existing notebooks for examples
- Refer to `QUICK_REFERENCE.md` for quick answers

---

<div align="center">

**Happy Learning! 🚀**

*Master PyTorch • Build Amazing AI Applications • Join the Deep Learning Revolution*

</div>

