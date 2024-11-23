---
creation_date: 2024-09-08 21:35  
modification_date:: 2024-09-08 21:59  
course_name: 数学软件  
lecturer: 课程教研组  

keywords: mathematica,符号计算  
tags: 
- mathematica
- 符号计算

toc: 'true'
---
## 下载与安装
- MMA14 版本下载 [BitTorrent种子](https://tiebamma.github.io/InstallTutorial#mathematica-1400)
- 在线激活：[针对MMA14](https://mmaactivate.github.io/MMAActivate/)
## 基本应用

1. 计算器
   ```mathematica
   Print[2+2]
   ```

2.  素因子分解 $2^{2^n}+1$ 
    ```mathematica
    Print[FactorInteger[Table[2^2^n + 1, {n, 6}]]]
    ```
3. 验证欧拉公式
    ```mathematica
    Print[E^(Pi I)+1==0]
    ```
4. 计算$\pi$的前200位
   ```mathematica
   Print[N[Pi, 200]]
   ```
5. 计算展开式
   ```mathematica
   Print[Expand[(a + b)^3]]
   ```
6. 因子分解
   ```mathematica
   Print[Factor[x^3 + y^3 + z^3 - 3 x  y  z]]
   ```
7. 求解一元三次方程的根
   ```mathematica
   Print[Solve[x^3 - 2 x - 1 == 0, x]]
   ```
8. 计算极限
   ```mathematica
   Print[Limit[(Tan[x] - x)/(x - Sin[x]), x -> 0]]
   ```
9. 计算导数
   ```mathematica
   Print[D[x^x, x]]
   ```
10. 计算不定积分
    ```mathematica
    Print[Integrate[x^2 Cos[x], x]]
    ```
11. 计算无穷函数项级数的和
    ```mathematica
    Print[Sum[x^(2 n)/(n^2 Binomial[2 n, n]), {n, Infinity}]]
    ```
12. 求解常微分方程的通解
    ```mathematica
    Print[FullSimplify[DSolve[y''[x] + y[x] == 8 x Sin[x], y[x], x]]]
    ```
13. 画图$y=\sin(1/x)$
    ```mathematica
    f=Plot[Sin[1/x], {x, 0, 1/Pi}, PlotPoints -> 1000];
    Export["sin1x.png", f];
    ```

    ![[sin1x.png]]
14. 可视化克莱因瓶
    ```mathematica
    (* A Stylized Klein Bottle. Created by Jeff Bryant  *)

    bx = 6*Cos[u]*(1 + Sin[u]); by = 16*Sin[u]; rad = 4*(1 - Cos[u]/2);
    X = If[Inequality[Pi, Less, u, LessEqual, 2*Pi], bx + rad*Cos[v + Pi],
        bx + rad*Cos[u]*Cos[v]];
    Y = If[Inequality[Pi, Less, u, LessEqual, 2*Pi], by,
       by + rad*Sin[u]*Cos[v]];
    Z = rad*Sin[v];
    o = 0.2; col1 = Blue; col2 = Gray;
    darklights = {{"Directional", RGBColor[0.5, 0.5, 1],
        ImageScaled[{0, 1, 0}]},
            {"Directional", RGBColor[1, 0.5, 0.5],
        ImageScaled[{1, -1, 0}]}, {"Directional", RGBColor[0.5, 1, 0.5],
        ImageScaled[{-1, -1, 0}]}};
    gr = ParametricPlot3D[{X, Y, Z}, {u, 0, 2*Pi}, {v, 0, 2*Pi},
      PlotPoints -> {48, 12}, Axes -> False, Boxed -> False, Mesh -> 59,
      MeshShading -> {{{col1, Opacity[o], Specularity[White, 128]}, {col1,
           Opacity[o], Specularity[White, 128]}, {col2,
          Specularity[White, 128]}}, {{col1, Opacity[o],
          Specularity[White, 128]}, {col1, Opacity[o],
          Specularity[White, 128]}, {col2,
          Specularity[White, 128]}}, {{col1, Opacity[o],
          Specularity[White, 128]}, {col1, Opacity[o],
          Specularity[White, 128]}, {col2,
          Specularity[White, 128]}}, {{col2,
          Specularity[White, 128]}, {col2,
          Specularity[White, 128]}, {col2, Specularity[White, 128]}}},
      MeshStyle -> GrayLevel[.3], ImageSize -> {1280, 1024},
      MeshFunctions -> {#4 &, #5 &}, Background -> Black,
      Lighting -> darklights, SphericalRegion -> True,
      ViewAngle -> \[Pi]/12];
      Export["KleinBottle.png", gr];
    ```
    ![[KleinBottle.png]]

15. 作曲
    ```mathematica
	s = Sound[
   SoundNote[##, "Piano"] & @@@ 
    Transpose[{{"B", "B", "C5", "D5", "D5", "C5", "B", "A", "G", "G", 
       "A", "B", "B", "A", "A", "B", "B", "C5", "D5", "D5", "C5", "B",
        "A", "G", "G", "A", "B", "A", "G", "G", "A", "A", "B", "G", 
       "A", "B", "C5", "B", "G", "A", "B", "C5", "B", "A", "G", "A", 
       "D", "B", "B", "B", "C5", "D5", "D5", "C5", "B", "A", "G", "G",
        "A", "B", "A", "G", "G"}, {0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 
       0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.25, 1, 0.5, 0.5, 0.5, 0.5, 
       0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.25, 1, 0.5, 
       0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.5, 0.5, 0.5, 0.25, 0.25, 0.5,
        0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 
       0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.25, 1}}]];
	s // EmitSound;
	Export["music.mp3", s]
    ```
	![[music.mp3]]
16. 哈勃望远镜的太空图
	* 图片来源: https://science.nasa.gov/wp-content/uploads/2023/04/m74-xlarge_web-jpg.webp
    ```mathematica
    M74 = Import["m74-xlarge_web-jpg.webp.jpeg"];
    (*转换为油画*)
    img=ImageEffect[M74, {"OilPainting", 6}];
	Export["M74.png", img];
    ```

    ![[M74.png]]
17. 寻找Grothendieck
    * 图片来源: http://farm1.staticflickr.com/35/103000621_bcaee4a234.jpg
   	```mathematica
	Grothendieck = Import["http://farm1.staticflickr.com/35/103000621_bcaee4a234.jpg"]
	face=HighlightImage[Grothendieck, FindFaces[Grothendieck][[2]]]
	Export["Grothendieck.png", face];
	```
    ![[Grothendieck.png]]
18. 京东股票数据
    ```mathematica
    (* 实时股价 *)
    Print[FinancialData["JD"]]
	(* 2020.01.01-2021.01.31 *)
    Export["JD2020-2021.png", DateListPlot[FinancialData["JD", {"Jan. 1, 2020", "Jul. 31, 2021"}]]]
	```
    ![[JD2020-2021.png]]

19. 假设$f(x)=1+x+x^2+x^3+x^4+x^5$, 试求$f(x)$在$x=-1$处的Taylor展开式。
	```mathematica
	f[x_] := Sum[x^k, {k, 0, 5}]
	Print[f[x]]
	g=Series[f[x], {x, -1, 6}];
	Print[Normal[g]]
	```
## 作为编程语言的Mathematica
### 基础知识
#### 原子(atom)
 **以下三类对象被称为原子（Atom）**：
* **符号（Symbol）**：由字母和数字组成的有限序列，其中数字不能作为起始字符。符号可以理解为变量的名称。例如，`x1` 是一个符号（变量名）。
* **数字（Number）**：包括整数、有理数、实数和复数，通常作为变量的值。例如，`42`、`3/7`、`π` 和 `2 + 3I`。
* **字符串（String）**：由双引号 `"` 括起来的任意字符序列，也可以作为变量的值。例如，`"Hello, world!"`。
	```mathematica
	x1=2+3*I;
	Print[Sin[x1]//N];
	```

#### 内建符号
 Mathematica系统内建符号的特点：
* **Camel命名法**：符号通常由第一个字母大写的单词组成，例如：True、False、FactorInteger、SetAttributes。
* **判断函数命名**：用于判断的函数名末尾通常带有“Q”，如：EvenQ、PrimeQ、MatchQ。
* **人名命名**：某些符号以人名为基础，格式为人名加符号名，例如：EulerGamma、BesselJ、DiracDelta。

因此，在命名自定义符号时，建议避免与内建符号冲突。一种有效的方法是使用小写字母开头的camel命名法。
### 关系运算与逻辑运算符
#### 关系运算
1. 大于、等于、小于、大于等于、小于等于、不等于、形式上完全相同（类型相同）、形式上不完全相同
   ```mathematica
Print[{1 < Sin[1], 1 > Sin[1], 1 == Sin[1], 1 != Sin[1], 
 1 <= Min[1, Sin[1]], 1 >= Min[1, Sin[1]], 1 === 1.0, 1 =!= 1.0}]  
   ```

1. 属于域、属于列表
   ```mathematica
   Print[{1 \[Element] Integers, 1.01 \[Element] Integers, 
 Pi \[Element] Reals, Pi \[Element] Rationals, 
 2 + 3 I \[Element] Complexes, MemberQ[{1, 3, 5}, PrimePi[2]], 
 MemberQ[{1, 3, 5}, PrimePi[4]]}]
   ```
1. 布尔运算
   ```mathematica 
   Print[{Boole[True], Boole[False], BooleanQ[True], BooleanQ[1]}]
   ```
#### 逻辑运算符 
1. 与(And)、或(Or)、非(Not)
   ```mathematica 
   ClearAll["Global`*"]
   {p,q,r}={False,True,True};
   Print[{p && q, p || q,  !p}]
   ```
2. 异或(Xor)、同或(Xnor)、与非(Nand)、或非(Nor)、蕴含(Implies)、等价(Equivalent)
   ```mathematica 
   ClearAll["Global`*"]
   {p,q,r}={False,True,True};
   Print[{Xor[p, q], p \[Xor] q, Xnor[p, q], p \[Xnor] q, Nand[p, q], 
 p \[Nand] q, Nor[p, q], p \[Nor] q, Implies[p, q], p \[Implies] q, 
 Equivalent[p, q], p \[Equivalent] q}]
   ```
#### 条件

1. 条件判断
	```mathematica
	rollDie[] := Module[{result},
	result = RandomInteger[{1, 6}];
	If[result == 1, 
	    Print["You rolled a 1, what a bad start!"], 
	    If[result == 6, 
	        Print["You rolled a 6, what a lucky start!"], 
	        Print["You rolled a ", result, ", keep going!"]
	    ]
	]
	]
	rollDie[]  (* Call the function to simulate rolling a die *)
	```
    扩展绝对值函数到复数(模长)
    ```mathematica 
    abs[x_]:=If[x>0,x,-x,Sqrt[Re[x]^2+Im[x]^2]]
    Print[{abs[-3], abs[3.14], abs[3+4I]}]
    ```
  
2. 多重条件判断
   使用`which`得到分段函数
   ```mathematica
   unitSin[x_] := Which[x < -Pi/2, -1, x > Pi/2, 1, True, Sin[x]]
   unitsin=Plot[unitSin[x], {x, -3, 3}];
   Export["unitSin.png", unitsin];
   ```
   ![[unitSin.png]]
   使用`Piecewise`函数，也可以得到完全一样的图形
   ```mathematica 
   unitSin[x_] := Piecewise[{{-1, x < -Pi/2}, {1, x > Pi/2}}, Sin[x]]
   Plot[unitSin[x], {x, -3, 3}]
   ```
   猜数游戏
   ```mathematica
	numberGuessingGame[] := Module[{target = RandomInteger[{1, 100}], guess, difference},
	  Print["Welcome to the Number Guessing Game! Guess a number between 1 and 100."];
	  
	  While[True,
	    guess = Input["Enter your guess: "];
	    difference = Abs[target - guess];
	    
	    Which[
	      difference == 0, 
	        Print["Congratulations! You've guessed the right number: ", target, "!"];
	        (* Exit the loop when guessed correctly *)
	        Break[],  
	      difference <= 5, 
	        Print["Very close! You're within 5."],
	      difference <= 15, 
	        Print["Close! You're within 15."],
	      difference <= 30, 
	        Print["Not too far! You're within 30."],
	      True, 
	        Print["Way off! Try again!"]
	    ];
	  ]
	]
	(* Start the game *)
	numberGuessingGame[] 
	```

    `Which`是多个条件，而如果只有一个表达式，需要根据该表达式匹配不同的情形，则使用`Switch`:

    ```mathematica
    animal = "Dog";
    description = Switch[
        animal,
        "Dog", "A dog is a loyal companion.",
        "Cat", "A cat is independent and curious.",
        "Bird", "A bird can sing and fly.",
        _, "Unknown animal."
    ]
    ```

### 循环
#### `For`循环
根据公式$\frac{\pi}{4}=1-\frac{1}{3}+\frac{1}{5}-\frac{1}{7}+\frac{1}{9}+\cdots$, 求$\pi$的近似值.
  ```mathematica 
  apprxPi[eps_] := Module[{n = Floor[1/eps], i, sum = 0.0, sign = 1},
   For[i = 1, i <= n, i += 2,
    sum += sign/i;
    sign = -sign;
   ];
   N[NumberForm[4.0*sum, Floor[Log10[n]] + 1]]
  ]
  Print[apprxPi[10^-6]]
 ```
 利用`For`循环给出一个倒计时游戏。
 ```mathematica
 countdownGame[start_Integer] := Module[{event, i},
   Print["Starting countdown from ", start, "!"];
   
   For[i = start, i > 0, i--,
     event = RandomChoice[{"Nothing happens.", "You find a treasure!", "A monster appears!", "You gain a bonus point!"}];
     Print[i, ": ", event];
     Pause[1];  (* Pause for a second for dramatic effect *)
   ];
   
   Print["Blast off!"];
 ]
 (* Start countdown from 10 *)
 countdownGame[10]
 ```
#### `While`循环
  计算一个十进制数的$p$进制表示.
  ```mathematica
  positiveIntegerQ[n_] := n \[Element] PositiveIntegers
  Print[positiveIntegerQ /@ {-1, 0, 3}]
  toPnary[num_?positiveIntegerQ, p_?positiveIntegerQ] := 
   Module[{i, bin = {}, r = num},
    While[r > 0,
     i = Mod[r, p];
     bin = Prepend[bin, i];
     r = Floor[r/p];
     ];
    bin]
  Print[toPnary[9, 2]]
  ```
  辗转相除法求最大公约数
  ```mathematica 
  gcd[m_, n_] := Module[{r = m, s = n, t},
  While[s != 0,
   (*Print[{r,s}];*)
   t = Mod[r, s];
   r = s;
   s = t;
   ];
  r]
Print[gcd[10, 8]]
  ```
#### `NestWhile`嵌套循环列表
 求正整数$N$的下一个素数。
 ```mathematica
 positiveIntegerQ[n_] := n \[Element] PositiveIntegers
 nextPrime[n_?positiveIntegerQ] := 
  NestWhile[# + 1 &, n + 1, ! PrimeQ[#] &]
 Print[nextPrime /@ {5, 9, 888}]
 ```
 猫映射：天才数学家Arnold提出一种映射，对 $a,b,N\in\mathbb{N}^+$, 以及任意的 $(x_0,y_0)\in \mathbb{N}^+\times \mathbb{N}^+$, 若定义
 $$
  \begin{pmatrix}
    x_{n+1}\\ y_ {n+1}
    \end{pmatrix}=
  \begin{pmatrix}
    1   &   a \\
    b& a b+1
    \end{pmatrix}
    \begin{pmatrix}
    x_n \\
  y_n 
\end{pmatrix}\pmod N
 $$
 可以证明，该映射一定是周期的。
 ```mathematica 
 positiveIntegerQ[n_] := n \[Element] PositiveIntegers
 catMap[{x0_?positiveIntegerQ, 
    y0_?positiveIntegerQ}, {a_?positiveIntegerQ, b_?positiveIntegerQ}, 
   n_?positiveIntegerQ] := Module[
   {max = 1},
   NestWhileList[
    Mod[{#[[1]] + a  #[[2]], b  #[[1]] + (a  b + 1) #[[2]]}, n] &, {x0,
      y0}, max++ < 31 &]
   ]
 catMapList = catMap[{2, 3}, {3, 7}, 15]
 Position[catMapList, {2, 3}]
 Graphics[{{PointSize[Large], Point[catMapList]}, 
   Map[Arrow, Partition[catMapList, 2, 1]]}]
```
#### `Do`循环
练习：使用循环给出连分数展开$\pi$的序列.
```mathematica
num = Pi;
L = {};
Do[AppendTo[L, Floor[num]]; num = 1/(num - Floor[num]) , {i, 5}]
Print[L]
(*验证*)
ContinuedFraction[Pi, 5]
``` 
### 函数、表达式与列表
#### 函数的定义
1. 使用模式匹配加延迟赋值
```mathematica
f[x_]:=x^2
g[x_,y_]:= Sin[x] Cos[y]
(*函数的使用*)
Print[f[2]]
Print[g[2,3]]
```
2. 匿名函数
```mathematica
(*完整形式*)
f1=Function[x,x^2]
(*简写形式*)
f2=#^2&;
g1=Function[{x,y},Sin[x]Cos[y]]
g2=Sin[#1]Cos[#2]&;
(*函数的使用*)
Print[f1[2]];
Print[f2[2]];
Print[g1[2,3]];
Print[g2[2,3]];
```
#### 函数的应用举例
- 求不大于正整数$n$的所有素数的和。
```mathematica
IsPrime[n_] := 
 Module[{max = Floor[Sqrt[n]] + 1, i = 2}, 
  While[i < max && Mod[n, i] != 0, i++]; n >= 2 && i >= max]
Print[Range[20]]
Print[IsPrime /@ Range[20]]
PrimeSum[n_]:=Module[{s = 0}, Do[If[IsPrime[i], s += i], {i, n}]; Print[s]]
PrimeSum[10]
```
我们也可以利用Mathematica内建函数来实现。`PrimePi[n]`给出不超过`n`的素数个数；`Prime[n]`给出第`n`个素数。
```mathematica
Print[Plus @@ Prime /@ Range@PrimePi[#] &[10]]
```
由于Mathematica内部存储了前10亿个素数的素数表，故后者运行速度更快。
#### 内建函数的简写形式
```mathematica
FullForm[Plus @@ Prime /@ Range@PrimePi[#] &]
```
可见，`@@`就是`Apply`， `/@`就是`Map`, `f@x`相当于`f[x]`.
#### 函数式编程
我们在使用MMA时，习惯于用内建函数来替代很多可能很复杂的程序。在计算机“理解”这些表达式的时候，首先就是将表达式翻译成语法树。事实上，我们可将所有的表达式都视为一个图论中的树（函数即节点、自变量即分支）：
```mathematica
Export["TreeFormofExpression.png", TreeForm[(a + b^n)/z == x]]
```
![[TreeFormofExpression.png]]
而MMA内部也是这样来理解表达式的。
```mathematica
Export["FullFormofExpression.png", FullForm[(a + b^n)/z == x]]
```
![[FullFormofExpression.png]]
因此，什么是一个MMA的表达式呢？
> 在 Mathematica 中，满足如下条件的对象就叫做表达式(expression):
> 1. 原子对象是表达式；
> 2. 若 $F$、$X_1$、$X_2$、$\ldots$、$X_n$ 是表达式，则 $F[X_1, X_2, \ldots, X_n]$也是表达式。

Mathematica 中的一切对象都是表达式，一个 Mathematica 程序就是一个表达式。这一事实如此地重要，以至于有人将它称为 Mathematica 的第一原理:
> Mathematica 第一原理：万物皆表(达式).
 
 常见运算符的完整形式 
```mathematica
Export["FullFormofCommenOperator.png", 
FullForm /@ {a + b, a - b, a*b, a/b, a^b,
a == b, a != b, a < b, 
  a <= b, a > b, a >= b, a && b, a || b}//TableForm]
```

![[FullFormofCommenOperator.png]]
```mathematica
Export["EpsilonDelta.png",ForAll[\[Epsilon], \[Epsilon] > 0, 
  Exists[\[Delta], \[Delta] > 0, 
   ForAll[x, Abs[x - Subscript[x, 0]] < \[Delta], 
    Abs[f[x] - f[Subscript[x, 0]]] < \[Epsilon]]]] // TraditionalForm]
```
![[EpsilonDelta.png]]
那么Mathematica如何计算表达式呢？我们通过计算$\int_0^{2\pi}\sin^2(x)dx$来说明。
```mathematica
res=Trace[(#2 - #1) & @@ (Integrate[Sin[x]^2, x] /. {x -> #} & /@ {0, 
     2 Pi})]
Export["TraceIngtegrate.png", StandardForm[res]]
```
![[TraceIngtegrate.png]]
仔细分析这个过程可以发现, 在每一步里我们做的其实都是下面这两件事:
1. 从待计算对象中识别一些可化简的模式;
2. 将识别出的模式用已知的规则进行化简.

Mathematica 也是这样进行计算的, 其中第一步叫做模式匹配, 第二步叫做规则代入. 基于模式和规则的计算模型在数理逻辑或者计算机科学中叫重写系统(rewriting system).
> 	Mathematica 第二原理: 计算即重写.

事实上，我们后面就会发现：Mathematica语言和其它**函数式编程语言**拥有一个共同的原理，那就是把**函数视为最基本的、可操作的对象**. Mathematica 的这一特征是如此重要, 以至于我们要将它总结为第零原理.
> 	Mathematica 第零原理: 重要的是函数, 而非变量.

#### 表达式
回忆, 一个表达式或者是原子, 或者是形如`F[X1, X2, ... , Xn]` 的函数. 我们称`F`为表达式的头(Head).
```mathematica
Print[Head /@ {1, 1/2, True, "number", a + b, a - b, a*b, 
  a/b, (f + g)[x1, x2, x3]}]
```
这里`/@`的全名叫`Map`， 即将函数作用到后面的各个变量，而不用重复写函数名。
猜猜下面的例子的输出是什么？
```mathematica
Print[h /@ k[x1, x2, x3]]
```
从上面的例子我们发现，符号的头总是`Symbol`; 数字的头则依赖于它的类型，结果可以是`Integer`、`Rational`、`Real` 和 `Complex`; 字符串的头总是`String`; 图片的头是`Image`等等.

除了表达式的头，常常一个函数的参数也需要取出来进行操作. 它是一些表达式构成的序列，是没有头的. 但是在 Mathematica 里所有的表达式都必须有头, 所以为了处理这种无头表达式，Mathematica 引入表（List）这个概念，然后规定所有的无头表达式的头都是`List`.
```mathematica
ex = f[x1, x2, x3];
Print[List @@ ex]
```
List 本身也是 Mathematica 的一个内部函数，它的作用是将输入的表达式序列做成一个表. 表达式 `x1, x2, ... , xn` 构成的表记为 `{x1, x2,..., xn}`.
```mathematica
Print[List[1, 2, 3]]
```

上面取函数`f`的参数的操作相当于将头`f`替换为了头`List`, 这里`@@`的全名是`Apply`. 上述换头术也是非常常用的操作.
```mathematica
Print[Apply[g, h[x1, x2, x3]]]
Print[g@@h[x1,x2,x3]]
```

有时，我们希望将一个函数的参数作为参数传给另一个函数，这时候上述换头得到的表就多了一层花括号(`{`和`}`), 如果不想要这层花括号, 就要用 `Sequence`换头.
```mathematica
ex = h[1, 2, 3];
seq = Sequence @@ ex;
lst = List @@ ex;
Print[seq]
Print[lst]

Print[f[seq]]
Print[f[lst]]
Print[f @@ lst]
Print[f[seq, lst, 4, 5, 6]]
```
除了用 `Head` 和 `Apply` 以外，Mathematica 还提供了另一种访问复合表达式内部表达式的方法，即系统内建函数 `Part`，简写形式为 `[[...]]`.
```mathematica
ex = f[x1, x2, x3];
Print[{ex[[0]], ex[[1]], ex[[2]], ex[[3]]}]
```
对于嵌套表达式，我们可以多次取`Part`:
```mathematica
ex = f[a, g[b, c], h[d, k[e, i], j]];
Print[ex[[3]][[2]][[2]]]
(*效果一样*)
Print[ex[[3,2,2]]]
```
Part 还有很多其它的变体，详见帮助系统. 例如：
```mathematica
ex = f[a, g[b, c], h[d, k[e, i], j]];
Print[ex[[-1, -2, -1]]]
Print[ex[[{2, 3}]]]
Print[ex[[1 ;; 2]]]
Print[ex[[1 ;; 3 ;; 2]]]
```
对一个表达式，它有两个重要的量，即长度和深度:
```mathematica 
ex = f[a, g[b, c], h[d, k[e, i], j]];
Print[Length[ex]]
Print[Depth[ex]]
```
此外，对最常用的一些`Part`有内建函数：
```mathematica
Print[Function[op, op[f[x1, x2, x3, x4]]] /@ {First, Last, Rest, Most}]
Print[Take[f[x1, x2, x3, x4], {2, 3}]]
Print[Drop[f[x1, x2, x3, x4], {2, 3}]]
```
#### 列表的构造
使用`Import`导入`Excel`数据：
```mathematica
data=Import["MathStuScore.xlsx","XLSX",
  CharacterEncoding->"MacintoshChineseSimplified"]
  (*在Mathematica 笔记本中能够正常运行*)
Print[data]
```
使用`Range`:
```mathematica
Print[Range[10]]
Print[Range[2, 10]]
Print[Range[2, 10, 3]]
```
使用`Table`:
```mathematica
Print[Table[i^2 + i + 1, {i, 10}]]
Print[Table[KroneckerDelta[i, j - 1] + t KroneckerDelta[i, j + 4], {i, 
   5}, {j, 5}]]
```
打印九九乘法表：
```mathematica
multiplicationTable=Grid[Table[ToString[j]<>"*"
 <>ToString[i]<>"="<>ToString[i*j],
 {i,9},{j,i}], Alignment->{Left, Baseline}
];
Export["multiplicationTable.png", multiplicationTable];
```
![[multiplicationTable.png]]
练习：使用列表生成杨辉三角并打印：
```mathematica
YangsTriangle[n_]:=Module[{
  
}, Table[{i,n}]]
```
使用`Array`:
```mathematica
Print[Array[#^2 + # + 1 &, 10]]
Print[#^2 + # + 1 & /@ Range[10]]
```
`Tuples`与`Outer`:
```mathematica
Print[Tuples[{a, b, c}, 3]]
Print[Outer[f, {a, b}, {c, d, e}]]
```
#### 列表的查询
我们可以使用`MemberQ`和`FreeQ`来判断元素是否属于列表。
```mathematica
ex = f[x1, x2, x3, x4];
Print[Function[i, MemberQ[ex, i]] /@ {f, x1, x2, x3, x4, x5, x6}]
Print[Function[i, FreeQ[ex, i]] /@ {f, x1, x2, x3, x4, x5, x6}]
Print[MemberQ[ex, f, Heads -> True]]
```
使用`Count`计算列表中给定元素出现的次数。
```mathematica
ex={a, b, a, a, {b, b, b}, b^b, c, b};
Print[Count[ex, b]]
Print[Count[ex, b, {2}]]
```
使用`Position`查找给定元素的位置。
```mathematica
euler = (a + b^n)/n == x;
(*FullForm=Equal[Times[Plus[a,Power[b,n]],Power[n,-1]],x]*)
Print[Position[euler, n]]
```
使用`Select`选择列表中的元素是的条件为真:
```mathematica
Print[Select[Prime /@ Range[10], OddQ]]
Print[Select[Prime /@ Range[10], Mod[#, 4] == 1 &]]
```
#### 添加删除和修改列表元素
```mathematica
ex = f[a, b, c];
Print[{Prepend[ex, z], 
  Append[ex, d], 
  Insert[ex, i, 2], 
  Insert[ex, i, -2]}]
Print[ex]
Print[{PrependTo[ex, z], AppendTo[ex, d]}]
Print[Delete[ex, 1]]
Print[Delete[ex, {{1}, {-1}}]]
Print[{ReplacePart[ex, 1 -> x], ex}]
Print[ex]
ex[[1]] = y;
Print[ex]
Print[Reverse[ex]]
Print[RotateLeft[ex, 2]]
Print[RotateRight[ex, -2]]
Print[RotateRight[ex, 2]]
```
头部一样的表达式之间的集合运算：
```mathematica
Print[#[f[x1, x2], f[x1, x3]]&/@{Join,Union,Intersection,Complement}]
```
排序
```mathematica
list = Array[RandomInteger[5] &, {6, 2}];
Print[list]
Print[Sort[list]]
(*上述命令等价于下列命令*)
Print[Sort[list, Function[{list1, list2}, list1[[1]] < list2[[1]] ] ] ]
(*更加简洁地，等价于下列命令*)
Print[Sort[list, #1[[1]] < #2[[1]] &] ]
Print[Sort[list, #1[[1]] <= #2[[1]] &]]
(*上一条命令等价于下列命令*)
Print[Sort[list, (#1[[1]] < #2[[1]]) 
	|| (#1[[1]] == #2[[1]] && #1[[2]] > #2[[2]]) &]]
```
排序索引
```mathematica
list = {2, 3, 5, 1, 4};
Print[Sort[list]]
(*使用Ordering输出排序后的位置索引*)
Print[Ordering[list]]
Print[list[[Ordering[list]]]]
```

练习：找出不大于 $n$ 的所有无平方因子的自然数。
> 如果除 $1$ 以外没有其他完全平方数可以将其整除，则称整数 $n$ 不包含平方因子.
> ![[10以内的无平方因子数.png]]
```mathematica
allNonSquareNumbers[n_] := 
	Select[Range[n], SquareFreeQ[#] &]
Print[allNonSquareNumbers[15]]
```
下面是另外的解法：

* 方法一：`AppendTo`

  ```mathematica
  solution1 =
    Function[n, L = {}; 
     Function[i, If[SquareFreeQ[i], AppendTo[L, i]]] /@ Range[n]; L];
  Print[solution1[15]]
  ```

* 方法二：`PrependTo`

  ```mathematica
  solution2 =
    Function[n, L = {}; 
     Function[i, If[SquareFreeQ[i], PrependTo[L, i]]] /@ Range[n]; 
     Reverse[L]];
  Print[solution2[15]]
  ```
* 方法三：嵌套表 + `Flatten`
  ```mathematica
  solution3[n_] :=Module[{L={}},
    If[SquareFreeQ[#], L = {L, #}]& /@ Range[n];
     Print[Flatten[L]]];
  solution3[15]
  ```
* 方法四：收获(`Reap`)与播种(`Sow`)
  ```mathematiac
  solution4[n_]:= 
 Reap[If[SquareFreeQ[#], Sow[#], 0]&/@Range[n]][[2, 1]];
  allNonSquareNumbers[15]
  ```
练习：求Pell方程$x^2 - 2 y^2 = 1$的满足$1 \leq y \leq n$的解。
```mathematica
L = {};
Do[If[Sqrt[1 + 2 y^2] \[Element] Integers, 
  L = AppendTo[L, {Sqrt[1 + 2 y^2], y}]], {y, 20}]
Print[L]
(*使用Reap-Sow*)
Print[Reap[Do[If[x = Sqrt[1 + 2 y^2]; IntegerQ[x], Sow[{x, y}]], {y, 
    20}]][[2, 1]]
    ]
```

## 参考资料
- 清华刘思齐: [链接](https://cloud.tsinghua.edu.cn/d/e26004d487914c4f9f4e/)
- Wolfram U: [链接](https://www.wolfram.com/wolfram-u/?source=nav) 可以获得证书，有你名字

## 用MMA模拟三体运行
假设有三个天体, 其质量为：

```mathematica
m = 14982844643 {1, 1, 1};
```

初始位置处于正三角形：

```mathematica
p0 = {{-0.5, 0, 0}, {0.5, 0, 0}, {0, 0, 2 Sqrt[3]/2}};
```

初始速度为单位速度，分别为：

```mathematica
v0 = Normalize /@ {{0, -1, 0}, {0, 1, 0}, {1, 1, 1}};
```

根据牛顿运动定律，我们知道三体的位置满足如下常微分方程组：

```plaintext
D[p[k],{t,2}] = \sum_{i\neq k}G m[i] \frac{p[i]-p[k]}{\lvert p[i]-p[k] \rvert^3}.
```

利用MMA的数值计算，容易解得如下运行图，[点击运行：三体](figures/animation.mp4)。

完整代码如下：

```mathematica
Manipulate[Module[{v0, p0, m, gravConst, p, eq, res, pres},
  (*Initial velocities*)
  v0 = Normalize /@ {{0, -1, 0}, {0, 1, 0}, {1, 1, 1}};
  (*Initial positions*)
  p0 = {{-0.5, 0, 0}, {0.5, 0, 0}, {0, 0, 2 Sqrt[3]/2}};
  (*Masses*)
  m = 14982844643 {1, 1, 1};
  (*Gravitational constant*)
  gravConst = 6.67430*10^(-11);
  (*Positions as functions of time*)
  p = {{x1[t], y1[t], z1[t]}, {x2[t], y2[t], z2[t]}, {x3[t], y3[t], z3[t]}};
  (*Equations of motion*)
  eq[i_, j_, k_, t_] := 
   gravConst*(m[[i]]*(p[[i]] - p[[k]])/Norm[p[[i]] - p[[k]]]^3 + 
      m[[j]]*(p[[j]] - p[[k]])/Norm[p[[j]] - p[[k]]]^3);
  (*Solving the differential equations*)
  res = NDSolve[Flatten[{
       Thread[D[p[[1]], {t, 2}] == eq[3, 2, 1, t]],
       Thread[D[p[[2]], {t, 2}] == eq[1, 3, 2, t]],
       Thread[D[p[[3]], {t, 2}] == eq[1, 2, 3, t]],
       Thread[(p /. t :> 0) == p0],
       Thread[(D[p, t] /. t :> 0) == v0]}], p, {t, 0, tmax}][[1]];
  (*Extracting positions at final time*)
  pres = p /. res;
  (*Creating points for each mass*)
  points = 
   Graphics3D[{PointSize[Large], 
     Table[{ColorData[1, i], Point[pres[[i]] /. t -> tmax], 
       Point[pres[[i]] /. t -> 0]}, {i, 3}]}];
  (*Creating trajectories*)
  trajectories = 
   ParametricPlot3D[pres, {t, 0, tmax}, 
    PlotStyle -> Table[ColorData[1, i], {i, 3}], 
    PlotRange -> {{-1, 4}, {-2, 4}, {0, 4}}, 
    AxesLabel -> {"X", "Y", "Z"}, PlotLegends -> {"1", "2", "3"}];
  (*Displaying trajectories and points*)
  Show[trajectories, points, AxesLabel -> {"X", "Y", "Z"}]],
 (*Manipulate control*)
 {{tmax, 0.01}, 0, 14, AnimationRate -> 0.5, Appearance -> "Open"}
]
```

## R语言
[R教程](https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/index.html)
