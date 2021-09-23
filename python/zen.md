$ python -c "import this"
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!

1. 长的变量名会使代码更加具有可读性
2. 深入学习一两个业内公认的Pythonic的代码库，比如Flask
3. 在代码中适当添加注释
4. 适当添加空行使代码布局更加合理
5. 将常量集中在一个文件，且常量名尽量使用全大写字母
6. 编写函数的4个原则
    1. 函数设计要尽量短小，嵌套层次不宜过深
    2. 函数声明应该做到合理、简单、易用
    3. 函数参数设计应该考虑向下兼容
    4. 一个函数只做一件事，尽量保证函数粒度的一致性
7. 利用assert语句来发现问题，但要注意，断言assert会影响效率
8. 数据交换值时不推荐使用临时变量，而是直接a, b = b, a
9. 充分利用惰性计算（Lazy evaluation）的特性，从而避免不必要的计算
10. 不推荐使用type来进行类型检查，因为有些时候type的结果并不一定可靠。如果有需求，建议使用isinstance函数来代替
11. 分清==和is的适用场景，特别是在比较字符串等不可变类型变量时
12. 有节制的使用from…import语句，防止污染命名空间
13. 优先使用absolute import来导入模块
14. i+=1不等于++i，在Python中，++i前边的加号仅表示正，不表示操作
15. 习惯使用with自动关闭资源，特别是在文件读写中
16. 连接字符串应优先使用join函数，而不是+操作
17. 格式化字符串时尽量使用.format函数，而不是%形式
18. 函数中慎用变长参数args和*kargs
    1. 这种使用太灵活，从而使得函数签名不够清晰，可读性较差
19. 深入理解str()和repr()的区别
    1. 两者之间的目标不同：str主要面向客户，其目的是可读性，返回形式为用户友好性和可读性都比较高的字符串形式；而repr是面向Python解释器或者说Python开发人员，其目的是准确性，其返回值表示Python解释器内部的定义
    2. 在解释器中直接输入变量，默认调用repr函数，而print(var)默认调用str函数
