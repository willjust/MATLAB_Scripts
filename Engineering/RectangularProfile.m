classdef RectangularProfile
    %circularProfile.m Represents a tube profile with an innter/outer D
    %   Creates a beam profile with a circular profile. 
    %   inner_diameter: inside diameter of tube
    %   outer_diameter: outside diameter of tube
    %   I(): Returns area moment of inertia
    %   y(): Returns distance to edge of profiles
    
    properties
        width = 0.1;
        height = 0.1;
        
        Material = 'Al-6061';
        
    end
    
    methods
        
        function profile = RectangularProfile(width, height) 
            switch nargin
                case 0
                    profile = RectangularProfile(0.01,0.01);
                case 1
                    profile = RectangularProfile(width, width);
                case 2
                    profile.width = width;
                    profile.height = height;
            end
        end
        % Returns the Area Moment of Intertia
        function val = I(obj) 
            val = obj.width*obj.height^3/12;
        end
        function val = y(obj)
            val = obj.height/2;
        end
        
        function val = area(obj) 
            val = obj.height*obj.width;
        end
    end
    
end

