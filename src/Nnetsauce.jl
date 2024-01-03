module Nnetsauce

using Pkg

Pkg.add("PyCall")
Pkg.add("Conda")

using PyCall
using Conda

ENV["PYTHON"] = PyCall.pyprogramname()
Conda.add("pip")
Conda.pip_interop(true)  # Enable pip interop
Conda.pip("install", "nnetsauce")  # Install nnetsauce

ns = PyCall.pyimport("nnetsauce")

    function Ridge2Classifier(kwargs...)
        return ns.Ridge2Classifier(kwargs)
    end

    function Ridge2MultitaskClassifier(kwargs...)
        return ns.Ridge2MultitaskClassifier(kwargs)
    end

    export Ridge2Classifier, Ridge2MultitaskClassifier

end
