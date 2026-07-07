# AGENTS.md - AI 助手维护规范

> 本文件是项目级维护指南，适用于任何 AI 助手维护本项目时阅读。
> Claude Code 还会加载对应的 `CLAUDE.md`（指向本文件，并补充 Claude Code 特有内容）。

---

## 项目性质

这是 `silver-novel-skills` —— **AI 小说创作技能套件**。

- 通过 `SKILL.md` 暴露为 Claude Skill
- 内容（写作指南、prompt、评测 Agent）设计为工具无关，可被其他 AI 工具使用
- 不是软件项目；**文件加载方式**通过 `Read 工具` 按需加载 `INDEX.md`

---

## 文件组织原则

### 文件清单的真相在磁盘

- 任何"文件清单"（`SKILL.md`、`guide.md`、`INDEX.md` 中列举的文件）必须与磁盘同步
- 新增 / 删除 / 重命名文件 → 同步更新父目录的 `INDEX.md`
- AI 不应记忆文件名，所有发现都应通过 `INDEX.md` 中介

### 禁止硬编码具体路径

- `SKILL.md`、`guide.md` 中**不应出现**具体文件名（如 `worldbuilder.md`）
- 改用：`Read <分类>/INDEX.md → 选择具体文件`
- 硬编码路径在文件演进时会过时，是 anti-pattern

### 命名一致性不是修改理由

- **不要**为了"对称"或"美观"而重命名文件
- AI 通过 `INDEX.md` 中的描述匹配，文件名后缀混乱（`_judge` / `_checker` / `_agent` 等）不影响功能
- 重命名 = 污染 git history + 破坏 cross-reference，ROI 不可证

---

## 修改原则

### 手术式修改

- 只动必须动的，**不清理无关代码、不"改进"相邻的注释或格式**
- 匹配现有风格，即使自己会写得不同
- 检验标准：每一行改动都应直接追溯到用户的需求

### 先思考后编码

- 评估修改的 ROI：这是**消除实际痛点**还是**对称性洁癖**？
- 预防性工作（"以防万一"、"未来可能需要"）不优先
- 写完代码自问："资深工程师会认为这过于复杂吗？"

### 不删除用户已接受的内容

- 用户已确认"必须保留"的内容（核心设计原则等）不要在重构中删除
- 即使你认为"更整洁的方案"——那是另一回事

---

## 内容设计原则

### 模板（templates）与评审（review agents）的职责分离

**模板（`*/templates/**/*.md`）的定义：**
- 用途：指导大模型进行**创作**的导向型文件
- 内容：资料点为主，**可以添加示例**，但**尽可能减少**
- **雷区章节：仅提供一两个示例，两个为上限**

**评审（`*/agents/review/**/*.md`）的定义：**
- 用途：指导大模型进行**文本内容的评审**
- 内容：主要是**点出评审点**，**而非详尽的指导**
- **一个点最多一个示例，非必要不要示例**

**为什么这样区分：**
- 模板面对"作者"，需要充足的资料点 + 适度示例来引导创作
- 评审面对"评审 Agent"，只需要清晰的判定点；过多示例会污染评审判断
- 两边的"雷区列表"看似重叠，实际是不同视角（创作 vs 评审），不可互替

---

## 提交规范

### 双语 commit message

- 中文在前，English 在后
- 格式：`type: 中文标题` + 空行 + `中文详细说明` + 空行 + `English title and explanation`
- 示例：

```text
refactor: 重写 guide.md 为工作流程操作手册

男频 guide.md（187→140 行）：...

refactor: Rewrite guide.md as workflow operations manual

male/guide.md (187→140 lines): ...
```

### 不直接 push 到 master

- 本仓库 master 分支有 PR review 保护规则
- 默认创建 PR；如需绕过，明确说明原因

---

## Commit 前自检

每次 commit 前运行一次（5 秒）：

```bash
grep -rn 'shared/database/schema.sql' --include="*.md" .
```

确认：

- 所有引用都指向 `shared/database/schema.sql` 同一路径
- 没有引用旧路径（如 `database/schema.sql` 缺 `shared/` 前缀）
- 引用的表名都在 `schema.sql` 中实际存在

---

## 关联文档

- `SKILL.md` —— Skill 入口（用户面向）
- `INDEX.md` —— 各类目录的文件清单
- `shared/database/schema.sql` —— 数据库表结构真相来源
- `README.md` / `README_EN.md` —— GitHub 展示用
- `CLAUDE.md` —— Claude Code 特有补充
