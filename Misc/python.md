## Must Install Packages
```
pip install ipdb
pip install pdbpp
pip install beeprint
pip install pynvim
```

## pdb tips
- create the .pdbrc in the working directory
- add predefined break points
- make use of aliases
-

SummaryWriter

- def add_scalar(tag, scalar_value, global_step)
- def add_scalars(tag, scalar_values/dict, global_step)
- def add_histogram(tag, scalar_values/dict, global_step)

autograd.grad

- If you are using backward() instead, simply do y.backward(torch.ones_like(y))

```python
v = x + 2
y = v ** 2

dy_dx = grad(outputs=y, inputs=x, grad_outputs=torch.ones_like(y))
print(f'dy/dx:\n {dy_dx}')

dv_dx = grad(outputs=v, inputs=x, grad_outputs=torch.ones_like(v))
print(f'dv/dx:\n {dv_dx}')
```

### egg file in python

The `.egg` file is a distribution format for Python packages. It’s just an alternative to a source code distribution or Windows `exe`. But note that for pure `Python`, the `.egg` file is completely cross-platform.

The `.egg` file itself is essentially a `.zip` file. If you change the extension to “`zip`”, you can see that it will have folders inside the archive.

Also, if you have an `.egg` file, you can install it as a package using `easy_install`

Example: To create an `.egg` file for a directory say `mymath` which itself may have several python scripts, do the following step:

```
# setup.py
from setuptools import setup, find_packages
setup(
    name = "mymath",
    version = "0.1",
    packages = find_packages()
    )

```

Then, from the terminal do:

```
 $ python setup.py bdist_egg

```

This will generate lot of outputs, but when it’s completed you’ll see that you have *three* new folders: *build*, *dist*, and *mymath.egg-info*. The only folder that we care about is the *dist* folder where you'll find your `.egg` file, **`mymath-0.1-py3.5.egg`** with your default python (installation) version number(mine here: 3.5)

## How to show the inputs of current function in pdb?

a(rgs)

## How to print the class arguments?

- training_set.__dict__
- var(training_set)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b7c02ccf-6a93-4ea2-833f-68e1416a875a/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b7c02ccf-6a93-4ea2-833f-68e1416a875a/Untitled.png)

# Writer will output to ./runs/ directory by default

```python
writer= SummaryWriter()
```

```python
zero_grad(set_to_none=False)
```

set_to_none (bool) – instead of setting to zero, set the grads to None.

torch.where(condition, x, y) → Tensor

Returns a tensor with the same size as input filled with fill_value. torch.full_like(input, fill_value) is equivalent to torch.full(input.size(), fill_value, dtype=input.dtype, layout=input.layout,

torch.sign(input, *, out=None) → Tensor Returns a new tensor with the signs of the elements of input.

SoftPlus is a smooth approximation to the ReLU function and can be used to constrain the output of a machine to always be positive.

One difference is that view() can only operate on contiguous tensor and the returned tensor is still contiguous. transpose() can operate both on contiguous and non-contiguous tensor. Unlike view(), the returned tensor may be not contiguous any more.

permute() and tranpose() are similar. transpose() can only swap two dimension. But permute() can swap all the dimensions.

tranpose() can be thought as a special case of permute() method in for 2D tensors.

id() function returns the identity of the object. This is an integer that is unique for the given object and remains constant during its lifetime.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b028de90-5983-4e7b-88d4-75e9f3cfd062/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b028de90-5983-4e7b-88d4-75e9f3cfd062/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d223786c-1168-4d64-a1ca-70a42f66d68d/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d223786c-1168-4d64-a1ca-70a42f66d68d/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/793ecd09-6ec7-4228-bd94-dd10b8e6e2a9/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/793ecd09-6ec7-4228-bd94-dd10b8e6e2a9/Untitled.png)

context manager: with

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d6a72355-850d-4155-8fb1-d1320698a2e7/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d6a72355-850d-4155-8fb1-d1320698a2e7/Untitled.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ddf3bb72-288f-4bf4-a290-625ab350561a/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ddf3bb72-288f-4bf4-a290-625ab350561a/Untitled.png)

Class __init__  and __call__

the instances behave like functions and can be called like a function

if this method is defined, x(arg1, arg2, ...) is a shorthand for x.**call**(arg1, arg2, ...).

eval

The eval() method parses the expression passed to this method and runs python expression (code) within the program.

numpy

np.fliplr: Flip the entries in each row in the left/right direction.

Almost everything in Python is an object, with its properties and methods.

A Class is like an object constructor, or a "blueprint" for creating objects.

The self parameter is a reference to the current instance of the class, and is used to access variables that belongs to the class.

object is a (global) variable. By default it is bound to a built-in class which is the root of the type hierarchy. Everything built-in that isn't a keyword or operator is an identifier.

```
class Classname(object):
    pass

class Classname():
    pass

class Classname:
    pass
```

In [2]: Classname.**bases**
Out[2]: (object,)

np.random.choice

np.generator.choice

np.random.permutation

np.random.shuffle

A canonical view is an image of an object that is the most representative, comes to mind first when associating a name, and gives rise to the most accurate and fastest recognition performance.

The nonlocal keyword is used to work with variables inside nested functions, where the variable should not belong to the inner function.

b.retain_grad() # Since b is non-leaf and it's grad will be destroyed otherwise.

For the backward hook, the function is of the form

hook(module, grad_input, grad_output) -> Tensor or None

For the forward hook, the function is of the form

hook(module, input, output) -> None or modified output

There is also another type of hook ***forward_pre_hook*** which is triggered before every time the ***forward*** method is invoked. The signature for the ***forward_pre_hook*** is of the form

```
hook(module, input) -> None or modified input
```

```
# 2：hook函数负责将获取的输入输出添加到feature列表中
# 并提供相应的module名字
def hook(module, fea_in, fea_out):
    print("hooker working")
    module_name.append(module.__class__)
    features_in_hook.append(fea_in)
    features_out_hook.append(fea_out)
    return None

# 3：定义全部是1的输入
x = torch.FloatTensor([[0.1, 0.1], [0.1, 0.1]])

# 4:注册钩子可以对某些层单独进行
net = TestForHook()
net_chilren = net.children()
for child in net_chilren:
    if not isinstance(child, nn.ReLU6):
        child.register_forward_hook(hook=hook)
```

pdb how to print function definition

Python Counter is a container that will hold the count of each of the elements present in the container. The counter is a sub-class available inside the dictionary class.

Python3.:= is actually a valid operator (the walrus operator) that allows for assignment of variables within expressions:

```
if (n := len(a)) > 10:
    print(f"List is too long ({n} elements, expected <= 10)")
```

```
# without walrus
n = 30
if n > 10:
    print(f"{n} is greater than 10")

# with walrus
if (n := 30) > 10:
    print(f"{n} is greater than 10")
```

delete an element

del dict1["x"]

sys.version same as python —version

加retain_grad的方案会增加内存的占用

initialise a model parameters

self.fc.weight = torch.nn.Parameters(torch.Tensor([1,2,3,4]))

register_backward_hook 的输入和输出端是站在向前传播的角度而不是反向传播的角度

talk is cheap

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/17b4bf5d-a735-4e4c-97e9-d3d4374e4ced/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/17b4bf5d-a735-4e4c-97e9-d3d4374e4ced/Untitled.png)

children()与modules()都是返回网络模型里的组成元素，但是children()返回的是最外层的元素，modules()返回的是所有的元素，包括不同级别的子元素。

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/89a327b0-f100-4a8d-9827-96cef2df484b/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/89a327b0-f100-4a8d-9827-96cef2df484b/Untitled.png)

load from a cpp file

```python
form torch.utils.cpp_extension import load
cd = load(name="cd", verbose=True, sources=[
	os.path.join(module_path, "chamfer_distance.cpp",
	os.path.join(module_path, "chamfer_distance.cu"
])
```

[@unique is] a class decorator specifically for enumerations. It searches an enumeration’s members gathering any aliases it finds; if any are found ValueError is raised with the details

save git credentials locally

Run

```
git config --global credential.helper store

```

then

```
git pull
```

Jedi is a static analysis tool for Python that is typically used in IDEs/editors plugins. Jedi has a focus on autocompletion and goto functionality. Other features include refactoring, code search and finding references.

If you want to pass the parameters from a shell script to another program, you should use "$@" instead of $@. This will ensure that each parameter is expanded as a single word, even if it contains spaces. $@ is equivalent to $1 $2 ..., while "$@" is equivalent to "$1" "$2" ....

# type: ignore is standard and other equivalent checkers will also respect it, so it's definitely the way to go

Pyright offers flexible configuration options specified in a JSON-formatted text configuration. By default, the file is called “pyrightconfig.json” and is located within the root directory of your project.

- Use `# type: ignore`.
- Use `pyrightconfig.json`
- Setting `python.analysis.diagnosticSeverityOverrides` in `coc-settings.json`

```
:copen " Open the quickfix window
:ccl   " Close it
:cw    " Open it if there are "errors", close it otherwise (some people prefer this)
:cn    " Go to the next error in the window
:cp    " Go to the previous error in the window
:cnf   " Go to the first error in the next file
:.cc   " Go to error under cursor (if cursor is in quickfix window)
```

# Best practice

`income **=** (gross_wages
          **+** taxable_interest)`

return return from a function

Tips # noqa: F841 means ignoring only F841 error at the line

how to restart pdb after modifying some source code?

get_last_lr is a newer version function

get_lr can be used in older version

```
vis = o3d.visualization.Visualizer()
vis.create_window()
vis.add_geometry(pcd)
vis.update_geometry(pcd)
vis.poll_events()
vis.update_renderer()
vis.capture_screen_image(path)
vis.destroy_window()

vis = o3d.visualization.Visualizer()
vis.create_window(visible=False)
vis.add_geometry(mesh)
vis.update_geometry(mesh)
vis.poll_events()
vis.update_renderer()
depth = vis.capture_depth_float_buffer(do_render=False)
vis.destroy_window()
```

ls | xargs -I {} echo'hello {}'

xargs -n 1 -P bash -c 'sleep 1; echo $0'

make -j${nproc}

tar cvfj folder.tar.bz2 *; j option is the filer the archive through bzip2

## Install headless render open3d on ubuntu 18.04

1. git clone --recursive [https://github.com/intel-isl/Open3D](https://github.com/intel-isl/Open3D)
    1. C++14 compiler: Ubuntu 18.04+: GCC 5+, Clang 7+
    2. CMake: 3.18+
    3. CUDA (optional)
2. # On Ubuntu
util/install_deps_ubuntu.sh
3. conda install matplotlib
4. conda install conda-build ;To enable building conda packages:
5. sudo apt-get install libosmesa6-dev
6. mkdir build && cd build
7.

```
cmake -DENABLE_HEADLESS_RENDERING=ON\
                 -DBUILD_GUI=OFF\
                 -DUSE_SYSTEM_GLEW=OFF\
                 -DUSE_SYSTEM_GLFW=OFF\
                 ..
```

1. make -j$(nproc)
2. make conda-package (make install-pip-package)
3. cd lib/python_package/conda_package/linux-64
4. conda install --offline ./open3d-0.12.0+bdd6c66e6-py36_0.tar.bz2

**`capture_screen_float_buffer`(*self*, *do_render=False*)**

Function to **capture** **screen** and store RGB in a float **buffer**

world_coordinate

What is the world coordinate?

World coordinate system (WCS) is the right handed cartesian co-ordinate system where we define the picture to be displayed. A finite region in the WCS is called the Window. The corresponding coordinate system on the display device where the image of the picture is displayed is called the physical coordinate system.

Normalized device coordinate (NDC) is the display area of the virtual display device corresponding to a unit square.

**Object Coordinates:** The positions of points relative to a zero point. The points referred to are the building blocks of some single object.

**World Coordinates:** The positions of collections of points (objects) relative to a single shared standard zero point.

**View Coordinates:** The position of all points (the whole scene) relative to a camera.

**Device Coordinates:** Any position within -1 to 1 on both the X and Y axis (and Z too for 3D). Any point within the drawing area of the device.

**Normalized Coordinates:** The positions of points of any object (or the whole scene) that have been transformed to fit within the -1 to 1 space of the drawing device.

- **World Coordinate System** - Also known as the "universe" or sometimes "model" coordinate system. This is the base reference system for the overall model, ( generally in 3D ), to which all other model coordinates relate.
- **Object Coordinate System** - When each object is created in a modelling program, the modeller must pick some point to be the origin of that particular object, and the orientation of the object to a set of model axes. For example when modelling a desk, the modeller might choose a point in the center of the desk top for the origin, or the point in the center of the desk at floor level, or the bottom of one of the legs of the desk. When this object is moved to a point in the world coordinate system, it is really the origin of the object ( in object coordinate system ) that is moved to the new world coordinates, and all other points in the model are moved by an equal amount. Note that while the origin of the object model is usually somewhere on the model itself, it does not have to be. For example, the origin of a doughnut or a tire might be in the vacant space in the middle.
- **Hierarchical Coordinate Systems** - Sometimes objects in a scene are arranged in a hierarchy, so that the "position" of one object in the hierarchy is relative to its parent in the hierarchy scheme, rather than to the world coordinate system. For example, a hand may be positioned relative to an arm, and the arm relative to the torso. When the arm moves, the hand moves with it, and when the torso moves, all three objects move together.
- **Viewpoint Coordinate System** - Also known as the "camera" coordinate system. This coordinate system is based upon the viewpoint of the observer, and changes as they change their view. Moving an object "forward" in this coordinate system moves it along the direction that the viewer happens to be looking at the time.
- **Model Window Coordinate System** - Not to be confused with desktop windowing systems ( MS Windows or X Windows ), this coordinate system refers to the subset of the overall model world that is to be displayed on the screen. Depending on the viewing parameters selected, the model window may be rectalinear or a distorted viewing frustrum of some kind.
- **Screen Coordinate System** - This 2D coordinate system refers to the physical coordinates of the pixels on the computer screen, based on current screen resolution.
- **Viewport Coordinate System** - This coordinate system refers to a subset of the screen space where the model window is to be displayed. Typically the viewport will occupy the entire screen window, or even the entire screen, but it is also possible to set up multiple smaller viewports within a single screen window.

pcd.paint_uniform_color([0.5, 0.5, 0.5])  # change pc color

pcd.colors[1500] = [1, 0, 0]

np.asarray(pcd.colors)[idx[1:], :] = [0, 1, 0]

```
#让visualizer渲染点云vis.poll_events()
vis.update_renderer()
vis.run()
```

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/25d73797-9401-4d28-bcdb-18bc5c713ba5/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/25d73797-9401-4d28-bcdb-18bc5c713ba5/Untitled.png)

a = np.asarray(im)

vimcoc invalid name to rename

you should call them in the opposite order: `optimizer.step()` before `lr_scheduler.step()`.

Figure dimension (width, height) in inches. figsize

emunerate start (optional) - enumerate() starts counting from this number. If start is omitted, 0 is taken as start.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a08b87bc-6e3d-48be-be07-4b371d61f8dd/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a08b87bc-6e3d-48be-be07-4b371d61f8dd/Untitled.png)

%matplotlib

Using matplotlib backend: MacOSX

import matplotlib
matplotlib.use("Agg")

to take back front end control

Error: “chromedriver” cannot be opened because the developer cannot be verified. Unable to launch the chrome browser

xattr -d com.apple.quarantine chromedriver

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f6acc972-deff-400e-800c-ac31c80f2dd6/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f6acc972-deff-400e-800c-ac31c80f2dd6/Untitled.png)

Basically, a decorator takes in a function, adds some functionality and returns it.

```
@make_pretty
def ordinary():
    print("I am ordinary")
```

is equivalent to

```
def ordinary():
    print("I am ordinary")
ordinary = make_pretty(ordinary)
```

One of the differentiated Tensors does not require grad

x_real.requires_grad_(True)

remove file early then time stamp

```
-newerXY reference
          Compares the timestamp of the current file with reference.   The
          reference  argument  is  normally the name of a file (and one of
          its timestamps is used for the comparison) but it may also be  a
          string  describing  an  absolute time.  X and Y are placeholders
          for other letters, and these letters select which time belonging
          to how reference is used for the comparison.

          a   The access time of the file reference
          B   The birth time of the file reference
          c   The inode status change time of reference
          m   The modification time of the file reference
          t   reference is interpreted directly as a time
```

find -maxdepth 1 -newermt 'Jun 7' -type d

[https://raw.githubusercontent.com/pytorch/pytorch/master/torch/utils/collect_env.py](https://raw.githubusercontent.com/pytorch/pytorch/master/torch/utils/collect_env.py)

The repr() function returns a printable representation of the given object.

```
class Person:
    name = 'Adam'

    def __repr__(self):
        return repr('Hello ' + self.name )

print(repr(Person()))
```

REPL - Read Evaluation Print Loop

__repl__ representation

The `__str__` method is called when the following functions are invoked on the object and return a string:

- print()
- str()

If we have not defined the `__str__`, then it will call the `__repr__` method. The **`__repr__` method** returns a string that describes the pointer of the object by default (if the programmer does not define it).

15 Jun 2021

TypeVar

- Type variables exist primarily for the benefit of static type checkers.  They serve as the parameters for generic types as well as for generic function definitions.

Type variables may be marked covariant or contravariant by passing covariant=True or contravariant=True.

By convention, it is recommended to use names ending in _co for type variables defined with covariant=True and names ending in _contra for that defined with contravariant=True.

torch.cuda.synchronize

16 Jun 2021

char operation in python

```python
a = None

b = ''

a is not equal to b

len(a) - object of type 'NoneType' has no len()

len(b) == 0
```

char vs ord

ord('a') is 97

char(97) is a

kernel = kernel[None, None]

kernel.shape

torch.Size[1,1,3,3]

19 Jun 2021

To be able to annotate what types your list should accept, you need to use `typing.List`

```
from typing import List
```

So in Python 3.9 or newer, you could actually write without having to import anything.

```
def totalFruit(self, tree: list[int]) -> int: # Note list instead of List
    pass
```

mp = collections.defaultdict(list)

mp[tuple(count)].append(st)

need to change to tuple before hashable in mp

count[ord(ch) - ord("a")] += 1

this is to check the times that this alpha appears

unbind to remove a tensor's dimension

torch.narrow

returns a new tensor that is a narrowed version of input tensor. the dimension dim is the input from start to start+length. the returned tensor and input tensor share the same underlying storage.

MRO method resolution order

it is the order in which methods should be inherited in the presense of multiple inheritance. You can view MRO by using the __mro__ attribute.

In the case of single inheritance, it allows us to refer base class by super().

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/52082246-2592-48e3-b3e9-3aab3ad4349d/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/52082246-2592-48e3-b3e9-3aab3ad4349d/Untitled.png)

nvcc has downward capabilities or not?

24 Jun 2021

functional.batch_norm

torch.nn.functional.batch_norm(input, running_mean, running_var, weight=None, bias=None, training=False, momentum=0.1, eps=1e-05)

applies batch normalisation for each channel across a batch of data

a = a.type(torch.FloatTensor)

cast the data type

25 Jun 2021

deque - double ended queue

- append
- pop
- appendleft
- popleft

can use len(a) to check the deque is empty or not

(pdb) a = deque()
(pdb) a
deque([])

yield

iterables are handy but the values is in memory. This is no always what you what wen you have a lot of values.

generators are iterables, a kind of iterable you can only iterate over once. Generators do not store all value in memory, they generate the value on the fly.

yield is a keyword used like return but the function will return a generator

[] -  used to define mutable data types, list and indexing slicing

() - define tuples, order of operations, generator expressions.

{} - hash table types, dict and set

torch.autograd.set_detect_anomaly(True)

How to understand the param_group in pytorch optimizer?

As stated here [https://github.com/aiidateam/aiida-core/issues/3559](https://github.com/aiidateam/aiida-core/issues/3559) This might be due to ipython 5.8.0 incompatible with Python 3.8 issue. pip install --upgrade ipython fixed the issue for me

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec7d0d44-3ba7-4bc1-83a2-42a1f525ee8b/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec7d0d44-3ba7-4bc1-83a2-42a1f525ee8b/Untitled.png)

Strategy 1: Ball-Pivoting Algorithm [1]

Strategy 2: Poisson reconstruction [2]

[https://towardsdatascience.com/5-step-guide-to-generate-3d-meshes-from-point-clouds-with-python-36bad397d8ba](https://towardsdatascience.com/5-step-guide-to-generate-3d-meshes-from-point-clouds-with-python-36bad397d8ba)

1x1 conv vs linear ? difference and similarity

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0997d822-b426-4140-894f-5b492b9e1cf0/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0997d822-b426-4140-894f-5b492b9e1cf0/Untitled.png)

1470 floating point exception (core dumped)

The problem is when you do not specify the dtype. If you set dtype=torch.float32 or dtype=torch.float64, it won't throw an error on both CPU and GPU.

KeyError: 128

Noise should be random noise uniform distributed instead of gaussion

1. World size
2. Dist url
3. Dist backend
4. Distributed
5. Rank
6. GPU

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/acbcdba7-34b1-422c-95be-4d4a0b543cff/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/acbcdba7-34b1-422c-95be-4d4a0b543cff/Untitled.png)

```python
if args.distributed:
        if args.dist_url == "env://" and args.rank == -1:
            args.rank = int(os.environ["RANK"])
        if args.multiprocessing_distributed:
            # For multiprocessing distributed training, rank needs to be the
            # global rank among all the processes
            args.rank = args.rank * ngpus_per_node + gpu
        dist.init_process_group(backend=args.dist_backend, init_method=args.dist_url,
                                world_size=args.world_size, rank=args.rank)

if args.distributed:
        # For multiprocessing distributed, DistributedDataParallel constructor
        # should always set the single device scope, otherwise,
        # DistributedDataParallel will use all available devices.
        if args.gpu is not None:
            torch.cuda.set_device(args.gpu)
            model.cuda(args.gpu)
            # When using a single GPU per process and per
            # DistributedDataParallel, we need to divide the batch size
            # ourselves based on the total number of GPUs we have
            args.batch_size = int(args.batch_size / ngpus_per_node)
            args.workers = int((args.workers + ngpus_per_node - 1) / ngpus_per_node)
            model = torch.nn.parallel.DistributedDataParallel(model, device_ids=[args.gpu])
        else:
            model.cuda()
            # DistributedDataParallel will divide and allocate batch_size to all
            # available GPUs if device_ids are not set
            model = torch.nn.parallel.DistributedDataParallel(model)
if args.distributed:
        train_sampler = torch.utils.data.distributed.DistributedSampler(train_dataset)
    else:
        train_sampler = None
if args.distributed:
    train_sampler.set_epoch(epoch)
if args.distributed:
    train_sampler.set_epoch(epoch)

adjust_learning_rate(optimizer, epoch, args)

if not args.multiprocessing_distributed or (args.multiprocessing_distributed
                and args.rank % ngpus_per_node == 0):
            save_checkpoint({
                'epoch': epoch + 1,
                'arch': args.arch,
                'state_dict': model.state_dict(),
                'optimizer' : optimizer.state_dict(),
            }, is_best=False, filename='checkpoint_{:04d}.pth.tar'.format(epoch))
```

1. to use multi gpus

```python
net = torch.nn.**DataParallel**(model, device_ids=[0, 1, 2])
```

2. DistributedParallel

```python
python -m torch.distributed.launch --nproc_per_node=x <filename>.py
```

WORLD_SIZE is generated from torch.distributed.launch.py, value is calculated as nproc_per_node * node (host number)

two steps

1. dist.is_available()
2. dist.is_initialized()

    torch.distributed.init_process_group(backend='nccl', init_method="env://")

    - backend
        - communication backend, single node multi gpus no big issue
        - machine communication protocol, single mode use [localhost](http://localhost) with an empty port
        - rank to recognise master and slave, 0 is good enough
    - init_method
        - init_method (str, optional) – URL specifying how to initialize the process group. Default is “env://” if no init_method or store is specified. Mutually exclusive with store.
        - init_method="tcp://{}:{}".format(ip, port)
        - two methods: 1: tcp, 2: shared filesystem
        - ip is the main node ip address, meaning rank=0 ip address, then the port is the empty port
        - init_method='file:///mnt/nfs/sharedfile'
            - the sharedfile does not exist initially, but the file is not auto deleted after job is done
    - world_size
        - indicator to recognise how many hosts, if there is only local host, then set to 1
    - rank

    ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f83b12a7-cf40-43f2-ac69-48527255b90c/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f83b12a7-cf40-43f2-ac69-48527255b90c/Untitled.png)

dist.get_world_size()

AssertionError: Default process group is not initialized

**Rule of thumb**

- **Use the NCCL backend for distributed GPU trainingUse the Gloo backend for distributed CPU training**
- distributed running script should be run in commandline
- if using argpars, arguments should include —local_rank

NCCL Nvidia Collective Communications Library

dist.barrer()

synchronizes all processes

```
# Use a barrier() to make sure that process 1 loads the model after process
# 0 saves it.
dist.barrier()
```

```python
torch.nn.parallel.DistributedDataParallel(model, device_ids, output_device, broadcast_buffers)
```

When doing test, execute

model = model.module

It is recommended to use DistributedDataParallel, instead of this class, to do multi-GPU training, even if there is only a single node.

DataParallel introduces GPU unbalance issue

os.environ['NCCL_SOCKET_IFNAME'] = 'eth0'

- docker0
- eth0

torch.utils.data.distributed.DistributedSample to avoid data transfer issu. It can only be called after torch.distributed.init_process_group is called. Then train_loader passes the arguments of sampler into the input. The purpose is when loading data from different nodes, it is not transfer data from rank=0, whereas reading data from local disk. The sampler is to organise the shuffle dataloading

# Error

1. RuntimeError: Expected to have finished reduction in the prior iteration before starting a new one. This error indicates that your module has parameters that were not used in producing loss. You can enable unused parameter detection by (1) passing the keyword argument `find_unused_parameters=True` to `torch.nn.parallel.DistributedDataParallel`; (2) making sure all `forward` function outputs participate in calculating loss. If you already have done the above two steps, then the distributed data parallel module wasn't able to locate the output tensors in the return value of your module's `forward` function. Please include the loss function and the structure of the return value of `forward` of your module when reporting this issue (e.g. list, dict, iterable).

RuntimeError: Tensors must be CUDA and dense and The all_reduce function requires all tensors to be on CUDA

However, if you create a new tensor and return that in validation_epoch_end, you need to make sure it is on "self.device"

Functions that are deemed too complex are functions that have too much branching logic. Branching logic includes if/elif/else and for/while loops.

mp.spawn

torch.multiprocessing.spawn(fn, args=(), nprocs=1)

The function is called as fn(i, *args), where i is the process index and args is the passed through tuple of arguments.

worker_init_fn (callable, optional) – If not None, this will be called on each worker subprocess with the worker id (an int in [0, num_workers - 1]) as input, after seeding and before data loading. (default: None)x

Tensorboard with multiprocessing

```python
def my_entry_point(index):
  if index == 0:
    writer = SummaryWriter(summary_dir)
    writer.add_scalar('test', 1.0, 1)

torch.multiprocessing.spawn(my_entry_point, args=(), nprocs=2)
```

How to use GPUs effecitvely?

1. Memory is not fully occpuied
2. The calculation power is utilised fully.

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/549f4f87-c0a8-4a61-8b78-8a5a2288fbea/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/549f4f87-c0a8-4a61-8b78-8a5a2288fbea/Untitled.png)

1. remember to 'cleanup' and reduce_tensor operation in distributed operation
