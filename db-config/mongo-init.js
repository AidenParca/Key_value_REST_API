const key_value_db = process.env.KEY_VALUE_DB;
const keyValueUser = process.env.KEY_VALUE_USER;
const keyValuePassword = process.env.KEY_VALUE_PASSWORD;

db = db.getSiblingDB(key_value_db);

db.createUser(
    {
        user: keyValueUser,
        pwd: keyValuePassword,
        roles: [
            {
                role: 'readWrite',
                db: key_value_db
            }
        ]
    }
)