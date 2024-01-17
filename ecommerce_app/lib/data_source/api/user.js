//lấy toàn bộ bảng product
const express = require('express');
const router = express.Router();
const connection = require('./db');


// lấy cả bảng brand
router.post('/',async (req, res) => {
    
        const { sex, password, name, phoneNumber, address, status,birthday } = req.body;
        console.log(req.body);
        const checkUserQuery = 'SELECT * FROM User WHERE phoneNumber = ?';
        const userExists = await new Promise((resolve, reject) => {
            connection.query(checkUserQuery, [phoneNumber], (err, results) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(results.length > 0);
                }
            });
        });

        if (userExists) {
            res.status(400).json({ success: false, message: 'sex is already registered' });
        } else {
            // const hashedPassword = await bcrypt.hash(password, 10);

            const addUserQuery = `
    INSERT INTO User (sex, Password, name, PhoneNumber, Address, Status,admin,birthday)
    VALUES (?, ?, ?, ?, ?, ?,?,?)
  `;

            connection.query(addUserQuery, [sex, password, name, phoneNumber, address, 1,0,birthday], (err) => {
                if (err) {
                    console.error('Error executing MySQL query:', err);
                    res.status(500).send('Internal Server Error');
                } else {
                    res.json({
                        name: name,
                        sex: sex,
                        Phone: phoneNumber,
                        address: address,
                        Password: password
                    });
                }
            });
        }
});

module.exports = router;
