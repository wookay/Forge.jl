# Pkg.clone("https://github.com/lejon/TSne.jl.git")
# Pkg.add("Colors")
# Pkg.add("MNIST")
# Pkg.add("HDF5")

using Forge.Smith
using TSne
using Colors
using MNIST
# using HDF5

const N = 2500

function rescale(A, dim::Integer=1)
    res = A .- mean(A, dim)
    res ./= map(x -> x > 0.0 ? x : 1.0, std(A, dim))
    res
end
data, labels = traindata()
data = convert(Matrix{Float64}, data[:, 1:N])'
X = rescale(data, 1)
Y = tsne(X, 2, 50, 3000, 20.0)

# f = h5open("tsne.h5", "w")
# write(f, "Y", Y)
# write(f, "labels", labels)
# close(f)
# 
# f = h5open("tsne.h5")
# Y = read(f, "Y")
# labels = read(f, "labels")
# close(f)


window = create_window(1000, 800, "t-SNE Demo")
show_window(window)

chart = create_chart_2d()
set_axes_limits(chart, -70, 70, -80, 80)

plots = Dict()
[setindex!(plots, [], n) for n in 0:9]
for idx in 1:N
    (x, y) = Y[idx, :]
    label = Int(labels[idx])
    append!(plots[label], [x y;])
end

colors = distinguishable_colors(10)

for label in 0:9
    pos = plots[label]
    data = reshape(pos, Int(length(pos)/2), 2)
    plot = create_plot(chart, length(data)/2, Forge.FG_PLOT_SCATTER, Forge.FG_MARKER_CIRCLE)
    set_color(plot, colors[label+1])
    set_legend(plot, string(label))
    update_vertex_buffer(plot, data)
end

draw_chart(!isclosed, window, chart)
save_framebuffer(window, "tsne.png")
