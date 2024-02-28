% The function computes the real number represented by a given machine number.
function RealNumber = fl1(input_vector)
    

    % 1. Check if the mantissa part of the input vector contains only binary digits (0 or 1).
    % Iterate through all elements of the input vector except the last one,ensuring they are either 0 or 1.
    if any(input_vector(1:end-1) ~= 0 & input_vector(1:end-1) ~= 1)
        error('Invalid mantissa: Should only contain 0s and 1s');
    end
    
    % 2. Validate the characteristic part (last element) of the input vector.
    %     Ensure the last element of the input vector is an integer. 
    if ~mod(input_vector(end), 1) == 0
        error('Invalid input: The last element should be an integer.');
    end
      
        % 3. Extraction of Components:
        %    Break down the input vector into 3 parts: sign bit, mantissa, and
        %    characteristic. Using vector indexing to extract these components.
        sign_bit = input_vector(1);
        mantissa = input_vector(2:end-1);
        characteristic = input_vector(end);
        
        % 4. Compute the sign of the number (-1 raised to the power of the sign bit):
        %   If the first bit (the sign_bit) is 0, then the number is positive.
        %   If the first bit (the sign bit) is 1, then the number is negative.
        sign = (-1) ^ sign_bit;
        
        % 5. Computing mantissa value using vectorized operations.(perform operations on entire array or vector)
        % 
        mantissa_value = sum(mantissa .* (2 .^ -(1:length(mantissa))));
    
        %6.  Computing characteristic value:
        base = 3;  % Because of the ternary numeral system (base = 3).
        characteristic_value = base ^ characteristic;
    
        %7. Compute the real number:
        % Combine the sign, mantissa value, and characteristic value to get the final real number.
        RealNumber = sign * mantissa_value * characteristic_value;
  
end


%     % TEST:
% Test1: (Positive number)
% input_vector_1 = [0 1 0 1];
% result_1 = fl1(input_vector_1);
% fprintf('Test Case 1: Result = %f\n', result_1);
% 
% Test2: (Positive number)
% input_vector_2 = [0 1 0 1 2];
% result_2 = fl1(input_vector_2);
% fprintf('Test Case 2: Result = %f\n', result_2);
% 
%Test3: (Negative number)
% input_vector_3 = [1 1 0 0 1];
% result_3 = fl1(input_vector_3);
% fprintf('Test Case 3: Result = %f\n', result_3);
% 
% Test4: (Invalid Mantissa) 
% input_vector_4 = [0 1 2 1 0];
% result_4 = fl1(input_vector_4);
% fprintf('Test Case 4: Result = %f\n', result_4);
% 
%Test5: Invalid characteristics  (Non-integer)
% input_vector_5 = [0 1 0 1 2.5];
% result_5 = fl1(input_vector_5);
% fprintf('Test Case 5: Result = %f\n', result_5);
% 
%Test6: (Zero Mantissa)
% input_vector_6 = [0 0 0 0 2];
% result_6 = fl1(input_vector_6);
% fprintf('Test Case 6: Result = %f\n', result_6);
