const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  //console.log("token", req.get('Authorization'));
  const authHeader = req.get('Authorization');
  if (!authHeader) {
    const error = new Error('Not authenticated!');
    error.statusCode = 401;
    throw error;
  }
  const token = authHeader.split(' ')[1];
  let decodedToken;
  try {
    decodedToken = jwt.verify(token, 'secretfortoken')
    res.user = decodedToken;
    res.status(200).json({data: res.user, message : 'TokenOn'});
  } catch (err) {
    err.statusCode = '600';
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