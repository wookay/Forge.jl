__precompile__()

module Forge

deps = joinpath(Pkg.dir("Forge"), "deps", "deps.jl")
if isfile(deps)
    include(deps)
else
    error("Forge not properly installed. Please run Pkg.build(\"Forge\")")
end

const FG_API_VERSION_CURRENT = 09
include("libforge_h.jl")
include("wrap.jl")

include("dsl.jl")

end # module
