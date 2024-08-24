{...}:

{
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
    };

    style = ''
      #window {
        border: double 2px transparent;
        border-radius: 10px;
        background-image: linear-gradient(45deg,#122,#112),  linear-gradient(135deg, #33ccff, #00ff99);
        background-origin: border-box;
        background-clip: content-box, border-box;
      }

      #outer-box {
        padding: 16px
      }
      
      #entry {
        margin-top: 4px;
        margin-bottom: 4px;
        border-radius: 4px;
        transition: all 0.1s ease-out;
      }

      #img {
        margin-right: 8px;
      }

      #input {
        border-radius: 4px;
        background-color: transparent;
      }
    '';
  };
}
