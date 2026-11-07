{ pkgs, ... }:

{
  programs.wezterm = {
  enable = true;

  extraConfig = ''
    local config = wezterm.config_builder()

    config.window_background_opacity = 0.98
    -- config.wayland_window_background_blur = true

    config.font = wezterm.font("Consolas", {
        weight = "Regular",
    })
    config.font_size = 10.0

    config.enable_tab_bar = true
    config.use_fancy_tab_bar = false
    config.hide_tab_bar_if_only_one_tab = false
    config.tab_bar_at_bottom = false

    config.colors = {
        background = '#1C2024',
        foreground = '#839496',
        tab_bar = {
            active_tab = {
                bg_color = '#1C2024',
                fg_color = '#fdf6e3',
                intensity = 'Bold',
                italic = false,
            },

            inactive_tab = {
                bg_color = '#073642',
                fg_color = '#839496',
            },

            inactive_tab_hover = {
                bg_color = '#002b36',
                fg_color = '#93a1a1',
                italic = true,
            },

            new_tab = {
                bg_color = '#073642',
                fg_color = '#839496',
            },
            new_tab_hover = {
                bg_color = '#268bd2',
                fg_color = '#fdf6e3',
            },
        },
    }

    config.window_padding = {
        left = 10,
        right = 10,
        top = 8,
        bottom = 20,
    }

    config.scrollback_lines = 10000

    return config
  '';
};
}
