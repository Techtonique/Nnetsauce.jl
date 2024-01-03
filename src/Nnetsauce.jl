module Nnetsauce

    import Pkg

    Pkg.add("PyCall")

    import PyCall

    ns = PyCall.pyimport("nnetsauce")

        function Ridge2Classifier(n_hidden_features,
            activation_name,
            a,
            nodes_sim,
            #bias=True,
            dropout,
            #direct_link=True,
            n_clusters,
            #cluster_encode=True,
            type_clust,
            #type_scaling=("std", "std", "std"),
            lambda1,
            lambda2,
            seed,
            backend)
            return ns.Ridge2Classifier(n_hidden_features=n_hidden_features,
                activation_name=activation_name,
                a=a,
                nodes_sim=nodes_sim,
                #bias=bias,
                dropout=dropout,
                #direct_link=direct_link,
                n_clusters=n_clusters,
                #cluster_encode=cluster_encode,
                type_clust=type_clust,
                #type_scaling=type_scaling,
                lambda1=lambda1,
                lambda2=lambda2,
                seed=seed,
                backend=backend)
        end

        function Ridge2MultitaskClassifier(n_hidden_features,
            activation_name,
            a,
            nodes_sim,
            #bias=True,
            dropout,
            n_clusters,
            #cluster_encode=True,
            type_clust,
            #type_scaling=("std", "std", "std"),
            lambda1,
            lambda2,
            seed,
            backend)
            return ns.Ridge2MultitaskClassifier(n_hidden_features=n_hidden_features,
                activation_name=activation_name,
                a=a,
                nodes_sim=nodes_sim,
                #bias=bias,
                dropout=dropout,
                n_clusters=n_clusters,
                #cluster_encode=cluster_encode,
                type_clust=type_clust,
                #type_scaling=type_scaling,
                lambda1=lambda1,
                lambda2=lambda2,
                seed=seed,
                backend=backend)
        end

    export Ridge2Classifier, Ridge2MultitaskClassifier

end
