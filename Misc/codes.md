1. load only requires_grad

```python
filter(lambda p: p.requires_grad, net_G.parameters())
```

2. lr scheduler

```python
>>> scheduler = MultiStepLR(optimizer, milestones=[30,80], gamma=0.1)
>>> for epoch in range(100):
>>>     train(...)
>>>     validate(...)
>>>     scheduler.step()
```

3. count_parameters

```python
def count_parameters(network):
    return sum(p.numel() for p in network.parameters()
```

4. network initialization

```python
classname = m.__class__.__name__
    if (
        classname.find("Conv2d") != -1
        and hasattr(m, "weight")
        or classname.find("Conv2d") == -1
        and classname.find("Conv1d") != -1
        and hasattr(m, "weight")
    ):
        torch.nn.init.normal_(m.weight.data, 0.0, 0.02)
    if (
        classname.find("BatchNorm2d") != -1
        or classname.find("BatchNorm2d") == -1
    ):
        torch.nn.init.normal_(m.weight.data, 1.0, 0.02)
        torch.nn.init.constant_(m.bias.data, 0.0)
```

5. An @ symbol at the beginning of a line is used for class, function and method decorators.

If you see an @ in the middle of a line, that's a different thing, matrix multiplication.

In [18]: a @ b
Out[18]: tensor(8)

In [19]: a.dot(b)
Out[19]: tensor(8)

26 April 2021

```python
def slerp(val, low, high):
    low_norm = low/torch.norm(low, dim=1, keepdim=True)
    high_norm = high/torch.norm(high, dim=1, keepdim=True)
    omega = torch.acos((low_norm*high_norm).sum(1))
    so = torch.sin(omega)
    res = (torch.sin((1.0-val)*omega)/so).unsqueeze(1)*low + (to
rch.sin(val*omega)/so).unsqueeze(1) * high
    return res
```

Keep in mind though that if you plan on changing this expanded tensor inplace, you will need to use .clone() on it before so that it actually is a full tensor (with memory for each element). But even .expand().clone() should be faster than .repeat() I think.

Backprop-wise, they will give the exact same result.

The difference is that if the original dimension you want to expand is of size 1, you can use

```
torch.expand()
```

to do it without using extra memory.

If the dimension you want to expand is of size more than 1, then you actually want to repeat what is at that dimension and you should use

```
torch.repeat()
```

. It will use extra memory (there is no way around that).

Visualize Point Cloud

```python
fig = plt.figure(figsize=(3 * len(pcl_lst), 3))
    for idx, (pts, title) in enumerate(zip(pcl_lst, title_lst)):
        ax1 = fig.add_subplot(1, len(pcl_lst), 1 + idx, projection='3d')
        ax1.set_title(title)
        ax1.scatter(pts[:, 0], pts[:, 1], pts[:, 2], s=5)
        ax1.set_xlim(-1, 1)
        ax1.set_ylim(-1, 1)
        ax1.set_zlim(-1, 1)
    fig.canvas.draw()

    # grab the pixel buffer and dump it into a numpy array
    res = np.array(fig.canvas.renderer._renderer)
    res = np.transpose(res, (2, 0, 1))

    plt.close()
```

Gradient penalty

```python
def compute_gradient_penalty(D, real_samples, fake_samples):
    """Calculates the gradient penalty loss for WGAN GP"""
    # Random weight term for interpolation between real and fake samples
    alpha = Tensor(np.random.random((real_samples.size(0), 1, 1, 1)))
    # Get random interpolation between real and fake samples
    interpolates = (alpha * real_samples + ((1 - alpha) * fake_samples)).requires_grad_(True)
    d_interpolates = D(interpolates)
    fake = Variable(Tensor(real_samples.shape[0], 1).fill_(1.0), requires_grad=False)
    # Get gradient w.r.t. interpolates
    gradients = autograd.grad(
        outputs=d_interpolates,
        inputs=interpolates,
        grad_outputs=fake,
        create_graph=True,
        retain_graph=True,
        only_inputs=True,
    )[0]
    gradients = gradients.view(gradients.size(0), -1)
    gradient_penalty = ((gradients.norm(2, dim=1) - 1) ** 2).mean()
    return gradient_penalty
```

open3d with numpy

```python
# Pass xyz to Open3D.o3d.geometry.PointCloud and visualize
    pcd = o3d.geometry.PointCloud()
    pcd.points = o3d.utility.Vector3dVector(xyz)
    o3d.io.write_point_cloud("../../TestData/sync.ply", pcd)
```

save gridded images

```python
def save_image_grid(img, fname, drange, grid_size):
    lo, hi = drange
    img = np.asarray(img, dtype=np.float32)
    img = (img - lo) * (255 / (hi - lo))
    img = np.rint(img).clip(0, 255).astype(np.uint8)

    gw, gh = grid_size
    _N, C, H, W = img.shape
    img = img.reshape(gh, gw, C, H, W)
    img = img.transpose(0, 3, 1, 4, 2)
    img = img.reshape(gh * H, gw * W, C)

    assert C in [1, 3]
    if C == 1:
        PIL.Image.fromarray(img[:, :, 0], 'L').save(fname)
    if C == 3:
        PIL.Image.fromarray(img, 'RGB').save(fname)
```

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9695fabc-e829-4a14-ac69-ed5cc22c6cca/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9695fabc-e829-4a14-ac69-ed5cc22c6cca/Untitled.png)

```python
class RandomSamplePoints(object):
    def __init__(self, parameters):
        self.n_points = parameters["n_points"]

    def __call__(self, ptcloud):
        choice = np.random.permutation(ptcloud.shape[0])
        ptcloud = ptcloud[choice[: self.n_points]]

        if ptcloud.shape[0] < self.n_points:
            zeros = np.zeros((self.n_points - ptcloud.shape[0], 3))
            ptcloud = np.concatenate([ptcloud, zeros])

        return ptcloud
```

logger = logging.getLogger()

The set nofoldenable makes sure that when opening, files are "normal", i.e. not folded.

- > main()
(pdb) n
--Call--
[0] > /home/yunfan/miniconda3/envs/sparenet/lib/python3.7/threading.py(1274)_shutdown()
-> def _shutdown():
(pdb) n
[0] > /home/yunfan/miniconda3/envs/sparenet/lib/python3.7/threading.py(1283)_shutdown()
-> if _main_thread._is_stopped:
(pdb) w
[0] > /home/yunfan/miniconda3/envs/sparenet/lib/python3.7/threading.py(1283)_shutdown()
-> if _main_thread._is_stopped:
- > assert tlock is not None
(pdb) n
[0] > /home/yunfan/miniconda3/envs/sparenet/lib/python3.7/threading.py(1292)_shutdown()
-> assert tlock.locked()
(pdb) n
[0] > /home/yunfan/miniconda3/envs/sparenet/lib/python3.7/threading.py(1293)_shutdown()
-> tlock.release()
(pdb) n
[0] > /home/yunfan/miniconda3/envs/sparenet/lib/python3.7/threading.py(1294)_shutdown()
-> _main_thread._stop()

```python
foreach folder in *; do ls $folder/* | wc -l ; done
```

to list file number in each folder

verbose set command/aliases? to check the last setting in the file

Try something like :set formatoptions-=t. The t option will insert line breaks to make text wrap at the width set by textwidth.

formatoptions vim default tcq

t autowrap text using textwidth

c autowrap comment using textwidth

q allow using gq to format 

set vs setlocal

windows buffers in vim

1. A **buffer** is a file loaded into memory for editing.
2. All opened files are associated with a **buffer**.

A window in Vim is a graphical representation of a buffer, i.e. the way that we see the content of a buffer is in a window.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/12f3f1ef-ba9d-4725-b803-d314bcebd42c/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/12f3f1ef-ba9d-4725-b803-d314bcebd42c/Untitled.png)

In [2]: type(a)
Out[2]: int

In [3]: type(a).**name**
Out[3]: 'int'

```python
# AdaIn (AdaptiveInstanceNorm)
class AdaIn(nn.Module):
    '''
    adaptive instance normalization
    '''
    def __init__(self, n_channel):
        super().__init__()
        self.norm = nn.InstanceNorm2d(n_channel)
        
    def forward(self, image, style):
				# split style into 2 split along dim=1
        factor, bias = style.chunk(2, 1)
        result = self.norm(image)
        result = result * factor + bias  
        return result
```

[http://www.360doc.com/content/19/0726/16/32196507_851161514.shtml](http://www.360doc.com/content/19/0726/16/32196507_851161514.shtml)

How to randomly pick an item from dataset pytorch?

get a subset of a dataset

```
subset_indices = [0] # select your indices here as a list
subset = torch.utils.data.Subset(testset, subset_indices)
testloader_subset = torch.utils.data.DataLoader(subset, batch_size=1, num_workers=0, shuffle=False)
```

```
# Recovers the original `dataset` from the `dataloader`
dataset = dataloader.dataset
n_samples = len(dataset)

# Get a random sample
random_index = int(numpy.random.random()*n_samples)
single_example = dataset[random_index]
```

```python
	 20     |   train_loader = torch.utils.data.DataLoader(
   19     |   ¦   dataset=tr_dataset, batch_size=cfg.data.batch_size,
   18     |   ¦   shuffle=(train_sampler is None),
   17     |   ¦   num_workers=cfg.data.num_workers, pin_memory=True,
   16     |   ¦   sampler=train_sampler, drop_last=True, worker_init_fn=init_np_seed)
   15     |   test_loader = torch.utils.data.DataLoader(
   14     |   ¦   dataset=te_dataset, batch_size=cfg.data.batch_size, shuffle=False,
   13     |   ¦   num_workers=cfg.data.num_workers, pin_memory=True, drop_last=False,
   12     |   ¦   worker_init_fn=init_np_seed)
```

Trick to pdb in multiprocessing mode

```python
import sys
import pdb

class ForkedPdb(pdb.Pdb):
    """A Pdb subclass that may be used
    from a forked multiprocessing child

    """
    def interaction(self, *args, **kwargs):
        _stdin = sys.stdin
        try:
            sys.stdin = open('/dev/stdin')
            pdb.Pdb.interaction(self, *args, **kwargs)
        finally:
            sys.stdin = _stdin
```

KNN

```python
def knn(x, k: int):
    """
    inputs:
    - x: b x npoints1 x num_dims (partical_cloud)
    - k: int (the number of neighbor)

    outputs:
    - idx: int (neighbor_idx)
    """
    # x : (batch_size, feature_dim, num_points)
    # Retrieve nearest neighbor indices

    if torch.cuda.is_available():
        from knn_cuda import KNN

        ref = x.transpose(2, 1).contiguous()  # (batch_size, num_points, feature_dim)
        query = ref
        _, idx = KNN(k=k, transpose_mode=True)(ref, query)

    else:
        inner = -2 * torch.matmul(x.transpose(2, 1), x)
        xx = torch.sum(x ** 2, dim=1, keepdim=True)
        pairwise_distance = -xx - inner - xx.transpose(2, 1)
        idx = pairwise_distance.topk(k=k, dim=-1)[1]  # (batch_size, num_points, k)

    return id
```

```python
class ForkedPdb(pdb.Pdb):
    """A Pdb subclass that may be used
    from a forked multiprocessing child

    """
    def interaction(self, *args, **kwargs):
        _stdin = sys.stdin
        try:
            sys.stdin = open('/dev/stdin')
            pdb.Pdb.interaction(self, *args, **kwargs)
        finally:
            sys.stdin = _stdin
```

```python

# Simple wrapper that applies EMA to a model. COuld be better done in 1.0 using
# the parameters() and buffers() module functions, but for now this works
# with state_dicts using .copy_
class ema(object):
  def __init__(self, source, target, decay=0.9999, start_itr=0):
    self.source = source
    self.target = target
    self.decay = decay
    # Optional parameter indicating what iteration to start the decay at
    self.start_itr = start_itr
    # Initialize target's params to be source's
    self.source_dict = self.source.state_dict()
    self.target_dict = self.target.state_dict()
    print('Initializing EMA parameters to be source parameters...')
    with torch.no_grad():
      for key in self.source_dict:
        self.target_dict[key].data.copy_(self.source_dict[key].data)
        # target_dict[key].data = source_dict[key].data # Doesn't work!

  def update(self, itr=None):
    # If an iteration counter is provided and itr is less than the start itr,
    # peg the ema weights to the underlying weights.
    if itr and itr < self.start_itr:
      decay = 0.0
    else:
      decay = self.decay
    with torch.no_grad():
      for key in self.source_dict:
        self.target_dict[key].data.copy_(self.target_dict[key].data * decay 
                                     + self.source_dict[key].data * (1 - decay))
```

[https://github.com/ajbrock/BigGAN-PyTorch/blob/master/utils.py#L614](https://github.com/ajbrock/BigGAN-PyTorch/blob/master/utils.py#L614)

Check gradient norms in each layer

```python
for name, param in model.named_parameters():
    print(name, param.grad.norm())
```