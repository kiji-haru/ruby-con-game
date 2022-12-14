module Scene
  module Results
    class Result5 < Scene::Results::Result_Base
      def initialize
        super
        @next_scene = Scene::Stages::Stage6.new
        @win_background = Image.load("#{$path}/lib/images/result/win-picture01.jpg")
        @lose_background = Image.load("#{$path}/lib/images/result/zero_destroyed.png")
      end
    end
  end
end