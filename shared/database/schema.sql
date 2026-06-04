-- =============================================================================
-- silver-novel-skills Database Schema (SQLite)
-- =============================================================================
-- 用途：跨章节/跨会话的状态持久化，解决多轮对话和长篇创作的上下文丢失
-- 维护原则：schema.sql 是字段定义和 INSERT 模板的唯一真理来源
-- 各 md 文件不再嵌入 SQL，只引用本文件
-- =============================================================================


-- =============================================================================
-- 1. 核心表
-- =============================================================================

-- 小说项目表
CREATE TABLE IF NOT EXISTS novels (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    genre TEXT,
    style TEXT,
    tone TEXT,
    target_audience TEXT,
    target_length TEXT,
    seed TEXT,
    status TEXT DEFAULT 'planning',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 框架规划表（世界观/情节/金手指框架级设计）
CREATE TABLE IF NOT EXISTS frameworks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    type TEXT NOT NULL,
    category TEXT,
    name TEXT,
    content TEXT,
    gold_finger_type TEXT,
    gold_finger_cost TEXT,
    gold_finger_limitation TEXT,
    parent_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE
);

-- 角色表
CREATE TABLE IF NOT EXISTS characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    role_type TEXT,
    gender_design_type TEXT,
    personality_flaw TEXT,
    core_value TEXT,
    inner_fear TEXT,
    appearance TEXT,
    personality TEXT,
    personality_type TEXT,                   -- 性格类型（女频扩展）
    emotional_independence TEXT,            -- 情感独立性（女频专项）
    has_own_judgment INTEGER DEFAULT 0,     -- 是否有自己判断（女频专项）
    background TEXT,
    motivation TEXT,
    arc_change TEXT,
    growth_arc_type TEXT,                   -- 成长弧光类型（女频扩展）
    primary_focus TEXT,                     -- 主要关注点（女频专项）
    abilities TEXT,
    relationships TEXT,
    is_killer INTEGER DEFAULT 0,            -- 悬疑题材标记
    antagonist_type TEXT,
    antagonist_intelligence_level TEXT,
    antagonist_arrogance_source TEXT,
    manipulation_style TEXT,                -- 反派操纵风格
    support_type TEXT,                      -- 配角类型（ally/rival/complex/functional）
    has_own_goal INTEGER DEFAULT 0,
    has_own_conflict INTEGER DEFAULT 0,     -- 配角是否有自己的困境
    has_growth_arc INTEGER DEFAULT 0,
    relationship_with_mc TEXT,
    relationship_with_protagonist TEXT,     -- 配角与主角的关系
    status TEXT DEFAULT 'alive',
    first_chapter INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE
);

-- 角色事件表
CREATE TABLE IF NOT EXISTS character_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    chapter_id INTEGER NOT NULL,
    event_type TEXT,
    event_desc TEXT,
    event_order INTEGER,
    emotional_state TEXT,
    consequence TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE CASCADE
);

-- 角色关系表
CREATE TABLE IF NOT EXISTS character_relationships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    character_id_1 INTEGER NOT NULL,
    character_id_2 INTEGER NOT NULL,
    relationship_type TEXT NOT NULL,
    initial_state TEXT,
    current_state TEXT,
    development_trend TEXT,
    key_event_ids TEXT,
    is_hidden INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id_1) REFERENCES characters(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id_2) REFERENCES characters(id) ON DELETE CASCADE
);

-- 角色关系事件表
CREATE TABLE IF NOT EXISTS relationship_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    relationship_id INTEGER NOT NULL,
    chapter_id INTEGER,
    event_type TEXT,
    event_desc TEXT,
    old_state TEXT,
    new_state TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (relationship_id) REFERENCES character_relationships(id) ON DELETE CASCADE,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE SET NULL
);

-- 势力/组织表
CREATE TABLE IF NOT EXISTS factions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    faction_type TEXT,
    description TEXT,
    ideology TEXT,
    resources TEXT,
    territory TEXT,
    relationships TEXT,
    status TEXT DEFAULT 'active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE
);

-- 势力事件表
CREATE TABLE IF NOT EXISTS faction_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    faction_id INTEGER NOT NULL,
    chapter_id INTEGER NOT NULL,
    event_type TEXT,
    event_desc TEXT,
    event_order INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (faction_id) REFERENCES factions(id) ON DELETE CASCADE,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE CASCADE
);

-- 物品/道具表
CREATE TABLE IF NOT EXISTS items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    item_type TEXT,
    description TEXT,
    abilities TEXT,
    rarity TEXT,
    current_holder INTEGER,
    location TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE,
    FOREIGN KEY (current_holder) REFERENCES characters(id)
);

-- 物品事件表
CREATE TABLE IF NOT EXISTS item_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_id INTEGER NOT NULL,
    chapter_id INTEGER NOT NULL,
    event_type TEXT,
    event_desc TEXT,
    from_holder INTEGER,
    to_holder INTEGER,
    event_order INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE CASCADE,
    FOREIGN KEY (from_holder) REFERENCES characters(id),
    FOREIGN KEY (to_holder) REFERENCES characters(id)
);

-- 章节表
CREATE TABLE IF NOT EXISTS chapters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    chapter_number INTEGER NOT NULL,
    title TEXT,
    summary TEXT,
    content TEXT,
    word_count INTEGER,
    key_events TEXT,
    characters_involved TEXT,
    factions_involved TEXT,
    items_involved TEXT,
    plot_progression TEXT,
    protagonist_type TEXT,                  -- 女频：女主类型（单主/双主）
    relationship_stage TEXT,                -- 女频：感情阶段（相遇/暧昧/确认...）
    sweet_level INTEGER,                    -- 女频：甜蜜度 1-10
    conflict_level INTEGER,                 -- 女频：冲突度 1-10
    version INTEGER DEFAULT 1,
    status TEXT DEFAULT 'draft',
    antagonist_quality TEXT,
    female_character_quality TEXT,
    protagonist_depth_quality TEXT,
    goldfinger_usage_quality TEXT,
    climax_quality TEXT,
    supporting_quality TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE
);

-- 反馈记录表
CREATE TABLE IF NOT EXISTS feedbacks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    chapter_id INTEGER NOT NULL,
    feedback_type TEXT,
    severity TEXT,
    content TEXT,
    suggested_fix TEXT,
    is_resolved INTEGER DEFAULT 0,
    resolved_in_chapter INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE CASCADE
);

-- 素材库表
CREATE TABLE IF NOT EXISTS materials (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER,
    type TEXT NOT NULL,
    genre TEXT,
    name TEXT NOT NULL,
    content TEXT,
    tags TEXT,
    usage_count INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE SET NULL
);

-- 自我反思记录表（评测 Agent 写入）
CREATE TABLE IF NOT EXISTS self_reflections (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    chapter_id INTEGER NOT NULL,
    reflection_type TEXT NOT NULL,
    score INTEGER,
    issues_found TEXT,
    self_improvement TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE CASCADE
);

-- 感情线表（女频专项）
CREATE TABLE IF NOT EXISTS romance_lines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    romance_pair VARCHAR(100) NOT NULL,
    current_stage VARCHAR(50) DEFAULT '相遇',
    tension_level INTEGER DEFAULT 5,
    sweet_level INTEGER DEFAULT 5,
    conflict_level INTEGER DEFAULT 5,
    last_development VARCHAR(200),
    next_target VARCHAR(200),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE
);

-- 快穿任务表（快穿文专项）
CREATE TABLE IF NOT EXISTS system_tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    world_id INTEGER,
    task_name VARCHAR(200) NOT NULL,
    task_type VARCHAR(50),
    task_description TEXT,
    success_criteria TEXT,
    difficulty_level VARCHAR(20) DEFAULT '中等',
    reward_type VARCHAR(50),
    reward_description TEXT,
    punishment_description TEXT,
    status VARCHAR(20) DEFAULT '进行中',
    completion_chapter INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE
);


-- =============================================================================
-- 2. 虚构表（从各 md 文件中提取并在此集中定义）
-- =============================================================================

-- 题材元数据（mystery_romance 等女频专项使用）
CREATE TABLE IF NOT EXISTS genre (
    id TEXT PRIMARY KEY,
    name_cn TEXT NOT NULL,
    name_en TEXT,
    target_audience TEXT,
    core_elements TEXT
);

-- 题材子分类
CREATE TABLE IF NOT EXISTS genre_subtype (
    id TEXT PRIMARY KEY,
    genre_id TEXT NOT NULL,
    name_cn TEXT,
    name_en TEXT,
    description TEXT,
    examples TEXT,
    FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
);

-- 题材角色模板
CREATE TABLE IF NOT EXISTS character_role (
    id TEXT PRIMARY KEY,
    genre_id TEXT NOT NULL,
    gender TEXT,
    role_type TEXT,
    name_cn TEXT,
    description TEXT,
    FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
);

-- 用户偏好问题模板
CREATE TABLE IF NOT EXISTS user_preference (
    id TEXT PRIMARY KEY,
    genre_id TEXT NOT NULL,
    preference_type TEXT,
    question TEXT,
    FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
);

-- 题材综合模板（GL/BL/女尊等用，整合多种字段）
CREATE TABLE IF NOT EXISTS genre_templates (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    genre_code TEXT,
    genre_id TEXT,
    genre_name TEXT,
    genre_name_cn TEXT NOT NULL,
    genre_name_en TEXT,
    category TEXT,
    target_audience TEXT,
    core_elements TEXT,                   -- JSON
    sub_types TEXT,                       -- JSON
    key_considerations TEXT,              -- JSON
    character_archetypes TEXT,            -- JSON
    relationship_dynamics TEXT,           -- JSON
    relationship_stages TEXT,             -- JSON (BL 专用)
    special_considerations TEXT,
    world_building_notes TEXT,
    character_types TEXT,
    plot_patterns TEXT,
    world_building TEXT,                  -- JSON
    checklist TEXT,                       -- JSON
    ratio_requirement TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 现代言情专用（复杂 JSON 结构）
CREATE TABLE IF NOT EXISTS novel_genres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    genre_id TEXT,
    genre_name TEXT,
    genre_name_en TEXT,
    category TEXT,
    target_audience TEXT,
    core_elements TEXT,                   -- JSON
    sub_types TEXT,                       -- JSON
    world_building TEXT,                  -- JSON
    character_archetypes TEXT,            -- JSON
    plot_patterns TEXT,                   -- JSON
    checklist TEXT,                       -- JSON
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 女频金手指设计表（区别于 frameworks）
CREATE TABLE IF NOT EXISTS novel_frameworks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    novel_id INTEGER NOT NULL,
    gold_finger_type TEXT,
    gold_finger_name TEXT,
    gold_finger_effect TEXT,
    gold_finger_cost TEXT,
    gold_finger_limitation TEXT,
    growth_stage TEXT,
    design_principle TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (novel_id) REFERENCES novels(id) ON DELETE CASCADE
);


-- =============================================================================
-- 3. 索引
-- =============================================================================

CREATE INDEX IF NOT EXISTS idx_frameworks_novel ON frameworks(novel_id);
CREATE INDEX IF NOT EXISTS idx_characters_novel ON characters(novel_id);
CREATE INDEX IF NOT EXISTS idx_character_events_character ON character_events(character_id);
CREATE INDEX IF NOT EXISTS idx_character_events_chapter ON character_events(chapter_id);
CREATE INDEX IF NOT EXISTS idx_character_relationships_novel ON character_relationships(novel_id);
CREATE INDEX IF NOT EXISTS idx_character_relationships_char1 ON character_relationships(character_id_1);
CREATE INDEX IF NOT EXISTS idx_character_relationships_char2 ON character_relationships(character_id_2);
CREATE INDEX IF NOT EXISTS idx_relationship_events_relationship ON relationship_events(relationship_id);
CREATE INDEX IF NOT EXISTS idx_relationship_events_chapter ON relationship_events(chapter_id);
CREATE INDEX IF NOT EXISTS idx_factions_novel ON factions(novel_id);
CREATE INDEX IF NOT EXISTS idx_faction_events_faction ON faction_events(faction_id);
CREATE INDEX IF NOT EXISTS idx_items_novel ON items(novel_id);
CREATE INDEX IF NOT EXISTS idx_item_events_item ON item_events(item_id);
CREATE INDEX IF NOT EXISTS idx_chapters_novel ON chapters(novel_id);
CREATE INDEX IF NOT EXISTS idx_feedbacks_chapter ON feedbacks(chapter_id);
CREATE INDEX IF NOT EXISTS idx_materials_novel ON materials(novel_id);
CREATE INDEX IF NOT EXISTS idx_self_reflections_chapter ON self_reflections(chapter_id);
CREATE INDEX IF NOT EXISTS idx_romance_lines_novel ON romance_lines(novel_id);
CREATE INDEX IF NOT EXISTS idx_system_tasks_novel ON system_tasks(novel_id);
CREATE INDEX IF NOT EXISTS idx_system_tasks_world ON system_tasks(world_id);
CREATE INDEX IF NOT EXISTS idx_novel_frameworks_novel ON novel_frameworks(novel_id);


-- =============================================================================
-- 4. 字段说明
-- =============================================================================

-- characters.role_type: protagonist/antagonist/supporting/female_lead
-- characters.gender_design_type: ambitious/independent/complex/growing (for female characters)
-- characters.personality_flaw: impulsive/cold/suspicious/arrogant/avoidant (for protagonist)
-- characters.antagonist_type: intelligent/arrogant/insidious/principled (for antagonist)
-- characters.antagonist_intelligence_level: high/medium/low
-- characters.has_own_goal: 1/0
-- characters.has_own_conflict: 1/0
-- characters.has_growth_arc: 1/0
-- characters.has_own_judgment: 1/0
-- characters.relationship_with_mc: equals/mc_dominant/subordinate
-- characters.relationship_with_protagonist: equals/mc_dependent/opposite/complex
-- characters.support_type: ally/rival/complex/functional
-- characters.manipulation_style: 直接/间接/借刀/规则
-- characters.is_killer: 1/0 (悬疑题材)

-- chapters.antagonist_quality: intelligent/average/brainless
-- chapters.female_character_quality: independent/average/tool
-- chapters.protagonist_depth_quality: deep/average/shallow
-- chapters.goldfinger_usage_quality: proper/overused/abused
-- chapters.climax_quality: excellent/good/average/poor
-- chapters.supporting_quality: independent/average/tool
-- chapters.protagonist_type: 单主/双主/群像 (女频)
-- chapters.relationship_stage: 相遇/相识/暧昧/确认/磨合/升华 (女频)
-- chapters.sweet_level: 1-10
-- chapters.conflict_level: 1-10

-- feedbacks.feedback_type: logic/personality/pacing/foreshadowing/information/goldfinger/climax/supporting/antagonist_stupid/female_tool

-- character_relationships.relationship_type: family/mentor/ally/rival/enemy/romantic/complex
-- character_relationships.development_trend: up/down/wave/stable
-- relationship_events.event_type: established/worsened/improved/broken/exploded

-- romance_lines.current_stage: 相遇/相识/暧昧/确认/磨合/升华
-- romance_lines.tension_level: 1-10
-- romance_lines.sweet_level: 1-10
-- romance_lines.conflict_level: 1-10

-- system_tasks.task_type: 攻略/收集/拯救/逆袭/治愈/事业/混合
-- system_tasks.difficulty_level: 简单/中等/困难/地狱
-- system_tasks.status: 进行中/已完成/失败

-- novel_frameworks.gold_finger_type: social_insight/emotional_perception/information_advantage/resource_integration/professional_expertise
--   social_insight: 人际洞察型
--   emotional_perception: 情感感知型
--   information_advantage: 信息差型
--   resource_integration: 资源整合型
--   professional_expertise: 专业能力型


-- =============================================================================
-- 5. self_reflections.reflection_type 完整列表
-- =============================================================================
-- 17 个评测 Agent 各自对应一个 reflection_type（注意用下划线命名）：

-- 通用评测（11 个）
--   'logic'                  逻辑一致性
--   'conflict'               冲突质量
--   'description_quality'    描写质量
--   'character'              人物塑造
--   'female_character'       女性角色塑造
--   'pace'                   节奏把控
--   'foreshadow'             伏笔呼应
--   'information'            信息交代
--   'goldfinger'             金手指使用
--   'climax'                 爽点设计
--   'pov'                    叙事视角
--   'supporting'             配角价值
--   'plot_structure'         剧情结构

-- 女频专项（4 个）
--   'male_character'         男性角色独立性
--   'romance_line'           感情线质量
--   'bl_relationship'        耽美关系
--   'gl_relationship'        百合关系


-- =============================================================================
-- 6. INSERT 模板（按表分组，所有 md 文件统一引用这里）
-- =============================================================================
-- 使用方式：所有评测/写入操作都参考下面的 INSERT 模板。
-- 字段名以本文件为准；md 文件不再嵌入 SQL，避免字段漂移。


-- -----------------------------------------------------------------------------
-- 6.1 novels
-- -----------------------------------------------------------------------------
INSERT INTO novels (title, genre, style, tone, target_audience, target_length, seed)
VALUES (?, ?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.2 frameworks（框架级设计：世界观/力量/势力/情节/金手指/关系网络等）
-- -----------------------------------------------------------------------------
INSERT INTO frameworks (novel_id, type, category, name, content)
VALUES (?, ?, ?, ?, ?);

INSERT INTO frameworks (novel_id, type, category, name, content,
                        gold_finger_type, gold_finger_cost, gold_finger_limitation)
VALUES (?, 'goldfinger', 'main', ?, ?, ?, ?, ?);

INSERT INTO frameworks (novel_id, type, category, name, content)
VALUES (?, 'relationship_network', 'overview', '角色关系网络', ?);

INSERT INTO frameworks (novel_id, type, category, name, content)
VALUES (?, 'climax_scene', 'face_slapping', '打脸场景', ?);

INSERT INTO frameworks (novel_id, type, category, name, content)
VALUES (?, 'climax_scene', 'face_slapping_female', '女频打脸场景', ?);

INSERT INTO frameworks (novel_id, type, category, name, content)
VALUES (?, 'world_structure', 'structure', ?, ?);

INSERT INTO frameworks (novel_id, type, category, name, content)
VALUES (?, 'power_system', 'level', ?, ?);


-- -----------------------------------------------------------------------------
-- 6.3 characters（角色：主角/女主/反派/配角/通用）
-- -----------------------------------------------------------------------------
-- 男频主角
INSERT INTO characters (novel_id, name, role_type,
                        personality_flaw, core_value, inner_fear, has_growth_arc)
VALUES (?, ?, 'protagonist', ?, ?, ?, ?);

-- 女频女主
INSERT INTO characters (novel_id, name, role_type,
                        personality_type, emotional_independence, has_own_judgment,
                        growth_arc_type, primary_focus)
VALUES (?, ?, 'female_lead', ?, ?, ?, ?, ?);

-- 反派（字段名带 antagonist_ 前缀）
INSERT INTO characters (novel_id, name, role_type,
                        antagonist_type, antagonist_intelligence_level,
                        antagonist_arrogance_source, manipulation_style)
VALUES (?, ?, 'antagonist', ?, ?, ?, ?);

-- 配角
INSERT INTO characters (novel_id, name, role_type, support_type,
                        has_own_goal, has_own_conflict, relationship_with_protagonist)
VALUES (?, ?, 'supporting', ?, ?, ?, ?);

-- 通用角色（女频 female_lead 类型）
INSERT INTO characters (novel_id, name, role_type, gender_design_type,
                        has_own_goal, has_growth_arc, relationship_with_mc)
VALUES (?, ?, 'female_lead', ?, ?, ?, ?);

-- 悬疑题材专用
INSERT INTO characters (novel_id, name, role_type, background, motivation, is_killer)
VALUES (?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.4 character_relationships / relationship_events
-- -----------------------------------------------------------------------------
INSERT INTO character_relationships (
    novel_id, character_id_1, character_id_2,
    relationship_type, initial_state, current_state,
    development_trend, key_event_ids, is_hidden
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO relationship_events (
    relationship_id, chapter_id, event_type,
    event_desc, old_state, new_state
) VALUES (?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.5 factions
-- -----------------------------------------------------------------------------
INSERT INTO factions (novel_id, name, faction_type, description, ideology, resources, territory)
VALUES (?, ?, ?, ?, ?, ?, ?);

INSERT INTO factions (novel_id, name, faction_type, ideology, resources)
VALUES (?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.6 items（如需）
-- -----------------------------------------------------------------------------
INSERT INTO items (novel_id, name, item_type, description, abilities, rarity, current_holder, location)
VALUES (?, ?, ?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.7 chapters
-- -----------------------------------------------------------------------------
-- 男频/通用
INSERT INTO chapters (novel_id, chapter_number, title, summary, content,
                      word_count, key_events, characters_involved,
                      factions_involved, items_involved, plot_progression)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

-- 女频（含 protagonist_type/relationship_stage/sweet_level/conflict_level）
INSERT INTO chapters (novel_id, title, chapter_number, word_count,
                      protagonist_type, relationship_stage, sweet_level, conflict_level)
VALUES (?, ?, ?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.8 feedbacks
-- -----------------------------------------------------------------------------
INSERT INTO feedbacks (chapter_id, feedback_type, severity, content, suggested_fix)
VALUES (?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.9 self_reflections（17 个评测 Agent 各自的 INSERT 模板）
-- -----------------------------------------------------------------------------
-- 通用评测（11 个）
INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'logic', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'conflict', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'description_quality', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'character', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'female_character', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'pace', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'foreshadow', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'information', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'goldfinger', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'climax', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'pov', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'supporting', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'plot_structure', ?, ?, ?);

-- 女频专项（4 个）
INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'male_character', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'romance_line', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'bl_relationship', ?, ?, ?);

INSERT INTO self_reflections (chapter_id, reflection_type, score, issues_found, self_improvement)
VALUES (?, 'gl_relationship', ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.10 romance_lines（女频感情线）
-- -----------------------------------------------------------------------------
INSERT INTO romance_lines (novel_id, romance_pair, current_stage,
                          tension_level, sweet_level, conflict_level)
VALUES (?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.11 system_tasks（快穿任务）
-- -----------------------------------------------------------------------------
INSERT INTO system_tasks (novel_id, world_id, task_name, task_type,
                          task_description, success_criteria, difficulty_level,
                          reward_type, reward_description, punishment_description)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.12 novel_frameworks（女频金手指）
-- -----------------------------------------------------------------------------
INSERT INTO novel_frameworks (novel_id, gold_finger_type, gold_finger_name,
                              gold_finger_effect, gold_finger_cost,
                              gold_finger_limitation, growth_stage, design_principle)
VALUES (?, ?, ?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.13 novel_genres（现代言情题材）
-- -----------------------------------------------------------------------------
INSERT INTO novel_genres (genre_id, genre_name, genre_name_en, category,
                          target_audience, core_elements, sub_types,
                          world_building, character_archetypes,
                          plot_patterns, checklist)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.14 genre_templates（GL/BL/女尊等综合题材模板）
-- -----------------------------------------------------------------------------
INSERT INTO genre_templates (
    genre_code, genre_name_cn, genre_name_en, target_audience,
    core_elements, sub_types, key_considerations,
    character_archetypes, relationship_dynamics, checklist
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO genre_templates (
    genre_id, genre_name, genre_name_cn, category, target_audience,
    core_elements, sub_types, relationship_stages,
    special_considerations, checklist
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO genre_templates (
    genre_name, genre_name_cn, sub_types, target_audience,
    core_elements, world_building_notes, character_types,
    plot_patterns, checklist, ratio_requirement
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.15 genre（题材元数据，mystery_romance 等用）
-- -----------------------------------------------------------------------------
INSERT INTO genre (id, name_cn, name_en, target_audience, core_elements)
VALUES (?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.16 genre_subtype（题材子分类）
-- -----------------------------------------------------------------------------
INSERT INTO genre_subtype (id, genre_id, name_cn, name_en, description, examples)
VALUES (?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.17 character_role（题材角色模板）
-- -----------------------------------------------------------------------------
INSERT INTO character_role (id, genre_id, gender, role_type, name_cn, description)
VALUES (?, ?, ?, ?, ?, ?);


-- -----------------------------------------------------------------------------
-- 6.18 user_preference（用户偏好问题）
-- -----------------------------------------------------------------------------
INSERT INTO user_preference (id, genre_id, preference_type, question)
VALUES (?, ?, ?, ?);
