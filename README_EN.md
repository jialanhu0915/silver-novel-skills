# Novel-Skills

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

AI-powered novel writing system with full support for male-oriented and female-oriented genres, providing complete capabilities for world-building, character development, plot design, and multi-dimensional quality evaluation.

[English](README_EN.md) | [中文](README.md)

---

## Features

### Dual System Support

| System | Target Audience | Supported Genres |
|--------|-----------------|------------------|
| Male-Oriented | Male readers | Xuanhuan, Xianxia, Urban, Mystery |
| Female-Oriented | Female readers | Romance, Boys' Love, Girls' Love, Female Dominance, Quick Pass, Mystery Romance |

### Framework Agents

- **WorldBuilder** - World-building and setting design
- **CharacterCraft** - Character development and arc design
- **PlotArchitect** - Plot structure and pacing control

### Quality Evaluation System

**Universal Evaluators (Shared)**

| Agent | Evaluation Dimension |
|-------|----------------------|
| LogicChecker | Logical consistency |
| CharacterJudge | Character development |
| PaceCritic | Pacing control |
| ForeshadowHunter | Foreshadowing & callbacks |
| InfoAuditor | Information delivery |
| GoldfingerChecker | Cheat item/golden finger usage |
| ClimaxChecker | Climax design |
| SupportingChecker | Supporting character value |

**Female-Oriented Specialized Evaluators**

| Agent | Evaluation Dimension |
|-------|----------------------|
| MaleRolesJudge | Male character independence (Critical) |
| RomanceLineJudge | Romance quality |
| BLRelationshipJudge | Boys' Love specialization |
| GLRelationshipJudge | Girls' Love specialization |

### Core Design Principles

- **Cheat Item Design** - Rational presentation of protagonist's special abilities
- **Intelligent Antagonists** - Antagonists with actual wit and competence
- **Climax Pacing** - Precise timing for power growth and face-slapping moments
- **Foreshadow System** - Interconnected narrative web with callbacks

---

## Quick Start

### Directory Structure

```
Novel-Skills/
├── SKILL.md              # Main entry
├── male/                 # Male-oriented system
│   ├── SKILL.md
│   ├── agents/
│   ├── templates/
│   └── prompts/
├── female/              # Female-oriented system
│   ├── SKILL.md
│   ├── agents/
│   ├── templates/
│   └── prompts/
└── shared/              # Shared resources
    ├── agents/
    │   ├── framework/   # Framework agents
    │   └── review/      # Evaluation agents
    ├── templates/       # Template library
    └── database/        # Data structures
```

### Basic Usage

**Male-Oriented Writing**

```
1. Navigate to the male/ directory
2. Read male/SKILL.md
3. Use Framework Agents to build your novel structure
4. Use Review Agents for quality evaluation
```

**Female-Oriented Writing**

```
1. Navigate to the female/ directory
2. Read female/SKILL.md
3. Use Framework Agents to build your novel structure
4. Use universal + specialized female-oriented agents for evaluation
```

---

## Architecture

```
Novel-Skills
│
├── male/                           # Male-oriented system
│   ├── agents/review/              # Male-specific evaluators
│   ├── templates/                  # Male-specific templates
│   │   ├── protagonist_design.md
│   │   ├── antagonist_design.md
│   │   ├── goldfinger_design.md
│   │   ├── climax_design.md
│   │   └── genres/                # Genre-specific
│   │       ├── xuanhuan.md
│   │       ├── xianxia.md
│   │       ├── dushi.md
│   │       └── mystery.md
│   └── prompts/                    # Writing flow prompts
│
├── female/                         # Female-oriented system
│   ├── agents/review/              # Female-specific evaluators
│   │   ├── male_roles_judge.md    # 【Critical】Male character independence
│   │   ├── romance_line_judge.md  # Romance quality
│   │   ├── bl_relationship_judge.md
│   │   └── gl_relationship_judge.md
│   ├── templates/                 # Female-specific templates
│   └── prompts/
│
└── shared/                         # Shared resources
    ├── agents/
    │   ├── framework/             # Framework building
    │   │   ├── worldbuilder.md
    │   │   ├── charactercraft.md
    │   │   └── plotarchitect.md
    │   └── review/                # Universal evaluators
    │       ├── logic_checker.md
    │       ├── pace_critic.md
    │       ├── foreshadow_hunter.md
    │       ├── info_auditor.md
    │       ├── goldfinger_checker.md
    │       ├── climax_checker.md
    │       ├── supporting_checker.md
    │       ├── character_judge.md
    │       └── female_character_judge.md
    └── templates/
        ├── character_relationship_network.md
        └── supporting_characters.md
```

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contributing

Pull Requests and Issues are welcome!
