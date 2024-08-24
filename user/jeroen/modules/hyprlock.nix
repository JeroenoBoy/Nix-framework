{...}:

let
  bg-color = "rgb(34,34,51)";#222233
  font-color = "rgb(204,204,255)";#ccccff
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
      };

      background = {
        path = "screenshot";
        blur_passes = 3;
        blur_size = 8;
      };
      
      label = [
        {
          text = "cmd[update:1000] echo $TIME";
          font_size = 25;
          color = font-color;
          position = "0, -20";
          halign = "center";
          valign = "top";
        }
        {
          text = ''Hi, <span foreground="##33ccff">$USER</span> :)'';
          font_size = 50;
          color = font-color;
          position = "0, 350";
          halign = "center";
          valign = "center";
        }
        {
          text = "Are you not me?";
          font_size = 30;
          font_family = "CascadiaCove Semibold Italic";
          color = font-color;
          position = "0, 190";
          halign = "center";
          valign = "center";
        }
        {
          text = "Fuck off!";
          font_size = 100;
          font_family = "CascadiaCove Black Italic";
          color = font-color;
          position = "0, 25";
          halign = "center";
          valign = "center";
        }
        {
          text = "Kindly.";
          font_size = 15;
          font_family = "CascadiaCove Italic";
          color = font-color;
          position = "0, -50";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = {
        size = "200, 50";
        position = "0, -200";
        dots_center = true;
        fade_on_empty = false;
        font_color = font-color;
        inner_color = bg-color;
        outer_color = "rgb(33ccff) rgb(00ff99ee) 45deg";
        outline_thickness = 2;
        placeholder_text = ''<span foreground="##cad3f5">Papers Please!</span>'';
      };
    };
  };
}
