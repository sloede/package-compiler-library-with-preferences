using PackageCompiler: PackageCompiler

package_dir = "LibMWE.jl"
dest_dir = "build"

PackageCompiler.create_library(package_dir, dest_dir;
                               lib_name = "mwe",
                               force = true,
                               header_files = ["LibMWE.jl/lib/mwe.h"])
