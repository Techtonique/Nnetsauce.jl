module Nnetsauce

    using Pkg
    ENV["PYTHON"] = readchomp(`which python3`);
    Pkg.add("PythonCall")
    Pkg.build("PythonCall")
    Pkg.add("Conda")
    Pkg.build("Conda")
    
    using PythonCall
    using Conda
    
    Conda.add("pip")  # Ensure pip is installed
    Conda.pip_interop(true)  # Enable pip interop
    Conda.pip("install", "scikit-learn")  # Install scikit-learn
    if Sys.isunix()  # Install jax and jaxlib only on Linux or macOS
        Conda.pip("install", "jax")  # Install jax
        Conda.pip("install", "jaxlib")  # Install jaxlib
    end
    Conda.pip("install", "nnetsauce")  # Install nnetsauce
    
    ns = PythonCall.pyimport("nnetsauce")
    sklearn = PythonCall.pyimport("sklearn")

    export Ridge2Classifier

    function Ridge2Classifier(;n_hidden_features=5,
        activation_name="relu",
        a=0.01,
        nodes_sim="sobol",
        bias=True,
        dropout=0,
        direct_link=True,
        n_clusters=2,
        cluster_encode=True,
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
