# PyTorch Quick Reference Guide

A comprehensive quick reference for PyTorch. Perfect for quick lookups and interview prep.

## 📦 Installation & Setup

```bash
# CPU version
pip install torch torchvision torchaudio

# CUDA 11.8
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# CUDA 12.1
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# Check installation
import torch
print(torch.__version__)
print(torch.cuda.is_available())
```

## 🔢 Tensor Basics

### Creating Tensors

```python
import torch

# From data
torch.tensor([1, 2, 3])
torch.tensor([[1, 2], [3, 4]], dtype=torch.float32)

# Zeros and ones
torch.zeros(2, 3)
torch.ones(2, 3)
torch.eye(3)  # Identity matrix

# Random
torch.rand(2, 3)  # Uniform [0, 1)
torch.randn(2, 3)  # Normal(0, 1)
torch.randint(0, 10, (2, 3))  # Random integers

# From numpy
import numpy as np
torch.from_numpy(np.array([1, 2, 3]))

# Like operations
x = torch.zeros(2, 3)
torch.zeros_like(x)
torch.ones_like(x)
torch.rand_like(x)
```

### Tensor Properties

```python
x = torch.randn(2, 3, 4)
x.shape  # torch.Size([2, 3, 4])
x.size()  # torch.Size([2, 3, 4])
x.dtype  # torch.float32
x.device  # cpu or cuda
x.requires_grad  # False
x.numel()  # 24 (total elements)
```

### Indexing & Slicing

```python
x = torch.randn(4, 5)
x[0]  # First row
x[:, 0]  # First column
x[0, :]  # First row (alternative)
x[1:3, :]  # Rows 1 and 2
x[[0, 2], :]  # Rows 0 and 2
x[x > 0]  # Boolean indexing
```

### Reshaping

```python
x = torch.randn(2, 3, 4)
x.view(2, 12)  # Reshape (requires contiguous)
x.reshape(2, 12)  # Reshape (handles non-contiguous)
x.view(-1)  # Flatten
x.unsqueeze(0)  # Add dimension at position 0
x.squeeze()  # Remove dimensions of size 1
x.transpose(0, 1)  # Swap dimensions
x.permute(2, 0, 1)  # Reorder dimensions
```

### Operations

```python
# Arithmetic
x + y, x - y, x * y, x / y
x.add(y), x.sub(y), x.mul(y), x.div(y)
x ** 2  # Power
torch.sqrt(x), torch.exp(x), torch.log(x)

# Matrix operations
x @ y  # Matrix multiplication
torch.mm(x, y)  # 2D matrix multiplication
torch.bmm(x, y)  # Batch matrix multiplication
torch.matmul(x, y)  # General matrix multiplication
x.T  # Transpose

# Aggregations
x.sum(), x.mean(), x.std(), x.var()
x.min(), x.max()
x.argmin(), x.argmax()
x.sum(dim=0)  # Sum along dimension

# Comparison
x > 0, x < 0, x == 0
torch.eq(x, y), torch.ne(x, y)
torch.gt(x, y), torch.lt(x, y)
```

### GPU Operations

```python
# Check CUDA
torch.cuda.is_available()
torch.cuda.device_count()
torch.cuda.get_device_name(0)

# Move to GPU
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
x = x.to(device)
x = x.cuda()  # Alternative

# Move to CPU
x = x.cpu()

# Create on GPU directly
x = torch.randn(2, 3, device='cuda')
```

## 🔄 Autograd

```python
# Enable gradient tracking
x = torch.randn(2, 3, requires_grad=True)

# Or enable later
x = torch.randn(2, 3)
x.requires_grad = True

# Forward pass
y = x ** 2
z = y.sum()

# Backward pass
z.backward()

# Access gradients
x.grad  # dz/dx

# Disable gradient
with torch.no_grad():
    y = x ** 2

# Detach from graph
y = x.detach()

# Zero gradients
x.grad.zero_()

# Context managers
torch.set_grad_enabled(False)
@torch.no_grad()
def inference(x):
    return model(x)
```

## 🧠 Neural Networks

### Basic Module

```python
import torch.nn as nn

class MyModel(nn.Module):
    def __init__(self):
        super(MyModel, self).__init__()
        self.layer1 = nn.Linear(10, 5)
        self.layer2 = nn.Linear(5, 1)
    
    def forward(self, x):
        x = torch.relu(self.layer1(x))
        x = self.layer2(x)
        return x

model = MyModel()
```

### Common Layers

```python
# Fully connected
nn.Linear(in_features, out_features)

# Convolutional
nn.Conv2d(in_channels, out_channels, kernel_size)
nn.Conv1d(in_channels, out_channels, kernel_size)
nn.Conv3d(in_channels, out_channels, kernel_size)

# Pooling
nn.MaxPool2d(kernel_size, stride)
nn.AvgPool2d(kernel_size, stride)
nn.AdaptiveAvgPool2d(output_size)

# Recurrent
nn.RNN(input_size, hidden_size, num_layers)
nn.LSTM(input_size, hidden_size, num_layers)
nn.GRU(input_size, hidden_size, num_layers)

# Normalization
nn.BatchNorm2d(num_features)
nn.LayerNorm(normalized_shape)
nn.GroupNorm(num_groups, num_channels)

# Dropout
nn.Dropout(p=0.5)
nn.Dropout2d(p=0.5)

# Activation
nn.ReLU(), nn.LeakyReLU(), nn.ELU()
nn.Sigmoid(), nn.Tanh()
nn.Softmax(dim=1)

# Attention
nn.MultiheadAttention(embed_dim, num_heads)
```

### Loss Functions

```python
# Classification
nn.CrossEntropyLoss()  # For logits
nn.NLLLoss()  # For log probabilities
nn.BCELoss()  # Binary cross-entropy
nn.BCEWithLogitsLoss()  # BCE with sigmoid

# Regression
nn.MSELoss()  # Mean squared error
nn.L1Loss()  # Mean absolute error
nn.SmoothL1Loss()  # Huber loss

# Custom
class CustomLoss(nn.Module):
    def forward(self, pred, target):
        return ((pred - target) ** 2).mean()
```

### Optimizers

```python
import torch.optim as optim

# SGD
optimizer = optim.SGD(model.parameters(), lr=0.01, momentum=0.9)

# Adam
optimizer = optim.Adam(model.parameters(), lr=0.001)

# AdamW (with weight decay)
optimizer = optim.AdamW(model.parameters(), lr=0.001, weight_decay=0.01)

# RMSprop
optimizer = optim.RMSprop(model.parameters(), lr=0.01)

# Learning rate scheduler
scheduler = optim.lr_scheduler.StepLR(optimizer, step_size=10, gamma=0.1)
scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, patience=5)
scheduler = optim.lr_scheduler.CosineAnnealingLR(optimizer, T_max=100)
```

## 🎯 Training Loop

```python
model.train()  # Set to training mode

for epoch in range(num_epochs):
    for batch_idx, (data, target) in enumerate(train_loader):
        # Move to device
        data, target = data.to(device), target.to(device)
        
        # Zero gradients
        optimizer.zero_grad()
        
        # Forward pass
        output = model(data)
        
        # Compute loss
        loss = criterion(output, target)
        
        # Backward pass
        loss.backward()
        
        # Update weights
        optimizer.step()
    
    # Update learning rate
    scheduler.step()
```

## 📊 Data Loading

```python
from torch.utils.data import Dataset, DataLoader
import torchvision.transforms as transforms

# Custom dataset
class CustomDataset(Dataset):
    def __init__(self, data, labels):
        self.data = data
        self.labels = labels
    
    def __len__(self):
        return len(self.data)
    
    def __getitem__(self, idx):
        return self.data[idx], self.labels[idx]

# DataLoader
dataset = CustomDataset(data, labels)
loader = DataLoader(dataset, batch_size=32, shuffle=True, num_workers=4)

# Transforms
transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.RandomHorizontalFlip(),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406],
                        std=[0.229, 0.224, 0.225])
])
```

## 💾 Saving & Loading

```python
# Save entire model
torch.save(model, 'model.pth')
model = torch.load('model.pth')

# Save state dict (recommended)
torch.save(model.state_dict(), 'model_weights.pth')
model.load_state_dict(torch.load('model_weights.pth'))

# Save checkpoint
torch.save({
    'epoch': epoch,
    'model_state_dict': model.state_dict(),
    'optimizer_state_dict': optimizer.state_dict(),
    'loss': loss,
}, 'checkpoint.pth')

# Load checkpoint
checkpoint = torch.load('checkpoint.pth')
model.load_state_dict(checkpoint['model_state_dict'])
optimizer.load_state_dict(checkpoint['optimizer_state_dict'])
epoch = checkpoint['epoch']
loss = checkpoint['loss']
```

## 🔍 Model Inspection

```python
# Model parameters
for name, param in model.named_parameters():
    print(name, param.shape)

# Total parameters
sum(p.numel() for p in model.parameters())

# Trainable parameters
sum(p.numel() for p in model.parameters() if p.requires_grad)

# Freeze/unfreeze layers
for param in model.parameters():
    param.requires_grad = False

# Model summary
print(model)

# Forward hook
def hook_fn(module, input, output):
    print(output.shape)

handle = model.layer1.register_forward_hook(hook_fn)
handle.remove()  # Remove hook
```

## 🎨 Torchvision

```python
import torchvision
from torchvision import models, datasets

# Pretrained models
model = models.resnet50(pretrained=True)
model = models.vgg16(pretrained=True)
model = models.efficientnet_b0(pretrained=True)

# Datasets
train_dataset = datasets.MNIST(root='./data', train=True, download=True)
train_dataset = datasets.CIFAR10(root='./data', train=True, download=True)
train_dataset = datasets.ImageFolder(root='./data/train')

# Transforms
from torchvision.transforms import functional as F
```

## ⚡ Performance Tips

```python
# Use GPU
device = torch.device('cuda')
model.to(device)

# Mixed precision training
from torch.cuda.amp import autocast, GradScaler
scaler = GradScaler()

with autocast():
    output = model(input)
    loss = criterion(output, target)

scaler.scale(loss).backward()
scaler.step(optimizer)
scaler.update()

# DataLoader workers
DataLoader(dataset, batch_size=32, num_workers=4, pin_memory=True)

# Non-blocking transfers
data = data.to(device, non_blocking=True)

# Gradient accumulation
for i, (data, target) in enumerate(loader):
    output = model(data)
    loss = criterion(output, target) / accumulation_steps
    loss.backward()
    
    if (i + 1) % accumulation_steps == 0:
        optimizer.step()
        optimizer.zero_grad()
```

## 🐛 Debugging

```python
# Check for NaN
torch.isnan(x).any()
torch.isinf(x).any()

# Gradient clipping
torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)

# Detect anomalies
torch.autograd.set_detect_anomaly(True)

# Print gradients
for name, param in model.named_parameters():
    if param.grad is not None:
        print(name, param.grad.abs().mean())
```

## 📈 Common Patterns

### Transfer Learning
```python
model = models.resnet50(pretrained=True)

# Freeze all layers
for param in model.parameters():
    param.requires_grad = False

# Replace final layer
model.fc = nn.Linear(model.fc.in_features, num_classes)

# Only train final layer
optimizer = optim.Adam(model.fc.parameters())
```

### Multi-GPU Training
```python
if torch.cuda.device_count() > 1:
    model = nn.DataParallel(model)

model.to(device)
```

### Evaluation Mode
```python
model.eval()
with torch.no_grad():
    for data, target in test_loader:
        output = model(data)
        # Compute metrics
```

## 🔗 Useful Links

- **Docs**: https://pytorch.org/docs/
- **Tutorials**: https://pytorch.org/tutorials/
- **Forums**: https://discuss.pytorch.org/
- **GitHub**: https://github.com/pytorch/pytorch

---

**Tip**: Keep this guide handy for quick reference during development!

