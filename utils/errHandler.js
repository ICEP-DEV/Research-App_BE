const modelErrHandle = (err) => {
  const errors = Object.values(err.errors).map((el) => el.message);
  const message = `Invalid input data : ${errors.join(", ")}`;
  // console.log(message)
  const e = new Error(message);
  e.statusCode = 400;
  e.status = "fail";

  return e;
};

const handleDublicateEntry = (err) => {
  const message = err.parent.sqlMessage;
  // console.log(message)
  const e = new Error(message);
  e.statusCode = 400;
  e.status = "fail";

  return e;
  // return new Error(err.parent.sqlMessage);
};

const errResponseHandler = (e, res) => {
    const message = e.message
    res.status(e.statusCode).json({
        status: e.status,
        message
    })

}

const errHandler = (err, req, res, next) => {
  console.log(err)
  const e = err;
  const code =
    typeof err.parent == "object" && err.parent && "errno" in err.parent
      ? err.parent.errno
      : 0;
  if ((code == 1062)) err = handleDublicateEntry(err);
  if (err.errors) err = modelErrHandle(err);

  err.statusCode = err.statusCode || 500;
  err.status = err.status || "error";
  err.message = err.message || "Ooops something went wrong";


  errResponseHandler(err, res)

//   res.status(err.statusCode).json({
//     status: err.status,
//     message: err.message,
//     e,
//   });
};

module.exports = errHandler;
