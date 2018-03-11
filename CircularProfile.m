classdef CircularProfile
    %circularProfile.m Represents a tube profile with an innter/outer D
    %   Creates a beam profile with a circular profile. 
    %   inner_diameter: inside diameter of tube
    %   outer_diameter: outside diameter of tube
    %   I(): Returns area moment of inertia
    %   y(): Returns distance to edge of profiles
    
    properties
        inner_diameter = 0;
        outer_diameter = 0.001;
        Material = 'Al-6061';
        
    end
    
    methods
        function profile = CircularProfile(ID,OD)
            switch nargin
                case 0
                    profile = CircularProfile(0,0.0254);
                case 1
                    profile = CircularProfile(0, ID);
                case 2
                    profile.inner_diameter = ID;
                    profile.outer_diameter = OD;
            end
        end
        
        % Returns the Area Moment of Intertia
        function val = I(obj) 
            val = obj.outer_diameter^4 - obj.inner_diameter^4;
            val = val * pi / 64;
        end
        function val = y(obj)
            y = obj.outer_diameter + obj.inner_diameter;
            val = y/2;
        end
        
        function val = area(obj)
            val = obj.outer_diameter^2 - obj.inner_diameter^2;
            val = val * pi;
        end
    end
    
end

