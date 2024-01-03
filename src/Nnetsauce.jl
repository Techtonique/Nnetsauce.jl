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
        ns.Ridge2Classifier(n_hidden_features=$n_hidden_features,
        activation_name=$activation_name,
        a=$a,
        nodes_sim=$nodes_sim,
        #bias=True,
        dropout=$dropout,
        n_clusters=$n_clusters,
        #cluster_encode=True,
        type_clust=$type_clust,
        #type_scaling=("std", "std", "std"),
        lambda1=$lambda1,
        lambda2=$lambda2,
        seed=$seed,
        backend=$backend)
        """       
    end
        
    export Ridge2Classifier

end
