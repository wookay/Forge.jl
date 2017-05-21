using Forge.Smith
using ColorTypes

window = create_window(1000, 800, "Plotting Demo")
show_window(window)

function get_plot_data(range_start, range_end, dx, f)
    data = []
    for i in range_start:dx:range_end+dx
        push!(data, i, f(i))
    end
    data
end

const FRANGE_START = 0.
const FRANGE_END = 2pi

chart = create_chart_2d()

for (f, color, legend, args) in [
        (sin, RGB(1,0,0), "Sine", ())
        (cos, RGB(0,0,1), "Cosine", (Forge.FG_PLOT_LINE, Forge.FG_MARKER_NONE))
        (tan, RGB(1,1,0), "Tangent", (Forge.FG_PLOT_LINE, Forge.FG_MARKER_TRIANGLE))
        (log, RGB(.\(0xff, (0x25, 0x79, 0x73))...), "Log base 10", (Forge.FG_PLOT_LINE, Forge.FG_MARKER_TRIANGLE))
    ]
    set_axes_limits(chart, FRANGE_START, FRANGE_END, -1, 1)
    data = get_plot_data(FRANGE_START, FRANGE_END, 0.1, f)
    plot = create_plot(chart, length(data)/2, args...)
    set_color(plot, color)
    set_legend(plot, legend)
    update_vertex_buffer(plot, data)
end

draw_chart(!isclosed, window, chart)
save_framebuffer(window, "plotting.png")
