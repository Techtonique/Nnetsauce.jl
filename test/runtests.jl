import Pkg
Pkg.add("Pkg")

using Pkg

Pkg.add("Conda")
Pkg.build("Conda")

using Nnetsauce
using Test
using Conda

Conda.add("pip")  # Ensure pip is installed
Conda.pip_interop(true)  # Enable pip interop
Conda.pip("install", "scikit-learn")  # Install scikit-learn
Conda.add("numpy")

np = pyimport("numpy")
sklearn = pyimport("sklearn")

@testset "Nnetsauce.jl" begin
    @testset "Ridge2Classifier" begin
        # Write your tests here.
        dataset = sklearn.datasets.load_breast_cancer()
        X = dataset["data"]
        y = dataset["target"]
        X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(X, y, 
        test_size=0.2, random_state=123)
        clf = Ridge2Classifier(n_hidden_features=9, dropout=0.43, n_clusters=1, 
        lambda1=1.24023438e+01, lambda2=7.30263672e+03)
        clf.fit(X=X_train, y=y_train)        
        @test clf.score(X_test, y_test) >= 0.98
    end
end
