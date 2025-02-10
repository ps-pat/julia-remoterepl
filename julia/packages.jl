interactive_pkgs = ["Revise"]

if Base.isinteractive()
    for pkg ∈ interactive_pkgs
        if pkg ∉ keys(Pkg.project().dependencies)
            Pkg.add(pkg)
        end
        @eval using $(Symbol(pkg))
    end
end
