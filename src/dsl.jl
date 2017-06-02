module DSL

export create_window, show_window, setup_grid, swap_window_buffers, save_framebuffer, isclosed
export create_chart_2d, create_chart_3d
# chart
export set_axes_limits, set_axes_titles
export create_image
export create_plot, create_surface, create_vector_field
export set_color
export set_legend, set_marker_size
export draw_chart
export update_vertex_buffer, update_direction_buffer

import ..Forge
using ColorTypes

struct Window
    ref::Ref{Forge.fg_window}
end

struct Image
    ref::Ref{Forge.fg_image}
end

struct Chart
    ref::Ref{Forge.fg_chart}
end

struct Plot
    ref::Ref{Forge.fg_plot}
end

struct Surface
    ref::Ref{Forge.fg_surface}
end

struct VectorField
    ref::Ref{Forge.fg_vector_field}
end

struct Histogram
    ref::Ref{Forge.fg_histogram}
end

# window
function create_window(width::Real, height::Real, title::String, shared_window=C_NULL, visible::Bool=true)::Window
    refwindow = Ref{Forge.fg_window}()
    Forge.fg_create_window(refwindow, Cint(width), Cint(height), title, shared_window, visible)
    Window(refwindow)
end

function show_window(window::Window)
    Forge.fg_show_window(window.ref[])
end

function setup_grid(window::Window, rows::Real, cols::Real)
    Forge.fg_setup_window_grid(rows, cols, window.ref[])
end

function create_image(width::Real, height::Real, format::Forge.fg_channel_format=Forge.FG_RGBA, dtype::Forge.fg_dtype=Forge.u8)::Image
    refimage = Ref{Forge.fg_image}()
    Forge.fg_create_image(refimage[], width, height, format, dtype)
    Image(refimage)
end

function swap_window_buffers(window::Window)
    Forge.fg_swap_window_buffers(window.ref[])
end

function save_framebuffer(window::Window, path::String)
    Forge.fg_save_window_framebuffer(path, window.ref[])
end

function isclosed(window::Window)::Bool
    refisclosed = Ref{Bool}()
    Forge.fg_close_window(refisclosed, window.ref[])
    refisclosed[]
end

# chart
function create_chart_2d()::Chart
    refchart = Ref{Forge.fg_chart}()
    Forge.fg_create_chart(refchart, Forge.FG_CHART_2D)
    Chart(refchart)
end

function create_chart_3d()::Chart
    refchart = Ref{Forge.fg_chart}()
    Forge.fg_create_chart(refchart, Forge.FG_CHART_3D)
    Chart(refchart)
end

function set_axes_limits(chart::Chart, xmin::Real, xmax::Real, ymin::Real, ymax::Real, zmin::Real=0, zmax::Real=0)
    Forge.fg_set_chart_axes_limits(chart.ref[], Cfloat.([xmin, xmax, ymin, ymax, zmin, zmax])...)
end

function set_axes_titles(chart::Chart, x::String, y::String, z::String="")
    Forge.fg_set_chart_axes_titles(chart.ref[], x, y, z)
end

function create_surface(chart::Chart, xsize::Real, ysize::Real, dtype::UInt32=Forge.FG_FLOAT32, plot_type::Forge.fg_plot_type=Forge.FG_PLOT_LINE, marker_type::Forge.fg_marker_type=Forge.FG_MARKER_NONE)::Surface
    refsurface = Ref{Forge.fg_surface}()
    Forge.fg_add_surface_to_chart(refsurface, chart.ref[], Cuint(xsize), Cuint(ysize), dtype, plot_type, marker_type)
    Surface(refsurface)
end

function create_plot(chart::Chart, npoints::Real)::Plot
    create_plot(chart, npoints, Forge.FG_FLOAT32, Forge.FG_PLOT_LINE, Forge.FG_MARKER_NONE)
end
function create_plot(chart::Chart, npoints::Real, plot_type::Forge.fg_plot_type, marker_type::Forge.fg_marker_type)::Plot
    create_plot(chart, npoints, Forge.FG_FLOAT32, plot_type, marker_type)
end
function create_plot(chart::Chart, npoints::Real, dtype::UInt32, plot_type::Forge.fg_plot_type, marker_type::Forge.fg_marker_type)::Plot
    refplot = Ref{Forge.fg_plot}()
    Forge.fg_add_plot_to_chart(refplot, chart.ref[], Cuint(npoints), dtype, plot_type, marker_type)
    Plot(refplot)
end

function create_vector_field(chart::Chart, npoints::Real, dtype::UInt32=Forge.FG_FLOAT32)::VectorField
    reffield = Ref{Forge.fg_vector_field}()
    Forge.fg_add_vector_field_to_chart(reffield, chart.ref[], Cuint(npoints), dtype)
    VectorField(reffield)
end

function create_histogram(chart::Chart, nbins::Real, dtype::Forge.fg_dtype=Forge.s32)::Histogram
    refhisto = Ref{Forge.fg_histogram}()
    Forge.fg_add_histogram_to_chart(refhisto, nbinsp, dtype)
    Histogram(refhisto)
end

function draw_chart(f::Function, window::Window, chart::Chart)
    while f(window)
        Forge.fg_draw_chart(window.ref[], chart.ref[])
    end
end

# set_color
function (::Type{RGBA})(color::Unsigned)
    RGBA(map(n -> (color >> n) & 0xFF / 255, (24, 16, 8, 0))...)
end

set_color(plot::Plot, color::Unsigned) = set_color(plot, RGBA(color))
set_color(plot::Plot, color::RGB) = set_color(plot, convert(RGBA, color))
function set_color(plot::Plot, color::RGBA)
    Forge.fg_set_plot_color(plot.ref[], Cfloat.([color.r, color.g, color.b, color.alpha])...)
end

set_color(field::VectorField, color::Unsigned) = set_color(field, RGBA(color))
set_color(field::VectorField, color::RGB) = set_color(field, convert(RGBA, color))
function set_color(field::VectorField, color::RGBA)
    Forge.fg_set_vector_field_color(field.ref[], Cfloat.([color.r, color.g, color.b, color.alpha])...)
end

set_color(histogram::Histogram, color::Unsigned) = set_color(histogram, RGBA(color))
set_color(histogram::Histogram, color::RGB) = set_color(histogram, convert(RGBA, color))
function set_color(histogram::Histogram, color::RGBA)
    Forge.fg_set_histogram_color(histogram.ref[], Cfloat.([color.r, color.g, color.b, color.alpha])...)
end

function set_legend(plot::Plot, legend::String)
    Forge.fg_set_plot_legend(plot.ref[], legend)
end

function set_marker_size(plot::Plot, marker_size::Real)
    Forge.fg_set_plot_marker_size(plot.ref[], Cfloat(marker_size))
end

# update vertex buffer
function update_vertex_buffer(plot::Plot, data::Array)
    refvertices = Ref{Cuint}()
    refvertexbuffersize = Ref{Cuint}()
    Forge.fg_get_plot_vertex_buffer(refvertices, plot.ref[])
    Forge.fg_get_plot_vertex_buffer_size(refvertexbuffersize, plot.ref[])
    Forge.fg_update_vertex_buffer(refvertices[], refvertexbuffersize[], Array{Cfloat}(data))
end

function update_vertex_buffer(surface::Surface, data::Array)
    refvertices = Ref{Cuint}()
    refvertexbuffersize = Ref{Cuint}()
    Forge.fg_get_surface_vertex_buffer(refvertices, surface.ref[])
    Forge.fg_get_surface_vertex_buffer_size(refvertexbuffersize, surface.ref[])
    Forge.fg_update_vertex_buffer(refvertices[], refvertexbuffersize[], Array{Cfloat}(data))
end

function update_vertex_buffer(field::VectorField, data::Array)
    refvertices = Ref{Cuint}()
    refvertexbuffersize = Ref{Cuint}()
    Forge.fg_get_vector_field_vertex_buffer(refvertices, field.ref[])
    Forge.fg_get_vector_field_vertex_buffer_size(refvertexbuffersize, field.ref[])
    Forge.fg_update_vertex_buffer(refvertices[], refvertexbuffersize[], Array{Cfloat}(data))
end

function update_direction_buffer(field::VectorField, data::Array)
    refdirections = Ref{Cuint}()
    refdirectionbuffersize = Ref{Cuint}()
    Forge.fg_get_vector_field_direction_buffer(refdirections, field.ref[])
    Forge.fg_get_vector_field_direction_buffer_size(refdirectionbuffersize, field.ref[])
    Forge.fg_update_vertex_buffer(refdirections[], refdirectionbuffersize[], Array{Cfloat}(data))
end

function update_pixel_buffer(image::Image, data::Array)
    bufferid
    buffersize
    Forge.fg_update_pixel_buffer(bufferid, buffersize, Array{Cfloat}(data))
end

function update_vertex_buffer(histogram::Histogram, data::Array)
    refvertices = Ref{Cuint}()
    refvertexbuffersize = Ref{Cuint}()
    Forge.fg_get_histogram_vertex_buffer(refvertices, field.ref[])
    Forge.fg_get_histogram_vertex_buffer_size(refvertexbuffersize, field.ref[])
    Forge.fg_update_vertex_buffer(refvertices[], refvertexbuffersize[], Array{Cfloat}(data))
end

function update_color_buffer(histogram::Histogram, data::Array)
    refcolorbuffer = Ref{Cuint}()
    refcolorbuffersize = Ref{Cuint}()
    Forge.fg_get_histogram_color_buffer(refcolorbuffer, histogram.ref[])
    Forge.fg_get_histogram_color_buffer_size(refcolorbuffersize, histogram.ref[])
    Forge.fg_update_vertex_buffer(refcolorbuffer[], refcolorbuffersize[], Array{Cfloat}(data))
end

end # module DSL
