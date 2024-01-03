module Nnetsauce

using Pkg
Pkg.add("PyCall")
Pkg.build("PyCall")
Pkg.add("Conda")
Pkg.build("Conda")

using PyCall
using Conda

Conda.add("pip")
Conda.pip_interop(true)  # Enable pip interop
Conda.pip("install", "scikit-learn")  # Install scikit-learn
Conda.pip("install", "jax")  # /!\ Only on Linux or macOS: Install jax
Conda.pip("install", "jaxlib")  # /!\ Only on Linux or macOS: Install jaxlib
Conda.pip("install", "nnetsauce")  # Install nnetsauce
Conda.add("numpy")
Conda.add("scikit-learn")

np = PyCall.pyimport("numpy")
ns = PyCall.pyimport("nnetsauce")
sklearn = PyCall.pyimport("sklearn")

    function Ridge2Classifier(kwargs...)
        return ns.Ridge2Classifier(kwargs)
    end

    function Ridge2MultitaskClassifier(kwargs...)
        return ns.Ridge2MultitaskClassifier(kwargs)
    end

    export Ridge2Classifier, Ridge2MultitaskClassifier

end
