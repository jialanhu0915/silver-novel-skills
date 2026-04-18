# Novelist - AI 男频小说写作 Skill

全类型 AI 独立创作男频小说，支持先整体规划后逐章节完成，通过 SQLite 数据库追踪所有设定确保跨章节一致性。

专为男频读者打造：玄幻、仙侠、都市、悬疑等主流题材。

---

## 核心特性

- **全类型支持**：玄幻、仙侠、都市、悬疑
- **交互式框架确定**：类型 → 世界观 → 人物 → 情节
- **程序化生成**：基于类型模板的有逻辑随机组合
- **多 Agents 协作**：框架阶段分工、评测阶段评审
- **自我反思机制**：九维评测（逻辑/人物/节奏/伏笔/信息/金手指/爽点/配角）
- **智慧型反派设计**：拒绝无脑降智，让反派有城府、有手段
- **女性角色独立人格**：拒绝工具化，让女主有独立目标和成长
- **主角深度塑造**：拒绝脸谱化，让主角有性格缺陷和人物弧光
- **金手指使用原则**：拒绝替代成长，让金手指辅助而非替代
- **合理爽点设计**：拒绝功利化，加入情感和精神层面爽点
- **配角独立价值**：拒绝工具化，让配角有自己的故事
- **SQLite 数据库全程追踪**

---

## 核心设计原则

### 一、智慧型反派

**反派的嘲讽必须有智慧、有根据，禁止无脑降智！**

| 检查项 | 说明 |
|--------|------|
| 嘲讽有事实依据 | 基于客观事实或合理推断 |
| 嘲讽有目的 | 试探/施压/立威/离间 |
| 反派有城府 | 不只靠嘴，有实际手段 |
| 嘲讽分对象 | 对强者有应有的尊重 |

### 二、女性角色独立人格

**女性角色不是奖品或工具，是完整的个体。**

| 检查项 | 说明 |
|--------|------|
| 有独立目标 | 不是"辅佐男主" |
| 有成长线 | 不是被男主"改造" |
| 有自己的选择 | 她的决定影响剧情 |
| 有底线 | 不是无条件的付出 |

### 三、主角深度塑造

**主角不是"爽"的载体，是有血有肉的人。**

| 检查项 | 说明 |
|--------|------|
| 有性格缺陷 | 不是完美的 |
| 有价值观底线 | 不是为了赢可以不择手段 |
| 有内心恐惧 | 让角色立体 |
| 有成长弧光 | 性格会变化 |

### 四、金手指使用原则

**金手指是辅助工具，不是替代成长的捷径。**

| 检查项 | 说明 |
|--------|------|
| 不是100%成功 | 有失败可能 |
| 有代价限制 | 消耗/次数/副作用 |
| 需要主角判断 | 不是自动触发 |
| 有依赖后果 | 过度依赖有负面影响 |

### 五、合理爽点设计

**爽点不只是"获得"，更是"成长"和"认同"。**

| 爽点类型 | 说明 |
|----------|------|
| 实力成长型 | 付出努力后的突破 |
| 情感共鸣型 | 信任回报、羁绊加深 |
| 认知升级型 | 看穿真相、智破困局 |
| 关系互动型 | 被认可、并肩作战 |

### 六、配角独立价值

**配角不是工具，是自己故事里的主角。**

| 检查项 | 说明 |
|--------|------|
| 有自己目标 | 不是只为帮助主角 |
| 有自己困境 | 需要解决自己的问题 |
| 有自己的关系 | 和主角是平等关系 |
| 有自己的成长 | 配角也在成长 |

---

## 工作流程

```
类型确定 → 框架构建（多agents分工）
         ↓
    用户补充 / AI自主设定
         ↓
    整体框架确认
         ↓
    逐章节创作（单一agent）
         ↓
    自我反思评测（九维评测）
         ↓
    人类审批反馈 → 记录到数据库
```

---

## 文件结构

```
male/
├── SKILL.md                    # 主技能文件
├── agents/review/             # 男频专项（如有）
├── templates/
│   ├── protagonist_design.md         # 主角设计
│   ├── antagonist_design.md         # 反派设计
│   ├── goldfinger_design.md         # 金手指设计
│   ├── climax_design.md             # 高潮设计
│   ├── antagonist_face_slapping.md  # 打脸设计
│   ├── female_characters.md          # 女性角色设计
│   └── genres/
│       ├── xuanhuan.md              # 玄幻
│       ├── xianxia.md               # 仙侠
│       ├── dushi.md                 # 都市
│       └── mystery.md               # 悬疑
└── prompts/
    ├── planning_flow.md             # 规划流程
    ├── chapter_flow.md              # 章节流程
    └── review_flow.md               # 评测流程

# 以下为男频与女频共享的资源
shared/
├── agents/
│   ├── framework/              # 框架构建Agents
│   │   ├── worldbuilder.md
│   │   ├── charactercraft.md
│   │   └── plotarchitect.md
│   └── review/                  # 通用评测Agents
│       ├── logic_checker.md
│       ├── pace_critic.md
│       ├── foreshadow_hunter.md
│       ├── info_auditor.md
│       ├── goldfinger_checker.md
│       ├── climax_checker.md
│       ├── supporting_checker.md
│       ├── character_judge.md
│       └── female_character_judge.md
├── templates/
│   ├── character_relationship_network.md
│   └── supporting_characters.md
└── database/
    └── schema.sql
```

---

## 九维评测体系

| 评测Agent | 评测维度 | 说明 |
|-----------|----------|------|
| LogicChecker | 逻辑一致性 | 时间线/规则/因果/常识 |
| CharacterJudge | 人物塑造 | 行为/台词/情感/关系 |
| FemaleCharacterJudge | 女性角色 | 独立目标/成长/选择/底线 |
| PaceCritic | 节奏把控 | 起伏/密度/开篇/结尾 |
| ForeshadowHunter | 伏笔呼应 | 伏笔回收/埋设/呼应 |
| InfoAuditor | 信息交代 | 清晰/冗余/缺失/展示 |
| GoldfingerChecker | 金手指使用 | 正确使用/代价/失败/依赖 |
| ClimaxChecker | 爽点设计 | 铺垫/代价/密度/类型 |
| SupportingChecker | 配角价值 | 独立目标/困境/工具人/平等 |

---

## 数据库表

| 表名 | 用途 | 新增字段 |
|------|------|----------|
| novels | 小说项目元数据 | - |
| frameworks | 世界观、情节、金手指设计 | gold_finger_type/cost/limitation |
| characters | 角色详情 | gender_design_type/personality_flaw/antagonist_type/has_own_goal等 |
| character_events | 角色事件 | - |
| character_relationships | 角色关系网络 | relationship_type/development_trend/is_hidden |
| relationship_events | 角色关系变化事件 | event_type/old_state/new_state |
| factions | 势力/组织 | - |
| faction_events | 势力事件 | - |
| items | 物品/道具 | - |
| item_events | 物品事件 | - |
| chapters | 章节内容 | antagonist_quality/female_character_quality/protagonist_depth_quality等 |
| feedbacks | 人类审批反馈 | 新增反馈类型 |
| materials | 可复用素材库 | - |
| self_reflections | 自我反思记录 | 新增reflection_type |

---

## 使用方式

### 开始新小说

```
我想写一本小说
```

### 继续现有小说

```
继续写《书名》
```

### 查看进度

```
查看《书名》的进度
```

---

## 输出格式

支持 Markdown (.md)、Plain Text (.txt)、数据库直接存储

---

## 创作检查清单

每次创作完成后，请确认：

### 反派塑造
- [ ] 反派嘲讽有事实/逻辑依据
- [ ] 无纯粹人身攻击
- [ ] 反派有实际手段
- [ ] 嘲讽有明确目的
- [ ] 对强者有尊重

### 女性角色
- [ ] 女角色有独立目标
- [ ] 女角色有自己的选择权
- [ ] 不是纯粹的"被保护"或"助攻"
- [ ] 关系是平等的

### 主角塑造
- [ ] 主角有性格缺陷
- [ ] 主角有自己的价值观底线
- [ ] 主角有内心成长
- [ ] 不是完美的工具人

### 金手指使用（如有）
- [ ] 金手指不是100%成功
- [ ] 金手指有代价/限制
- [ ] 主角需要自己判断
- [ ] 过度依赖有后果

### 爽点设计
- [ ] 爽点有铺垫
- [ ] 爽点有代价/来之不易
- [ ] 不是连续爽点
- [ ] 有精神层面的爽点
- [ ] 没有"红颜知己"等工具化描写

### 配角设计
- [ ] 配角有自己的目标
- [ ] 配角有自己的困境
- [ ] 和主角是平等关系
- [ ] 不是纯粹的工具人