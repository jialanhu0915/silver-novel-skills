-- Novelist Skill Database Schema
-- SQLite

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

-- 框架规划表
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
    background TEXT,
    motivation TEXT,
    arc_change TEXT,
    abilities TEXT,
    relationships TEXT,
    antagonist_type TEXT,
    antagonist_intelligence_level TEXT,
    antagonist_arrogance_source TEXT,
    has_own_goal INTEGER DEFAULT 0,
    has_growth_arc INTEGER DEFAULT 0,
    relationship_with_mc TEXT,
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

-- 自我反思记录表
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

-- 索引
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

-- 字段说明：
-- characters.role_type: protagonist/antagonist/supporting/female_lead
-- characters.gender_design_type: ambitious/independent/complex/growing (for female characters)
-- characters.personality_flaw: impulsive/cold/suspicious/arrogant/avoidant (for protagonist)
-- characters.antagonist_type: intelligent/arrogant/insidious/principled (for antagonist)
-- characters.antagonist_intelligence_level: high/medium/low
-- characters.has_own_goal: 1/0
-- characters.has_growth_arc: 1/0
-- characters.relationship_with_mc: equals/mc_dominant/subordinate
-- chapters.antagonist_quality: intelligent/average/brainless
-- chapters.female_character_quality: independent/average/tool
-- chapters.protagonist_depth_quality: deep/average/shallow
-- chapters.goldfinger_usage_quality: proper/overused/abused
-- chapters.climax_quality: excellent/good/average/poor
-- chapters.supporting_quality: independent/average/tool
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