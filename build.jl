using PackageCompiler: PackageCompiler

package_dir = "project"
dest_dir = "build"

PackageCompiler.create_library(package_dir, dest_dir;
                               lib_name = "mwe",
                               force = true,
                               julia_init_c_file = [PackageCompiler.default_julia_init(), "init.c"],
                               julia_init_h_file = [PackageCompiler.default_julia_init_header(), "init.h"],
                               incremental = true,
                               include_transitive_dependencies = false,
                               include_lazy_artifacts = false,
                               version = v"0.1.0",
                               header_files = ["LibMWE.jl/lib/mwe.h"])
