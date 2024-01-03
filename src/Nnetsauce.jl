module Nnetsauce

    import Pkg

    Pkg.add("PyCall")

    import PyCall

    ns = PyCall.pyimport("nnetsauce")

    export ns.Ridge2Classifier, ns.Ridge2MultitaskClassifier

end
