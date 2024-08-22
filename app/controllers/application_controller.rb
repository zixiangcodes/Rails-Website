class ApplicationController < ActionController::API
    
    # class ApplicationController < ActionController::Base
    # Make ApplicationController inherit from ActionController::API instead of ActionController::Base. 
    # As with middleware, this will leave out any Action Controller modules that provide 
    # functionalities primarily used by browser applications.

end
