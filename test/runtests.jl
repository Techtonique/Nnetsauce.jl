using Conda
using PythonCall
using Pkg 

Pkg.add("Test")  # Install Test

using Test 

@testset "Nnetsauce.jl" begin    

    try 
        ENV["PYTHON"] = readchomp(`which python3`);
    catch
        nothing
    end

    using Nnetsauce
    
    # sklearn = PythonCall.pyimport("sklearn")

    # dataset = sklearn.datasets.load_breast_cancer()
    # X = dataset["data"]
    # y = dataset["target"]
    # X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(X, y, 
    # test_size=0.2, random_state=123)
    # clf = Nnetsauce.Ridge2Classifier(n_hidden_features=9, dropout=0.43, n_clusters=1, 
    # lambda1=1.24023438e+01, lambda2=7.30263672e+03)
    # clf.fit(X=X_train, y=y_train)        
    # @test clf.score(X_test, y_test) >= 0.98

    function generate_classification_dataset(num_samples::Int)
        # Set seed for reproducibility
        Random.seed!(42)

        # Generate random features (two-dimensional)
        features = randn(num_samples, 2)

        # Generate corresponding labels (0 or 1)
        labels = rand([0, 1], num_samples)

        return features, labels
    end

    # Example: Generate a dataset with 100 samples
    num_samples = 100
    features, labels = generate_classification_dataset(num_samples)

    # Display the first few samples
    println("Features:")
    println(features[1:5, :])
    println("\nLabels:")
    println(labels[1:5])

    # Split the dataset into training and test sets /!\
    clf = Nnetsauce.Ridge2Classifier(n_hidden_features=5)
    clf.fit(X=features, y=labels)        
    @test clf.score(X=features, y=labels) >= 0.5
    
end
