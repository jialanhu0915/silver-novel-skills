---
name: novelist
description: Use when user wants to create AI-assisted web novels, including male-targeted (xuanhuan, xianxia, dushi, mystery) or female-targeted (romance, BL, GL, quick-pass, mystery romance) fiction
---

# Novelist - AI 小说写作 Skill

## 选择你的创作方向

欢迎使用 Novelist AI 小说写作系统！请选择你想要创作的**小说类型**：

---

### 男频（男性向）

面向男性读者的爽文系统，涵盖玄幻、仙侠、都市、悬疑等主流题材。

**特点：**
- 升级打脸、战力提升
- 智慧型反派设计
- 金手指辅助成长
- 多维度评测保障质量

**进入男频系统：**
```
male/SKILL.md
```

---

### 女频（女性向）

面向女性读者的情感系统，涵盖言情、耽美、百合、女尊、快穿、悬疑恋爱等题材。

**特点：**
- 感情线为核心驱动
- 男性角色独立性检查（Critical）
- 双主角/群像支持
- 叙事平衡（根据类型调整）

**进入女频系统：**
```
female/SKILL.md
```

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
│   ├── character_relationship_network.md
│   └── supporting_characters.md
├── templates/
│   ├── character_relationship_network.md
│   └── supporting_characters.md
└── database/
    └── schema.sql
```

---

## 系统架构

```
Novel-Skills/
├── SKILL.md              # 主入口（你在这里）
├── male/                 # 男频系统
│   ├── SKILL.md
│   ├── agents/review/    # 男频专项评测Agents
│   ├── templates/        # 男频专项模板
│   │   ├── protagonist_design.md
│   │   ├── antagonist_design.md
│   │   ├── goldfinger_design.md
│   │   ├── climax_design.md
│   │   ├── antagonist_face_slapping.md
│   │   ├── female_characters.md
│   │   └── genres/
│   │       ├── xuanhuan.md
│   │       ├── xianxia.md
│   │       ├── dushi.md
│   │       └── mystery.md
│   └── prompts/          # 男频流程提示词
│       ├── planning_flow.md
│       ├── chapter_flow.md
│       └── review_flow.md
│
├── female/                # 女频系统
│   ├── SKILL.md
│   ├── agents/review/    # 女频专项评测Agents
│   │   ├── male_roles_judge.md      # 【Critical】男性角色独立性
│   │   ├── romance_line_judge.md     # 感情线质量
│   │   ├── bl_relationship_judge.md # 耽美专项
│   │   └── gl_relationship_judge.md # 百合专项
│   ├── templates/        # 女频专项模板
│   │   ├── protagonist_female.md
│   │   ├── dual_protagonist.md
│   │   ├── romance_line.md
│   │   ├── female_goldfinger_design.md
│   │   ├── antagonist_face_slapping_female.md
│   │   └── genres/
│   │       ├── romance_modern.md       # 现代言情
│   │       ├── ancient_romance.md      # 古代言情
│   │       ├── female_xianxia.md       # 女频仙侠
│   │       ├── boys_love.md            # 耽美
│   │       ├── girls_love.md            # 百合
│   │       ├── female_dominance.md     # 女尊
│   │       ├── quick_pass.md           # 快穿/穿书
│   │       └── mystery_romance.md      # 悬疑恋爱
│   └── prompts/          # 女频流程提示词
│       ├── planning_flow.md
│       ├── review_flow.md
│       └── female_chapter_flow.md
│
└── shared/                # 共享资源
    ├── agents/
    ├── templates/
    └── database/
```

---

## 快速开始

### 男频创作

```
进入 male/ 目录
阅读 male/SKILL.md
开始创作
```

### 女频创作

```
进入 female/ 目录
阅读 female/SKILL.md
开始创作
```

---

## 系统特性

| 特性 | 男频 | 女频 |
|------|------|------|
| 类型 | 玄幻/仙侠/都市/悬疑 | 言情/耽美/百合/女尊/快穿 |
| 核心驱动 | 升级打脸 | 感情线推进 |
| 评测重点 | 反派智慧/金手指 | 男性角色独立性 |
| 评测Agents | 9个通用 | 9通用 + 4专项 |

---

## 通用评测（男女频共享）

| Agent | 维度 |
|-------|------|
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

---

**选择你的创作方向，开始写作吧！**