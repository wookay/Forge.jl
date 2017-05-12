module Smith

export create_window, show_window, isclosed
export create_chart_2d, create_chart_3d
export set_chart_axes_limits, set_chart_axes_titles
export add_plot_to_chart, add_surface_to_chart
export set_plot_color, set_plot_legend
export draw_chart
export update_vertex_buffer

import ..Forge
using ColorTypes

# window
function create_window(width::Real, height::Real, title::String, shared_window=C_NULL, visible::Bool=true)::Ref{Forge.fg_window}
    refwindow = Ref{Forge.fg_window}()
    Forge.fg_create_window(refwindow, Cint(width), Cint(height), Cstring(pointer(title)), shared_window, visible)
    refwindow
end

function show_window(refwindow::Ref{Forge.fg_window})
    Forge.fg_show_window(refwindow[])
end

function isclosed(refwindow::Ref{Forge.fg_window})::Bool
    refisclosed = Ref{Bool}()
    Forge.fg_close_window(refisclosed, refwindow[])
    refisclosed[]
end

# chart
function create_chart_2d()::Ref{Forge.fg_chart}
    refchart = Ref{Forge.fg_chart}()
    Forge.fg_create_chart(refchart, Forge.FG_CHART_2D)
    refchart
end

function create_chart_3d()::Ref{Forge.fg_chart}
    refchart = Ref{Forge.fg_chart}()
    Forge.fg_create_chart(refchart, Forge.FG_CHART_3D)
    refchart
end

function set_chart_axes_limits(refchart::Ref{Forge.fg_chart}, xmin::Real, xmax::Real, ymin::Real, ymax::Real, zmin::Real=0, zmax::Real=0)
    Forge.fg_set_chart_axes_limits(refchart[], Cfloat.([xmin, xmax, ymin, ymax, zmin, zmax])...)
end

function set_chart_axes_titles(refchart::Ref{Forge.fg_chart}, x::String, y::String, z::String)
    Forge.fg_set_chart_axes_titles(refchart[], (Cstring ∘ pointer).([x, y, z])...)
end

function add_surface_to_chart(refchart::Ref{Forge.fg_chart}, xsize::Real, ysize::Real, dtype::UInt32=Forge.FG_FLOAT32, plot_type::Forge.fg_plot_type=Forge.FG_PLOT_LINE, marker_type::Forge.fg_marker_type=Forge.FG_MARKER_NONE)::Ref{Forge.fg_surface}
    refsurface = Ref{Forge.fg_surface}()
    Forge.fg_add_surface_to_chart(refsurface, refchart[], Cuint(xsize), Cuint(ysize), dtype, plot_type, marker_type)
    refsurface
end

function add_plot_to_chart(refchart::Ref{Forge.fg_chart}, npoints::Real)
    add_plot_to_chart(refchart, npoints, Forge.FG_FLOAT32, Forge.FG_PLOT_LINE, Forge.FG_MARKER_NONE)
end

function add_plot_to_chart(refchart::Ref{Forge.fg_chart}, npoints::Real, plot_type::Forge.fg_plot_type, marker_type::Forge.fg_marker_type)::Ref{Forge.fg_plot}
    add_plot_to_chart(refchart, npoints, Forge.FG_FLOAT32, plot_type, marker_type)
end

function add_plot_to_chart(refchart::Ref{Forge.fg_chart}, npoints::Real, dtype::UInt32, plot_type::Forge.fg_plot_type, marker_type::Forge.fg_marker_type)::Ref{Forge.fg_plot}
    refplot = Ref{Forge.fg_plot}()
    Forge.fg_add_plot_to_chart(refplot, refchart[], Cuint(npoints), dtype, plot_type, marker_type)
    refplot
end

function draw_chart(f::Function, refwindow::Ref{Forge.fg_window}, refchart::Ref{Forge.fg_chart})
    while f(refwindow)
        Forge.fg_draw_chart(refwindow[], refchart[])
    end
end

# plot
function set_plot_legend(refplot::Ref{Forge.fg_plot}, legend::String)
    Forge.fg_set_plot_legend(refplot[], Cstring(pointer(legend)))
end

set_plot_color(refplot::Ref{Forge.fg_plot}, color::RGB) = set_plot_color(refplot, convert(RGBA, color))
function set_plot_color(refplot::Ref{Forge.fg_plot}, color::RGBA)
    Forge.fg_set_plot_color(refplot[], Cfloat.([color.r, color.g, color.b, color.alpha])...)
end

function update_vertex_buffer(ref::Union{Ref{Forge.fg_plot}, Ref{Forge.fg_surface}}, data::Array)
    refvertices = Ref{Cuint}()
    refvertexbuffersize = Ref{Cuint}()
    Forge.fg_get_surface_vertex_buffer(refvertices, ref[])
    Forge.fg_get_surface_vertex_buffer_size(refvertexbuffersize, ref[])
    Forge.fg_update_vertex_buffer(refvertices[], refvertexbuffersize[], Array{Cfloat}(data))
end

end # module Smith
