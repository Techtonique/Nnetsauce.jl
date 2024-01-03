module Nnetsauce

    import Pkg

    Pkg.add("PyCall")
    Pkg.add("Conda")
    
    import PyCall
    import Conda

    Conda.add("pip")  # Ensure pip is installed
    Conda.pip_interop(true)  # Enable pip interop
    Conda.pip("install", "nnetsauce")  # Install nnetsauce
    
    PyCall.py"""
    import nnetsauce as ns
    """

    function Ridge2Classifier(kwargs...)        
        return PyCall.py"""        
        ns.Ridge2Classifier
        """(kwargs)        
    end
        
    function Ridge2MultitaskClassifier(kwargs...)        
        return PyCall.py"""        
        ns.Ridge2MultitaskClassifier
        """(kwargs)        
    end

    export Ridge2Classifier, Ridge2MultitaskClassifier    

end
