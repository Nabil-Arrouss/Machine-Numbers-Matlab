% Computes and displays parameters of a machine number
function [M_infinity, epsilon_0, epsilon_1] = fl2(t, k1, k2)

    % Check if input parameters are appropriate:
        % Validation:
        % t should be a positive integer.  (number of bits in the mantissa)
        % k1 and k2 should be integers with k1 < k2. // k1:k2: Bounds of the characteristics(exponent).
        if ~isscalar(t) || ~isscalar(k1) || ~isscalar(k2) || t <= 0 || k1 >= k2 || ~mod(t, 1) == 0 || ~mod(k1, 1) == 0 || ~mod(k2, 1) == 0
            error('Invalid input: t should be a positive integer, and k1, k2 should be integers with k1 < k2.');
        end
    
    % Initialize variables to store the computed parameters 
        M_infinity = 0;   % Maximm machine number
        epsilon_0 = 0;    % smallest positive number with lowest exponent
        epsilon_1 = 0;    % smallest positive number with exponent zero
        num_elements = 0; % Counter for the number of machine numbers  
    
    % Machine number computation using symmetry (for faster computation):

        for exp = k1:k2 % Loop through the range of characteristics from k1 to k2.
            for mantissa = 0:2^(t-1)-1 % For each characteristic, loop through all possible mantissas.
                % Use the fl1 function to convert to a machine number
                machine_number = fl1([dec2bin(mantissa, t - 1) - '0', exp]);
                % Count both positive and negative values for symmetry
                if machine_number > M_infinity % Update M_infinity if a larger machine number is found
                    M_infinity = machine_number;
                end

                num_elements = num_elements + 1;  % Increment by one to keep track of total number of elements
            end
        end  
    
    % Calculate epsilon_0 and epsilon_1
        epsilon_0 = fl1([dec2bin(1, t - 1) - '0', k1]); % Using the lowest characteristic (k1)
        epsilon_1 = fl1([dec2bin(1, t - 1) - '0', 0]);  % when the characteristic is zero
    
    % Display machine numbers and parameters
        fprintf('Number of elements: %d\n', num_elements);
        fprintf('M_infinity: %f\n', M_infinity);
        fprintf('epsilon_0: %f\n', epsilon_0);
        fprintf('epsilon_1: %f\n', epsilon_1);

end



    % TEST:
% % Test Case 1: Basic test with small values
% [t1, k11, k21] = deal(3, -2, 2);
% fl2(t1, k11, k21);
% 
% % Test Case 2: Larger t and negative exponents
% [t2, k12, k22] = deal(4, -3, -1);
% fl2(t2, k12, k22);
% 
% % Test Case 3: t = 1 (minimum t value)
% [t3, k13, k23] = deal(1, -1, 1);
% fl2(t3, k13, k23);
% 
%  % Test Case 4: k1 = k2 (invalid input)
% [t4, k14, k24] = deal(5, 2, 2);
% fl2(t4, k14, k24);
% 
% % Test Case 5: t is not an integer (invalid input)
% [t5, k15, k25] = deal(2.5, -2, 2);
% fl2(t5, k15, k25);