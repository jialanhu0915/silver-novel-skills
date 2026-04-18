# 女尊 (FEMALE DOMINANCE) 类型模板

## 目标读者
喜欢性别反转幻想世界的女性读者

## 核心元素
- 女性主导的社会
- 男性角色处于不同的社会地位
- 打破性别刻板印象

## 定义
女尊 (Female Dominance / Gender Reversed):
- 女性掌握政治、经济、社会权力的世界
- 男性可能处于从属地位（与现实世界不同）
- 女主通常强大、有权势，可有后宫（可选）
- 可以是严肃的世界构建或喜剧风格

## 核心概念：逆后宫 (Reverse Harem)
- 一位女主角
- 多位男性追求者
- 女主有自主意志和权力
- 与男性后宫不同——女性是主体，不是客体

---

## 细分类型

### 类型一：经典女尊 (Classic Female Dominance)
- 严肃的世界构建
- 女性掌握：皇位、政治权力、继承权
- 男性处于传统"女性"角色
- 重点：政治、权力斗争、恋爱

### 类型二：逆后宫 (Reverse Harem)
- 重点：多位男主的恋爱
- 女主：被追求、有权力、能做选择
- 男角色：每个都独特，有自己的个性
- 基调：可以是甜蜜的或戏剧性的

### 类型三：女强修仙 (Female Strong Cultivation)
- 设定：女性主导的修仙世界
- 女性：可以修炼、掌握权力
- 男性：可能处于辅助角色
- 重点：修仙 + 恋爱

### 类型四：喜剧女尊 (Comedic Female Dominance)
- 基调：轻松、幽默
- 性别反转用于制造喜剧效果
- 通常：现代设定，期望被颠覆

---

## 世界构建

### 性别反转的关键领域

| 领域 | 传统设定 | 女尊世界 |
|------|----------|----------|
| 继承 | 男性继承 | 女性继承 |
| 政治权力 | 男性统治者 | 女性统治者 |
| 教育 | 男性教育优先 | 女性教育优先 |
| 婚姻 | 女性加入男性家庭 | 男性可能加入女性家庭 |
| 社会地位 | 男性优越 | 女性优越 |
| 工作 | 男性在外工作 | 女性在外工作 |
| 家务 | 女性做家务 | 男性可能做家务 |

### 重要注意事项
- 避免：女性只是"更好的男性"
- 应该探索：社会如何不同地运作
- 生理差异可以保留（怀孕等），但社会角色被翻转
- 男性仍然可以是：坚强的、有能力的，但在女性主导的社会中

---

## 角色类型

### 女尊中的男性角色

| 类型 | 描述 |
|------|------|
| 忠犬型 | 忠诚、奉献、保护 |
| 傲娇型 | 外冷内热 |
| 病娇型 | 执着、强烈 |
| 阳光型 | 开朗、支持 |
| 复杂型 | 有自己的目标，对爱情纠结 |

#### 必须避免 (❌)
- 男性角色都是受害者（太悲惨）
- 翻转男性凝视（男性角色被过度物化）
- 用女性个性写男性（他们仍然是男性）

#### 应该有 (✅)
- 男性角色有尊严和能力
- 有些男性可能反抗体制（制造冲突）
- 男性友谊、目标、梦想
- 男性角色可以有自己的强大之处

### 女尊中的女主角

#### 必须具备
- 有能力和权力
- 有自己的判断
- 做有意义的选择
- 有深度（不只是接受追求者）

#### 可以包含
- 逆后宫：多位男性追求者
- 政治阴谋
- 修炼成长
- 打破体制（如果批判性别角色）

---

## 情节模式

### 模式一：女主登基 (Female Emperor)
1. 女主出生在权力中/被推入危机
2. 必须证明自己
3. 政治挑战
4. 恋爱副线
5. 成为统治者

### 模式二：逆后宫邂逅 (Reverse Harem Meeting)
1. 女主遇到多位男角色
2. 每位男性都有独特吸引力
3. 女主处理关系
4. 男性之间的竞争/嫉妒
5. 女主做出最终选择 或 开放式

### 模式三：打破偏见 (Breaking Stereotypes)
1. 批判性别角色
2. 女主挑战期望
3. 角色成长
4. 两种性别都被平等重视

---

## 检查清单

- [ ] 世界构建一致且逻辑自洽
- [ ] 性别反转不只是复制男性主导的套路
- [ ] 女主角有自主意志
- [ ] 男性角色有尊严
- [ ] 恋爱不是剥削性的
- [ ] 保持用户偏好的细分类型
- [ ] 叙事平衡

---

## SQL Record Format

```sql
INSERT INTO genre_templates (
    genre_name,
    genre_name_cn,
    sub_types,
    target_audience,
    core_elements,
    world_building_notes,
    character_types,
    plot_patterns,
    checklist,
    ratio_requirement,
    created_at
) VALUES (
    'FEMALE_DOMINANCE',
    '女尊',
    '["经典女尊", "逆后宫", "女强修仙", "喜剧女尊"]',
    'Female readers who enjoy gender-reversed fantasy worlds',
    '["Female-led society", "Male characters with different social position", "Breaking gender stereotypes"]',
    '["Inheritance: Female inherits", "Political power: Female rulers", "Marriage: Man may join woman family"]',
    '["忠犬型", "傲娇型", "病娇型", "阳光型", "复杂型"]',
    '["女主登基", "逆后宫邂逅", "打破偏见"]',
    '["World building consistent", "Gender reversal logical", "FL has agency", "Male characters have dignity"]',
    'balanced',
    NOW()
);
```
