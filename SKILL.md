---
name: sliver-novel-skills
description: Use when user wants to create AI-assisted web novels, including male-targeted (xuanhuan, xianxia, dushi, mystery etc.) or female-targeted (romance, BL, GL, quick-pass, mystery romance etc.) fiction
---

# Sliver-novel-skills - AI 小说写作 Skill

## 选择创作方向

引导用户选择创作方向。如果用户未明确方向，先询问用户偏好再继续。根据用户选择加载对应子技能。

---

### 男频（男性向）

面向男性读者的爽文系统，涵盖玄幻、仙侠、都市、悬疑等主流题材。

**特点：**
- 升级打脸、战力提升
- 智慧型反派设计
- 金手指辅助成长
- 多维度评测保障质量

**加载男频技能：**
用户确认选择男频后，读取 `male/guide.md` 获取男频完整创作流程，按流程推进。

---

### 女频（女性向）

面向女性读者的情感系统，涵盖言情、耽美、百合、女尊、快穿、悬疑恋爱等题材。

**特点：**
- 感情线为核心驱动
- 男性角色独立性检查（Critical）
- 双主角/群像支持
- 叙事平衡（根据类型调整）

**加载女频技能：**
用户确认选择女频后，读取 `female/guide.md` 获取女频完整创作流程，按流程推进。

---

## 共享资源

无论选择男频还是女频，以下资源为两者共享：

```
shared/
├── agents/
│   ├── framework/          # 框架构建Agents
│   │   ├── worldbuilder.md
│   │   ├── charactercraft.md
│   │   └── plotarchitect.md
│   └── review/             # 通用评测Agents
│       ├── logic_checker.md
│       ├── pace_critic.md
│       ├── foreshadow_hunter.md
│       ├── info_auditor.md
│       ├── goldfinger_checker.md
│       ├── climax_checker.md
│       ├── supporting_checker.md
│       ├── character_judge.md
│       ├── female_character_judge.md
│       ├── conflict_checker.md       # 冲突质量评测
│       ├── pov_checker.md            # 叙事视角评测
│       ├── description_quality_agent.md
│       └── plot_structure_agent.md
├── templates/
│   ├── writing_craft/              # 写作技法模块
│   │   ├── emotional_craft.md      # 情感渲染技法
│   │   ├── dialogue_craft.md       # 对白设计技法
│   │   ├── scene_craft.md          # 场景感染力
│   │   ├── depth_balance.md        # 深度与爽感平衡
│   │   ├── narrative_pov.md        # 叙事视角技法
│   │   └── world_craft.md          # 世界观构建技法
│   ├── character_relationship_network.md  # 角色关系网络模板
│   └── supporting_characters.md           # 配角设计模板
└── database/
    └── schema.sql
```

---

## 系统架构

```
Novel-Skills/
├── SKILL.md              # 主入口（你在这里）
├── male/                 # 男频系统
│   ├── guide.md          # 男频创作入口
│   ├── agents/review/    # 男频专项评测Agents（预留）
│   ├── templates/        # 男频专项模板
│   │   ├── protagonist_design.md          # 男频主角设计模板
│   │   ├── antagonist_design.md           # 反派角色设计模板
│   │   ├── goldfinger_design.md           # 金手指设计模板
│   │   ├── climax_design.md                # 高潮爽点设计模板
│   │   ├── antagonist_face_slapping.md     # 反派打脸设计模板
│   │   ├── female_characters.md           # 女性角色设计模板
│   │   └── genres/                        # 题材专项模板
│   │       ├── xuanhuan.md                # 玄幻题材
│   │       ├── xianxia.md                 # 仙侠题材
│   │       ├── dushi.md                   # 都市题材
│   │       ├── mystery.md                 # 悬疑题材
│   │       ├── scifi.md                   # 科幻题材
│   │       ├── gaming.md                  # 游戏题材
│   │       ├── historical.md              # 历史题材
│   │       ├── urban_fantasy.md          # 都市异能题材
│   │       ├── transmigration.md         # 穿越题材
│   │       ├── horror.md                  # 恐怖题材
│   │       └── entertainment.md          # 娱乐明星题材
│   └── prompts/          # 男频流程提示词
│       ├── planning_flow.md               # 世界观与大纲规划流程
│       ├── chapter_flow.md                # 单章创作流程
│       └── review_flow.md                 # 质量评测流程
│
├── female/                # 女频系统
│   ├── guide.md          # 女频创作入口
│   ├── agents/review/    # 女频专项评测Agents
│   │   ├── male_roles_judge.md           # 【Critical】男性角色独立性评测
│   │   ├── romance_line_judge.md          # 感情线质量评测
│   │   ├── bl_relationship_judge.md       # 耽美关系专项评测
│   │   └── gl_relationship_judge.md       # 百合关系专项评测
│   ├── templates/        # 女频专项模板
│   │   ├── protagonist_female.md          # 女频女主设计模板
│   │   ├── dual_protagonist.md            # 双主角设计模板
│   │   ├── romance_line.md                # 感情线设计模板
│   │   ├── female_goldfinger_design.md     # 女频金手指设计模板
│   │   ├── antagonist_face_slapping_female.md # 女频反派打脸模板
│   │   └── genres/                        # 题材专项模板
│   │       ├── romance_modern.md          # 现代言情题材
│   │       ├── ancient_romance.md         # 古代言情题材
│   │       ├── female_xianxia.md          # 女频仙侠题材
│   │       ├── boys_love.md               # 耽美题材
│   │       ├── girls_love.md              # 百合题材
│   │       ├── female_dominance.md        # 女尊题材
│   │       ├── quick_pass.md             # 快穿/穿书题材
│   │       └── mystery_romance.md         # 悬疑恋爱题材
│   └── prompts/          # 女频流程提示词
│       ├── planning_flow.md               # 世界观与大纲规划流程
│       ├── review_flow.md                 # 质量评测流程
│       └── female_chapter_flow.md         # 女频单章创作流程
│
└── shared/                # 共享资源（男女频通用）
    ├── agents/
    │   ├── framework/              # 框架构建Agents
    │   │   ├── worldbuilder.md     # 世界观与设定构建
    │   │   ├── charactercraft.md   # 角色塑造与人物弧光设计
    │   │   └── plotarchitect.md    # 情节结构与节奏把控
    │   └── review/                 # 通用评测Agents
    │       ├── logic_checker.md            # 逻辑一致性评测
    │       ├── pace_critic.md             # 节奏把控评测
    │       ├── foreshadow_hunter.md       # 伏笔呼应评测
    │       ├── info_auditor.md            # 信息交代评测
    │       ├── goldfinger_checker.md      # 金手指使用评测
    │       ├── climax_checker.md          # 爽点设计评测
    │       ├── supporting_checker.md      # 配角价值评测
    │       ├── character_judge.md         # 人物塑造评测
    │       ├── female_character_judge.md  # 女性角色塑造评测
    │       ├── conflict_checker.md        # 冲突质量评测
    │       ├── pov_checker.md            # 叙事视角评测
    │       ├── description_quality_agent.md # 描写质量评测
    │       └── plot_structure_agent.md    # 剧情结构评测
    └── templates/
        ├── character_relationship_network.md  # 角色关系网络模板
        ├── supporting_characters.md           # 配角设计模板
        └── writing_craft/                     # 写作技法模块
            ├── emotional_craft.md            # 情感渲染技法
            ├── dialogue_craft.md             # 对白与台词设计技法
            ├── scene_craft.md                 # 场景感染力技法
            ├── depth_balance.md              # 深度与爽感平衡技法
            ├── narrative_pov.md               # 叙事视角技法
            └── world_craft.md                # 世界观构建技法
```

---

## 快速开始

### 男频创作

1. 引导用户提供男频偏好（题材、风格、篇幅等）
2. 读取 `male/guide.md`，按 规划 → 创作 → 评测 流程推进
3. 使用 `shared/agents/` 下的框架 Agent 和评测 Agent

### 女频创作

1. 引导用户提供女频偏好（题材、感情线风格、角色模式等）
2. 读取 `female/guide.md`，按 规划 → 创作 → 评测 流程推进
3. 使用共享 Agent + 女频专项评测 Agent

---

## 系统特性

| 特性 | 男频 | 女频 |
|------|------|------|
| 类型 | 玄幻/仙侠/都市/悬疑 | 言情/耽美/百合/女尊/快穿 |
| 核心驱动 | 升级打脸 | 感情线推进 |
| 评测重点 | 反派智慧/金手指 | 男性角色独立性 |
| 评测Agents | 13个通用 | 13通用 + 4专项 |

---

## 通用评测（男女频共享）

| Agent | 维度 |
|-------|------|
| LogicChecker | 逻辑一致性 |
| ConflictChecker | 冲突质量 |
| DescriptionQualityAgent | 描写质量 |
| CharacterJudge | 人物塑造 |
| FemaleCharacterJudge | 女性角色塑造 |
| PaceCritic | 节奏把控 |
| ForeshadowHunter | 伏笔呼应 |
| InfoAuditor | 信息交代 |
| GoldfingerChecker | 金手指使用 |
| ClimaxChecker | 爽点设计 |
| PovChecker | 叙事视角 |
| SupportingChecker | 配角价值 |
| PlotStructureAgent | 剧情结构 |

---

**选择你的创作方向，开始写作吧！**

> **使用说明：** 以上文件树为系统完整结构索引，各模板和 Agent 文件在创作过程中按需加载。请勿在未读取的情况下猜测文件内容。如果用户需求超出支持的网文类型（如纯文学、非虚构等），提示本系统专注于商业网文创作，建议用户调整方向。