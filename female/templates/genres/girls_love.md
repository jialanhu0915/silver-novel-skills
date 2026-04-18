# 百合（GL）类型模板

**目标读者：** 喜欢女女恋爱的女性读者
**核心元素：** 双女主、情感深度、女性视角

---

## 百合说明

- 女性之间的恋爱，主要为女性读者创作
- 两个角色都是女性，没有基于性别的权力不平衡
- 重点关注情感连接和女性体验
- 女性视角是核心——真实地探索女性之间的吸引

---

## 百合细分类型

### 类型一：青春校园

- **设定：** 高中、大学
- **基调：** 纯真、青春、情感觉醒
- **重点：** 初恋、成长、自我发现
- **典型：** 一方发现吸引，另一方不知情

### 类型二：现代都市

- **设定：** 当代城市生活
- **重点：** 事业、独立、寻找爱情
- **平衡：** 职业生活与爱情兼顾
- **典型：** 职场相遇或邻居

### 类型三：治愈温暖

- **基调：** 温暖、情感情愈
- **背景：** 一方或双方都有过往创伤
- **重点：** 共同度过困难、相互支持
- **典型：** 失忆/抑郁/家庭创伤

### 类型四：时尚模特

- **设定：** 娱乐圈
- **重点：** 光鲜、竞争、恋爱
- **典型：** 从对手到恋人的竞争对手

---

## 与耽美的关键区别

| 方面 | 耽美 | 百合 |
|------|------|------|
| 性别动态 | 两个男人 | 两个女人 |
| 社会背景 | 可能包括偏见 | 常探索女性体验 |
| 权力平衡 | 传统性别角色被移除 | 都是女性，不同动态 |
| 重点 | 常注重激情 | 常注重情感亲密 |

---

## 百合专项注意事项

### 1. 真实女性体验

- 探索真实的女性吸引
- 不是男性幻想版本
- 处理：社会压力、家庭期望、自我发现

### 2. 女性情谊

- 谨慎处理女性友谊
- 区分：亲密友谊vs浪漫兴趣
- 包含：不只是恋爱中的女性纽带

### 3. 情感深度

- 百合常注重情感亲密
- 身体亲密：暗示而非明示
- 重点：情感连接第一

### 4. 社会背景

- 家庭压力（尤其在传统设定中）
- 社会偏见（谨慎处理）
- 结局：挣来的，不是魔法般的接受

---

## 百合角色类型

### 女主类型A（主动型）

- 在恋爱中采取主动
- 有清晰的目标和野心
- 可能在外表上更"男性化"，也可能不是
- 示例：CEO、运动员、自信的艺术家

### 女主类型B（成长型）

- 在故事中发现吸引
- 最初更犹豫
- 通过关系成长
- 示例：晚熟者、温室花朵

### 关系动态

- 一方可能更有经验
- 不同性格创造张力
- 双方都应该有独立生活
- 平衡：在一起的时间vs独立成长

---

## 百合检查清单

- [ ] 两个女性都感觉真实和完整？
- [ ] 关系对女性体验来说是真实的？
- [ ] 保持了女性视角（不是男性幻想）？
- [ ] 双方都有独立目标？
- [ ] 社会背景处理得当？
- [ ] 情感连接是首要的？
- [ ] 用户偏好风格保持一致？

---

## SQL记录格式

```sql
INSERT INTO genre_templates (
    genre_code,
    genre_name_cn,
    genre_name_en,
    target_audience,
    core_elements,
    sub_types,
    key_considerations,
    character_archetypes,
    relationship_dynamics,
    checklist,
    created_at
) VALUES (
    'GL',
    '百合',
    'Girls Love',
    'Female readers who enjoy female-female romance',
    'Dual female protagonists, emotional depth, female gaze',
    '["青春校园", "现代都市", "治愈温暖", "时尚模特"]',
    '{"authentic_female_experience": true, "womens_relationships": true, "emotional_depth": true, "social_context": true}',
    '{"active_type": "Takes initiative, clear goals", "growth_type": "Discovers attraction, hesitant initially"}',
    '{"experience_imbalance": true, "personality_tension": true, "independent_lives": true}',
    '["Both authentic", "Genuine relationship", "Female gaze maintained", "Independent goals", "Social context handled", "Emotional connection primary", "Style maintained"]',
    CURRENT_TIMESTAMP
);
```