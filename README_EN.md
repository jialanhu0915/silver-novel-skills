# silver-novel-skills

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
silver-novel-skills/
├── SKILL.md              # Main entry
├── male/                 # Male-oriented system
│   ├── guide.md          # Male-oriented entry
│   ├── templates/
│   └── prompts/
├── female/              # Female-oriented system
│   ├── guide.md          # Female-oriented entry
│   ├── agents/
│   │   └── review/       # Female-specific evaluators
│   ├── templates/
│   └── prompts/
└── shared/              # Shared resources
    ├── agents/
    │   ├── framework/   # Framework agents
    │   └── review/      # Universal evaluators
    ├── templates/
    │   ├── character_relationship_network.md
    │   ├── supporting_characters.md
    │   └── writing_craft/   # 6 writing craft modules
    └── database/
        └── schema.sql
```

### Basic Usage

**Male-Oriented Writing**

```
1. Read male/guide.md
2. Use Framework Agents to build your novel structure
3. Use Review Agents for quality evaluation
```

**Female-Oriented Writing**

```
1. Read female/guide.md
2. Use Framework Agents to build your novel structure
3. Use universal + specialized female-oriented agents for evaluation
```

---

## Architecture

```
silver-novel-skills
│
├── male/                           # Male-oriented system
│   ├── guide.md                    # Male-oriented entry
│   ├── templates/                  # Male-specific templates
│   │   ├── protagonist_design.md
│   │   ├── antagonist_design.md
│   │   ├── goldfinger_design.md
│   │   ├── climax_design.md
│   │   ├── antagonist_face_slapping.md
│   │   ├── female_characters.md
│   │   └── genres/                # Genre-specific (11 genres)
│   │       ├── xuanhuan.md
│   │       ├── xianxia.md
│   │       ├── dushi.md
│   │       ├── mystery.md
│   │       ├── scifi.md
│   │       ├── gaming.md
│   │       ├── historical.md
│   │       ├── urban_fantasy.md
│   │       ├── transmigration.md
│   │       ├── horror.md
│   │       └── entertainment.md
│   └── prompts/                    # Writing flow prompts
│
├── female/                         # Female-oriented system
│   ├── guide.md                    # Female-oriented entry
│   ├── agents/review/              # Female-specific evaluators
│   │   ├── male_roles_judge.md    # 【Critical】Male character independence
│   │   ├── romance_line_judge.md  # Romance quality
│   │   ├── bl_relationship_judge.md
│   │   └── gl_relationship_judge.md
│   ├── templates/                 # Female-specific templates (5 base + 8 genres)
│   │   ├── protagonist_female.md
│   │   ├── dual_protagonist.md
│   │   ├── romance_line.md
│   │   ├── female_goldfinger_design.md
│   │   ├── antagonist_face_slapping_female.md
│   │   └── genres/
│   │       ├── romance_modern.md
│   │       ├── ancient_romance.md
│   │       ├── female_xianxia.md
│   │       ├── boys_love.md
│   │       ├── girls_love.md
│   │       ├── female_dominance.md
│   │       ├── quick_pass.md
│   │       └── mystery_romance.md
│   └── prompts/
│
└── shared/                         # Shared resources
    ├── agents/
    │   ├── framework/             # Framework building
    │   │   ├── worldbuilder.md
    │   │   ├── charactercraft.md
    │   │   └── plotarchitect.md
    │   └── review/                # Universal evaluators (13 agents)
    │       ├── logic_checker.md
    │       ├── conflict_checker.md
    │       ├── description_quality_agent.md
    │       ├── character_judge.md
    │       ├── female_character_judge.md
    │       ├── pace_critic.md
    │       ├── foreshadow_hunter.md
    │       ├── info_auditor.md
    │       ├── goldfinger_checker.md
    │       ├── climax_checker.md
    │       ├── pov_checker.md
    │       ├── supporting_checker.md
    │       └── plot_structure_agent.md
    └── templates/
        ├── character_relationship_network.md
        ├── supporting_characters.md
        └── writing_craft/   # 6 writing craft modules
            ├── emotional_craft.md
            ├── dialogue_craft.md
            ├── scene_craft.md
            ├── depth_balance.md
            ├── narrative_pov.md
            └── world_craft.md
```

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contributing

Pull Requests and Issues are welcome!
