% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calibrate_yasso.R
\name{calibrate_yasso}
\alias{calibrate_yasso}
\title{Calibrate the YASSO model}
\usage{
calibrate_yasso(
  par,
  n_runs,
  time,
  temp,
  prec,
  init,
  litter,
  wsize,
  leac,
  sspred = 0L
)
}
\arguments{
\item{par}{A numeric vector of YASSO parameters.}

\item{n_runs}{Input data. Refer to \code{\link{sample_data_cal}} for now.}

\item{time}{-||-}

\item{temp}{-||-}

\item{prec}{-||-}

\item{init}{-||-}

\item{litter}{-||-}

\item{wsize}{-||-}

\item{leac}{-||-}

\item{sspred}{Optional integer, should steady state mode be used (1 = yes).}
}
\value{
A matrix containing simulated soil carbon. Each row corresponds to a
  row in the matrix of initial states provided to the model.
}
\description{
\code{calibrate_yasso()} runs the YASSO model in a way intended for model
calibration at the Finnish Meteorological Institute. For most users, it is
recommended to instead use \code{\link{run_yasso}} for simulating soil
carbon.
}
\details{
\code{calibrate_yasso()} wraps the Fortran90-release of the soil carbon model
YASSO15 into a simple R-function. The function is intended for calibrating
the model using the data sets and methods applied at the Finnish
Meteorological Institute.

The function provides YASSO with the initial soil carbon values in the matrix
\code{init} and runs the model one time step at a time. The initial value
of each time step is read from the matrix. The model runs until it has looped
over all the time steps.
}
\examples{
soil_c <- calibrate_yasso(
 par = sample_parameters,
 n_runs = sample_data_cal$n_runs,
 time = sample_data_cal$time,
 temp = sample_data_cal$temp,
 prec = sample_data_cal$prec,
 init = sample_data_cal$init,
 litter = sample_data_cal$litter,
 wsize = sample_data_cal$wsize,
 leac = sample_data_cal$leac
)
}
