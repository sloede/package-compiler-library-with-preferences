module LibMWE

using Preferences: @load_preference

export mwe_get_compile_time_value, mwe_get_run_time_value, mwe_print_paths

const _compile_time_value = @load_preference("compile_time_value", -1)

Base.@ccallable function mwe_get_compile_time_value()::Int32
    return _compile_time_value
end

Base.@ccallable function mwe_get_run_time_value()::Int32
    return @load_preference("run_time_value", -1);
end

Base.@ccallable function mwe_print_paths()::Cvoid
    JULIA_DEPOT_PATH = get(ENV, "JULIA_DEPOT_PATH", "NOT FOUND")
    JULIA_LOAD_PATH = get(ENV, "JULIA_LOAD_PATH", "NOT FOUND")
    @show JULIA_DEPOT_PATH
    @show JULIA_LOAD_PATH
    @show DEPOT_PATH
    @show LOAD_PATH
    @show Base.get_preferences()

    return nothing
end

end # module LibMWE
