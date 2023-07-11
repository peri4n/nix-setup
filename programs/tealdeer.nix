{ pkgs, ... }:

{
  programs.tealdeer = {
    enable = true;
    settings = {
      display = {
        compact = true;
        use_pager = true;
      };
      updates = {
        auto_update = false;
      };

      style = {
        description = {
          foreground = "purple";
          italic = true;
        };
        command_name = {
          foreground = "magenta";
        };
        example_text = {
          foreground = "cyan";
        };
        example_variables = {
          foreground = "white";
        };
      };
    };
  };
}
