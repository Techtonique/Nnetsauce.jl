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

    function Ridge2Classifier(;n_hidden_features=100, dropout=0.15, n_clusters=1, 
        lambda1=1.0, lambda2=1.0)
        return ns.Ridge2Classifier(n_hidden_features=n_hidden_features, dropout=dropout, 
            n_clusters=n_clusters, lambda1=lambda1, lambda2=lambda2)
    end

    function Ridge2MultitaskClassifier(;n_hidden_features=100, dropout=0.15, n_clusters=1, 
        lambda1=1.0, lambda2=1.0)
        return ns.Ridge2MultitaskClassifier(n_hidden_features=n_hidden_features, dropout=dropout, 
            n_clusters=n_clusters, lambda1=lambda1, lambda2=lambda2)        
    end

    export Ridge2Classifier
    export Ridge2MultitaskClassifier

end
