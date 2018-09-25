function [W]=weight_generator(number_neurons,number_inputs)
    size=[number_neurons,number_inputs];
    W= unifrnd(0,1,size);
endfunction;

