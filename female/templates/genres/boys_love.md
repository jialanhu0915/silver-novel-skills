# 耽美（BL）类型模板

**目标读者：** 喜欢男男恋爱的女性读者
**核心元素：** 双男主、浪漫张力、情感深度

## 耽美说明

- 起源于日本（Boys' Love），在中国发展为耽美
- 主要由女性作者为女性读者创作
- 男角色应被塑造成完整的男人，而非女性化的男人
- 重点关注情感连接和关系动态

---

## 耽美细分类型

### 类型一：现代甜宠

| 方面 | 描述 |
|------|------|
| **设定** | 现代、都市 |
| **基调** | 轻松、浪漫、HE（幸福结局） |
| **重点** | 日常生活、甜蜜时刻、关系发展 |
| **示例** | 室友、同事、青梅竹马 |

### 类型二：古代武侠

| 方面 | 描述 |
|------|------|
| **设定** | 武侠世界、古代中国 |
| **元素** | 修仙、门派、江湖 |
| **示例** | 武侠门派中的师兄弟关系 |

### 类型三：校园纯爱

| 方面 | 描述 |
|------|------|
| **设定** | 高中、大学 |
| **基调** | 纯真、青春、初恋 |
| **重点** | 情感觉醒、共同成长 |

### 类型四：虐恋情深

| 方面 | 描述 |
|------|------|
| **基调** | 虐心、激烈、可能有悲剧元素 |
| **冲突** | 家庭反对、社会压力、秘密 |
| **可能涉及** | 分手、分离、牺牲 |

### 类型五：玄幻冒险

| 方面 | 描述 |
|------|------|
| **设定** | 异世界、超自然 |
| **元素** | 系统、穿越、超能力 |
| **重点** | 特殊环境下的关系发展 |

---

## 攻受关系动态

> **重要：** 攻受是叙事角色分工，不是性格强弱！

### 攻方

- **传统叙事角色：** 追求方、主动方
- **不一定：** 性格上更强势
- **可以是：** 温柔、天真、古怪

### 受方

- **传统叙事角色：** 承受方、被追求方
- **不一定：** 性格上更弱势
- **可以是：** 强势、凶猛、能干

### 核心原则

两个角色都必须是有各自目标、性格和成长弧光的完整的人。

---

## 关系阶段设计

### 阶段一：相遇

- 初次相遇的方式
- 强烈印象（正面或负面）
- 难忘时刻

### 阶段二：相识

- 互相了解
- 发现差异
- 初步吸引

### 阶段三：暧昧

- 推拉
- 吃醋时刻
- 擦肩而过
- 身体张力

### 阶段四：确认

- 感情被承认
- 开始亲密
- 建立信任

### 阶段五：磨合

- 关系挑战
- 价值观差异浮现
- 亲密加深

### 阶段六：升华

- 深度羁绊
- 共同度过危机
- 准备好结局

---

## 耽美专项注意事项

### 1. 亲密戏处理

- 通常暗示优于明示
- 重点在情感，不只是身体
- 使用"雾里看花"技巧（暗示而非展示）
- 保持在内容规范内

### 2. 社会背景

- 可能包括：家庭排斥、社会偏见
- 谨慎处理：不要太黑暗，不要轻视
- 结局：挣来的，不是魔法般解决

### 3. 角色声音

- 两个男人听起来都应该是男人
- **避免：** 女性化的言语模式、"娘受"刻板印象
- **可以包括：** 攻受不同的言语风格但都男性化

### 4. 配角处理

- 常包括：女性朋友、家庭成员、竞争对手
- **功能：** 情节推动，不只是搞笑担当
- **必须是：** 有完整性格的

---

## 耽美检查清单

- [ ] 两个角色都像是完整的男人？
- [ ] 攻受动态平衡、不刻板？
- [ ] 情感连接是首要的？
- [ ] 亲密处理得当？
- [ ] 用户偏好风格（甜/虐/推拉）保持一致？
- [ ] 关系进展是挣来的？

---

## SQL记录格式

```sql
INSERT INTO genre_templates (
    genre_id,
    genre_name,
    genre_name_cn,
    category,
    target_audience,
    core_elements,
    sub_types,
    relationship_stages,
    special_considerations,
    checklist,
    created_at
) VALUES (
    'BL',
    'Boys Love',
    '耽美/BL',
    'female',
    'Female readers who enjoy male-male romance',
    'Dual male protagonists; romantic tension; emotional depth; complete male characters',
    '{"modern_sweet":"现代甜宠 - Contemporary urban, light romantic HE", "ancient_wuxia":"古代武侠 - Martial arts world, cultivation sects", "campus":"校园纯爱 - High school/university, pure first love", "bitter_love":"虐恋情深 - Angsty conflict, possible tragedy", "fantasy_adventure":"玄幻冒险 - Other worlds, supernatural abilities"}',
    '{"stage1_meeting":"First encounter, strong impression", "stage2_acquaintance":"Getting to know, initial attraction", "stage3_ambiguity":"Push-pull, jealousy, near-misses", "stage4_confirmation":"Feelings acknowledged, beginning intimacy", "stage5_adjustment":"Challenges, value differences", "stage6_transcendence":"Deep bond, crisis weathered"}',
    'Intimacy: suggestive not explicit, emotion-focused; Social context: handle rejection/prejudice sensitively; Character voice: both masculine, avoid feminization; Third wheels: well-characterized, not just comic relief',
    'Both characters complete men; 攻受 balanced not stereotyped; Emotional connection primary; Intimacy appropriate; User style maintained; Progression earned',
    NOW()
);
```