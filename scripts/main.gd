extends Node2D
## Danger first vertical-slice technical prototype. All geometric visuals are temporary.
## No claim of source-accurate AIONIA sprite assets or complete Mission 1.

const GROUND_Y := 430.0
const FLOOR_LEFT := 0.0
const FLOOR_RIGHT := 1850.0
const MOVE_SPEED := 240.0
const JUMP_SPEED := 470.0
const GRAVITY := 1100.0
const SHOT_SPEED := 670.0
const HERO_SIZE := Vector2(24, 40)

var player := Vector2(100, GROUND_Y - 20)
var velocity := Vector2.ZERO
var facing := 1
var hp := 5
var score := 0
var rescued := false
var collected := false
var won := false
var lost := false
var jump_was_down := false
var fire_cooldown := 0.0
var projectiles: Array[Vector2] = []
var foes := [
    {"pos": Vector2(525, GROUND_Y - 18), "hp": 3, "alive": true, "id": "DNG-FOE-001"},
    {"pos": Vector2(830, GROUND_Y - 18), "hp": 3, "alive": true, "id": "DNG-FOE-002"}
]
var camera_x := 0.0

func _ready() -> void:
    set_process(true)
    queue_redraw()

func _process(delta: float) -> void:
    if Input.is_key_pressed(KEY_R) and (lost or won):
        get_tree().reload_current_scene()
        return
    if won or lost:
        queue_redraw()
        return

    var direction := int(Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT)) - int(Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT))
    if direction != 0:
        facing = direction
    velocity.x = direction * MOVE_SPEED
    var jump_down := Input.is_key_pressed(KEY_SPACE) or Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP)
    var grounded := player.y >= GROUND_Y - HERO_SIZE.y * 0.5 - 0.01
    if jump_down and not jump_was_down and grounded:
        velocity.y = -JUMP_SPEED
    jump_was_down = jump_down
    velocity.y += GRAVITY * delta
    player += velocity * delta
    player.x = clampf(player.x, FLOOR_LEFT + HERO_SIZE.x, FLOOR_RIGHT - HERO_SIZE.x)
    if player.y >= GROUND_Y - HERO_SIZE.y * 0.5:
        player.y = GROUND_Y - HERO_SIZE.y * 0.5
        velocity.y = 0.0

    fire_cooldown = maxf(0.0, fire_cooldown - delta)
    if (Input.is_key_pressed(KEY_F) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and fire_cooldown == 0.0:
        projectiles.append(player + Vector2(facing * 24, -7))
        fire_cooldown = 0.32

    for i in range(projectiles.size() - 1, -1, -1):
        projectiles[i].x += SHOT_SPEED * facing * delta
        if absf(projectiles[i].x - player.x) > 940:
            projectiles.remove_at(i)
            continue
        var hit := false
        for foe in foes:
            if foe["alive"] and projectiles[i].distance_to(foe["pos"]) < 28:
                foe["hp"] -= 1
                if foe["hp"] <= 0:
                    foe["alive"] = false
                    score += 100
                hit = true
                break
        if hit:
            projectiles.remove_at(i)

    for foe in foes:
        if foe["alive"] and absf(player.x - foe["pos"].x) < 30 and absf(player.y - foe["pos"].y) < 30:
            hp -= 1
            player.x = maxf(28.0, player.x - 85.0)
            if hp <= 0:
                lost = true

    if not collected and player.distance_to(Vector2(300, GROUND_Y - 25)) < 36:
        collected = true
        score += 50
    if not rescued and player.distance_to(Vector2(1060, GROUND_Y - 30)) < 55 and Input.is_key_pressed(KEY_E):
        rescued = true
        score += 200
    if player.x >= 1680 and rescued and foes.all(func(f): return not f["alive"]):
        won = true
    camera_x = clampf(player.x - 300.0, 0.0, FLOOR_RIGHT - 960.0)
    queue_redraw()

func _draw() -> void:
    var vp := get_viewport_rect().size
    draw_rect(Rect2(Vector2.ZERO, vp), Color("#132b36"))
    draw_rect(Rect2(Vector2(0, GROUND_Y), Vector2(vp.x, vp.y - GROUND_Y)), Color("#4d7050"))
    draw_line(Vector2(0, GROUND_Y), Vector2(vp.x, GROUND_Y), Color("#b7d8a2"), 3)
    draw_set_transform(Vector2(-camera_x, 0))
    for x in [180, 620, 940, 1210, 1470]:
        draw_line(Vector2(x, GROUND_Y), Vector2(x, 170), Color("#627c65"), 13)
        draw_circle(Vector2(x, 160), 44, Color("#507a74"))
        draw_circle(Vector2(x + 8, 156), 9, Color("#fff3b0"))
    draw_rect(Rect2(player - HERO_SIZE / 2.0, HERO_SIZE), Color("#84d6c6"))
    draw_rect(Rect2(player + Vector2(facing * 7 - 3, -9), Vector2(6, 5)), Color("#233a43"))
    for foe in foes:
        if foe["alive"]:
            draw_circle(foe["pos"], 19, Color("#e99d7d"))
            draw_circle(foe["pos"] + Vector2(-6, -6), 3, Color("#253238"))
    for shot in projectiles:
        draw_circle(shot, 5, Color("#ffe79e"))
    if not collected:
        draw_circle(Vector2(300, GROUND_Y - 25), 12, Color("#f8d779"))
    if not rescued:
        draw_rect(Rect2(Vector2(1038, GROUND_Y - 58), Vector2(44, 58)), Color("#8b8e9e"))
        draw_circle(Vector2(1060, GROUND_Y - 43), 10, Color("#ffe2c6"))
    draw_rect(Rect2(Vector2(1670, GROUND_Y - 120), Vector2(20, 120)), Color("#d7ad80"))
    draw_rect(Rect2(Vector2(1690, GROUND_Y - 120), Vector2(55, 37)), Color("#c8f2ab"))
    draw_set_transform(Vector2.ZERO)
    var font := ThemeDB.fallback_font
    draw_string(font, Vector2(18, 28), "DANGER | AIONIA · DEVELOPMENT PLACEHOLDERS", HORIZONTAL_ALIGNMENT_LEFT, -1, 20, Color.WHITE)
    draw_string(font, Vector2(18, 56), "HP: %d    SCORE: %d    RESCUED: %s" % [hp, score, "YES" if rescued else "NO"], HORIZONTAL_ALIGNMENT_LEFT, -1, 17, Color("#f3e5b3"))
    draw_string(font, Vector2(18, 82), "Move A/D  Jump Space  Fire F  Rescue E  Restart R", HORIZONTAL_ALIGNMENT_LEFT, -1, 15, Color("#b2dce2"))
    if won or lost:
        draw_rect(Rect2(Vector2(220, 160), Vector2(520, 170)), Color("#23313e"))
        draw_string(font, Vector2(300, 230), "MISSION COMPLETE" if won else "MISSION FAILED", HORIZONTAL_ALIGNMENT_LEFT, -1, 34, Color("#d9e8b5"))
        draw_string(font, Vector2(340, 278), "Press R to try again", HORIZONTAL_ALIGNMENT_LEFT, -1, 19, Color.WHITE)
