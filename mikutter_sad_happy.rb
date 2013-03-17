# -*- coding: utf-8 -*-

Plugin.create :mikutter_sad_happy do
  texts = ["にゃー♡", "にゃんにゃん♡"]

  filter_gui_postbox_post do |box|
    now = Time.now

    if (0..6).cover? now.hour
      buff = ::Plugin.create(:gtk).widgetof(box).widget_post.buffer
      if rand(20) == 10
        buff.text = (texts * rand(0..5)).map {|e| e.sample }.join
      else
        buff.text = buff.text.gsub(/…|\./u, "♡")
      end
    end
    
    [box]
  end
end
