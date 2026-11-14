# 试卷 $\LaTeX$ 排版规范

HDU, WeYoung Society, Mingyu Xia

## Warning

1. `preamble.tex` 中的东西请不要乱改！——除非你有高人指点，则当我没说
2. 请主动屏蔽（无视）掉 CSDN 中关于 $\LaTeX$ 的文章，垃圾无底线网站，文章内容随意从别的网站爬取拼凑大杂烩、十分劣质.
3. 你们可能注意到编译出来的PDF中的字体没有我给的样例中那么好看，这是因为考虑到你们电脑中并未安装这些字体，所以我把字体相关设置注释掉了.

## Typeset

1. 微分算子 $\mathrm d$ 请使用正体，如 $\int f(x)\,\mathrm d x$. 请使用文档中已预制好了的  `\d` 命令，即 `\int f(x) \d x`. 温馨提示：如果你遇到报错 `Undefined control sequence（未定义的控制序列）`，请检查你是不是写成了 `\dx`，因为没有 `\dx` 这一命令，只有命令 `\d`，后面需要加空格"打断施法".

2. 导数 $f'(x)$，$f''(x)$ 请直接写成 `f'(x)`，`f''(x)`，没必要使用 `f^\prime (x)`. 因为数学模式中的 char (`'`) 已经在文档中被定向到 `\prime` 命令.

3. 求导中 $\frac{\mathrm d y}{\mathrm d x}$ 和 $\mathrm d y/\mathrm d x$ 请使用文档中预制的命令 `\odv`，前者分数线写法为 `\odv yx`，后者斜线（text friction）写法为 `\odv y/x`. 这两种写法均是下方 Coding Style 的简洁写法. 如果你要写 `f(x) 对 x 的导数`，则需要花括号界定作用域，即 `\odv{f(x)}{x}` 和 `\odv{f(x)}/{x}`.

4. 之前很多人犯的一个问题，行内的变量、值等请通通用数学模式 `$...$` pair 包裹. 行间公式请使用 `\[...\]` pair，而不要使用 `$$...$$`.

> 请这样
```tex
计算 $f(x)$ 在 $x$ 点的导数.
\[\ln(x^2 -2x + 3) - \frac{1}{\sqrt2} \arctan \frac{x - 1}{\sqrt2} + C\]
```
> 而不要这样
```tex
计算f(x)在x点的导数.
$$\ln(x^2 -2x + 3) - \frac{1}{\sqrt2} \arctan \frac{x - 1}{\sqrt2} + C$$
```

5. 大括号公式组写法：
```tex
\[
  \begin{cases}
    1 - \arctan \frac1x, & x < 0\\
    a + e^{2\sqrt x},    & x \geq 0
  \end{cases}
\]
```

6. 单纯的对齐，不要大括号：
```tex
\begin{align*}
  1 - \arctan \frac1x, & x < 0\\
  a + e^{2\sqrt x},    & x \geq 0
\end{align*}
```

如你所见，连 `\[...\]` pair 也不需要添加，因为 `align*` 环境已经进入了行间数学模式，添加 `\[...\]` pair 反而会报错.

7. 可能概率统计会遇到多一些：强制在公式中打文本

```tex
\begin{align*}
  1 - \arctan \frac1x, & x < 0\\
  a + e^{2\sqrt x},    & x = a \text{或} x = \text{其他}
\end{align*}
```

就算你使用洋文，把 `或` 用 `or` 替代，把 `其他` 用 `else` 替代，也请你用命令 `\text` 将其包裹

```tex
\begin{align*}
  1 - \arctan \frac1x, & x < 0\\
  a + e^{2\sqrt x},    & x = a \text{or} x = \text{else}
\end{align*}
```

因为这里是文本，不是公式，不用 `\text` 包裹，英文字母就都是斜体了，无法和公式斜体做区分，很丑.

8. `\[...\]` pair、`cases`、`align*` 环境中请不要有空行！否则会报错.

9. 题目请用 `\begin{problem}...\end{problem}` 环境包围，解答请用 `\begin{solution}...\end{solution}` 包围.

10. 选择题请使用 `tasks` 环境排版. 例如

```tex
\begin{tasks}(4)
  \task $\sqrt2(\pi - 1)$
  \task $2(e^\pi - 1)$
  \task[\true] $\sqrt2(e^\pi - 1)$
  \task $2(\pi - 1)$
\end{tasks}
```

请在正确的选项后添加 `[\true]`. 此时此选项的字母会变为一个对号. `\begin{tasks}(4)`，后面的 `(4)` 意思是一行塞4个选项. 至于一行塞几个，请自行判断.

  - 一个棘手的问题：如果某道题有5个选项，其中前2个选项比较长，后3个选项比较短. 那么如何最优空间利用？——答案是第一行塞俩选项，第二行塞三个. 那么如何实现？
  ```tex
  \begin{tasks}(6)
    \task*(3) 若 $\int f(x) \d x = g(x)$，则 $f(x) = g'(x)$
    \task*(3) 若 $f'(x) = g(x)$，则 $f(x) = \int g(x) \d x$
    \task*(2) $\int (f(x))' \d x = f(x)$
    \task*(2) $(\int f(x) \d x)' = f(x)$
    \task*(2) $f(x) \d x = \d[\int f(x) \d x]$
  \end{tasks}
  ```
  意思是把选项所在行分 `(6)` 段，然后前两个选项均占用 `*(3)` 段，后三个选项均占用 `*(2)` 段.

  如果某道题有4个选项，其中前3个选项比较短，最后一个选项特别长. 那么如何最优空间利用？——答案是第一行塞三选项，第二行最后一个选项独占.
  ```tex
  \begin{tasks}(4)
    \task 短选项A
    \task 短选项B
    \task 短选项C
    \task! 长——————————————选项D
  \end{tasks}
  ```
  `!` 参数表示此选项独占这一整行. `*` 参数如果后面不加 `(<数字>)`，则表示此选项霸占这一行剩余的所有空间. 比如上一个例子也可以写为
  ```tex
  \begin{tasks}(6)
    \task*(3) 若 $\int f(x) \d x = g(x)$，则 $f(x) = g'(x)$
    \task* 若 $f'(x) = g(x)$，则 $f(x) = \int g(x) \d x$
    \task*(2) $\int (f(x))' \d x = f(x)$
    \task*(2) $(\int f(x) \d x)' = f(x)$
    \task* $f(x) \d x = \d[\int f(x) \d x]$
  \end{tasks}
  ```
  省略了一个 `(3)` 和 `(2)`.

11. 填空题答案请使用命令 `\result{<答案>}`，此时答案会被下划线. 最后也会由 @文档作者 快速生成无答案版——因为 `\result{}` 命令被作者留后门了（笑）.

12. 小标题：针对选择题，请使用 `\section{选择题（每题x分，共xx分）}`；对于填空题，如果每题/每空分值一样，亦可使用 `\section{选择题（每题x分，共xx分）}` 或 `\section{选择题（每空x分，共xx分）}`，解答题以及填空题如果每空分值不一样，请直接写 `\section{解答/填空题（共xx分）}`，此时需在每题标注分制.
  - 分值标注：即在 `\problem` 环境开始的地方：`\begin{problem}[本题x分]...\end{problem}` 用方括号扩住.

13. 解答题的小问请使用项目列表！
> 请这样
```tex
\begin{enumerate}
  \item 曲线 $y = \ln x$ 过坐标原点的切线方程.
  \item 平面图形 $D$ 绕 $y$ 轴旋转一周所得的旋转体的体积.
\end{enumerate}
```

> 不要这样——这不是 `markdown😡👊`
```tex
1. 曲线 $y = \ln x$ 过坐标原点的切线方程.
2. 平面图形 $D$ 绕 $y$ 轴旋转一周所得的旋转体的体积.
```

- 如果你觉得某道大题的小问长度都很短，那建议使用 `tasks` 环境，并将 `label` 设置为阿拉伯数字，如

```tex
\begin{tasks}[label = \arab*.](3)
  \task 若 $\int f(x) \d x = g(x)$，则 $f(x) = g'(x)$
  \task 若 $f'(x) = g(x)$，则 $f(x) = \int g(x) \d x$
  \task $\int (f(x))' \d x = f(x)$
\end{tasks}
```

嘿嘿，节省了2行空间. 当然，更进阶地，你也可以选择刚才的方法：`一个棘手的问题：如果某道题有5个选项，其中前2个选项比较长，后3个选项比较短. 那么如何最优空间利用？——答案是第一行塞俩选项，第二行塞三个.`

14. 句号的地方请不要使用中文全角句号 `。`，而是使用英文半角点 + 空格 `. `，这是因为考虑到数学、物理等理工科排版，难免会遇到有三角函数 `度数` $\degree$，和句号放在一起会很乱. 但是正文中，逗号请使用中文全角逗号 `，`，而不是英文半角逗号 `,`. 但是*2，数学公式中所有标点请使用半角符号——因为全角符号它！不！认！

15. 空格 & 省略号

- 对于某些题目条件 `x = 1, 2, 3, ..., n`，请这样写：`$x = 1$,~2, $\ldots\,$,~$n$`，会输出 $x = 1$, 2, $\ldots\,$, $n$.

- 对于 `对于 a，b > 0，存在xxx` 请这样写：`对于 $a$，$b > 0$，存在xxx`——爽朗地使用全角逗号吧！

- 但是如果在行间公式，你实在 "无法脱身" 逃离数学模式，请这样：
```tex
\begin{align*}
  1 - \arctan \frac1x, & a,\ b < 0\\
  a + e^{2\sqrt x},    & a,\ b > 0
\end{align*}
```

- 解释一下：`\,` 会产生 `1/6 em` 大小的空格（即字母 `m` 宽度的六分之一） ，`~` 和 `\ ` 均会产生 `1/3 em` 大小的硬空格. 不同的是，$\TeX$ 不会在 `~`（称作带子，tie）处断行. 至于为什么要这样做？因为这样更好看，参考链接：[https://tex.stackexchange.com/questions/115030/using-commas-in-mathematical-formulas](Using commas in mathematical formulas)


## Coding Style

Coding Style 并不会影响最终的PDF输出结果，但好的Coding Style会让人赏心悦目，同时也便于在以后其他同学阅读代码的便利性.

1. 运算符、积分上下限和被积函数、被积函数和积分变量之间请添加空格 ` `，如：`$y = \ln x$`，`\int_0^2 xa^{\sin (x + a)} \d x`. 不要 `$y=\ln x$`，`\int_0^2xa^{\sin(x+a)}\d x`

2. 每行不的超过 `80` 个 char. 建议将VS Code的 Word Wrap Column设置为 80. 但请不要随意断行，请在标点符号后面/公式结束后面段行. 如遇过长公式，请按照以下符号优先级段行：`=/>/</≠=±`，`+/-/\cdot`，请保证对仗工整. 如以下代码实例

> 请这样
```tex
\[
  f = \frac{u \pm v_o}{u \mp v_s}\nu_0
    = \frac{330}{330 - 50} \times \qty{450}\Hz \approx \qty{530.36}\Hz
\]
```
> 而不要这样
```tex
\[
  f = \frac{u \pm v_o}{u \mp v_s}\nu_0
  = \frac{330}{330 - 50} \times \qty{450}\Hz \approx \qty{530.36}\Hz
\]
```

> 更不要这样（毕竟已经超过一行 `80` 个 char的限制了）
```tex
\[
  f=\frac{u\pm v_o}{u\mp v_s}\nu_0=\frac{330}{330-50}\times\qty{450}\Hz\approx\qty{530.36}\Hz
\]
```

2. 每个环境中，缩进量大小为 `2` 个 char.

> 请这样
```tex
\begin{problem}
  这是一道题
  \[H\psi = E\psi\]
\end{problem}

\begin{problem}
  这是另一道题
  \[
    f = \frac{u \pm v_o}{u \mp v_s}\nu_0
      = \frac{330}{330 - 50} \times \qty{450}\Hz \approx \qty{530.36}\Hz
  \]
\end{problem}
```

> 而不要这样
```tex
\begin{problem}
这是一道题
\[H\psi = E\psi\]
\end{problem}

\begin{problem}
这是另一道题
\[f = \frac{u \pm v_o}{u \mp v_s}\nu_0
    = \frac{330}{330 - 50} \times \qty{450}\Hz \approx \qty{530.36}\Hz\]
\end{problem}
```

输入行间公式的 `\[...\]` 对也是一个环境. 请不要舍不得换行.

3. 数学公式和文字、命令之间请添加空格，但是数学公式和标点之间无需添加.

> 请这样
```tex
\begin{problem}
  已知 $f(x)$ 是连续函数，则 $a = $ \result{$\frac\pi2$}
\end{problem}
```

> 而不要这样
```tex
\begin{problem}
  已知$f(x)$是连续函数，则$a = $\result{$\frac\pi2$}
\end{problem}
```

4. 制表符 `&` 请上下对其，同时与最长的那一行中间保持一个空格.

> 请这样
```tex
\begin{cases}
  1 - \arctan \frac1x, & x < 0\\
  a + e^{2\sqrt x},    & x \geq 0
\end{cases}$
```

> 而不要这样
```tex
\begin{cases}
  1 - \arctan \frac1x,&x < 0\\
  a + e^{2\sqrt x},&x \geq 0
\end{cases}$
```

5. 建议使用 $\TeX$ 的语法特点. 如当接受参数的命令后面只跟着一个 char，或者控制序列时，作用域花括号可（请）省略. 如 `\frac{1}{2}` 请写成 `\frac12`，`x_{1}^{2}` 请写成 `x_1^2`，`\int_{1}^{\infty}` 请写成 `\int_0^\infty`，`\odv{y}{x}` 请写成 `\odv yx`，`\sqrt{2}` 请写成`\sqrt2` 这样的写法会使代码区更加整洁、干净. 但是请注意，`\sqrt{x}` 请写成 `\sqrt x`，如果你没添加空格写成了 `\sqrtx`，那么会报错——毕竟没有 `\sqrtx` 这个控制序列！
  - 为什么不会报错 "没有控制序列`\sqrt2`"？因为在 $\LaTeX2\varepsilon$ 中，控制序列由反斜杠 `\` 开头，由字母组成（甚至包括字符 `@`），这些都以 `字母的catcode为（多少我忘了）` 为基础，数字（当然包括空格）的 `catcode` 和字母不同，不会被当作控制序列.
  - 同时，对于 `\sqrt x` 这种情况，我们是为了防止出现命令 `\sqrtx` 而添加的空格，所以在控制序列后的空格一律会被忽略！不会输出到PDF中.
  - 何为catcode？category code，类别码.

6. 如果你在担心肆意的添加空格会产生unwanted space，那么我要告诉你
  - 根据 unicode-data 宏包，$\rm XƎ\TeX$ 将所有 CJK 表意文字的 `\catcode` 设置为 11. 因此汉字可以直接用作控制序列的名字. 同时 $\rm XƎ\TeX$ 会聪明地在数学公式和文本之间添加合适的间距，就算你代码区有空格，根据 $\TeX$ 的特性，多个空格（缩进）等于一个空格，也就是说你添加的空格会被忽略，但是却带来了视觉上的整齐清爽易读.
  - 但是请不要肆意的添加空行（注意，空行≠断行）. 在定理环境 `problem`，`solution` 之间可以添加空行. 建议在每组 `问题-解答` pair 之间添加空行，以表示这是一道题和它的解答. 在行间公式`\[...\]`前后请勿出现空行，否则会带来 unwanted space.
  ```tex
  \begin{problem}
    问题1
  \end{problem}
  \begin{solution}
    问题1的解答
    \[...\]
    问题1的解答
  \end{solution}

  \begin{problem}
    问题2
  \end{problem}
  \begin{solution}
    问题2的解答
    \[...\]
    问题2的解答
  \end{solution}
  ```

> 不要这样
```tex
\begin{solution}
  问题2的解答

  \[...\]

  问题2的解答
\end{solution}
```