using Forge.Smith
using Colors

const MINIMUM = 1.0
const MAXIMUM = 20.
const STEP    = 2.0
const NELEMS  = (MAXIMUM-MINIMUM+1)/STEP
const DPOINTS = [5, 5, 5, 15, 15, 5, 15, 15]

points = []
dirs = []
for j in 0:NELEMS-1, i in 0:NELEMS-1
    y = MINIMUM + j*STEP
    x = MINIMUM + i*STEP
    push!(points, x, y)
    push!(dirs, sin(2pi*x/10), sin(2pi*y/10))
end

window = create_window(600, 480, "Vector Field Demo")
show_window(window)

chart = create_chart_2d()
set_axes_limits(chart, MINIMUM-1.0, MAXIMUM, MINIMUM-1.0, MAXIMUM)
set_axes_titles(chart, "x-axis", "y-axis")

plot = create_plot(chart, 4, Forge.FG_PLOT_SCATTER, Forge.FG_MARKER_CIRCLE)
set_color(plot, RGB(0.9, 0.9, 0))
set_legend(plot, "Convergence Points")
set_marker_size(plot, 24)

field = create_vector_field(chart, NELEMS*NELEMS)
set_color(field, RGB(0, 0.6, 0.3))

update_vertex_buffer(plot, DPOINTS)
update_vertex_buffer(field, points)
update_direction_buffer(field, dirs)

draw_chart(!isclosed, window, chart)
save_framebuffer(window, "field.png")
