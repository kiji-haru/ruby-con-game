module Scene
  class Credit < Scene::Base
    def initialize
      super
      h1 = 60
      h2 = 50
      p = 45
      sentence = Struct.new(:str, :size)
      @qrcode = Image.load("#{$path}/lib/images/QR.png")
      @message = [
        sentence.new("Pictures", h1),
        sentence.new("空母の画像", h2),
        sentence.new("Tzoli", p),
        sentence.new("https://www.deviantart.com/tzoli", p),
        sentence.new("ゼロ戦の画像", h2),
        sentence.new("ピクセルガロー -https://soundeffect-lab.info/", p),
        sentence.new("その他の飛行機", h2),
        sentence.new("自作", p),
        sentence.new("Sounds", h1),
        sentence.new("効果音ラボ https://soundeffect-lab.info/", p),
        sentence.new("Font", h1),
        sentence.new("x8y12pxTheStrongGamer", p),
        sentence.new("http://www17.plala.or.jp/xxxxxxx/00ff/", p),
        sentence.new("UsedOpenSource", h1),
        sentence.new("Ruby", h2),
        sentence.new("DXRuby", h2),
        sentence.new("SourceCode", h1),
        sentence.new("https://github.com/kiji-haru/for_ruby-con", 30)
      ]
      @keys = [
        K_A,
        K_B,
        K_C,
        K_D,
        K_E,
        K_F,
        K_G,
        K_H,
        K_I,
        K_J,
        K_L,
        K_N,
        K_M,
        K_O,
        K_P,
        K_Q,
        K_R,
        K_S,
        K_T,
        K_U,
        K_V,
        K_W,
        K_X,
        K_Y,
        K_Z,
        K_RETURN,
        K_SPACE
      ]
      @next_scene = Scene::Opening.new
    end

    def update
      super
      @keys.each do |n|
        return @is_finish = true if Input.key_push?(n)
      end
      #Window.draw_font(Window.width - 50, Window.height - 50, "#{@count}", Font.new(20))
      space = -50
      @message.count.times do |i|
        space += @message[i].size * 2
        Window.draw_font(80, Window.height + space - @count * 1.5,
                         "#{@message[i].str}",
                         Font.new(@message[i].size, @Font))
      end
      Window.draw(Window.width / 2 - @qrcode.width / 2, Window.height + space - @count * 1.5 + 100, @qrcode)
      @is_finish = true if @count > 3100
    end
  end
end