# frozen_string_literal: true

class Scene::Opening < Scene::Base
  def initialize
    super
    @touch_sound = Sound.new("#{$path}/lib/sounds/title_button_touch.wav")
    @click_sound = Sound.new("#{$path}/lib/sounds/title_button_click.wav")
    @select_y = 0
  end

  def update
    super
    if Input.key_push?(K_S) || Input.key_push?(K_DOWNARROW) || Input.pad_push?(23)
      @select_y += 1
      @touch_sound.play
    end
    if Input.key_push?(K_W) || Input.key_push?(K_UPARROW) || Input.pad_push?(22)
      @select_y -= 1
      @touch_sound.play
    end
    @select_y = 0 if @select_y.negative?
    @select_y = 4 if @select_y > 4
    Window.draw_font(50, Window.height / 6 - 80, '!DANMAKU!', Font.new(150, @Font))
    if $lang == "en"
      Window.draw_font(Window.width / 2 - 200, Window.height - 500, '๐ฎ GameStart ๐ฎ', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 200, Window.height - 400, '๐ ใRanking  ๐', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 200, Window.height - 300, 'โ  ใOptionใ โ', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 200, Window.height - 200, 'โ    Guide   โ', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 200, Window.height - 100, ' ใ   Exit   โก', Font.new(48, @Font))
      Window.draw(Window.width / 2 - 200, Window.height + 50 - 100 * (5 - @select_y), Image.new(440, 3, C_WHITE))
    else
      Window.draw_font(Window.width / 2 - 160, Window.height - 500, '๐ฎ ใฒใผใ ในใฟใผใ ๐ฎ', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 160, Window.height - 400, '๐ ใใฉใณใญใณใฐ  ๐', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 160, Window.height - 300, 'โ ใใชใใทใงใณ  โ', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 160, Window.height - 200, 'โ ใใใใซใใ  โ', Font.new(48, @Font))
      Window.draw_font(Window.width / 2 - 160, Window.height - 100, 'ใใฒใผใ ใ็ตไบใใโก', Font.new(48, @Font))
      Window.draw(Window.width / 2 - 160, Window.height + 50 - 100 * (5 - @select_y), Image.new(360, 3, C_WHITE))
    end


    return unless Input.key_push?(K_RETURN) || Input.key_push?(K_SPACE) || Input.pad_push?(5)

    @is_finish = true
    @click_sound.play
    case @select_y
    when 0
      @next_scene = Scene::Select_Stage.new
      $score = 0
    when 1
      @next_scene = Scene::Ranking.new
    when 2
      @next_scene = Scene::Option.new
    when 3
      @next_scene = Scene::Guide.new
    when 4
      @next_scene = nil
    else
      @next_scene = nil
    end
  end
end
