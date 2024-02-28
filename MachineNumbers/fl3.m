% the function finds the machine number that represents a given real number 
function machine_vector = fl3(r, t, k1, k2)

    % Validations to checks whether the input arguments are appropriate:
    %    t should be a positive integer
    %    k1 and k2 should be integers, and k1 should be less than k2.
    if ~isnumeric(r) || ~isnumeric(t) || ~isnumeric(k1) || ~isnumeric(k2) || ...
       (t <= 0 || k1 >= k2 || mod(t,1) ~= 0 || mod(k1,1) ~= 0 || mod(k2,1) ~= 0)
        error('Invalid input parameters');
    end
    
    % We call function fl2 to get the parameters M_infinity, epsilon_0 of the
    % machine number set, becasue we need them to check if the real number
    % can be respresented in the set.
    [M_infinity, epsilon_0, ~] = fl2(t, k1, k2);
    
    % Check if the real number can be represented in the machine number
    % set. we see if the absolute value of the real number 'r' is within the
    % representable range of the machine number.
    if abs(r) < epsilon_0 || abs(r) > M_infinity
        error('The real number cannot be represented in the machine number set');
    end
    
    % Determine the sign_bit
    sign_bit = 0;
    if r < 0
        sign_bit = 1;
    end
    
    % Characteristic and Mantissa Calculation:
    % Calculate the characteristic by taking the floor of the base-2 logarithm of the absolute value of r.
    % Compute the mantissa value by dividing the absolute value of r by 2 to the power of the characteristic and subtracting 1.
    % Convert the mantissa value to binary, adjust for t-1 bits, and reverse the order to match the machine number format.
    characteristic = floor(log2(abs(r)));
    mantissa_value = abs(r) / 2^characteristic - 1;  
    mantissa_vector = fliplr(dec2bin(mantissa_value * 2^(t-1), t-1) - '0');
    
    % Combine the sign_bit, mantissa, and characteristic into the machine vector
    machine_vector = [sign_bit, mantissa_vector, characteristic];

end


% % TEST:
% Test 1: A positive real number within the representable range
% r1 = 2.5;
% t1 = 4;
% k11 = -2;
% k21 = 2;
% machine_vector_1 = fl3(r1, t1, k11, k21);
% disp(['Test Case 1 - Real Number: ', num2str(r1)]);
% disp(['Machine Vector: ', num2str(machine_vector_1)]);

% % Test 2: A real number with zero mantissa and non-zero characteristic
% r2 = 16;
% t2 = 5;
% k12 = 0;
% k22 = 3;
% machine_vector_2 = fl3(r2, t2, k12, k22);
% disp(['Test Case 2 - Real Number: ', num2str(r2)]);
% disp(['Machine Vector: ', num2str(machine_vector_2)]);

% % Test 3: A real number with a small fractional part
% r3 = 0.0625;
% t3 = 4;
% k13 = -2;
% k23 = 2;
% machine_vector_3 = fl3(r3, t3, k13, k23);
% disp(['Test Case 3 - Real Number: ', num2str(r3)]);
% disp(['Machine Vector: ', num2str(machine_vector_3)]);