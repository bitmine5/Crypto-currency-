-- Migration file for VIP decorations
CREATE TABLE IF NOT EXISTS "vip_decorations" (
  "id" SERIAL PRIMARY KEY,
  "vip_level" INTEGER NOT NULL UNIQUE,
  "accent_color" TEXT NOT NULL,
  "secondary_color" TEXT NOT NULL,
  "border_style" TEXT NOT NULL,
  "background_pattern" TEXT NOT NULL,
  "badge_icon" TEXT NOT NULL,
  "badge_text" TEXT NOT NULL,
  "name_prefix" TEXT,
  "name_suffix" TEXT,
  "special_effects" TEXT
);

-- Create default VIP decorations if none exist
INSERT INTO "vip_decorations" ("vip_level", "accent_color", "secondary_color", "border_style", "background_pattern", "badge_icon", "badge_text", "name_prefix", "name_suffix", "special_effects")
SELECT 0, '#4F7942', '#98FB98', 'solid', 'none', 'circle', 'VIP 0', '', '', 'none'
WHERE NOT EXISTS (SELECT 1 FROM "vip_decorations" WHERE "vip_level" = 0);

INSERT INTO "vip_decorations" ("vip_level", "accent_color", "secondary_color", "border_style", "background_pattern", "badge_icon", "badge_text", "name_prefix", "name_suffix", "special_effects")
SELECT 1, '#228B22', '#90EE90', 'solid', 'linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%)', 'star', 'VIP 1', '', ' ★', 'none'
WHERE NOT EXISTS (SELECT 1 FROM "vip_decorations" WHERE "vip_level" = 1);

INSERT INTO "vip_decorations" ("vip_level", "accent_color", "secondary_color", "border_style", "background_pattern", "badge_icon", "badge_text", "name_prefix", "name_suffix", "special_effects")
SELECT 2, '#008000', '#32CD32', 'double', 'linear-gradient(to right, #43e97b 0%, #38f9d7 100%)', 'award', 'VIP 2', '', ' ★★', 'text-shadow: 0 0 5px rgba(50,205,50,0.5)'
WHERE NOT EXISTS (SELECT 1 FROM "vip_decorations" WHERE "vip_level" = 2);

INSERT INTO "vip_decorations" ("vip_level", "accent_color", "secondary_color", "border_style", "background_pattern", "badge_icon", "badge_text", "name_prefix", "name_suffix", "special_effects")
SELECT 3, '#006400', '#00FF00', 'ridge', 'linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%)', 'gem', 'VIP 3', '💎 ', ' ★★★', 'text-shadow: 0 0 10px rgba(0,255,0,0.7); box-shadow: 0 0 15px rgba(0,100,0,0.5)'
WHERE NOT EXISTS (SELECT 1 FROM "vip_decorations" WHERE "vip_level" = 3);

INSERT INTO "vip_decorations" ("vip_level", "accent_color", "secondary_color", "border_style", "background_pattern", "badge_icon", "badge_text", "name_prefix", "name_suffix", "special_effects")
SELECT 4, '#013220', '#00FA9A', 'groove', 'linear-gradient(to right, #00b09b, #96c93d)', 'crown', 'VIP 4', '👑 ', ' ★★★★', 'text-shadow: 0 0 15px rgba(0,250,154,0.9); box-shadow: 0 0 20px rgba(1,50,32,0.7); animation: glow 1.5s ease-in-out infinite alternate'
WHERE NOT EXISTS (SELECT 1 FROM "vip_decorations" WHERE "vip_level" = 4);