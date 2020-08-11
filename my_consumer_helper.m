function [coupon, price] = my_consumer_helper(value)
% value (scalar, double) represents the dollar amt of the consumer's bill.
% coupon (scalar, double) is a value 1, 2, or 3, & indicates the coupon w largest discount
% (1) the 10% discount, (2) $25 discount on 200+, (3)  $50 discount on 400+
% price (scalar, double) is what the consumer will pay after the discount
    if value < 200
        coupon = 1;
        price = value - (value * .1);
    elseif value >= 200 && value < 250
        coupon = 2;
        price = value-25;
    elseif value >= 250 && value < 400
        coupon = 1;
        price = value - (value * .1);
    elseif value >=400 && value < 500
        coupon = 3;
        price = value - 50;
    elseif value >= 500
        coupon = 1;
        price = value - (value * .1);
    end
end
