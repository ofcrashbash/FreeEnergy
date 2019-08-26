#include "__cf_DataWeatherModel.h"
#ifndef RTW_HEADER_DataWeatherModel_acc_types_h_
#define RTW_HEADER_DataWeatherModel_acc_types_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#ifndef _DEFINED_TYPEDEF_FOR_WeatherData_
#define _DEFINED_TYPEDEF_FOR_WeatherData_
typedef struct { real_T WindSpeed ; real_T WindDirection ; real_T Humidity ;
real_T WetTemperature ; real_T DryTemperature ; real_T GlobalSolarIrradiance
; real_T GlobalSolarIrradianceSimulated ; real_T DirrectSolarIrradianceVector
[ 3 ] ; real_T DiffuseSolarIrradiance ; } WeatherData ;
#endif
typedef struct fvbhztin3n_ fvbhztin3n ;
#endif
