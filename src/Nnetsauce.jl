module Nnetsauce

    import Pkg

    Pkg.add("PyCall")

    import PyCall

    ns = PyCall.pyimport("nnetsauce")

        function Ridge2Classifier(n_hidden_features=5,
            activation_name="relu",
            a=0.01,
            nodes_sim="sobol",
            bias=True,
            dropout=0,
            direct_link=True,
            n_clusters=2,
            cluster_encode=True,
            type_clust="kmeans",
            #type_scaling=("std", "std", "std"),
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
                #type_scaling=type_scaling,
                lambda1=lambda1,
                lambda2=lambda2,
                seed=seed,
                backend=backend)
        end

        function Ridge2MultitaskClassifier(n_hidden_features=5,
            activation_name="relu",
            a=0.01,
            nodes_sim="sobol",
            bias=True,
            dropout=0,
            n_clusters=2,
            cluster_encode=True,
            type_clust="kmeans",
            #type_scaling=("std", "std", "std"),
            lambda1=0.1,
            lambda2=0.1,
            seed=123,
            backend="cpu")
            return ns.Ridge2MultitaskClassifier(n_hidden_features=n_hidden_features,
                activation_name=activation_name,
                a=a,
                nodes_sim=nodes_sim,
                bias=bias,
                dropout=dropout,
                n_clusters=n_clusters,
                cluster_encode=cluster_encode,
                type_clust=type_clust,
                #type_scaling=type_scaling,
                lambda1=lambda1,
                lambda2=lambda2,
                seed=seed,
                backend=backend)
        end

    export Ridge2Classifier, Ridge2MultitaskClassifier

end
