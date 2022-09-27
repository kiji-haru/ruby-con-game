module Scene
  class Stage2 < Scene::Stage
    include Fixture::Stage1
    def initialize
      @player = Player.new
      @carrier = Image.load("#{$PATH}/lib/images/Carrier.png")
      super
    end

    def update
      super
    end

    def start
      if @count > 60
        background_move_draw_1
        Window.draw(Window.width / 2 - @carrier.width / 2, (@count - 60) * 4 - (@carrier.height - 300)  / 2, @carrier)
        if @count > 360
          @player.y -= 5
        end
        @player.image
        if @count > 600
          @player.y = Window.height + 50
          @player.y -= (@count - 600)
          if @player.y == Window.height - 60
            @scene = :game
          end
        end
      else
        just_draw
        Window.draw(Window.width / 2 - @carrier.width / 2, -1 * (@carrier.height - 300)  / 2, @carrier)
        @player.image
      end
    end

    def game
      background_move_draw_2
      @player.update
      if @count % 1200 == 0
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      end
      @enemies.each { |n|n.update }
      @enemies.each do |n|
        n.bullets.each do |i|
          if i === @player
            @player.damage
            i.hit = true
          end
        end
      end

      @player.bullets.each do |n|
        @enemies.each do |i|
          if i === n
            i.damage
            n.hit = true
          end
        end
      end
    end

    def end_scene
      super
      background_move_draw_2
      @player.y -= 5
      if @player.y < -10
        @is_finish = true
      end
    end

    def finish?
      super
    end

    def next_scene
      super
    end
  end
end