const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  const authHeader = req.headers.authorization?.split(" ")[1];
  if (!authHeader) {
    const error = new Error('Not authenticated!');
    error.statusCode = 401;
    //throw error;
  }
  const token = authHeader;
  let decodedToken;
  try {
    decodedToken = jwt.verify(token, 'secretfortoken')
  } catch (err) {
    if (err) {
      return res.status(401).json({ error: "Invalid token" });
    }
    //throw err;
  }
  if (!decodedToken) {
    const error = new Error('Not authenticated!');
    error.statusCode = 401;
    //throw error;
  }
  req.isLoggedIn = true;
  req.userId = decodedToken.userId;
  req.email = decodedToken.email;
  next();
};