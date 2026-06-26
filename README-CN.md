# Mini 组合数学与离散几何

一系列**从零构建、零外部依赖的 Lean 4 实现**，涵盖大学水平的组合数学与离散几何，包括计数组合学、极值组合学、代数组合学、加性组合学、Ramsey 理论、图论、凸多胞体与离散几何。每个子模块对应 MIT（及其他顶尖大学）课程，使用 Lean 4 证明助手从第一性原理构建组合结构。

## 子模块

| 子模块 | 主题 | 对应课程 |
|--------|------|----------|
| [mini-enumerative-combinatorics](mini-enumerative-combinatorics/) | 计数、二项式系数、生成函数、分拆、Stirling 数、Catalan 数、特殊数列 | MIT 18.226, Stanford Math 155 |
| [mini-extremal-combinatorics](mini-extremal-combinatorics/) | Sperner 定理、Erdős–Ko–Rado、Turán 定理、Kruskal-Katona、Hall 婚配定理、Dilworth 定理 | MIT 18.217, Stanford Math 156 |
| [mini-graph-theory](mini-graph-theory/) | 简单/有向/带权图、树、平面性、着色、匹配、网络流、谱图论、图子式 | MIT 18.315, Stanford Math 108 |
| [mini-ramsey-theory](mini-ramsey-theory/) | Ramsey 数、Van der Waerden 定理、Schur 定理、Hales-Jewett 定理、分拆正则方程 | MIT 18.217, Cambridge Part III |
| [mini-algebraic-combinatorics](mini-algebraic-combinatorics/) | 分拆、Young 表、RSK 对应、对称函数、生成函数、偏序集、Möbius 反演 | MIT 18.212, Cambridge Part II |
| [mini-additive-combinatorics](mini-additive-combinatorics/) | 和集、加性能量、倍增率、等差数列、Freiman 定理、和积现象 | MIT 18.218, Princeton MAT 527 |
| [mini-convex-polytopes](mini-convex-polytopes/) | 顶点、面、facet、f-向量、h-向量、Euler 关系、Gale 图、壳性、Dehn-Sommerville、g-定理 | MIT 18.319, Stanford Math 256B |
| [mini-discrete-geometry](mini-discrete-geometry/) | 多胞体理论、凸性、格点几何、Minkowski 和、关联几何、组合结构、计算几何 | MIT 18.319, Princeton MAT 559 |

## 设计理念

- **零外部依赖** --- 纯 Lean 4 实现，仅依赖内核导入和标准 mathlib4；每个子模块使用独立的 `lakefile.lean`
- **子模块自包含** --- 每个子模块拥有独立的 Core/、docs/、examples/、Test/ 目录；可独立编译
- **理论到代码的映射** --- 每个模块包含内联 `#eval` 示例、定理陈述和基准验证
- **全面覆盖** --- 每个子模块涵盖从 L1 定义到 L9 研究前沿，包含 3000+ 行形式化 Lean 代码

## 构建

每个子模块独立构建，使用 Lake：

```bash
cd mini-graph-theory
lake build
lake env lean --run Test/Smoke.lean
```

需要 **Lean 4** 和 **Lake**。

## 项目结构

```
17. mini-combinatorics-discrete-geometry/
├── mini-enumerative-combinatorics/    # 计数、二项式系数、生成函数、分拆、特殊数列
├── mini-extremal-combinatorics/       # Sperner、Erdős–Ko–Rado、Turán、Hall、Dilworth 定理
├── mini-graph-theory/                 # 图、树、平面性、着色、匹配、流、谱图论
├── mini-ramsey-theory/                # Ramsey 数、Van der Waerden、Schur、Hales-Jewett 定理
├── mini-algebraic-combinatorics/      # 分拆、Young 表、对称函数、生成函数、偏序集
├── mini-additive-combinatorics/       # 和集、加性能量、倍增率、等差数列
├── mini-convex-polytopes/             # 多胞体、f/h-向量、Euler 关系、Gale 图、壳性
├── mini-discrete-geometry/            # 多胞体理论、凸性、格点几何、Minkowski 和、关联几何
├── .gitignore
├── README.md
└── README-CN.md
```

## 许可证

MIT
