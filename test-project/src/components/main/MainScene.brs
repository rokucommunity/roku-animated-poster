function init() as void
  createObject("roSGNode", "TrackerTask")
  configureAnimatedPosters()
end function


function configureAnimatedPosters()
  m.animatedPosters = []
  cols = 3
  rows = 3
  x = 0
  m.animatedPosters = []
  for i = 0 to cols - 1
    for j = 0 to rows - 1
      p = m.top.createChild("ap_AnimatedPoster")
      p.translation = [(x * 900) + (i * 400) + (j * 40), j * 150]
      p.width = 240
      p.height = 240
      p.spriteSheetUri = "pkg:/images/s.png"

      p.frameOffsets = [
        [0, 0]
        [240, 0]
        [480, 0]
        [720, 0]
        [960, 0]
        [1200, 0]
      ]
      m.animatedPosters.push(p)
      p.duration = (rnd(0) / 3.0) + 0.05
      p.control = "start"
    end for 
  end for

end function

