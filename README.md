# one-third-two-thirds

Computational experiments on the **1/3–2/3 conjecture** for finite posets (exhaustive verification for small n, and the "gap above 1/3" for width-2 posets).
关于有限偏序集 **1/3–2/3 猜想** 的计算实验（小规模穷举验证，以及宽度 2 偏序中 1/3 上方“空隙”的研究）。中文说明见下方。

## Problem

For a finite poset P that is not a chain, let p(x<y) be the fraction of linear extensions in which x precedes y, and
δ(P) = max over pairs x,y of min(p(x<y), p(y<x)).
The 1/3–2/3 conjecture (Kislitsyn 1968, Fredman 1975, Linial 1984) says δ(P) ≥ 1/3 for every such P. It is open in general. Formal statement: [formal-conjectures `conjecture_1_3_to_2_3.lean`](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/Wikipedia/conjecture_1_3_to_2_3.lean).

## Methods
- `src/delta.c`, `src/run.py`, `src/analyze.py`, `src/show.py`: enumerate all posets up to isomorphism for n ≤ 11 (counts match OEIS A000112) and compute δ exactly (rational arithmetic) by DP over the ideal lattice.
- `src/w2.c`, `src/w2lib.py`: width-2 posets encoded as two chains with cross-relations (the (f,g) / lattice-path representation); exhaustive search of indecomposable (not a linear sum) width-2 posets up to n = 20.
- `src/ladder.py`, `src/chen.py`: full ladders and Chen's (2018) broken ladders.
- `src/sa.c`: simulated annealing on the (f,g) representation, minimising δ (n = 30–101).
- `src/indep.py`, `src/check60.py`, `src/check80.py`: an **independent** exact checker (transitive closure from explicit relations, BFS over ideals, integer counts; also checks indecomposability). Cross-checked against brute force on 200 random small posets.
- `src/pecz.py`: recomputes every poset in Peczarski's published table (all 27 values agree).
- `src/draw.py`: Hasse diagrams.

## Key results
1. **All non-chain posets with n ≤ 11** (~49.5 million) satisfy δ ≥ 1/3. No counterexample. (Small-case verification, not a proof; [Gupta 2026](https://arxiv.org/abs/2607.23926) reports verification up to n = 14.) Posets with δ = 1/3 for n ≤ 11 are exactly linear sums of singletons and at least one copy of the 3-element poset {a<b, c}; counts per n: 1, 2, 3, 5, 8, 12, 18, 27, 40.
2. **Width-2 indecomposable minima, n ≤ 20** (`data/width2_minima.csv`):

| n | min δ | ≈ |
|---|---|---|
| 4 | 2/5 | 0.40000 |
| 5 | 3/8 | 0.37500 |
| 6 | 5/14 | 0.35714 |
| 7 | 9/25 | 0.36000 |
| 8 | 16/45 | 0.35556 |
| 9 | 6/17 | 0.35294 |
| 10 | 37/106 | 0.34906 |
| 11 | 20/57 | 0.35088 |
| 12 | 97/277 | 0.35018 |
| 13 | 157/448 | 0.35045 |
| 14 | 254/725 | 0.35034 |
| 15 | 166/475 | 0.34947 |
| 16 | 665/1898 | 0.35037 |
| 17 | 1304/3737 | 0.34894 |
| 18 | 387/1108 | 0.34928 |
| 19 | 458/1311 | 0.34935 |
| 20 | 6059/17366 | 0.34890 |

   Minimisers are broken ladders; full ladders tend to (1+3√5)/22 ≈ 0.35037, Chen's period-5 family to ≈ 0.348900.
3. **Broken ladders below Sah's β** = (5864893+27√57)/16812976 ≈ 0.348843467422 (exact δ, independently verified; `data/below_beta.json`, `data/P60.json`, `data/P81.json`):

| n | δ (exact) | ≈ |
|---|---|---|
| 57 | 236624677/678311920 | |
| 60 | 4948107449/14184320534 | 0.348843459730 |
| 72 | 95562661439/273941387768 | 0.348843459609 |
| 80 | 59165451235279/169604587978180 | 0.348843459606 |
| 81 | 58094520507875/166534641555764 | |
| 91 | 6304556942893505/18072739416224156 | |

   Below β from 53 elements. Best (n = 80) is ≈ 8.2×10⁻¹⁰ below the best value in Peczarski's table (50 elements, 1087457557/3117322468 ≈ 0.348843460426). All values remain above 0.348843, so Peczarski's gap conjecture is not contradicted.

## Comparison with the literature
- M. Peczarski, *The Worst Balanced Partially Ordered Sets—Ladders with Broken Rungs*, Experimental Mathematics 28 (2019) 181–184, online 2017, [doi:10.1080/10586458.2017.1368050](https://doi.org/10.1080/10586458.2017.1368050). Defines broken ladders and lists 27 posets (recomputed here, all agree; `data/pecz_table.json` holds the values with this citation). His search above 28 elements used a restricted gap pattern, up to 54 elements.
- E. Chen, *A family of partially ordered sets with small balance constant*, 2018 (period-5 broken ladders, limit ≈ 0.348900).
- A. Sah, *Improving the 1/3–2/3 conjecture for width two posets*, [arXiv:1811.01500](https://arxiv.org/abs/1811.01500) (δ ≥ 0.33876 for width 2; family with limit β).
- Gupta 2026, [arXiv:2607.23926](https://arxiv.org/abs/2607.23926) (computational verification up to n = 14).
- Linial 1984 (width 2 case proved); Aigner 1985 (characterisation of δ = 1/3 for width 2).

## Novelty statement (honest)
- The class of posets (broken ladders) is Peczarski's; nothing structural here is new.
- Our values are lower than every value in Peczarski's 2017/2019 table. We have **not** checked work published after it, so this is only a candidate improvement.
- The improvement concerns only the width of the gap above 1/3. **Nothing about the 1/3–2/3 conjecture itself is resolved.**

## Reproduce
```bash
cd src
gcc -O2 -o delta delta.c && gcc -O2 -o w2 w2.c && gcc -O2 -o sa sa.c -lm
pip install sympy mpmath matplotlib
# scripts read/write data files in the current directory:
cd ../data && gunzip -k results.csv.gz
PYTHONPATH=../src python ../src/run.py        # enumeration (needs ../src/delta; n=11 takes hours)
PYTHONPATH=../src python ../src/check60.py    # independent exact check of P60
PYTHONPATH=../src python ../src/check80.py
PYTHONPATH=../src python ../src/pecz.py       # recompute Peczarski's table
```
Paths inside scripts may assume the original flat working directory; adjust if needed. Requires Python 3.10+, gcc. Full raw per-poset data for n = 9, 10, 11 was not included (size); `results.csv.gz` has one row per poset for n ≤ 11 and `raw_11_filtered.csv` the extreme n = 11 cases.

Figures: `figures/` (δ histogram, width-2 minimum vs n, SA best vs β, Hasse diagram of P60). Working notes (Chinese): `docs/report*.md`.

---

# 中文说明

**问题。** 对不是全序的有限偏序 P，δ(P) = max 最小(p(x<y), p(y<x))。1/3–2/3 猜想断言 δ(P) ≥ 1/3，一般情形仍然开放。

**方法。** 精确有理数计算：枚举 n ≤ 11 的全部偏序；穷举宽度 2、不可拆层的偏序到 n = 20；在 (f,g) 表示上做模拟退火；用一套完全独立的代码复核；重算 Peczarski 论文表中的 27 个偏序（全部一致）。

**主要结果。**
1. n ≤ 11 的约 4,950 万个非全序偏序全部满足 δ ≥ 1/3（小规模验证，不是证明）。δ = 1/3 的恰好是三元例子与单点的线性和。
2. 宽度 2 不可拆层偏序的最小 δ 见上表，n ≤ 20 的最小值是 n=17 的 1304/3737。
3. 找到一批 δ 低于 Sah β ≈ 0.348843467 的缺横档梯子（53 元起），最好的 80 元例子 δ ≈ 0.348843459606，比 Peczarski 表中最好值（50 元，≈ 0.348843460426）低约 8.2×10⁻¹⁰。

**新颖性说明。** 这类偏序（缺横档梯子）是 Peczarski 定义的，结构上没有新东西；数值低于他论文表中的所有值，但尚未核对 2017 年之后的文献，只能算候选结果；结果仍高于 0.348843，没有推翻他的空隙猜想。**1/3–2/3 猜想本身没有任何进展。**

**复现。** 见上方 Reproduce 一节。详细中文报告在 `docs/`。

License: MIT.
