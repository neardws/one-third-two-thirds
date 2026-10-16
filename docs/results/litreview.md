# 文献检索：1/3–2/3 猜想的平衡常数下确界（新颖性核查）
检索时间：2026-10-15（北京时间）。用到的来源有 arXiv API（按全文和标题搜索 "balance constant"、"1/3-2/3 conjecture"、"balanced pairs"、"one-third two-thirds"、"linear extensions width two"）、OpenAlex（Peczarski、Sah、Chen 三篇论文的被引；2021 年以后的关键词搜索）、Semantic Scholar（Sah arXiv:1811.01500 的被引）和网页搜索（"0.34884"）。Google Scholar 和 MathOverflow 没有直接查到（没有 API，网页搜索也没有返回相关结果）。

我们的值：α=(115713181619−36√6697)/331705168868 ≈ 0.348843459593420。

## 已核查的来源
| # | 论文 | 作者 / 年份 | 链接 | 关于最小平衡常数的内容 |
|---|---|---|---|---|
| 1 | A Family of Partially Ordered Sets with Small Balance Constant | E. Chen, EJC 25(4) 2018 | https://arxiv.org/abs/1709.05753 , https://doi.org/10.37236/7337 | 一族极限为 (93−√6697)/32≈0.3488999 的偏序（注意它也含 √6697）。§1.4 引用了 Peczarski 的 L：δ=39148472052/112223608848≈0.3488434604，以及 Sah 的 β≈0.34884346742 |
| 2 | The Worst Balanced Partially Ordered Sets—Ladders with Broken Rungs | M. Peczarski, Exp. Math. 28(2) 2019（2017 年在线） | https://doi.org/10.1080/10586458.2017.1368050 | 数值找到的有限梯子 L50，δ≈0.348843460426；猜想 (1/3, ≈0.348843) 区间内没有平衡常数 |
| 3 | Improving the 1/3–2/3 Conjecture for Width Two Posets | A. Sah, Combinatorica 41 (2021) | https://arxiv.org/abs/1811.01500 , https://doi.org/10.1007/s00493-020-4091-3 | 证明宽度 2 时 δ≥(−3+5√17)/52≈0.33876；构造了 T_n，δ→β=(5864893+27√57)/16812976≈0.3488434674；说 β“可能是最优的” |
| 4 | Balance constants for Coxeter groups | C. Gaetz, Y. Gao, TAMS 2023 | https://arxiv.org/abs/2005.09719 , https://doi.org/10.1090/tran/9040 | 推广到 Coxeter 群，没有新的小常数 |
| 5 | Sorting probability for large Young diagrams | S.H. Chan, I. Pak, G. Panova, 2020 | https://arxiv.org/abs/2005.08390 | 引用 Sah；只讨论 δ→1/2 的渐近，与下确界无关 |
| 6 | Sorting probability of Catalan posets | Chan, Pak, Panova, AAM 2021 | https://arxiv.org/abs/2005.13686 | 同上 |
| 7 | The cross-product conjecture for width two posets | Chan, Pak, Panova, TAMS 2022 | https://arxiv.org/abs/2104.09009 | 引用 Sah 和 Chen；没有新的常数 |
| 8 | Extensions of the Kahn–Saks inequality for posets of width two | Chan, Pak, Panova, Comb. Theory 2023 | https://arxiv.org/abs/2106.07133 | 同上 |
| 9 | The Gold Partition Conjecture and the Lexicographic Sum of Posets | E. Dolores-Cuenca, A. Guzmán-Sáenz, S. Kim, 2024 | https://arxiv.org/abs/2410.12494 | 研究 Gold Partition 猜想，没有比 β 更小的值 |
| 10 | Linear extensions of finite posets（综述） | S.H. Chan, I. Pak, EMS Surveys 2025 | https://arxiv.org/abs/2311.02743 , https://doi.org/10.4171/emss/97 | 引用 Sah 的宽度 2 结果；没有给出比 β 更小的构造 |
| 11 | Poset probability in two-row partition posets | A. Jaldevik, J. Snellman, 2025 | https://arxiv.org/abs/2501.11073 | 两行 Young 图偏序的概率公式，与下确界无关 |
| 12 | Balance Constants, Majority Cycles, and the Gold Partition Conjecture through Fourteen Elements | A. Gupta, 2026 | https://arxiv.org/abs/2607.23926 | n≤14 全部枚举；不是非平凡序数和的最小值为 254/725（L_{14,1,9}）；仍把 Sah 的 β 和 Peczarski 的 0.348843 当作现状，没有更小的值 |
| 13 | On the Gap of Finite Posets | A. Haqi, 2026 | https://arxiv.org/abs/2608.12678 | 研究期望秩的间隙，与 δ 下确界无关 |
| 14 | Breaking the Infinite Barrier in the 1/3–2/3 Conjecture | M. Aires, S.H. Chan, I. Pak, G. Panova, 2026-09 | https://arxiv.org/abs/2609.30888 | 一般下界比 BFT 改进了一个 ε；§7 只引用 Chen18 和 Sah21，没有更小的构造 |
| 15 | On Partially Ordered Sets and the 1/3–2/3 Conjecture | 2024，Springer 会议论文集 | https://doi.org/10.1007/978-3-031-81217-0_1 | OpenAlex 显示它引用了 Sah 和 Chen；没拿到全文，标题和摘要看是讨论性质的 |

另外看到几篇 2026 年 Zenodo / ResearchGate 上的非同行评审稿（如 "Causal Flow Equations and the 1/3–2/3 Conjecture"、"Prime-Domain Algebra…"），都没有报告具体的小常数，可信度低，不列入。

OpenAlex 记录的被引情况：Peczarski 被 Chen 和 Sah 引用（共 2 篇）；Sah 被 #5–#8 和 #15 引用；Chen 被 #5、#7、#8、#15 和 Discrete Analysis 2021 的一篇（doi 10.19086/da.30071）引用。Semantic Scholar 上 Sah 的被引：#5–#9。

## 结论
- 已知最接近的值：Sah 的 β≈0.3488434674（目前公开的最好极限），Peczarski 的有限梯子 39148472052/112223608848≈0.3488434604 和 L50≈0.348843460426，以及他猜想的 0.348843。
- 没有找到任何来源报告 ≤α 的值，或者 α 这个闭式。截至 2026-09 的文献（Gupta 2026、Aires–Chan–Pak–Panova 2026）仍把 Sah 的 β 当作最好的构造。
- 新颖性判断：很可能是新的（置信度约 80%）。剩下的风险有三点：Google Scholar 和 MathOverflow 没能直接检索；Peczarski 的原始数据或后续未发表的计算可能已经有更大的 L_n；2017 年以前的会议论文和学位论文没有覆盖。
- 一点观察：Chen 的极限 (93−√6697)/32 和我们的 α 在同一个二次域 ℚ(√6697) 里，写论文时应当指出这个联系。
