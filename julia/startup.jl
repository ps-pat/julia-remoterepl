import RemoteREPL, Sockets

include("packages.jl")

listen_addr = Sockets.IPv4("0.0.0.0")
RemoteREPL.serve_repl(listen_addr)
