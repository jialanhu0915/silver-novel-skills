# CLAUDE.md - Claude Code 加载入口

> 本文件是 Claude Code 在本项目工作时自动加载的入口。
> 完整的项目维护规范见 [AGENTS.md](./AGENTS.md)。
> 本文件只包含 Claude Code 特有的补充。

---

## 与 AGENTS.md 的关系

- 加载顺序：全局 `~/.claude/CLAUDE.md` → 本项目 `AGENTS.md` → 本文件
- 本文件**不重复** AGENTS.md 的内容
- 修改项目规范时优先改 `AGENTS.md`

---

## Claude Code 特有

### Skill 加载方式

本项目通过 `SKILL.md` 的 frontmatter 被 Claude Code 识别为 Skill：

```yaml
---
name: silver-novel-skills
description: Use when user wants to create AI-assisted web novels...
---
```

修改 `SKILL.md` 的 frontmatter 时，**只改 `description`**——`name` 是 Skill 的唯一标识，乱改会导致加载失败。

### 避免误用全局指令

全局 `~/.claude/CLAUDE.md` 中的"提交"等规则与本项目可能冲突。本项目的提交规范以 `AGENTS.md` 为准。

### 内容设计原则

模板（templates）与评审（review agents）的**职责分离、示例数量约束**等原则见 [AGENTS.md](./AGENTS.md)「内容设计原则」章节。本文件不重复——但在创建或重构模板/评审文件时，必须先回顾该章节。
