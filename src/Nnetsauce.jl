module Nnetsauce

    import Pkg

    Pkg.add("PyCall")
    Pkg.add("Conda")
    
    import PyCall
    import Conda

    #Conda.add("pip")  # Ensure pip is installed
    #Conda.pip_interop(true)  # Enable pip interop
    Conda.pip("install", "nnetsauce")  # Install nnetsauce
    
    Ridge2Classifier = PyCall.py"""
    import nnetsauce as ns
    ns.Ridge2Classifier()
    """

    Ridge2MultitaskClassifier = PyCall.py"""
    import nnetsauce as ns
    ns.Ridge2MultitaskClassifier()
    """

    export Ridge2Classifier
    export Ridge2MultitaskClassifier

end
