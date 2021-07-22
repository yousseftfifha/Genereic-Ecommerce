INSERT INTO `product` ( `name`, `brand`, `description`, `sku`, `code`, `tmpcode`, `isbn`, `category`) VALUES
('iOttie Easy One Touch 4 Dash',
 'IOttie ',
'iOttie Easy One Touch 4 Dash & Windshield Universal Car Mount Phone Holder Desk Stand for iPhone, Samsung, Moto, Huawei, Nokia, LG, Smartphones',
 1110001,
 '12AX',
 'T12AQW',
 11111004,
 26);
INSERT INTO `productdetails` (`attribute`, `value`, `product`) VALUES
( 'Mounting Type','Dashboard and Windshield', 17),
( 'Special Feature', 'Universal Phone Control', 16),
( 'Compatible Phone Models', 'ALL', 17),
( 'Model Name', '852306006596', 17);
INSERT INTO `productinformation` ( `max`, `min`, `security`, `threshold`, `product`) VALUES
( 10, 5, 5, 5, 17);
INSERT  INTO mouvement ( quantity, transfered, unit_price, product, ins, outs) VALUES
(30,0,22.95,17,0,0)
