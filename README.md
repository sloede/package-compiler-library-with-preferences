# package-compiler-library-with-preferences

Minimum working example for testing how PackageCompiler.jl-generated libraries interact with
Preferences.jl.

## Installation

Build shared library from Julia code:
```shell
make lib
```

Compile executable from C code and link to shared library:
```shell
make mwe
```

## Usage

Run MWE:
```shell
./mwe
```

This will show some similar to the following:
```
compile_time_value = 30
run_time_value = -1
JULIA_DEPOT_PATH = "build/share/julia"
JULIA_LOAD_PATH = "build/share/julia"
DEPOT_PATH = ["build/share/julia"]
LOAD_PATH = ["build/share/julia"]
```

You can also set runtime preferences by creating appropriate TOML files in the library's
`LOAD_PATH`:
```shell
make set-runtime-prefs
```
Running `./mwe` will now show the following
```
compile_time_value = 30
run_time_value = 50
JULIA_DEPOT_PATH = "build/share/julia"
JULIA_LOAD_PATH = "build/share/julia"
DEPOT_PATH = ["build/share/julia"]
LOAD_PATH = ["build/share/julia"]
```


## Author
Michael Schlottke-Lakemper
([RWTH Aachen University/HLRS, Germany](https://lakemper.eu))

## License
The contents of this repository are available under the MIT license (see
[`LICENSE.md`](LICENSE.md)).
