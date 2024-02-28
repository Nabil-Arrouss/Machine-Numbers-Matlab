% the function performs addition between two machine numbers.
function sum_machine_number = fl4(machine_number_1, machine_number_2)

    % Input Validation: check if both machine number vectors have the same length.
    if length(machine_number_1) ~= length(machine_number_2)
        error('Input vectors must have the same length');
    end
    
    % Extract sign, mantissa, and characteristic from both machine number vectors.
    sign_1 = machine_number_1(1);
    mantissa_1 = machine_number_1(2:end-1);
    characteristic_1 = machine_number_1(end);
    
    sign_2 = machine_number_2(1);
    mantissa_2 = machine_number_2(2:end-1);
    characteristic_2 = machine_number_2(end);
    
    % If the characteristics are not equal, shift the mantissa of the smaller number to the right,
    % Adjust the characteristic of the smaller number to match the larger number's characteristic.
    shift_amount = abs(characteristic_1 - characteristic_2);
    if characteristic_1 > characteristic_2
        mantissa_2 = [zeros(1, shift_amount), mantissa_2(1:end-shift_amount)];
    elseif characteristic_2 > characteristic_1
        mantissa_1 = [zeros(1, shift_amount), mantissa_1(1:end-shift_amount)];
        characteristic_1 = characteristic_2;
    end
    
    % Perform binary addition
    mantissa_sum = mantissa_1 + mantissa_2;
    carry = floor(mantissa_sum / 2);  % handle binary carry (if sum is of 2 bits in a column is 2 or greater)
    mantissa_sum = mantissa_sum - carry * 2;
    characteristic_1 = characteristic_1 + any(carry);  % increment characteristic if there's a carry
    
    % Construct the sum machine number by combining the sign_bit, summed
    %   mantissa and adjusted characteristic into a single vector.
    sum_machine_number = [sign_1, mantissa_sum, characteristic_1];

end


% TEST:
% % Test 1: Addition of positive numbers with the same characteristic
% machine_number_1 = [0, 110, 3];  
% machine_number_2 = [0, 101, 3];  
% sum_machine_number_1 = fl4(machine_number_1, machine_number_2);
% disp(['Test Case 1 - Sum Machine Number: ', num2str(sum_machine_number_1)]);

% % Test 2: Subtraction of positive numbers with the same characteristic
% machine_number_3 = [0, 110, 3]; 
% machine_number_4 = [1, 101, 3];  
% diff_machine_number_1 = fl4(machine_number_3, machine_number_4);
% disp(['Test Case 2 - Difference Machine Number: ', num2str(diff_machine_number_1)]);

% % Test 3: Addition of numbers with different characteristics
% machine_number_5 = [0, 110, 3];   
% machine_number_6 = [0, 101, 4];  
% sum_machine_number_2 = fl4(machine_number_5, machine_number_6);
% disp(['Test Case 3 - Sum Machine Number: ', num2str(sum_machine_number_2)]);

% % Test 4: Addition with different sign bits
% machine_number_7 = [0, 110, 3];   
% machine_number_8 = [1, 101, 3];   
% sum_machine_number_3 = fl4(machine_number_7, machine_number_8);
% disp(['Test Case 4 - Sum Machine Number: ', num2str(sum_machine_number_3)]);