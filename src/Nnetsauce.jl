module Nnetsauce

    import Pkg

    Pkg.add("PyCall")
    Pkg.add("Conda")
    
    import PyCall
    import Conda

    Conda.add("pip")  # Ensure pip is installed
    Conda.pip_interop(true)  # Enable pip interop
    Conda.pip("install", "nnetsauce")  # Install nnetsauce
    ns = PyCall.pyimport("nnetsauce")

    export ns.Ridge2Classifier, ns.Ridge2MultitaskClassifier

end
