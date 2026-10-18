#!/usr/bin/env python3
"""Regenerate ladder.pdf / lattice.pdf — clean journal look."""
from pathlib import Path
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
from matplotlib import patheffects as pe

OUT = Path(__file__).resolve().parent

# ~8–9 pt at include width ≈ textwidth with figsize ~6 in
FS, FS_SMALL, FS_LABEL = 8.0, 7.0, 7.5
LW, LW_THIN, LW_GUIDE = 0.85, 0.7, 0.55
NAVY = "#243040"
TEAL = "#3a6e5e"
BROKEN = "#a04a4a"
BAND_BLUE = "#dce6ee"
BAND_GREEN = "#dde8e1"
BAND_ORANGE = "#eee4d4"
BAND_EDGE = "#c0c8d0"
GRID = "#e4e7eb"
TEXT = "#222222"
MUTED = "#5a6570"


def save(fig, name):
    for ext in ("pdf", "png"):
        fig.savefig(
            OUT / f"{name}.{ext}",
            dpi=300,
            bbox_inches="tight",
            pad_inches=0.06,
            facecolor="white",
            edgecolor="none",
        )
        print("wrote", OUT / f"{name}.{ext}")
    plt.close(fig)


def broken_set(m):
    """Broken-rung set B of P_m, exactly as in the Definition (n = 108 + 20m)."""
    n = 108 + 20 * m
    cstar = {1, 5, 8, 9, 12, 13, 17, 20, 21, 25, 28, 29, 33, 36, 39, 43}
    core = {j for j in range(44, 52 + 10 * m + 1) if j % 10 in (3, 6, 9)}
    return n, cstar | core | {n - 4 - j for j in cstar} | {n - 4 - j for j in core}


def make_ladder():
    """Actual Hasse-type generators of P_2 in three windows (left end, core, right end).

    Element with label x sits at horizontal position x/2: even labels (a-chain)
    on the lower line, odd labels (b-chain) on the upper line, so the chains are
    staggered by half a step.  Same-index elements a_r, b_r are NOT joined:
    they are incomparable.  Diagonal arrows are the cross-chain generators
    x < x+3 (a_r < b_{r+1}, b_r < a_{r+2}); dashed grey stubs marked x are broken
    rungs x in B.  Chain generators x < x+2 are the horizontal lines.
    """
    m = 2
    n, B = broken_set(m)
    windows = [(0, 23), (44, 57), (n - 14, n - 1)]
    gap = 1.6
    fig, ax = plt.subplots(figsize=(6.7, 2.25))
    ax.set_aspect("equal")
    ax.axis("off")
    y_a, y_b, r = 0.0, 1.45, 0.085
    pos = {}
    off = 0.0
    spans = []
    for lo, hi in windows:
        for x in range(lo, hi + 1):
            pos[x] = (off + (x - lo) / 2.0, y_a if x % 2 == 0 else y_b)
        spans.append((off, off + (hi - lo) / 2.0, lo, hi))
        off += (hi - lo) / 2.0 + gap
    # chains
    for lo, hi in windows:
        for par in (0, 1):
            xs = [x for x in range(lo, hi + 1) if x % 2 == par]
            ax.plot([pos[xs[0]][0], pos[xs[-1]][0]], [pos[xs[0]][1]] * 2,
                    color=NAVY, lw=LW, solid_capstyle="round", zorder=3)
    # rungs x -> x+3
    for lo, hi in windows:
        for x in range(lo, hi - 2):
            (x0, y0), (x1, y1) = pos[x], pos[x + 3]
            dx, dy = x1 - x0, y1 - y0
            L = (dx * dx + dy * dy) ** 0.5
            ux, uy = dx / L, dy / L
            sx, sy = x0 + ux * (r + 0.02), y0 + uy * (r + 0.02)
            ex, ey = x1 - ux * (r + 0.03), y1 - uy * (r + 0.03)
            if x in B:
                ax.plot([sx, sx + 0.42 * (ex - sx)], [sy, sy + 0.42 * (ey - sy)],
                        color=BROKEN, lw=LW_THIN * 0.8, ls=(0, (1.3, 1.2)), zorder=2)
                ax.plot(sx + 0.42 * (ex - sx), sy + 0.42 * (ey - sy), marker="x",
                        markersize=3.0, markeredgewidth=0.7, color=BROKEN, zorder=4)
            else:
                ax.annotate("", xy=(ex, ey), xytext=(sx, sy), zorder=2,
                            arrowprops=dict(arrowstyle="-|>,head_length=0.32,head_width=0.13",
                                            color=TEAL, lw=LW_THIN, shrinkA=0, shrinkB=0))
    for x, (px, py) in pos.items():
        ax.add_patch(plt.Circle((px, py), r, facecolor=NAVY, edgecolor="white",
                                linewidth=0.3, zorder=5))
    # ellipses between windows
    for k in range(len(spans) - 1):
        mid = (spans[k][1] + spans[k + 1][0]) / 2
        for y in (y_a, y_b):
            ax.plot([mid - 0.25, mid, mid + 0.25], [y] * 3, "o", color=NAVY,
                    markersize=1.6, zorder=5)
    # element names at the ends and at a few chain positions
    p = n // 2
    def lab(x, s, below):
        px, py = pos[x]
        ax.text(px, py + (-0.17 if below else 0.17), s, fontsize=FS_SMALL,
                ha="center", va="top" if below else "bottom", color=TEXT, zorder=6)
    lab(0, r"$a_1$", True); lab(1, r"$b_1$", False)
    lab(n - 2, r"$a_p$", True); lab(n - 1, r"$b_p$", False)
    # window captions
    caps = [r"left end, labels 0–23 (cap $C^*$)",
            r"core, labels 44–57",
            r"right end (mirrored cap)"]
    for (a, b, lo, hi), c in zip(spans, caps):
        ax.text((a + b) / 2, 2.17, c, fontsize=FS_SMALL, ha="center", va="bottom", color=MUTED)
        ax.plot([a, b], [2.08, 2.08], color="#9aa3ad", lw=0.45)
    ax.text(spans[0][0] - 0.45, y_b, r"$b$", fontsize=FS_LABEL, ha="right", va="center", color=MUTED)
    ax.text(spans[0][0] - 0.45, y_a, r"$a$", fontsize=FS_LABEL, ha="right", va="center", color=MUTED)
    # legend
    ly = -0.85
    x0 = spans[0][0]
    ax.annotate("", xy=(x0 + 0.9, ly), xytext=(x0 - 0.1, ly),
                arrowprops=dict(arrowstyle="-|>,head_length=0.32,head_width=0.13", color=TEAL, lw=LW_THIN))
    ax.text(x0 + 1.1, ly, r"rung $x<x+3$ ($x\notin B$)", fontsize=FS_SMALL, va="center", ha="left", color=TEXT)
    x2 = x0 + 9.6
    ax.plot([x2, x2 + 0.3], [ly, ly], color=BROKEN, lw=LW_THIN * 0.8, ls=(0, (1.3, 1.2)))
    ax.plot(x2 + 0.3, ly, marker="x", markersize=3.0, markeredgewidth=0.7, color=BROKEN)
    ax.text(x2 + 0.5, ly, r"broken rung ($x\in B$)", fontsize=FS_SMALL, va="center", ha="left", color=TEXT)
    x3 = x0 + 18.2
    ax.plot([x3, x3 + 0.55], [ly, ly], color=NAVY, lw=LW)
    ax.text(x3 + 0.7, ly, r"chain $x<x+2$", fontsize=FS_SMALL, va="center", ha="left", color=TEXT)
    ax.set_xlim(spans[0][0] - 1.0, spans[-1][1] + 0.6)
    ax.set_ylim(-1.1, 2.55)
    save(fig, "ladder")


E0_EXACT = 830465512946702116549200  # |L(P_0)|, Section 2


def ideal_grid(m=0):
    """Valid points (i, j): {a_1..a_i} u {b_1..b_j} is a down-set of the order
    generated by x<x+2 and x<x+3 (x not in B). Computed from the relations."""
    n, B = broken_set(m)
    p = n // 2
    gens = [(x, x + 2) for x in range(n - 2)] + [(x, x + 3) for x in range(n - 3) if x not in B]
    below = [set() for _ in range(n)]
    for x in range(n):  # generators go upward, so increasing x is a valid order
        for a, b in gens:
            if b == x:
                below[x] |= {a} | below[a]
    valid = set()
    for i in range(p + 1):
        for j in range(p + 1):
            S = {2 * r - 2 for r in range(1, i + 1)} | {2 * r - 1 for r in range(1, j + 1)}
            if all(below[x] <= S for x in S):
                valid.add((i, j))
    return n, B, p, valid


# Row-mask words of Lemma 2.3 (bit t = offset t-3), as in lean/OneThird/Structure.lean.
_O, _L, _R, _T = [1, 2, 3, 4], [0, 1, 2, 3, 4], [1, 2, 3, 4, 5], [0, 1, 2, 3, 4, 5]
PRE = [[3, 4], [2, 3, 4], _O, _L, _R, _L, _R, _L, _O, _L, _R, _L, _O, _L, _R, _L, _O, _L, _R, _L, _O, _O]
XBLK = [_L, _R, _L, _O, _O]
MID = [_L, _R, _L, _O, _O, _L, _O, _R, _L, _O, _O]
SUF = [_L, _R, _L, _O, _O, _T, _O, _L, _O, _T, _O, _L, _O, _T, _O, _T, _O, _L, _O, _L, _O, [0, 1, 2, 3]]


def make_lattice():
    import random
    n, B, p, valid = ideal_grid(0)
    word = PRE + MID + SUF  # m = 0: no X blocks
    assert len(word) == p + 1
    assert valid == {(i, i + t - 3) for i, mk in enumerate(word) for t in mk}, "mask cross-check failed"

    # exact path counts to (p,p); uniform random linear extension with a fixed seed
    G = {}
    for i in range(p, -1, -1):
        for j in range(p, -1, -1):
            if (i, j) in valid:
                G[i, j] = 1 if (i, j) == (p, p) else G.get((i + 1, j), 0) + G.get((i, j + 1), 0)
    assert G[0, 0] == E0_EXACT
    rng = random.Random(20261017)
    path, i, j = [(0, 0)], 0, 0
    while (i, j) != (p, p):
        e, nn = G.get((i + 1, j), 0), G.get((i, j + 1), 0)
        if rng.randrange(e + nn) < e:
            i += 1
        else:
            j += 1
        path.append((i, j))
    assert all(q in valid for q in path)

    groups = [("PRE", 0, 21, BAND_BLUE), ("MID", 22, 32, BAND_ORANGE), ("SUF", 33, 54, BAND_GREEN)]
    color_of = {}
    for name, r0, r1, c in groups:
        for r in range(r0, r1 + 1):
            color_of[r] = c

    fig, ax = plt.subplots(figsize=(4.95, 4.85))
    for (i, j) in valid:
        ax.add_patch(Rectangle((i - 0.5, j - 0.5), 1, 1, facecolor=color_of[i],
                               edgecolor=BAND_EDGE, linewidth=0.2, zorder=1))
    # band cells (inside -3 <= j-i <= 2 and the grid) that are NOT ideals: closed by an intact rung
    closed = [(i, i + d) for i in range(p + 1) for d in range(-3, 3)
              if 0 <= i + d <= p and (i, i + d) not in valid]
    cx, cy = zip(*closed)
    ax.scatter(cx, cy, marker="x", s=5, linewidths=0.45, color="#7d8792", zorder=2)
    # extreme offsets opened by a broken rung (d = 2: 2i in B; d = -3: 2i-5 in B)
    opened = [(i, j) for (i, j) in valid if j - i in (2, -3)]
    ox, oy = zip(*opened)
    ax.scatter(ox, oy, marker="s", s=5.5, facecolors="none", edgecolors=BROKEN, linewidths=0.45, zorder=3)

    # band lines
    ax.plot([-0.5, p - 2 + 0.5], [1.5, p + 0.5], color=BROKEN, lw=LW_GUIDE, ls=(0, (3, 2)), zorder=3)
    ax.plot([2.5, p + 0.5], [-0.5, p - 3 + 0.5], color=BROKEN, lw=LW_GUIDE, ls=(0, (3, 2)), zorder=3)
    for x, y, txt, rot in [(9, 12.6, r"$j-i=2$", 45), (14.2, 9.2, r"$j-i=-3$", 45)]:
        t = ax.text(x, y, txt, fontsize=FS_SMALL, color=BROKEN, rotation=rot, rotation_mode="anchor",
                    ha="center", va="center", zorder=6)
        t.set_path_effects([pe.withStroke(linewidth=1.8, foreground="white")])

    px, py = zip(*path)
    ax.plot(px, py, color=NAVY, lw=0.8, zorder=4, solid_joinstyle="round")

    # row-group brackets below the band
    off = 5.0  # bracket on the diagonal j - i = -off, just below the band
    for name, r0, r1, c in groups:
        a0, a1 = r0 - 0.35, r1 + 0.35
        ax.plot([a0, a1], [a0 - off, a1 - off], color=MUTED, lw=0.5, zorder=3)
        for a in (a0, a1):
            ax.plot([a, a + 0.55], [a - off, a - off - 0.55], color=MUTED, lw=0.5, zorder=3)
        mid = (r0 + r1) / 2
        t = ax.text(mid + 1.55, mid - off - 1.55,
                    rf"{name}: rows {r0}–{r1}", fontsize=FS_SMALL, color=TEXT, rotation=45,
                    rotation_mode="anchor", ha="center", va="center")
        t.set_path_effects([pe.withStroke(linewidth=1.6, foreground="white")])

    ax.annotate(r"$(0,0)$", xy=(0, 0), xytext=(-0.8, 5.6), fontsize=FS_SMALL, color=MUTED,
                arrowprops=dict(arrowstyle="-", color=MUTED, lw=0.45))
    ax.annotate(r"$(p,p)=(54,54)$", xy=(p, p), xytext=(39.5, 57.2), fontsize=FS_SMALL, color=MUTED,
                arrowprops=dict(arrowstyle="-", color=MUTED, lw=0.45), annotation_clip=False)

    ax.set_xlim(-1.5, p + 1.5)
    ax.set_ylim(-1.5, p + 1.5)
    ax.set_aspect("equal")
    ax.set_xticks(range(0, p + 1, 6))
    ax.set_yticks(range(0, p + 1, 6))
    ax.tick_params(labelsize=FS_SMALL, length=2, width=0.5, colors=MUTED)
    for sp in ax.spines.values():
        sp.set_linewidth(0.5)
        sp.set_color("#9aa3ad")
    ax.set_xlabel(r"$i$ (number of $a$-elements; row index)", fontsize=FS, color=TEXT, labelpad=2)
    ax.set_ylabel(r"$j$ (number of $b$-elements)", fontsize=FS, color=TEXT, labelpad=2)

    # legend (lower right, empty triangle)
    from matplotlib.lines import Line2D
    handles = [
        Rectangle((0, 0), 1, 1, facecolor=BAND_BLUE, edgecolor=BAND_EDGE, lw=0.3, label="valid ideal (PRE / SUF rows)"),
        Rectangle((0, 0), 1, 1, facecolor=BAND_ORANGE, edgecolor=BAND_EDGE, lw=0.3, label="valid ideal (MID rows)"),
        Line2D([], [], marker="s", ls="none", ms=3.2, mfc="none", mec=BROKEN, mew=0.5, label=r"offset $2$ or $-3$ opened by a broken rung"),
        Line2D([], [], marker="x", ls="none", ms=2.8, color="#7d8792", mew=0.5, label="band cell closed by an intact rung"),
        Line2D([], [], color=NAVY, lw=0.8, label="sampled linear extension (seed 20261017)"),
    ]
    handles[0].set_facecolor(BAND_BLUE)
    leg = ax.legend(handles=handles, loc="lower right", bbox_to_anchor=(1.0, 0.0), fontsize=FS_SMALL,
                    frameon=False, handlelength=1.6, borderaxespad=0.4, labelspacing=0.35)
    # SUF uses green; show it in the first legend entry by a split patch is overkill -> separate entry
    handles.insert(2, Rectangle((0, 0), 1, 1, facecolor=BAND_GREEN, edgecolor=BAND_EDGE, lw=0.3, label="valid ideal (SUF rows)"))
    handles[0].set_label("valid ideal (PRE rows)")
    leg.remove()
    ax.legend(handles=handles, loc="lower right", bbox_to_anchor=(1.0, 0.0), fontsize=FS_SMALL,
              frameon=False, handlelength=1.6, borderaxespad=0.4, labelspacing=0.35)

    # inset: the actual mask of row 38 (SUF[5] = T)
    r = 38
    mk = [t - 3 for t in word[r]]
    ins = fig.add_axes([0.135, 0.585, 0.43, 0.32])
    for d in range(-3, 3):
        on = d in mk
        ins.add_patch(Rectangle((d - 0.45, -0.45), 0.9, 0.9, facecolor=color_of[r] if on else "white",
                                edgecolor=BROKEN if d in (-3, 2) else BAND_EDGE, lw=0.6 if d in (-3, 2) else 0.4))
        ins.text(d, 0, rf"${d}$", ha="center", va="center", fontsize=FS_SMALL, color=TEXT)
        ins.text(d, -0.78, rf"$j{{=}}{r + d}$", ha="center", va="center", fontsize=6.3, color=MUTED)
    ins.text(-0.5, 1.0, rf"row $i={r}$ (SUF row {r - 33}): mask $\mathtt{{T}}=\{{-3,\dots,2\}}$",
             ha="center", va="center", fontsize=6.5, color=TEXT)
    ins.text(2.0, 1.55 - 0.0, "", fontsize=1)
    ins.text(-0.5, 2.3, rf"$2i-5={2*r-5}\in B$ opens $d=-3$", ha="center", va="center", fontsize=FS_SMALL, color=BROKEN)
    ins.text(-0.5, 1.75, rf"$2i={2*r}\in B$ opens $d=2$", ha="center", va="center", fontsize=FS_SMALL, color=BROKEN)
    assert 2 * r in B and 2 * r - 5 in B
    ins.set_xlim(-3.75, 2.75)
    ins.set_ylim(-1.05, 2.7)
    ins.axis("off")
    ins.add_patch(Rectangle((-3.73, -1.03), 6.46, 3.71, fill=False, edgecolor="#b8c0c8", lw=0.45, clip_on=False))

    fig.subplots_adjust(left=0.10, right=0.985, top=0.975, bottom=0.075)
    save(fig, "lattice")
    print("valid points:", len(valid), "closed band cells:", len(closed), "opened extremes:", len(opened))


if __name__ == "__main__":
    make_ladder()
    make_lattice()
