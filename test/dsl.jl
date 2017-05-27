using Forge.DSL
using Base.Test

@test isa(create_window, Function)
@test isa(isclosed, Function)
@test isa(!isclosed, Function)
