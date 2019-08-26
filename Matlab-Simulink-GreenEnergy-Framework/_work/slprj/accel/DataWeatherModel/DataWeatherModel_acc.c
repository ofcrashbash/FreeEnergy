#include "__cf_DataWeatherModel.h"
#include <math.h>
#include "DataWeatherModel_acc.h"
#include "DataWeatherModel_acc_private.h"
#include <stdio.h>
#include "simstruc.h"
#include "fixedpoint.h"
#define CodeFormat S-Function
#define AccDefine1 Accelerator_S-Function
static void mdlOutputs ( SimStruct * S , int_T tid ) { real_T oh44davnny_p ;
real_T enljzhh4zr_idx_0 ; real_T enljzhh4zr_idx_1 ; real_T enljzhh4zr_idx_2 ;
be1bpnqtu5 * _rtB ; fvbhztin3n * _rtP ; lf50em4din * _rtDW ; _rtDW = ( (
lf50em4din * ) ssGetRootDWork ( S ) ) ; _rtP = ( ( fvbhztin3n * )
ssGetDefaultParam ( S ) ) ; _rtB = ( ( be1bpnqtu5 * ) _ssGetBlockIO ( S ) ) ;
{ void * fp = ( void * ) _rtDW -> mruisrs0nx . PrevTimePtr ; const char *
errMsg = ( NULL ) ; if ( fp != ( NULL ) && ( ssIsMajorTimeStep ( S ) || ! 0 )
) { real_T t = ssGetTaskTime ( S , 0 ) ; { void * y = & _rtB -> do0agf5kgu ;
errMsg = rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t ,
ssIsMajorTimeStep ( S ) , & y ) ; if ( errMsg != ( NULL ) ) {
ssSetErrorStatus ( S , errMsg ) ; return ; } } } } { void * fp = ( void * )
_rtDW -> bmx5mn1zwx . PrevTimePtr ; const char * errMsg = ( NULL ) ; if ( fp
!= ( NULL ) && ( ssIsMajorTimeStep ( S ) || ! 0 ) ) { real_T t =
ssGetTaskTime ( S , 0 ) ; { void * y = & _rtB -> kp3i4noxif ; errMsg =
rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t , ssIsMajorTimeStep ( S
) , & y ) ; if ( errMsg != ( NULL ) ) { ssSetErrorStatus ( S , errMsg ) ;
return ; } } } } { void * fp = ( void * ) _rtDW -> hnopkpvlcs . PrevTimePtr ;
const char * errMsg = ( NULL ) ; if ( fp != ( NULL ) && ( ssIsMajorTimeStep (
S ) || ! 0 ) ) { real_T t = ssGetTaskTime ( S , 0 ) ; { void * y = & _rtB ->
cn030jvlai ; errMsg = rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t ,
ssIsMajorTimeStep ( S ) , & y ) ; if ( errMsg != ( NULL ) ) {
ssSetErrorStatus ( S , errMsg ) ; return ; } } } } { void * fp = ( void * )
_rtDW -> hff405ydib . PrevTimePtr ; const char * errMsg = ( NULL ) ; if ( fp
!= ( NULL ) && ( ssIsMajorTimeStep ( S ) || ! 0 ) ) { real_T t =
ssGetTaskTime ( S , 0 ) ; { void * y = & _rtB -> giftgazbki ; errMsg =
rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t , ssIsMajorTimeStep ( S
) , & y ) ; if ( errMsg != ( NULL ) ) { ssSetErrorStatus ( S , errMsg ) ;
return ; } } } } if ( ssIsSampleHit ( S , 1 , 0 ) ) { _rtB -> ne2o4f12mj =
_rtP -> P_0 ; } _rtB -> dd433btjgv . WetTemperature = _rtB -> giftgazbki +
_rtB -> ne2o4f12mj ; { void * fp = ( void * ) _rtDW -> kjt0v52aom .
PrevTimePtr ; const char * errMsg = ( NULL ) ; if ( fp != ( NULL ) && (
ssIsMajorTimeStep ( S ) || ! 0 ) ) { real_T t = ssGetTaskTime ( S , 0 ) ; {
void * y = & _rtB -> giftgazbki ; errMsg =
rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t , ssIsMajorTimeStep ( S
) , & y ) ; if ( errMsg != ( NULL ) ) { ssSetErrorStatus ( S , errMsg ) ;
return ; } } } } _rtB -> giftgazbki += _rtB -> ne2o4f12mj ; _rtB ->
ipfjlodsb3 = muDoubleScalarSin ( _rtP -> P_3 * ssGetTaskTime ( S , 0 ) + _rtP
-> P_4 ) * _rtP -> P_1 + _rtP -> P_2 ; ssCallAccelRunBlock ( S , 0 , 9 ,
SS_CALL_MDL_OUTPUTS ) ; { void * fp = ( void * ) _rtDW -> fzlkvhfaxz .
PrevTimePtr ; const char * errMsg = ( NULL ) ; if ( fp != ( NULL ) && (
ssIsMajorTimeStep ( S ) || ! 0 ) ) { real_T t = ssGetTaskTime ( S , 0 ) ; {
void * y = & _rtB -> ipfjlodsb3 ; errMsg =
rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t , ssIsMajorTimeStep ( S
) , & y ) ; if ( errMsg != ( NULL ) ) { ssSetErrorStatus ( S , errMsg ) ;
return ; } } } } { void * fp = ( void * ) _rtDW -> bqcdujkq3l . PrevTimePtr ;
const char * errMsg = ( NULL ) ; if ( fp != ( NULL ) && ( ssIsMajorTimeStep (
S ) || ! 0 ) ) { real_T t = ssGetTaskTime ( S , 0 ) ; { void * y = & _rtB ->
etcme0vyca ; errMsg = rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t ,
ssIsMajorTimeStep ( S ) , & y ) ; if ( errMsg != ( NULL ) ) {
ssSetErrorStatus ( S , errMsg ) ; return ; } } } } { void * fp = ( void * )
_rtDW -> jwjpcqigwa . PrevTimePtr ; const char * errMsg = ( NULL ) ; if ( fp
!= ( NULL ) && ( ssIsMajorTimeStep ( S ) || ! 0 ) ) { real_T t =
ssGetTaskTime ( S , 0 ) ; { void * y = & _rtB -> i1f1ilxgag [ 0 ] ; errMsg =
rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t , ssIsMajorTimeStep ( S
) , & y ) ; if ( errMsg != ( NULL ) ) { ssSetErrorStatus ( S , errMsg ) ;
return ; } } } } if ( ssIsSampleHit ( S , 1 , 0 ) ) { _rtB -> fb2diq3blu =
_rtP -> P_5 ; _rtB -> isdyl5dg15 = _rtP -> P_6 ; ssCallAccelRunBlock ( S , 0
, 15 , SS_CALL_MDL_OUTPUTS ) ; } enljzhh4zr_idx_0 = _rtB -> etcme0vyca * _rtB
-> i1f1ilxgag [ 0 ] * _rtB -> c12xjid3lt ; enljzhh4zr_idx_1 = _rtB ->
etcme0vyca * _rtB -> i1f1ilxgag [ 1 ] * _rtB -> c12xjid3lt ; enljzhh4zr_idx_2
= _rtB -> etcme0vyca * _rtB -> i1f1ilxgag [ 2 ] * _rtB -> c12xjid3lt ; if (
ssIsSampleHit ( S , 1 , 0 ) ) { _rtB -> mahynmclff [ 0 ] = _rtP -> P_7 [ 0 ]
; _rtB -> mahynmclff [ 1 ] = _rtP -> P_7 [ 1 ] ; _rtB -> mahynmclff [ 2 ] =
_rtP -> P_7 [ 2 ] ; } oh44davnny_p = ( enljzhh4zr_idx_0 * _rtB -> mahynmclff
[ 0 ] + enljzhh4zr_idx_1 * _rtB -> mahynmclff [ 1 ] ) + enljzhh4zr_idx_2 *
_rtB -> mahynmclff [ 2 ] ; { void * fp = ( void * ) _rtDW -> p4u4cawejw .
PrevTimePtr ; const char * errMsg = ( NULL ) ; if ( fp != ( NULL ) && (
ssIsMajorTimeStep ( S ) || ! 0 ) ) { real_T t = ssGetTaskTime ( S , 0 ) ; {
void * y = & _rtB -> etcme0vyca ; errMsg =
rtwMatFileLoaderCollectionGetOutput ( 1 , fp , 0 , t , ssIsMajorTimeStep ( S
) , & y ) ; if ( errMsg != ( NULL ) ) { ssSetErrorStatus ( S , errMsg ) ;
return ; } } } } _rtB -> dd433btjgv . WindSpeed = _rtB -> do0agf5kgu ; _rtB
-> dd433btjgv . WindDirection = _rtB -> kp3i4noxif ; _rtB -> dd433btjgv .
Humidity = _rtB -> cn030jvlai ; _rtB -> dd433btjgv . DryTemperature = _rtB ->
giftgazbki ; _rtB -> dd433btjgv . GlobalSolarIrradiance = _rtB -> ipfjlodsb3
; _rtB -> dd433btjgv . GlobalSolarIrradianceSimulated = oh44davnny_p + _rtB
-> etcme0vyca ; _rtB -> dd433btjgv . DirrectSolarIrradianceVector [ 0 ] =
enljzhh4zr_idx_0 ; _rtB -> dd433btjgv . DirrectSolarIrradianceVector [ 1 ] =
enljzhh4zr_idx_1 ; _rtB -> dd433btjgv . DirrectSolarIrradianceVector [ 2 ] =
enljzhh4zr_idx_2 ; _rtB -> dd433btjgv . DiffuseSolarIrradiance = _rtB ->
etcme0vyca ; ssCallAccelRunBlock ( S , 0 , 22 , SS_CALL_MDL_OUTPUTS ) ;
ssCallAccelRunBlock ( S , 0 , 23 , SS_CALL_MDL_OUTPUTS ) ; UNUSED_PARAMETER (
tid ) ; }
#define MDL_UPDATE
static void mdlUpdate ( SimStruct * S , int_T tid ) { UNUSED_PARAMETER ( tid
) ; } static void mdlInitializeSizes ( SimStruct * S ) { ssSetChecksumVal ( S
, 0 , 3213778070U ) ; ssSetChecksumVal ( S , 1 , 345203716U ) ;
ssSetChecksumVal ( S , 2 , 1098553979U ) ; ssSetChecksumVal ( S , 3 ,
2534365608U ) ; { mxArray * slVerStructMat = NULL ; mxArray * slStrMat =
mxCreateString ( "simulink" ) ; char slVerChar [ 10 ] ; int status =
mexCallMATLAB ( 1 , & slVerStructMat , 1 , & slStrMat , "ver" ) ; if ( status
== 0 ) { mxArray * slVerMat = mxGetField ( slVerStructMat , 0 , "Version" ) ;
if ( slVerMat == NULL ) { status = 1 ; } else { status = mxGetString (
slVerMat , slVerChar , 10 ) ; } } mxDestroyArray ( slStrMat ) ;
mxDestroyArray ( slVerStructMat ) ; if ( ( status == 1 ) || ( strcmp (
slVerChar , "8.5" ) != 0 ) ) { return ; } } ssSetOptions ( S ,
SS_OPTION_EXCEPTION_FREE_CODE ) ; if ( ssGetSizeofDWork ( S ) != sizeof (
lf50em4din ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal DWork sizes do "
"not match for accelerator mex file." ) ; } if ( ssGetSizeofGlobalBlockIO ( S
) != sizeof ( be1bpnqtu5 ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal BlockIO sizes do "
"not match for accelerator mex file." ) ; } if ( ssGetSizeofY ( S ) != sizeof
( ga1va3awxb ) ) { static char msg [ 256 ] ; sprintf ( msg ,
"Unexpected error: Internal ExternalOutputs sizes do "
"not match for accelerator mex file." ) ; } { int ssSizeofParams ;
ssGetSizeofParams ( S , & ssSizeofParams ) ; if ( ssSizeofParams != sizeof (
fvbhztin3n ) ) { static char msg [ 256 ] ; sprintf ( msg ,
"Unexpected error: Internal Parameters sizes do "
"not match for accelerator mex file." ) ; } } _ssSetDefaultParam ( S , (
real_T * ) & n0w0chivbi ) ; } static void mdlInitializeSampleTimes (
SimStruct * S ) { } static void mdlTerminate ( SimStruct * S ) { }
#include "simulink.c"
