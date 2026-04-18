# 悬疑恋爱 (MYSTERY ROMANCE) 类型模板

目标读者：喜欢悬疑与恋爱结合的女性读者
核心元素：侦探/调查情节搭配恋爱张力，悬疑与情感回报

## 核心概念

两条叙事线交织：
- **悬疑线**：调查、秘密、揭露
- **恋爱线**：关系发展、情感张力

这种结合创造了独特的吸引力：
- 悬疑提供智力刺激
- 恋爱提供情感满足
- 结合：刺激的揭露 AND 心动的时刻

---

## 细分类型（悬疑恋爱细分类型）

### 类型一：推理言情 (Detective Romance)
- 女主：侦探、记者、业余侦探
- 男主：调查搭档 或 嫌疑人/犯罪相关
- 情节：破案同时发展恋爱
- 示例：侦探搭档, 犯罪心理学, 侦探×记者

### 类型二：甜蜜惊悚 (Sweet Thriller)
- 悬疑：谋杀、绑架、阴谋
- 恋爱：甜蜜时刻缓解紧张
- 基调：悬疑与甜蜜交替
- 示例：惊悚恋爱, 甜蜜中带刀

### 类型三：心理悬疑 (Psychological Mystery)
- 重点：复杂心理、隐藏动机
- 恋爱：角色相互理解对方的创伤
- 基调：更黑暗、更强烈的情感联系
- 示例：心理医生, 催眠师

### 类型四：豪门悬疑 (Mansion Mystery)
- 设定：富裕家庭、继承、秘密
- 悬疑：凶手是谁、家庭阴谋
- 恋爱：从仇人到恋人、秘密关系
- 示例：豪门恩怨, 家族秘密

### 类型五：双重身份 (Dual Identity)
- 悬疑：角色有隐藏身份
- 恋爱：爱人发现真相
- 张力：他们会接受真相吗？
- 示例：卧底×警察, 特工×平民

---

## 悬疑元素结构

### 调查流程 (Investigation Structure)
1. **谜题呈现**: 犯罪/发现
2. **线索收集**: 开始调查
3. **障碍出现**: 误导线索、危险
4. **真相逼近**: 真正线索出现
5. **真相大白**: 揭露
6. **危机解决**: 解决

### 线索布置 (Clue Placement)
- 必须对读者公平
- 正确埋下伏笔
- 类型：
  - 关键线索 (Key Clues)
  - 误导线索 (Red Herrings)
  - 情感线索 (Emotional Clues)

---

## 角色定位

### 女主角色 (Female Protagonist Roles)
1. **侦探型**: 她进行调查
2. **受害者型**: 她遭遇了某事
3. **目击者型**: 她看到了什么
4. **嫌疑犯型**: 她必须证明清白

### 男主角色 (Male Protagonist Roles)
1. **搭档型**: 调查搭档
2. **嫌疑人型**: 他可能涉案
3. **知情者型**: 他知道什么
4. **救赎者型**: 他帮她走出黑暗

---

## 关系动态

### 平衡悬疑与恋爱
```
章节结构示例：
Chapter X: 调查片段 → 甜蜜互动
Chapter Y: 危险时刻 → 他保护她
Chapter Z: 重大线索 → 情感升温
```

### 关键原则
- 恋爱应该**推进**悬疑情节
- 悬疑应该**深化**恋爱
- 不要将两者分离成独立轨道

### 整合示例
```
她发现线索A → 他提供关键信息 → 两人合作
→ 调查深入 → 感情升温
→ 危机出现 → 他保护她
→ 真相大白 → 感情确认
```

---

## 用户确认问题

写作前需与用户确认：
1. 悬疑vs恋爱比例偏好？
2. 基调：更多悬疑还是更多甜蜜？
3. 犯罪类型：谋杀/绑架/阴谋/其他？
4. 圆满结局还是苦涩结局？

---

## 悬疑恋爱检查清单

- [ ] 悬疑情节连贯且公平？
- [ ] 线索正确埋下伏笔？
- [ ] 恋爱自然推进悬疑？
- [ ] 悬疑深化情感联系？
- [ ] 用户偏好的悬疑/恋爱比例？
- [ ] 甜虐平衡保持？
- [ ] 叙事平衡保持（恋爱和悬疑都得到适当发展）？

---

## 常见问题 (Common Problems)

| 问题 | 原因 | 解决方案 |
|------|------|----------|
| 推理薄弱 | 只顾着谈恋爱，推理太弱 | 增加独立推理情节 |
| 情感突兀 | 还没感情基础就有亲密 | 循序渐进增加亲密 |
| 比例失衡 | 全是推理没有甜 | 按比例穿插甜蜜互动 |
| 强行绑定 | 爱情压过逻辑 | 保证逻辑自洽 |

---

## SQL Record Format

```sql
-- Genre Record
INSERT INTO genre (id, name_cn, name_en, target_audience, core_elements) 
VALUES (
  'female_mystery_romance',
  '悬疑恋爱',
  'Mystery Romance',
  'Female readers who enjoy combined mystery and romance',
  'Detective/investigation plots paired with romantic tension'
);

-- Sub-types
INSERT INTO genre_subtype (id, genre_id, name_cn, name_en, description, examples)
VALUES 
  ('dmr_detective', 'female_mystery_romance', '推理言情', 'Detective Romance', 'Female detective/reporter + male partner/suspect solving crimes', '侦探×记者, 犯罪心理学'),
  ('dmr_thriller', 'female_mystery_romance', '甜蜜惊悚', 'Sweet Thriller', 'Murder/kidnapping with sweet relief moments', '惊悚恋爱, 甜蜜中带刀'),
  ('dmr_psych', 'female_mystery_romance', '心理悬疑', 'Psychological Mystery', 'Complex psychology with trauma understanding', '心理医生, 催眠师'),
  ('dmr_mansion', 'female_mystery_romance', '豪门悬疑', 'Mansion Mystery', 'Inheritance secrets in wealthy families', '豪门恩怨, 家族秘密'),
  ('dmr_dual', 'female_mystery_romance', '双重身份', 'Dual Identity', 'Hidden identity discovered by love interest', '卧底×警察, 特工×平民');

-- Character Roles
INSERT INTO character_role (id, genre_id, gender, role_type, name_cn, description)
VALUES
  ('cr_f_detective', 'female_mystery_romance', 'female', '侦探型', '侦探型女主', '主动调查解决问题的女主'),
  ('cr_f_victim', 'female_mystery_romance', 'female', '受害者型', '受害者型女主', '遭遇事件需要查明真相的女主'),
  ('cr_f_witness', 'female_mystery_romance', 'female', '目击者型', '目击者型女主', '看见关键线索的女主'),
  ('cr_f_suspect', 'female_mystery_romance', 'female', '嫌疑犯型', '嫌疑犯型女主', '需要证明自己清白的女主'),
  ('cr_m_partner', 'female_mystery_romance', 'male', '搭档型', '搭档型男主', '调查搭档'),
  ('cr_m_suspect', 'female_mystery_romance', 'male', '嫌疑人型', '嫌疑人型男主', '可能有嫌疑的男主'),
  ('cr_m_knower', 'female_mystery_romance', 'male', '知情者型', '知情者型男主', '知道内幕的男主'),
  ('cr_m_savior', 'female_mystery_romance', 'male', '救赎者型', '救赎者型男主', '帮助女主走出黑暗的男主');

-- User Preferences
INSERT INTO user_preference (id, genre_id, preference_type, question)
VALUES
  ('up_ratio', 'female_mystery_romance', 'ratio', 'Mystery vs Romance ratio preference?'),
  ('up_tone', 'female_mystery_romance', 'tone', 'Tone: More suspense or more sweet?'),
  ('up_crime', 'female_mystery_romance', 'crime_type', 'Crime type: Murder/Kidnapping/Conspiracy/Other?'),
  ('up_ending', 'female_mystery_romance', 'ending', 'Happy ending or bittersweet?');
```
