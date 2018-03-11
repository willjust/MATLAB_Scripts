classdef Material
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        density = 0;
        tensile_yield;
        tensile_ultimate;
        shear_ultimate;
        bearing_yield;
        bearing_ultimate;
        E; G; mu;
    end
    
    methods
        function mat = Material(materialName)
            switch materialName
                case 'Al-6061'
                    mat.density = 2700;
                    mat.tensile_yield = 241.31E6;
                    mat.shear_ultimate = 186.2E6;
                    mat.bearing_yield = 344.7E6;
                    mat.E = 68.26E9;
                    mat.G = 26.2E9;
                    mat.mu = 0.33;
                case 'Al-7075'
                    mat.density = 2700;
                    mat.tensile_yield = 468.84E6;
                    mat.shear_ultimate = 310.3E6;
                    mat.bearing_yield = 779.1E6;
                    mat.E=71.02E9;
                    mat.G=26.89;
                    mat.mu = 0.33;
                case 'SS-415'
                    mat.density = 7750.37;
                    mat.tensile_yield = 585E6;
                    mat.E = 0;
                    
                case 'SS-303'
                    mat.density = 8027;
                    mat.tensile_yield = 415E6;
                    mat.E = 0;
            end
        end
    end
    
end

