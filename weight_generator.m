function [W]=weight_generator(number_neurons,nomber_entries)
    size=[number_neurons,nomber_entries];
    W= unifrnd(0,1,size);
endfunction;

