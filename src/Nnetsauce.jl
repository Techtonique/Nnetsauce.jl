module Nnetsauce

    import Pkg

    Pkg.add("PyCall")
    Pkg.add("Conda")
    
    import PyCall
    import Conda

    Conda.pip("install", "nnetsauce")  # Install nnetsauce        

    function Ridge2Classifier(kwargs...)  
        # Printing key-value pair by 
        # accessing each key one-by-one 
        for i in keys(kwargs) 
            println(i, " => ", kwargs[i]) 
        end              
    end
        
    export Ridge2Classifier

end
