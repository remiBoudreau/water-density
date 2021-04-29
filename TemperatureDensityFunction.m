N = 6.022140857*10^23;
MW = 18.015;

% Select method
% Opt 1 outputs number of entities for density at given temperature
% Opt 2 outputs box length for volume for density at given temperature
% Opt 3 outputs temperature for given density
display('Select method:')
display('(1) Input temperature and box length for molecules')
display('(2) Input temperature and number of water molecules')
y = '';
x = input(y);

if x == 1|2
    t = input('Enter the temperature (C):');
    %Emperical density in g/m^3
    d = (999.85308 + 6.32693*10^(-2)*t - 8.523829*10^(-3)*t^2 + ...
        6.943248*10^(-5)*t^3 - 3.821216*10^(-7)*t^4)*1000;
    strt = num2str(t);
    
    if x == 1
        l = input('Enter the edge length of cube (A):');

        %Volume of cube
        standardL = l*10^(-10);
        V = standardL^3;

        %Calculate the number of atoms
        numAtoms = V*N*d/MW;
        intAtoms = round(numAtoms);
        strAtoms = num2str(intAtoms);

        %Display results
        strV = num2str(l^3);
        ['There are ', strAtoms, ...
            ' water molecules in a box with a volume of ', strV, ...
            ' A3 at ', strt, ' C']
    
    elseif x == 2 
        numAtoms = input('Enter the number of water molecules:');
        strAtoms = num2str(numAtoms);
        
        %Calculate the volume of the box
        V = numAtoms*MW/(N*d);
        standardL = V^(1/3);
        l = standardL*10^10;
        strl = num2str(l);
        strV = num2str(l^3);
        ['A volume of ', strV, ' A^3 (length = ', strl, 'A) is ', ...
            'required for ', strAtoms, ' water molecules at ', strt, ' C'] 
    end
else 
    ['Please select 1 or 2']
end