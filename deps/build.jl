using BinDeps

@BinDeps.setup

forge_version = "0.9.2"

libforge = library_dependency("libforge")
github_root = "https://github.com/arrayfire/forge"
provides(Sources,
         URI("$(github_root)/archive/v$(forge_version).tar.gz"),
         [libforge],
         unpacked_dir="forge-$(forge_version)")

prefix = joinpath(BinDeps.depsdir(libforge), "usr")
srcdir = joinpath(BinDeps.depsdir(libforge), "src", "forge-$(forge_version)")

cmake_options = [
    "-DCMAKE_INSTALL_PREFIX=$prefix",
    "-DBUILD_EXAMPLES_CUDA=OFF",
    "-DBUILD_EXAMPLES_OPENCL=OFF",
]

provides(SimpleBuild,
          (@build_steps begin
              GetSources(libforge)
              @build_steps begin
                  ChangeDirectory(srcdir)
                  `mkdir -p build`
                  @build_steps begin
                      ChangeDirectory(joinpath(srcdir, "build"))
                      `rm -f CMakeCache.txt`
                      `cmake $cmake_options ..`
                      `make -j4`
                      `make install`
                  end
                end
          end), libforge, os = :Unix)

@BinDeps.install Dict(:libforge => :libforge)
