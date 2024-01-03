module Nnetsauce

    import Pkg

    Pkg.add("PyCall")
    Pkg.add("Conda")
    
    import PyCall
    import Conda

    Conda.pip("install", "nnetsauce")  # Install nnetsauce        

    function Ridge2Classifier(kwargs...)        
        return PyCall.py"""        
        import nnetsauce as ns
        return ns.Ridge2Classifier(**kwargs)
        """        
    end
        
    export Ridge2Classifier

end
