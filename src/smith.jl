module Smith

export create_window, show_window, isclosed
export create_chart_3d, set_chart_axes_limits, set_chart_axes_titles, add_surface_to_chart, draw_chart
export update_vertex_buffer

import ..Forge

# window
function create_window(width::Real, height::Real, title::String, shared_window=C_NULL, visible::Bool=true)::Ref{Forge.fg_window}
    refwindow = Ref{Forge.fg_window}()
    Forge.fg_create_window(refwindow, Cint(width), Cint(height), Cstring(pointer(title)), shared_window, visible)
    refwindow
end

function show_window(refwindow::Ref{Forge.fg_window})
    Forge.fg_show_window(refwindow[])
end

# chart
function create_chart_3d()::Ref{Forge.fg_chart}
    refchart = Ref{Forge.fg_chart}()
    Forge.fg_create_chart(refchart, Forge.FG_CHART_3D)
    refchart
end

function set_chart_axes_limits(refchart::Ref{Forge.fg_chart}, xmin::Real, xmax::Real, ymin::Real, ymax::Real, zmin::Real, zmax::Real)
    Forge.fg_set_chart_axes_limits(refchart[], Cfloat(xmin), Cfloat(xmax), Cfloat(ymin), Cfloat(ymax), Cfloat(zmin), Cfloat((zmax)))
end

function set_chart_axes_titles(refchart::Ref{Forge.fg_chart}, x::String, y::String, z::String)
    f(s) = Cstring(pointer(s))
    Forge.fg_set_chart_axes_titles(refchart[], f.([x, y, z])...)
end

function add_surface_to_chart(refchart::Ref{Forge.fg_chart}, xsize::Real, ysize::Real, dtype::UInt32=Forge.FG_FLOAT32, plot_type::Forge.fg_plot_type=Forge.FG_PLOT_LINE, marker_type::Forge.fg_marker_type=Forge.FG_MARKER_NONE)::Ref{Forge.fg_surface}
    refsurface = Ref{Forge.fg_surface}()
    Forge.fg_add_surface_to_chart(refsurface, refchart[], UInt32(xsize), UInt32(ysize), dtype, plot_type, marker_type)
    refsurface
end

function isclosed(refwindow::Ref{Forge.fg_window})::Bool
    refisclosed = Ref{Bool}()
    Forge.fg_close_window(refisclosed, refwindow[])
    refisclosed[]
end

function draw_chart(f::Function, refwindow::Ref{Forge.fg_window}, refchart::Ref{Forge.fg_chart})
    while f(refwindow)
        Forge.fg_draw_chart(refwindow[], refchart[])
    end
end

# surface
function update_vertex_buffer(refsurface::Ref{Forge.fg_surface}, data::Array)
    refvertices = Ref{Cuint}()
    refvertexbuffersize = Ref{Cuint}()
    Forge.fg_get_surface_vertex_buffer(refvertices, refsurface[])
    Forge.fg_get_surface_vertex_buffer_size(refvertexbuffersize, refsurface[])
    Forge.fg_update_vertex_buffer(refvertices[], refvertexbuffersize[], Array{Cfloat}(data))
end

end # module Smith
