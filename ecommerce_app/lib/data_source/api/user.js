const express = require('express');
const crypto = require('crypto-js');
const router = express.Router();
const connection = require('./db');


router.post('/register', async (req, res) => {

    const { sex, password, name, phoneNumber, birthday } = req.body;
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
        res.status(400);
    } else {
        // const hashedPassword = await bcrypt.hash(password, 10);

        const addUserQuery = `
    INSERT INTO User (Password, name, PhoneNumber, Status,admin,birthday)
    VALUES ( ?, ?, ?, ?,?,?)
  `;

        connection.query(addUserQuery, [ password, name, phoneNumber, 1, 0, birthday], (err) => {
            if (err) {
                console.error('Error executing MySQL query:', err);
                res.status(500).send('Internal Server Error');
            } else{
            res.send("Reg succces");

            }
        });
    }
    res.send("");
});

// Định nghĩa route đăng nhập
router.post('/login', async (req, res) => {
    const { phoneNumber, password } = req.body;

    // Truy vấn để kiểm tra người dùng tồn tại và lấy mật khẩu đã băm
    const getUserQuery = 'SELECT * FROM User WHERE phoneNumber = ? and status=1';
    connection.query(getUserQuery, [phoneNumber], async (err, results) => {
        if (err) {
            console.error('Lỗi khi truy vấn người dùng:', err);
            res.status(500).send('Lỗi Nội Server');
        } else {
            if (results.length === 0) {
                res.status(401);
            } else {
                // So sánh mật khẩu đã nhập với mật khẩu đã băm trong cơ sở dữ liệu
                const user = results[0];
                const hashedPassword = crypto.SHA256(password).toString(crypto.enc.Hex);

                if (hashedPassword === user.password) {
                    // Đăng nhập thành công
                    res.status(200).json({
                        success: true,
                        message: 'Đăng nhập thành công',
                    });
                } else {
                    // Mật khẩu không khớp
                    res.status(401).json({ success: false, message: 'Mật khẩu không đúng' });
                }
            }
        }
    });
});
router.get('/', (req, res) => {
    const selectQuery = 'SELECT * FROM User WHERE status != 0';

    connection.query(selectQuery, [], (err, results) => {
        if (err) {
            console.error('Error fetching users:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (results.length === 0) {
                res.status(404).send('Users not found');
            } else {
                // Map the results to an array of user objects
                const users = results.map(user => ({
                    name: user.name,
                    phoneNumber: user.phoneNumber,
                    birthday: user.birthday,
                    sex: user.sex,
                    biography: user.biography,
                }));

                res.status(200).json(users);
            }
        }
    });
});

router.post('/update', (req, res) => {
    const {
        phoneNumber,
        name,
        sex,
        birthday,
        biography,
        // Add other necessary fields
    } = req.body;

    const updateQuery = 'UPDATE User SET name=?, sex=?, birthday=?, biography=? WHERE phoneNumber=?';

    connection.query(updateQuery, [name, sex, birthday,biography, phoneNumber], (err, results) => {
        if (err) {
            console.error('Error updating user:', err);
            res.status(500).send('Internal Server Error');
        } else {
            res.status(200).send('User updated successfully');
        }
    });
});

router.get('/id:phone', (req, res) => {
    var query = 'SELECT * FROM `user` WHERE status!=0 AND phoneNumber=?';
    connection.query(query, [req.params.phone], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' })
        }
        else {
            return res.json(results);
        }
    }
    );
});

router.get('/user', (req, res) => {
    var query = 'SELECT * FROM `user` WHERE admin!=1';
    connection.query(query, [req.params.phone], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' })
        }
        else {
            return res.json(results);
        }
    }
    );
});



module.exports = router;
