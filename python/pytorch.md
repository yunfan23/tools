19 Mar 2021

1. Check the variables passed to current function

pdb command a(rgs) to print the argument list of the current function

2. worker_init_fn???

worker*init_fn=\_worker_init_fn*()

`def _worker_init_fn_(): torch_seed = torch.initial_seed() np_seed = torch_seed // 2**32-1 random.seed(torch_seed) np.random.seed(np_seed)`

3. DistributedDataParallel

我发现我的代码中有一处很隐蔽的地方会导致这种情况发生：当你用

`checkpoint = torch.load("checkpoint.pth") model.load_state_dict(checkpoint["state_dict"])`

这样 load 一个 pretrained model 的时候，torch.load() 会默认把 load 进来的数据放到 0 卡上，这样 4 个进程全部会在 0 卡占用一部分显存。

解决的方法也很简单，就是把 load 进来的数据 map 到 cpu 上：

`checkpoint = torch.load("checkpoint.pth", map_location=torch.device('cpu')) model.load_state_dict(checkpoint["state_dict"])`

4. scheduler.step 要在 optimizer.step 前执行

5. git submodule add [https://github.com/ThibaultGROUEIX/ChamferDistancePytorch](https://github.com/ThibaultGROUEIX/ChamferDistancePytorch)

6. cannont fine tensorboard

tensorboardX 是在 tensorboard 的基础上做出来，需要 tensorflow 支持

pip install tensorflow

20 Mar 2021

- [ ] what is the meaning of numerical stability?

How to check the CUDA version?

1. nvcc -V or nvcc —version
1. cat /usr/local/cuda/version.txt
1. cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2

[CUDA](https://www.notion.so/2b311da656104a54bc4d003f7dcaceb5)

1. CUDA version issue

Conda variable cannot be copied, but can be cloned.

conda create --name new_name —copy --clone old_name

This command re-download the packages; it can be disabled using —offline flag

Need to deactivate the old_name before remove the old_name

CUDA has 2 primary APIs, the runtime and the driver API. Both have a corresponding version (e.g. 8.0, 9.0, etc.)

The necessary support for the driver API (e.g. libcuda.so on linux) is installed by the GPU driver installer.

The necessary support for the runtime API (e.g. libcudart.so on linux, and also `nvcc`) is installed by the CUDA toolkit installer (which may also have a GPU driver installer bundled in it).

In any event, the (installed) driver API version may not always match the (installed) runtime API version, especially if you install a GPU driver independently from installing CUDA (i.e. the CUDA toolkit).

The `nvidia-smi` tool gets installed by the GPU driver installer, and generally has the GPU driver in view, not anything installed by the CUDA toolkit installer.

Recently (somewhere between 410.48 and 410.73 driver version on linux) the powers-that-be at NVIDIA decided to add reporting of the CUDA Driver API version installed by the driver, in the output from `nvidia-smi`.

This has no connection to the installed CUDA runtime version.

`nvcc`, the CUDA compiler-driver tool that is installed with the CUDA toolkit, will always report the CUDA runtime version that it was built to recognize. It doesn't know anything about what driver version is installed, or even if a GPU driver is installed.

Therefore, by design, these two numbers don't necessarily match, as they are reflective of two different things.

conda install pytorch torchvision cudatoolkit=10.2 -c pytorch will install CUDA 10.2 and cudnn binaries within the Conda environment, so the system-installed CUDA 11 will not be used at all

You don't have to deal with installing CUDA and cuDNN manaually at the system wide level

7 Mar 2021

ImportError: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.21' not found

**Install gcc and g++**

```
sudo apt install g++-5
sudo apt install gcc-5

```

**Change the symlink to point to gcc 5 and g++ 5**

```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++
```

update-alternatives - maintain symbolic links determining default commands

7 March 2021

1. PointFlow Env setup

In file [install.sh](http://install.sh/), I changed into c++14, pytorch=1.4.0, torchvision=0.5.0. It seems work well now. Thank you

conda install pytorch==1.0.1 torchvision==0.2.2 cudatoolkit=10.0 -c pytorch

conda install matplotlib tqdm scikit-learn -ypip install pillow==5.0.0

pip install scipy==1.0.1

pip install numpy==1.16.4

pip install tensorflow-gpu==1.13.1

pip install tensorboardX==1.7

pip install torchdiffeq==0.0.1

Lesson Learnt: better to record all pip install module/package versions

k80 has compute compatibility 3.7 (according to this page [https://developer.nvidia.com/cuda-gpus#compute](https://developer.nvidia.com/cuda-gpus#compute)). So you need to set the correct CUDA_ARCH parameter in the make file. I.e. add the following line-gencode arch=compute_37,code=sm_37.

[https://developer.nvidia.com/cuda-gpus#compute

open3d has no attribute geometry.

I installed open3d 0.9.0 and it seems to have solved it

conda search to search available package/module

```
conda search "open3d-admin::**[name=open3d]*" to search the open3d from open3d-admin
```

Activate Python Env

```
C:/ProgramData/Anaconda3/Scripts/activate

next(model.parameters()).is_cuda
```

How to check the CUDA version?

1. ```
   nvcc -V or nvcc —version
   cat /usr/local/cuda/version.txt
   cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
   ```

_20 Apr 2021_

Size() function in torch returns torch.Size. The returned value is a subclass of _tuple_.

\* is called _iterative unpacking_

    *a = [1, 2]
    ^

SyntaxError: starred assignment target must be in a list or tuple

`*a, = [1, 2]`

`type(a) list`

If we try to use the `*` operator to pack several values into a single variable, then we need to use the singleton `tuple` syntax

#### Merging Iterables With the \* Operator

use the iterable unpacking operator, `*`, when defining sequences to unpack the elements of a subsequence (or iterable) into the final sequence.

### Unpacking Dictionaries With the \*\* Operator

in the context of unpacking in Python, the **\*\*** operator is called the dictionary unpacking operator.

if the dictionarieds to merge have repeated or common keys, then the values of the right-most dictionary will override the values of the left-most dictionary.

In function definition:

`args` and `kwargs`, are optional and automatically default to `()` and `{}` respectively

## stack vs cat

```
stack
```

> Concatenates sequence of tensors along a **new dimension**.

```
cat
```

> Concatenates the given sequence of seq tensors **in the given dimension**.

So if `A` and `B` are of shape (3, 4), `torch.cat([A, B], dim=0)` will be of shape (6, 4) and `torch.stack([A, B], dim=0)` will be of shape (2, 3, 4).

## Matrix Operator

\* is element-wise product operator \
`matmul` is matrix multiply \
`bmm` is batch matrix multiply

BatchNorm1d \
AdaptiveAvgPool1d \
`self.register_buffer`

