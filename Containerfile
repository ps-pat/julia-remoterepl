FROM docker.io/julia:1.11.3
LABEL maintainer="Patrick Fournier p_fournier@hushmail.com"

RUN groupadd julian -g 1000
RUN adduser --uid 1000 --gid 1000 --disabled-password --comment "" julian

## Entrypoint
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /

## Julia setup
COPY julia /julia/
RUN chown -R 1000:1000 /julia

USER julian
RUN julia -e "using Pkg; Pkg.add(\"Revise\"); Pkg.add(url = \"https://codeberg.org/ptrk/RemoteREPL.jl.git\")"
ENV JULIA_DEPOT_PATH="/julia/depot:/home/julian/.julia:"
