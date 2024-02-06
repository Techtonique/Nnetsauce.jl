module Nnetsauce

    using Pkg    
    
    ENV["PYTHON"] = ""

    using Conda
    using PyCall
    
    run(`pip install -U scikit-learn`)  # Install scikit-learn
    if Sys.isunix()  # Install jax and jaxlib only on Linux or macOS
        run(`pip install -U jax`)  # /!\ Only on Linux or macOS: Install jax
        run(`pip install -U jaxlib`)  # /!\ Only on Linux or macOS: Install jaxlib
    end
    run(`pip install -U nnetsauce`)  # Install nnetsauce    
    
    Conda.add("pip")  # Ensure pip is installed
    Conda.pip_interop(true)  # Enable pip interop
    Conda.pip("install", "scikit-learn")  # Install scikit-learn
    if Sys.isunix()  # Install jax and jaxlib only on Linux or macOS
        Conda.pip("install", "jax")  # /!\ Only on Linux or macOS: Install jax
        Conda.pip("install", "jaxlib")  # /!\ Only on Linux or macOS: Install jaxlib
    end 
    Conda.pip("install", "nnetsauce")  # Install nnetsauce

    ns = PyCall.pyimport("nnetsauce")
    sklearn = PyCall.pyimport("sklearn")

    export Ridge2Classifier

    function Ridge2Classifier(;n_hidden_features=5,
        activation_name="relu",
        a=0.01,
        nodes_sim="sobol",
        bias=true,
        dropout=0,
        direct_link=true,
        n_clusters=2,
        cluster_encode=true,
        type_clust="kmeans",
        type_scaling=("std", "std", "std"),
        lambda1=0.1,
        lambda2=0.1,
        seed=123,
        backend="cpu")  
        return ns.Ridge2Classifier(n_hidden_features=n_hidden_features,
            activation_name=activation_name,
            a=a,
            nodes_sim=nodes_sim,
            bias=bias,
            dropout=dropout,
            direct_link=direct_link,
            n_clusters=n_clusters,
            cluster_encode=cluster_encode,
            type_clust=type_clust,
            type_scaling=type_scaling,
            lambda1=lambda1,
            lambda2=lambda2,
            seed=seed,
            backend=backend)
    end        

end
