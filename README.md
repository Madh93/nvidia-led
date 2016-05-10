# nvidia-led

LEDs are funny. LEDs are irresistible. Everybody loves LEDs. Why do you think you got your gpu? For performance? Not! it's because you love LEDs :rotating_light:

Nvidia-led is equivalent to [GeForce Experience LED Visualizer](http://www.geforce.com/whats-new/guides/geforce-experience-nvidia-geforce-gtx-led-visualizer-user-guide#1) for GNU/Linux. Get awesome effects for NVIDIA GeForce GTX LED logo like this:

<p align="center"><a href="https://www.youtube.com/watch?v=5W5Rm8K-hcY"><img src="http://img.youtube.com/vi/5W5Rm8K-hcY/0.jpg" alt="Demostration video" width="480" height="320" border="0"></a></p>

###Requirements

* Nvidia drivers >= [331.38](http://www.nvidia.com/download/driverResults.aspx/72250/en-us)
*  A Nvidia Geforce GTX GPU with LED logo (obvious!)

###Installation

#####From sources

Clone or download repository and install it traditionally:

    make
    sudo make install

### Usage

    $ nvidia-led [effect] [VALUES]
    
#####Examples:

    $ nvidia-led no-animation 80
    $ nvidia-led breathing 40-100 25 50
    
#####Effects

    no-animation <intensity>                      Fixed brightness
    flashing <intensity> <interval>               Flashing effect
    dual-flashing <intensity> <interval>          Double flashing effecte
    breathing <intensity> <interval> <interval>   Breathing effect
    
Do you need more effects? Add your custom effects in `~/.config/nvidia-led/styles`

### Contributing

1. Fork it ( https://github.com/Madh93/nvidia-led/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request