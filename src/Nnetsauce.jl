module Nnetsauce

    import Pkg

    Pkg.add("PyCall")

    import PyCall

    ns = PyCall.pyimport("nnetsauce")

        function Ridge2Classifier(kwargs...)
            return ns.Ridge2Classifier(kwargs)
        end

        function Ridge2MultitaskClassifier(kwargs...)
            return ns.Ridge2MultitaskClassifier(kwargs)
        end

    export Ridge2Classifier, Ridge2MultitaskClassifier

end
