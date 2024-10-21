-- luacheck: globals data
local default_gui = data.raw["gui-style"].default

-- constants
local fancy_list_box_width = 188
local camera_flow_left_side_width = 200
local camera_flow_left_side_margin = 8
local tab_width = 560

-- 'borrowed' from core
local function default_glow(tint_value, scale_value)
    return {
        position = { 200, 128 },
        corner_size = 8,
        tint = tint_value,
        scale = scale_value,
        draw_type = "outer"
    }
end

local function rounded_corners_glow(tint_value)
    return {
        position = { 240, 783 },
        corner_size = 16,
        tint = tint_value,
        top_outer_border_shift = 4,
        bottom_outer_border_shift = -4,
        left_outer_border_shift = 4,
        right_outer_border_shift = -4,
        draw_type = "outer"
    }
end

local red_button_glow_color = { 254, 90, 90, 128 }
local default_dirt_color = { 15, 7, 3, 100 }
local default_dirt = default_glow(default_dirt_color, 0.5)
local textbox_dirt = rounded_corners_glow(default_dirt_color)

-- general styles
default_gui["tlbe_fancy_list_box"] = {
    type = "scroll_pane_style",
    vertical_flow_style = {
        type = "vertical_flow_style",
        parent = "vertical_flow",
        vertical_spacing = 0
    }
}

default_gui["tlbe_fancy_list_box_item"] = {
    type = "frame_style",
    parent = "shallow_frame",
    padding = 0,
    width = fancy_list_box_width
}

default_gui["tlbe_fancy_list_box_item_selected"] = {
    type = "frame_style",
    parent = "tlbe_fancy_list_box_item",
    graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8 }
    }
}

default_gui["tlbe_fancy_list_box_label"] = {
    type = "label_style",
    parent = "clickable_label",
    horizontally_stretchable = "on"
}

default_gui["tlbe_fancy_list_box_button"] = {
    type = "button_style",
    width = 22,
    height = 22,
    padding = 0
}

default_gui["tlbe_fancy_list_box_image"] = {
    type = "image_style",
    width = 22,
    height = 22,
    padding = 0,
    stretch_image_to_widget_size = true
}

default_gui["tlbe_fancy_list_box_image_reduce_size"] = {
    type = "image_style",
    parent = "tlbe_fancy_list_box_image",
    padding = 5,
}

default_gui["tlbe_fancy_list_box_button_hidden"] = {
    type = "empty_widget_style",
    width = 22,
    height = 22
}

-- specific styles
default_gui["tlbe-tabbed_pane"] = {
    type = "tabbed_pane_style",
    width = tab_width,
    tab_content_frame = {
        type = "frame_style",
        parent = "tabbed_pane_frame",
        width = tab_width
    }
}

default_gui["tlbe_frame_action_button_selected"] = {
    type = "button_style",
    parent = "frame_action_button",
    -- From frame_action_button.selected_graphical_set
    default_graphical_set = {
        base = { position = { 272, 169 }, corner_size = 8 },
        shadow = { position = { 440, 24 }, corner_size = 8, draw_type = "outer" }
    },
    -- From frame_action_button.selected_hovered_graphical_set
    hovered_graphical_set = {
        base = { position = { 369, 17 }, corner_size = 8 },
        shadow = { position = { 440, 24 }, corner_size = 8, draw_type = "outer" }
    }
}

default_gui["tlbe_tool_button_selected"] = {
    type = "button_style",
    parent = "tool_button",
    -- From button.selected_graphical_set
    default_graphical_set = {
        base = { position = { 225, 17 }, corner_size = 8 },
        shadow = default_dirt
    },
    -- From button.selected_hovered_graphical_set
    hovered_graphical_set = {
        base = { position = { 369, 17 }, corner_size = 8 },
        shadow = default_dirt
    }
}

default_gui["tlbe_fancy_list_parent"] = {
    type = "vertical_flow_style",
    width = camera_flow_left_side_width
}

default_gui["tlbe_camera_dropdown"] = {
    type = "dropdown_style",
    width = fancy_list_box_width,
    right_margin = camera_flow_left_side_margin
}

default_gui["tlbe_tracker_list"] = {
    type = "scroll_pane_style",
    parent = "tlbe_fancy_list_box",
    width = camera_flow_left_side_width,
    right_margin = camera_flow_left_side_margin
}

default_gui["tlbe_tracker_add_dropdown"] = {
    type = "dropdown_style",
    width = fancy_list_box_width,
    right_margin = camera_flow_left_side_margin
}

-- Default button that glows red on hover/select
default_gui["tlbe_tracker_remove_button"] = {
    type = "button_style",
    size = { 15, 28 }, -- extra height to align (more) nicely with order buttons
    parent = "tlbe_fancy_list_box_button",
    -- from red_button
    hovered_graphical_set = {
        base = { position = { 170, 17 }, corner_size = 8 },
        shadow = default_dirt,
        glow = default_glow(red_button_glow_color, 0.5)
    },
    clicked_graphical_set = {
        base = { position = { 187, 17 }, corner_size = 8 },
        shadow = default_dirt
    }
}

default_gui["tlbe_tracker_button"] = {
    type = "button_style",
    parent = "tlbe_fancy_list_box_button"
}

default_gui["tlbe_tracker_button_selected"] = {
    type = "button_style",
    parent = "tlbe_fancy_list_box_button",
    -- From button.selected_graphical_set
    default_graphical_set = {
        base = { position = { 225, 17 }, corner_size = 8 },
        shadow = default_dirt
    },
    -- From button.selected_hovered_graphical_set
    hovered_graphical_set = {
        base = { position = { 369, 17 }, corner_size = 8 },
        shadow = default_dirt
    }
}

default_gui["tlbe_tracker_button_red"] = {
    type = "button_style",
    parent = "tlbe_fancy_list_box_button",
    -- From red_button
    default_graphical_set = {
        base = { position = { 136, 17 }, corner_size = 8 },
        shadow = default_dirt
    },
    hovered_graphical_set = {
        base = { position = { 170, 17 }, corner_size = 8 },
        shadow = default_dirt,
        glow = default_glow(red_button_glow_color, 0.5)
    },
    clicked_graphical_set = {
        base = { position = { 187, 17 }, corner_size = 8 },
        shadow = default_dirt
    },
    disabled_graphical_set = {
        base = { position = { 153, 17 }, corner_size = 8 },
        shadow = default_dirt
    }
}

default_gui["tlbe_order_up_button"] = {
    type = "button_style",
    size = { 12, 12 },
    -- from column_ordering_ascending_button_style
    default_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-up-active.png",
        size = { 16, 16 },
        scale = 0.5
    },
    hovered_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-up-hover.png",
        size = { 16, 16 },
        scale = 0.5
    },
    clicked_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-up-active.png",
        size = { 16, 16 },
        scale = 0.5
    },
    disabled_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
        size = { 16, 16 },
        scale = 0.5
    }
}

default_gui["tlbe_order_down_button"] = {
    type = "button_style",
    size = { 12, 12 },
    -- from column_ordering_descending_button_style
    default_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-down-active.png",
        size = { 16, 16 },
        scale = 0.5
    },
    hovered_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-down-hover.png",
        size = { 16, 16 },
        scale = 0.5
    },
    clicked_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-down-active.png",
        size = { 16, 16 },
        scale = 0.5
    },
    disabled_graphical_set = {
        filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
        size = { 16, 16 },
        scale = 0.5
    }
}

default_gui["tlbe_order_hidden_button"] = {
    type = "empty_widget_style",
    size = 12
}

default_gui["tlbe_config_button"] = {
    type = "button_style",
    size = 28,
    padding = 0
}

default_gui["tlbe_config_textfield"] = {
    type = "textbox_style",
    width = 200
}

default_gui["tlbe_config_dropdown"] = {
    type = "dropdown_style",
    width = 200,
}

default_gui["tlbe_config_half_width_textfield"] = {
    type = "textbox_style",
    parent = "tlbe_config_textfield",
    width = 90
}

default_gui["tlbe_config_half_width_textfield_invalid"] = {
    type = "textbox_style",
    parent = "tlbe_config_half_width_textfield",
    -- from invalid_value_textfield
    default_background = {
        base = { position = { 0, 913 }, corner_size = 8 },
        shadow = textbox_dirt
    },
    active_background = {
        base = { position = { 0, 913 }, corner_size = 8 },
        shadow = textbox_dirt
    }
}

-- aligns 2 tlbe_config_half_width_textfield styles textfields with a single tlbe_config_textfield
default_gui["tlbe_config_half_width_label"] = {
    type = "label_style",
    size = { 12, 28 }, -- textbox height
    horizontal_align = "center",
    vertical_align = "center"
}
