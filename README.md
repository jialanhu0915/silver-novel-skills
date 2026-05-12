# Novel-Skills

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

AI 小说写作系统，支持男频/女频全类型创作，提供完整的小说框架构建、角色塑造、情节设计和多维度质量评测能力。

[English](README_EN.md) | 中文

---

## 功能特性

### 双系统支持

| 系统 | 面向读者 | 题材支持 |
|------|----------|----------|
| 男频 | 男性 | 玄幻、仙侠、都市、悬疑、科幻、游戏、灵异 |
| 女频 | 女性 | 言情、耽美、百合、女尊、快穿、悬疑恋爱、古代言情、女频仙侠 |

### 框架构建 Agent

- **WorldBuilder** - 世界观与设定构建
- **CharacterCraft** - 角色塑造与人物弧光设计
- **PlotArchitect** - 情节结构与节奏把控

### 质量评测体系

**通用评测（男女频共享）**

| Agent | 评测维度 |
|-------|----------|
| LogicChecker | 逻辑一致性 |
| ConflictChecker | 冲突质量 |
| DescriptionQualityAgent | 描写质量 |
| CharacterJudge | 人物塑造 |
| PaceCritic | 节奏把控 |
| ForeshadowHunter | 伏笔呼应 |
| InfoAuditor | 信息交代 |
| GoldfingerChecker | 金手指使用 |
| ClimaxChecker | 爽点设计 |
| PovChecker | 叙事视角 |
| SupportingChecker | 配角价值 |
| PlotStructureAgent | 剧情结构 |

**女频专项评测**

| Agent | 评测维度 |
|-------|----------|
| MaleRolesJudge | 男性角色独立性（Critical） |
| RomanceLineJudge | 感情线质量 |
| BLRelationshipJudge | 耽美专项 |
| GLRelationshipJudge | 百合专项 |

### 核心设计理念

- **金手指设计** - 主角特殊能力的合理化呈现
- **反派智慧** - 智商在线的反派对抗
- **爽点节奏** - 精准把控升级与打脸的时机
- **伏笔系统** - 前后呼应的叙事网络

---

## 快速开始

### 目录结构

```
Novel-Skills/
├── SKILL.md              # 主入口
├── male/                 # 男频系统
│   ├── SKILL.md
│   ├── agents/
│   ├── templates/
│   └── prompts/
├── female/               # 女频系统
│   ├── SKILL.md
│   ├── agents/
│   ├── templates/
│   └── prompts/
└── shared/               # 共享资源
    ├── agents/
    │   ├── framework/    # 框架构建 Agents
    │   └── review/       # 评测 Agents
    ├── templates/         # 模板库
    └── database/          # 数据结构
```

### 基础使用

**男频创作**

```
1. 进入 male/ 目录
2. 阅读 male/SKILL.md
3. 按流程使用 Framework Agents 构建小说框架
4. 使用 Review Agents 进行质量评测
```

**女频创作**

```
1. 进入 female/ 目录
2. 阅读 female/SKILL.md
3. 按流程使用 Framework Agents 构建小说框架
4. 使用通用 + 女频专项 Agents 进行质量评测
```

---

## 系统架构

```
Novel-Skills
│
├── male/                           # 男频系统
│   ├── SKILL.md                    # 男频创作入口
│   ├── templates/                 # 男频专项模板
│   │   ├── protagonist_design.md          # 男频主角设计模板
│   │   ├── antagonist_design.md          # 反派角色设计模板
│   │   ├── goldfinger_design.md          # 金手指（特殊能力）设计模板
│   │   ├── climax_design.md               # 高潮/爽点设计模板
│   │   ├── female_characters.md          # 女性角色设计模板
│   │   ├── antagonist_face_slapping.md   # 反派打脸场景设计模板
│   │   └── genres/                        # 题材专项模板
│   │       ├── xuanhuan.md               # 玄幻题材模板
│   │       ├── xianxia.md                # 仙侠题材模板
│   │       ├── dushi.md                  # 都市题材模板
│   │       ├── mystery.md                # 悬疑题材模板
│   │       ├── scifi.md                  # 科幻题材模板
│   │       ├── gaming.md                 # 游戏题材模板
│   │       ├── historical.md             # 历史题材模板
│   │       ├── urban_fantasy.md          # 都市异能题材模板
│   │       ├── transmigration.md         # 穿越题材模板
│   │       ├── horror.md                 # 恐怖题材模板
│   │       └── entertainment.md          # 娱乐明星题材模板
│   └── prompts/                          # 男频创作流程提示词
│       ├── planning_flow.md              # 世界观与大纲规划流程
│       ├── chapter_flow.md               # 单章创作流程
│       └── review_flow.md                # 质量评测流程
│
├── female/                          # 女频系统
│   ├── SKILL.md                     # 女频创作入口
│   ├── agents/review/               # 女频专项评测Agents
│   │   ├── male_roles_judge.md     # 【Critical】男性角色独立性评测
│   │   ├── romance_line_judge.md   # 感情线质量评测
│   │   ├── bl_relationship_judge.md # 耽美关系专项评测
│   │   └── gl_relationship_judge.md # 百合关系专项评测
│   ├── templates/                  # 女频专项模板
│   │   ├── protagonist_female.md           # 女频女主设计模板
│   │   ├── dual_protagonist.md             # 双主角设计模板
│   │   ├── romance_line.md                 # 感情线设计模板
│   │   ├── female_goldfinger_design.md     # 女频金手指设计模板
│   │   ├── antagonist_face_slapping_female.md # 女频反派打脸模板
│   │   └── genres/                        # 题材专项模板
│   │       ├── romance_modern.md          # 现代言情题材模板
│   │       ├── ancient_romance.md         # 古代言情题材模板
│   │       ├── female_xianxia.md          # 女频仙侠题材模板
│   │       ├── boys_love.md               # 耽美题材模板
│   │       ├── girls_love.md              # 百合题材模板
│   │       ├── female_dominance.md        # 女尊题材模板
│   │       ├── quick_pass.md              # 快穿/穿书题材模板
│   │       └── mystery_romance.md          # 悬疑恋爱题材模板
│   └── prompts/                          # 女频创作流程提示词
│       ├── planning_flow.md              # 世界观与大纲规划流程
│       ├── review_flow.md                # 质量评测流程
│       └── female_chapter_flow.md        # 女频单章创作流程
│
└── shared/                          # 共享资源（男女频通用）
    ├── agents/
    │   ├── framework/              # 框架构建Agents
    │   │   ├── worldbuilder.md     # 世界观与设定构建
    │   │   ├── charactercraft.md   # 角色塑造与人物弧光设计
    │   │   └── plotarchitect.md    # 情节结构与节奏把控
    │   └── review/                # 通用评测Agents
    │       ├── logic_checker.md            # 逻辑一致性评测
    │       ├── pace_critic.md              # 节奏把控评测
    │       ├── foreshadow_hunter.md        # 伏笔呼应评测
    │       ├── info_auditor.md             # 信息交代评测
    │       ├── goldfinger_checker.md       # 金手指使用评测
    │       ├── climax_checker.md           # 爽点设计评测
    │       ├── supporting_checker.md       # 配角价值评测
    │       ├── character_judge.md          # 人物塑造评测
    │       ├── female_character_judge.md   # 女性角色塑造评测
    │       ├── conflict_checker.md         # 冲突质量评测
    │       ├── pov_checker.md              # 叙事视角评测
    │       ├── description_quality_agent.md # 描写质量评测
    │       └── plot_structure_agent.md      # 剧情结构评测
    └── templates/
        ├── character_relationship_network.md  # 角色关系网络模板
        ├── supporting_characters.md          # 配角设计模板
        └── writing_craft/                   # 写作技法模块
            ├── emotional_craft.md           # 情感渲染技法
            ├── dialogue_craft.md            # 对白与台词设计技法
            ├── scene_craft.md               # 场景感染力技法
            ├── depth_balance.md              # 深度与爽感平衡技法
            ├── narrative_pov.md              # 叙事视角技法
            └── world_craft.md               # 世界观构建技法
```

---

## 许可证

本项目采用 [MIT 许可证](LICENSE)。

---

## 参与贡献

欢迎提交 Pull Request 或创建 Issue！
