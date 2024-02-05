using Nnetsauce
using PythonCall
using Test 

@testset "Nnetsauce.jl" begin            
    sklearn = PythonCall.pyimport("sklearn")

    dataset = sklearn.datasets.load_breast_cancer()
    X = dataset["data"]
    y = dataset["target"]
    X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(X, y, 
    test_size=0.2, random_state=123)
    clf = Nnetsauce.Ridge2Classifier(n_hidden_features=9, dropout=0.43, n_clusters=1, 
    lambda1=1.24023438e+01, lambda2=7.30263672e+03)
    clf.fit(X=X_train, y=y_train)        
    @test clf.score(X_test, y_test) >= 0.98
    
end
