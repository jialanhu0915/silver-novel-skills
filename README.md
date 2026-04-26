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
│   ├── agents/review/              # 男频专项评测
│   ├── templates/                 # 男频专项模板
│   │   ├── protagonist_design.md
│   │   ├── antagonist_design.md
│   │   ├── goldfinger_design.md
│   │   ├── climax_design.md
│   │   └── genres/                # 题材专项
│   │       ├── xuanhuan.md
│   │       ├── xianxia.md
│   │       ├── dushi.md
│   │       ├── mystery.md
│   │       ├── entertainment.md
│   │       ├── gaming.md
│   │       ├── horror.md
│   │       ├── scifi.md
│   │       ├── transmigration.md
│   │       └── urban_fantasy.md
│   └── prompts/                    # 创作流程提示词
│
├── female/                         # 女频系统
│   ├── agents/review/              # 女频专项评测
│   │   ├── male_roles_judge.md    # 【Critical】男性角色独立性
│   │   ├── romance_line_judge.md   # 感情线质量
│   │   ├── bl_relationship_judge.md
│   │   └── gl_relationship_judge.md
│   ├── templates/                 # 女频专项模板
│   │   ├── romance_modern.md       # 现代言情
│   │   ├── ancient_romance.md      # 古代言情
│   │   ├── female_xianxia.md       # 女频仙侠
│   │   ├── boys_love.md            # 耽美
│   │   ├── girls_love.md           # 百合
│   │   ├── female_dominance.md     # 女尊
│   │   ├── quick_pass.md           # 快穿/穿书
│   │   └── mystery_romance.md      # 悬疑恋爱
│   └── prompts/
│
└── shared/                         # 共享资源
    ├── agents/
    │   ├── framework/              # 框架构建
    │   │   ├── worldbuilder.md
    │   │   ├── charactercraft.md
    │   │   └── plotarchitect.md
    │   └── review/                 # 通用评测
    │       ├── logic_checker.md
    │       ├── pace_critic.md
    │       ├── foreshadow_hunter.md
    │       ├── info_auditor.md
    │       ├── goldfinger_checker.md
    │       ├── climax_checker.md
    │       ├── supporting_checker.md
    │       ├── character_judge.md
    │       ├── female_character_judge.md
    │       ├── conflict_checker.md
    │       ├── pov_checker.md
    │       ├── description_quality_agent.md
    │       └── plot_structure_agent.md
    └── templates/
        ├── character_relationship_network.md
        ├── supporting_characters.md
        └── writing_craft/              # 写作技法模块
            ├── emotional_craft.md
            ├── dialogue_craft.md
            ├── scene_craft.md
            ├── depth_balance.md
            ├── narrative_pov.md
            └── world_craft.md
        ├── character_relationship_network.md
        └── supporting_characters.md
```

---

## 许可证

本项目采用 [MIT 许可证](LICENSE)。

---

## 参与贡献

欢迎提交 Pull Request 或创建 Issue！
