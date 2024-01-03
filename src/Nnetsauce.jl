module Nnetsauce

    import Pkg

    Pkg.add("PyCall")
    Pkg.add("Conda")
    
    import PyCall
    import Conda

    Conda.pip("install", "nnetsauce")  # Install nnetsauce        

    function Ridge2Classifier(kwargs...)        
        PyCall.py"""
        import nnetsauce as ns
        """
        return PyCall.py"""        
        ns.Ridge2Classifier($kwargs)
        """       
    end
        
    function Ridge2MultitaskClassifier(kwargs...)        
        PyCall.py"""
        import nnetsauce as ns
        """
        return PyCall.py"""        
        ns.Ridge2MultitaskClassifier($kwargs)
        """
    end

    export Ridge2Classifier, Ridge2MultitaskClassifier    

end
