

exports.login = (req, res, next)=> {
    res.status(200).json({
        status: 'success',
        message: 'Welcome to login endpoint'
    })
}

exports.signup = (req, res, next)=> {
    res.status(200).json({
        status: 'success',
        message: 'Welcome to Signup endpoint'
    })
}


exports.forgotPassword = (req, res, next)=> {
    res.status(200).json({
        status: 'success',
        message: 'Welcome to Forgot Password endpoint'
    })
}


exports.updatePassword = (req, res, next)=> {
    res.status(200).json({
        status: 'success',
        message: 'Welcome to Upadate Password endpoint'
    })
}


