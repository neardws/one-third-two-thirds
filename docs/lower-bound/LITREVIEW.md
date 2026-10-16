# 1/3–2/3 猜想：一般下界方向的文献综述

检索时间：2026-10-17（北京时间）。记 $\delta(P)=\max_{x\parallel y}\min\{\Pr[x<y],\Pr[y<x]\}$，概率取在线性扩张的均匀分布上；$\delta^*=\inf_{P\ \text{非全序}}\delta(P)$。猜想：$\delta^*\ge 1/3$（$1/3$ 由 $2+1$ 偏序取到）。

**核实标记**：✅ = 本次打开 arXiv 摘要页或全文核对过；☑️ = 只经由 ACPP (arXiv:2609.30888) 或 Aires–Kahn 的参考文献列表间接核实（作者、年份、期刊）；⚠️ = DOI 凭记忆给出，没有逐一打开核对，引用前请复查。

## 1. 一般下界的主线

| 年份 | 作者 | 核心方法 | 下界 | 卡在哪里 | 链接 |
|---|---|---|---|---|---|
| 1984 | Kahn–Saks | 平均高度 $h(x)=\mathbb E f(x)$；取 $h(x)\le h(y)\le h(x)+1$ 的不可比对；Stanley 不等式（Alexandrov–Fenchel ⇒ $\Pr[f(y)-f(x)=k]$ 对数凹）+“packing”极值论证 | $3/11\approx0.2727$ | 只用一对元素；对数凹约束下的极值序列本身就给出 $3/11$，方法用尽 | ☑️ Order 1 (1984) 113–126，⚠️ doi:10.1007/BF00565647 |
| 1991 | Kahn–Linial | Brunn–Minkowski + Grünbaum 质心定理（凸体过质心的超平面两侧至少 $1/e$） | $1/(2e)\approx0.184$（更弱但证明简单） | Grünbaum 的 $1/e$ 是几何常数，无法单独给出 $1/3$ | ☑️ Combinatorica 11 (1991) 363–368，⚠️ doi:10.1007/BF01275670 |
| 1991 | Karzanov–Khachiyan | 序多面体上的 Markov 链电导，同样用 Brunn–Minkowski | $1/e^2\approx0.135$ | 同上 | ☑️ Order 8 (1991) 7–15 |
| 1995 | Brightwell–Felsner–Trotter (BFT) | 取 $h(x)\le h(y)\le h(z)\le h(x)+2$ 的“BFT 三元组”，分 A/B/C/D 四种情形；Ahlswede–Daykin + Alexandrov–Fenchel；证明了交叉积不等式的 $k=\ell=1$ 特例 | $(5-\sqrt5)/10\approx0.2764$ | **无限障碍**：结论对无限偏序也成立，而无限 Fibonacci 偏序 $x_i\prec x_j\iff j-i\ge2$ 恰好取到这个常数，所以只用“局部”信息的论证无法超过它 | ☑️ Order 12 (1995) 327–349，⚠️ doi:10.1007/BF01110378 |
| 2025 | Aires–Kahn (AK25a) | 窗口参数 $\mathrm{win}(x)$、链多面体质心、对数凹估计、Komlós 定理推广 | 宽度 $\omega(\sqrt n)$ 或高度 $o(n)$ 时 $\delta\ge 1/e-o(1)$；宽度 $\Omega(n)$ 时 $\delta\to1/2$ | 只覆盖“大”偏序，常数结构与 $1/3$ 无关 | ✅ arXiv:2509.11549 |
| 2025 | Aires–Kahn (AK25b) | 方差 vs. range：$\pi\to\infty\Rightarrow\sigma\to\infty$；有界宽度下 $\sigma(x)\to\infty\Rightarrow\delta_x\to1/2$（XYZ + Graham–Yao–Yao + Stanley） | 有界宽度且 range 大时 $\delta\to1/2$ | 定性结论，常数没有显式化；需要宽度有界 | ✅ arXiv:2510.26134 |
| 2026 | Aires–Chan–Pak–Panova (ACPP) | 分三类：(i) range $\pi(P)\le D$：在 BFT 三元组里挑一个端点达到最大位移 $M=\max_i|h(v_i)-i|$ 的三元组，证 $\delta\ge C_{BFT}+M^2/441$，再用 $M\ge q_2=(D+1)^{-2(D+1)}$；(ii) 宽度 $>K$：canopy 反链 + Haqi–Kahn 理想不等式 + XYZ + 窗口估计，得 $\delta>e^{-1}-10^{-100}$；(iii) 宽度小、range 大：用 AK25b | $C_{BFT}+\varepsilon$，$\varepsilon=3^{-3^{16\times10^{18}}}$（第一个“打破无限障碍”的一般改进） | (i) 的增益 $\eta_D=(D+1)^{-4(D+1)}/4096$ 随 $D$ 指数衰减，三类拼接后 $\varepsilon$ 极小；作者自己在 §7.4 说要到 $+0.001$ 需要“新工具和新想法”。情形 C 的 BFT 论证其实给 $67/242\approx0.27686$（附录 A） | ✅ arXiv:2609.30888（全文核对） |

ACPP 关键中间结论（全文核对，转述）：
- 引理 3.2：若 $\pi(P)\le D$ 且 $\delta(P)\le C_{BFT}+\eta_D$，则每个 BFT 三元组都是情形 D（$x\prec z$, $y$ 与 $x,z$ 都不可比），$z$ 覆盖 $x$，$y$ 只与 $x,z$ 不可比，且 $xy,yz$ 是不可比图的桥。也就是说，接近 BFT 常数的偏序在局部必须长成“Fibonacci 式”的桥结构。
- 引理 4.2：在这种结构下 $\max\{\delta(x,y),\delta(y,z)\}\ge C_{BFT}+M^2/441$。
- 有限 Fibonacci 偏序 $\mathcal F_m$ 的边界对 $\to(3-\sqrt5)/2\approx0.382$，中心对 $\to C_{BFT}$；位移 $M$ 正好区分出边界。

## 2. 特殊类上的完整证明（$\delta\ge1/3$）

| 年份 | 作者 | 偏序类 | 方法 | 局限 | 链接 |
|---|---|---|---|---|---|
| 1984 | Linial | 宽度 2 | 一条链上找“扩散”元素，格路论证 | 不能推广到宽度 3 | ☑️ SIAM J. Comput. 13 (1984) 795–801，⚠️ doi:10.1137/0213050 |
| 1985 | Aigner | 宽度 2 的等号情形 | 证明宽度 2 时 $\delta=1/3$ 只在 $2+1$ 及其直和型出现 | 同上 | ☑️ Order 2 (1985) 257–264 |
| 1987 | Ganter–Häfner–Poguntke | 有非平凡自同构的偏序 | 对称性直接给出 $1/2$ 对 | 一般偏序无对称 | ☑️ Discrete Math. 63 (1987) 153–156 |
| 1989 | Brightwell | 半序 (semiorders) | 区间结构 | 依赖区间表示 | ☑️ Order 5 (1989) 369–380 |
| 1992 | Trotter–Gehrlein–Fishburn | 高度 2 | 组合计数 | 只对高度 2 | ☑️ Order 9 (1992) 43–53，doi:10.1007/BF00419038（仓库已有） |
| 1992 | Brightwell–Wright | 5-thin（range $\le5$） | 局部构型的有限穷举 + 计算 | 构型数和见证强度随 $k$ 爆炸 | ☑️ SIAM J. Discrete Math. 5 (1992) 467–474，doi:10.1137/0405037 |
| 1993 | Friedman | 高度 $O(\log\log n)$；Friedman 条件下 $\delta>1/e-o(1)$ | 序多面体几何（Grünbaum 型） | 渐近；高度大时失效 | ☑️ SIAM J. Comput. 22 (1993) 72–78，doi:10.1137/0222007 |
| 2008 | Peczarski | 6-thin（并证金分割猜想 gold partition 在该类成立） | 计算机辅助的局部构型验证（约 787 CPU 小时） | ACPP：“方法对更大 $D$ 失效”；本仓库复现时 $k\ge4$ 已有大量未解构型 | ☑️ Order 25 (2008) 91–103，doi:10.1007/s11083-008-9081-9 |
| 2012 | Zaguia | N-free | 结构分解 | 依赖禁止子结构 | ☑️ EJC 19(2) (2012) P29 |
| 2018 | Olson–Sagan | Young 图偏序等 | 显式计数 | 特殊类 | ☑️ Order 35 (2018) 581–596 |
| 2019 | Zaguia | 覆盖图是森林 | 结构归纳 | 特殊类 | ☑️ Order 36 (2019) 335–347 |
| 2021 | Sah | 宽度 2：$\delta\ge(-3+5\sqrt{17})/52\approx0.33876$（严格大于 $1/3$，非直和时） | 格路 + 精细不等式 | 只宽度 2 | ✅ arXiv:1811.01500 |
| 2026 | Gupta | $|P|\le14$ 全部成立 | 穷举 | 有限规模 | ✅ arXiv:2607.23926 |
| 2026 | ACPP Thm 1.4 | 宽度 $>K$（$K$ 未显式化） | 见上 | $K$ 天文数字 | ✅ |

## 3. 工具线：对数凹、交叉积、熵

| 年份 | 作者 | 内容 | 与下界的关系 | 链接 |
|---|---|---|---|---|
| 1981 | Stanley | Alexandrov–Fenchel ⇒ $N_k=\#\{f: f(x)=k\}$ 对数凹 | Kahn–Saks、BFT 的核心输入 | ☑️ JCTA 31 (1981) 56–65 |
| 1982 | Shepp | XYZ 不等式 | AK25b、ACPP 用到 | ☑️ Ann. Probab. 10 (1982) 824–827 |
| 1995 | Kahn–Kim | 图熵 ⇒ 用 $O(\log e(P))$ 次比较排序；不需要 $1/3$ 对 | 算法上绕开了猜想；但熵方法本身不给出单对平衡常数 | ☑️ JCSS 51 (1995) 390–399，⚠️ doi:10.1006/jcss.1995.1077 |
| 2010/13 | Cardinal–Fiorini–Joret–Jungers–Munro | 不用椭球法的熵排序算法 | 同上：说明“信息论”路线对算法够用，对 $\delta^*$ 没有直接贡献 | ✅ arXiv:0911.0086 |
| 1995 | BFT | 交叉积猜想 (CPC) $F(k{+}1,\ell)F(k,\ell{+}1)\ge F(k,\ell)F(k{+}1,\ell{+}1)$；证明 $k=\ell=1$ | BFT 下界只用了这一特例 | 同上 |
| 2022 | Chan–Pak–Panova | CPC 对宽度 2 成立 | 宽度 2 已知猜想成立，不改进一般下界 | ✅ arXiv:2104.09009 |
| 2023 | Chan–Pak–Panova | Kahn–Saks 不等式在宽度 2 的推广 | 同上 | ✅ arXiv:2106.07133（仓库旧综述已列） |
| 2025 | Chan–Pak–Panova | 弱 CPC：$F(k{+}1,\ell)F(k,\ell{+}1)\ge(\tfrac12+\varepsilon)F(k,\ell)F(k{+}1,\ell{+}1)$，$\varepsilon$ 依赖于偏序；**推广版 CPC 被否定** | 一般 CPC 仍开放；ACPP §2.2 明确说 CPC 一般情形是“challenging open problem” | ✅ arXiv:2306.09240，Can. J. Math. 77 (2025) 535–562 |
| 2022 | Ma–Shenfeld | Stanley 不等式等号情形的完全刻画 | 给出“何时对数凹是紧的”，可用于稳定性/改进 | ✅ arXiv:2211.14252（搜索摘要核对） |
| 2025 | Chan–Pak | 线性扩张综述（§11 讲 1/3–2/3） | 现状总结 | ✅ arXiv:2311.02743 |
| 2026 | Haqi | 证明 Haqi–Kahn 理想不等式 $\max_{x\in I}h(x)\ge|I|-|\max I|+1$ | ACPP 大宽度情形的关键 | ✅ arXiv:2608.12678 |

## 4. 已记录的障碍与失败路线

1. **无限障碍**（BFT95 §7；Brightwell 1999 综述）：Kahn–Saks/BFT 式论证对无限偏序同样成立，而无限 Fibonacci 偏序 $\delta=C_{BFT}$。任何只看“高度相近的几个元素”的局部论证都不能超过 $0.2764$。ACPP 用全局量（位移 $M$、有限性）才绕过去。
2. **Grünbaum 常数 $1/e$**：几何（质心）方法天然给 $1/e\approx0.368>1/3$，但只在“窗口大于高度差”时适用（AK25a 引理 5.7），对小偏序/窄偏序无效。
3. **CPC 一般情形开放，推广版为假**（CPP25）。BFT 的 0.2764 只用了 CPC 的 $(1,1)$ 特例；能否用更多 CPC 实例改进情形 D 不清楚，且 ACPP 证明表明在接近 $C_{BFT}$ 时情形 D 会被迫变成桥结构，额外不等式的收益可能为零阶小量。
4. **局部穷举的爆炸**（Brightwell–Wright、Peczarski，以及本仓库 track2_thin 复现）：$k$-thin 的构型数尚可，但单个构型的“见证”需要越来越强；$k\ge7$ 无公开结果。
5. **熵/信息论**（Kahn–Kim、Cardinal 等）：只保证存在“平均意义上”好的比较，不能导出单对 $\ge1/3$。
6. **ACPP 常数**：$\varepsilon$ 来自 $\eta_D$ 的指数衰减和大宽度阈值 $K$ 的不显式性，三段拼接。

## 5. 一句话现状

一般下界：$\delta^*\ge C_{BFT}+\varepsilon$，$\varepsilon$ 微乎其微（ACPP 2026）；有效数值仍是 $0.2764$。上界侧：$\delta^*\le$ 本仓库的 $\gamma\approx0.3488434595$。猜想在宽度 2、高度 2、6-thin、N-free、半序、森林覆盖图、$n\le14$、大宽度（$K$ 未显式）等类上成立。剩下真正开放的是“宽度和 range 都中等”的区域，而这正是 ACPP 三段拼接中常数最差的地方。
