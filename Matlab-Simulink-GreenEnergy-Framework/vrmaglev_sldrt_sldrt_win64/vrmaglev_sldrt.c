/*
 * vrmaglev_sldrt.c
 *
 * Code generation for model "vrmaglev_sldrt".
 *
 * Model version              : 1.161
 * Simulink Coder version : 9.4 (R2020b) 29-Jul-2020
 * C source code generated on : Tue Feb  9 20:54:50 2021
 *
 * Target selection: sldrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "vrmaglev_sldrt.h"
#include "vrmaglev_sldrt_private.h"
#include "vrmaglev_sldrt_dt.h"

/* list of Simulink Desktop Real-Time timers */
const int SLDRTTimerCount = 1;
const double SLDRTTimers[2] = {
  0.001, 0.0,
};

/* Block signals (default storage) */
B_vrmaglev_sldrt_T vrmaglev_sldrt_B;

/* Continuous states */
X_vrmaglev_sldrt_T vrmaglev_sldrt_X;

/* Block states (default storage) */
DW_vrmaglev_sldrt_T vrmaglev_sldrt_DW;

/* Real-time model */
static RT_MODEL_vrmaglev_sldrt_T vrmaglev_sldrt_M_;
RT_MODEL_vrmaglev_sldrt_T *const vrmaglev_sldrt_M = &vrmaglev_sldrt_M_;
static void rate_scheduler(void);

/*
 *   This function updates active task flag for each subrate.
 * The function is called at model base rate, hence the
 * generated code self-manages all its subrates.
 */
static void rate_scheduler(void)
{
  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   */
  (vrmaglev_sldrt_M->Timing.TaskCounters.TID[2])++;
  if ((vrmaglev_sldrt_M->Timing.TaskCounters.TID[2]) > 19) {/* Sample time: [0.02s, 0.0s] */
    vrmaglev_sldrt_M->Timing.TaskCounters.TID[2] = 0;
  }

  vrmaglev_sldrt_M->Timing.sampleHits[2] =
    (vrmaglev_sldrt_M->Timing.TaskCounters.TID[2] == 0);
  (vrmaglev_sldrt_M->Timing.TaskCounters.TID[3])++;
  if ((vrmaglev_sldrt_M->Timing.TaskCounters.TID[3]) > 99) {/* Sample time: [0.1s, 0.0s] */
    vrmaglev_sldrt_M->Timing.TaskCounters.TID[3] = 0;
  }

  vrmaglev_sldrt_M->Timing.sampleHits[3] =
    (vrmaglev_sldrt_M->Timing.TaskCounters.TID[3] == 0);
}

/*
 * This function updates continuous states using the ODE5 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE5_A[6] = {
    1.0/5.0, 3.0/10.0, 4.0/5.0, 8.0/9.0, 1.0, 1.0
  };

  static const real_T rt_ODE5_B[6][6] = {
    { 1.0/5.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

    { 3.0/40.0, 9.0/40.0, 0.0, 0.0, 0.0, 0.0 },

    { 44.0/45.0, -56.0/15.0, 32.0/9.0, 0.0, 0.0, 0.0 },

    { 19372.0/6561.0, -25360.0/2187.0, 64448.0/6561.0, -212.0/729.0, 0.0, 0.0 },

    { 9017.0/3168.0, -355.0/33.0, 46732.0/5247.0, 49.0/176.0, -5103.0/18656.0,
      0.0 },

    { 35.0/384.0, 0.0, 500.0/1113.0, 125.0/192.0, -2187.0/6784.0, 11.0/84.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE5_IntgData *id = (ODE5_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T *f3 = id->f[3];
  real_T *f4 = id->f[4];
  real_T *f5 = id->f[5];
  real_T hB[6];
  int_T i;
  int_T nXc = 5;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  vrmaglev_sldrt_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE5_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[0]);
  rtsiSetdX(si, f1);
  vrmaglev_sldrt_output();
  vrmaglev_sldrt_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE5_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[1]);
  rtsiSetdX(si, f2);
  vrmaglev_sldrt_output();
  vrmaglev_sldrt_derivatives();

  /* f(:,4) = feval(odefile, t + hA(3), y + f*hB(:,3), args(:)(*)); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE5_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[2]);
  rtsiSetdX(si, f3);
  vrmaglev_sldrt_output();
  vrmaglev_sldrt_derivatives();

  /* f(:,5) = feval(odefile, t + hA(4), y + f*hB(:,4), args(:)(*)); */
  for (i = 0; i <= 3; i++) {
    hB[i] = h * rt_ODE5_B[3][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
                   f3[i]*hB[3]);
  }

  rtsiSetT(si, t + h*rt_ODE5_A[3]);
  rtsiSetdX(si, f4);
  vrmaglev_sldrt_output();
  vrmaglev_sldrt_derivatives();

  /* f(:,6) = feval(odefile, t + hA(5), y + f*hB(:,5), args(:)(*)); */
  for (i = 0; i <= 4; i++) {
    hB[i] = h * rt_ODE5_B[4][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
                   f3[i]*hB[3] + f4[i]*hB[4]);
  }

  rtsiSetT(si, tnew);
  rtsiSetdX(si, f5);
  vrmaglev_sldrt_output();
  vrmaglev_sldrt_derivatives();

  /* tnew = t + hA(6);
     ynew = y + f*hB(:,6); */
  for (i = 0; i <= 5; i++) {
    hB[i] = h * rt_ODE5_B[5][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
                   f3[i]*hB[3] + f4[i]*hB[4] + f5[i]*hB[5]);
  }

  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

real_T rt_powd_snf(real_T u0, real_T u1)
{
  real_T tmp;
  real_T tmp_0;
  real_T y;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = (rtNaN);
  } else {
    tmp = fabs(u0);
    tmp_0 = fabs(u1);
    if (rtIsInf(u1)) {
      if (tmp == 1.0) {
        y = 1.0;
      } else if (tmp > 1.0) {
        if (u1 > 0.0) {
          y = (rtInf);
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = (rtInf);
      }
    } else if (tmp_0 == 0.0) {
      y = 1.0;
    } else if (tmp_0 == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > floor(u1))) {
      y = (rtNaN);
    } else {
      y = pow(u0, u1);
    }
  }

  return y;
}

/* Model output function */
void vrmaglev_sldrt_output(void)
{
  real_T tmp;
  real_T u1;
  real_T u2;
  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M)) {
    /* set solver stop time */
    if (!(vrmaglev_sldrt_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&vrmaglev_sldrt_M->solverInfo,
                            ((vrmaglev_sldrt_M->Timing.clockTickH0 + 1) *
        vrmaglev_sldrt_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&vrmaglev_sldrt_M->solverInfo,
                            ((vrmaglev_sldrt_M->Timing.clockTick0 + 1) *
        vrmaglev_sldrt_M->Timing.stepSize0 +
        vrmaglev_sldrt_M->Timing.clockTickH0 *
        vrmaglev_sldrt_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(vrmaglev_sldrt_M)) {
    vrmaglev_sldrt_M->Timing.t[0] = rtsiGetT(&vrmaglev_sldrt_M->solverInfo);
  }

  /* SignalGenerator: '<Root>/Signal Generator' */
  tmp = vrmaglev_sldrt_P.SignalGenerator_Frequency * vrmaglev_sldrt_M->Timing.t
    [0];
  if (tmp - floor(tmp) >= 0.5) {
    /* SignalGenerator: '<Root>/Signal Generator' */
    vrmaglev_sldrt_B.SignalGenerator =
      vrmaglev_sldrt_P.SignalGenerator_Amplitude;
  } else {
    /* SignalGenerator: '<Root>/Signal Generator' */
    vrmaglev_sldrt_B.SignalGenerator =
      -vrmaglev_sldrt_P.SignalGenerator_Amplitude;
  }

  /* End of SignalGenerator: '<Root>/Signal Generator' */

  /* Sum: '<Root>/Sum2' incorporates:
   *  Constant: '<Root>/Setpoint Offset'
   */
  vrmaglev_sldrt_B.Sum2 = vrmaglev_sldrt_P.SetpointOffset_Value +
    vrmaglev_sldrt_B.SignalGenerator;

  /* StateSpace: '<Root>/Analog Filter Design' */
  vrmaglev_sldrt_B.AnalogFilterDesign = 0.0;
  vrmaglev_sldrt_B.AnalogFilterDesign += vrmaglev_sldrt_P.AnalogFilterDesign_C *
    vrmaglev_sldrt_X.AnalogFilterDesign_CSTATE[1];

  /* Integrator: '<S3>/position' */
  /* Limited  Integrator  */
  if (vrmaglev_sldrt_X.position_CSTATE >= vrmaglev_sldrt_P.position_UpperSat) {
    vrmaglev_sldrt_X.position_CSTATE = vrmaglev_sldrt_P.position_UpperSat;
  } else {
    if (vrmaglev_sldrt_X.position_CSTATE <= vrmaglev_sldrt_P.position_LowerSat)
    {
      vrmaglev_sldrt_X.position_CSTATE = vrmaglev_sldrt_P.position_LowerSat;
    }
  }

  /* Integrator: '<S3>/position' */
  vrmaglev_sldrt_B.position = vrmaglev_sldrt_X.position_CSTATE;

  /* Fcn: '<S7>/Position sensor gain and offset' */
  vrmaglev_sldrt_B.Positionsensorgainandoffset = 1000.0 *
    vrmaglev_sldrt_B.position;

  /* Gain: '<S7>/A//D converter gain' */
  vrmaglev_sldrt_B.ADconvertergain = vrmaglev_sldrt_P.ADconvertergain_Gain *
    vrmaglev_sldrt_B.Positionsensorgainandoffset;

  /* Saturate: '<S3>/Position limits' */
  tmp = vrmaglev_sldrt_B.ADconvertergain;
  u1 = vrmaglev_sldrt_P.Positionlimits_LowerSat;
  u2 = vrmaglev_sldrt_P.Positionlimits_UpperSat;
  if (tmp > u2) {
    /* Saturate: '<S3>/Position limits' */
    vrmaglev_sldrt_B.Positionlimits = u2;
  } else if (tmp < u1) {
    /* Saturate: '<S3>/Position limits' */
    vrmaglev_sldrt_B.Positionlimits = u1;
  } else {
    /* Saturate: '<S3>/Position limits' */
    vrmaglev_sldrt_B.Positionlimits = tmp;
  }

  /* End of Saturate: '<S3>/Position limits' */
  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[1] == 0) {
    /* ZeroOrderHold: '<Root>/Zero-Order Hold' */
    vrmaglev_sldrt_B.ZeroOrderHold = vrmaglev_sldrt_B.Positionlimits;
  }

  /* ManualSwitch: '<Root>/Bypass Filter' */
  if (vrmaglev_sldrt_P.BypassFilter_CurrentSetting == 1) {
    /* ManualSwitch: '<Root>/Bypass Filter' */
    vrmaglev_sldrt_B.BypassFilter = vrmaglev_sldrt_B.AnalogFilterDesign;
  } else {
    /* ManualSwitch: '<Root>/Bypass Filter' */
    vrmaglev_sldrt_B.BypassFilter = vrmaglev_sldrt_B.ZeroOrderHold;
  }

  /* End of ManualSwitch: '<Root>/Bypass Filter' */
  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[2] == 0) {
  }

  /* Switch: '<S1>/Ball Presence Detection Value > Threshold = Ball Not Present' */
  if (vrmaglev_sldrt_B.BypassFilter >=
      vrmaglev_sldrt_P.BallPresenceDetectionValueThresholdBallNotPresent_Threshold)
  {
    /* Switch: '<S1>/Ball Presence Detection Value > Threshold = Ball Not Present' incorporates:
     *  Constant: '<S1>/Position of  Hidden Ball'
     */
    vrmaglev_sldrt_B.BallPresenceDetectionValueThresholdBallNotPresent =
      vrmaglev_sldrt_P.PositionofHiddenBall_Value;
  } else {
    /* Switch: '<S1>/Ball Presence Detection Value > Threshold = Ball Not Present' */
    vrmaglev_sldrt_B.BallPresenceDetectionValueThresholdBallNotPresent =
      vrmaglev_sldrt_B.BypassFilter;
  }

  /* End of Switch: '<S1>/Ball Presence Detection Value > Threshold = Ball Not Present' */

  /* Assignment: '<S4>/Assignment' incorporates:
   *  Constant: '<S5>/Constant'
   */
  vrmaglev_sldrt_B.Assignment[0] = vrmaglev_sldrt_P.Constant_Value[0];
  vrmaglev_sldrt_B.Assignment[1] = vrmaglev_sldrt_P.Constant_Value[1];
  vrmaglev_sldrt_B.Assignment[2] = vrmaglev_sldrt_P.Constant_Value[2];

  /* Assignment: '<S4>/Assignment' */
  vrmaglev_sldrt_B.Assignment[1] =
    vrmaglev_sldrt_B.BallPresenceDetectionValueThresholdBallNotPresent;
  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[3] == 0) {
  }

  /* Sum: '<Root>/Sum' */
  vrmaglev_sldrt_B.Sum = vrmaglev_sldrt_B.Sum2 - vrmaglev_sldrt_B.BypassFilter;

  /* Gain: '<S2>/Ki' */
  vrmaglev_sldrt_B.Ki = vrmaglev_sldrt_P.DiscreteTimePID_Ki *
    vrmaglev_sldrt_B.Sum;

  /* Gain: '<S6>/Gain' */
  vrmaglev_sldrt_B.Gain = vrmaglev_sldrt_P.Ts * vrmaglev_sldrt_B.Ki;
  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[1] == 0) {
    /* UnitDelay: '<S6>/Unit Delay' */
    vrmaglev_sldrt_B.UnitDelay = vrmaglev_sldrt_DW.UnitDelay_DSTATE;
  }

  /* Sum: '<S6>/Sum' */
  vrmaglev_sldrt_B.Sum_k = vrmaglev_sldrt_B.UnitDelay + vrmaglev_sldrt_B.Gain;

  /* RelationalOperator: '<S6>/Relational operator' incorporates:
   *  Constant: '<S6>/Constant'
   */
  vrmaglev_sldrt_B.Relationaloperator = (vrmaglev_sldrt_B.Sum_k <
    vrmaglev_sldrt_P.DiscreteTimeLimitedIntegrator_upper_limit);

  /* Switch: '<S6>/Switch' */
  if (vrmaglev_sldrt_B.Relationaloperator >= vrmaglev_sldrt_P.Switch_Threshold)
  {
    /* Switch: '<S6>/Switch' */
    vrmaglev_sldrt_B.Switch = vrmaglev_sldrt_B.Sum_k;
  } else {
    /* Switch: '<S6>/Switch' incorporates:
     *  Constant: '<S6>/Constant'
     */
    vrmaglev_sldrt_B.Switch =
      vrmaglev_sldrt_P.DiscreteTimeLimitedIntegrator_upper_limit;
  }

  /* End of Switch: '<S6>/Switch' */

  /* RelationalOperator: '<S6>/Relational operator1' incorporates:
   *  Constant: '<S6>/Constant1'
   */
  vrmaglev_sldrt_B.Relationaloperator1 = (vrmaglev_sldrt_B.Switch >
    vrmaglev_sldrt_P.DiscreteTimeLimitedIntegrator_lower_limit);

  /* Switch: '<S6>/Switch1' */
  if (vrmaglev_sldrt_B.Relationaloperator1 >= vrmaglev_sldrt_P.Switch1_Threshold)
  {
    /* Switch: '<S6>/Switch1' */
    vrmaglev_sldrt_B.Switch1 = vrmaglev_sldrt_B.Switch;
  } else {
    /* Switch: '<S6>/Switch1' incorporates:
     *  Constant: '<S6>/Constant1'
     */
    vrmaglev_sldrt_B.Switch1 =
      vrmaglev_sldrt_P.DiscreteTimeLimitedIntegrator_lower_limit;
  }

  /* End of Switch: '<S6>/Switch1' */
  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[1] == 0) {
    /* UnitDelay: '<S2>/Unit Delay' */
    vrmaglev_sldrt_B.UnitDelay_b = vrmaglev_sldrt_DW.UnitDelay_DSTATE_a;
  }

  /* Sum: '<S2>/Sum3' */
  vrmaglev_sldrt_B.Sum3 = vrmaglev_sldrt_B.Sum - vrmaglev_sldrt_B.UnitDelay_b;

  /* Gain: '<S2>/Gain1' */
  tmp = 1.0 / vrmaglev_sldrt_P.Ts;

  /* Gain: '<S2>/Gain1' */
  vrmaglev_sldrt_B.Gain1 = tmp * vrmaglev_sldrt_B.Sum3;

  /* Gain: '<S2>/Kd' */
  vrmaglev_sldrt_B.Kd = vrmaglev_sldrt_P.DiscreteTimePID_Kd *
    vrmaglev_sldrt_B.Gain1;

  /* Gain: '<S2>/Kp' */
  vrmaglev_sldrt_B.Kp = vrmaglev_sldrt_P.DiscreteTimePID_Kp *
    vrmaglev_sldrt_B.Sum;

  /* Sum: '<S2>/Sum2' */
  vrmaglev_sldrt_B.Sum2_f = (vrmaglev_sldrt_B.Kd + vrmaglev_sldrt_B.Kp) +
    vrmaglev_sldrt_B.UnitDelay;

  /* Gain: '<Root>/FeedForward' */
  vrmaglev_sldrt_B.FeedForward = vrmaglev_sldrt_P.FeedForward_Gain *
    vrmaglev_sldrt_B.BypassFilter;

  /* Fcn: '<S3>/variable gap' */
  tmp = 0.006 - vrmaglev_sldrt_B.position;
  tmp = rt_powd_snf(tmp, 2.0);

  /* Fcn: '<S3>/variable gap' */
  vrmaglev_sldrt_B.variablegap = 2.16e-6 / tmp;

  /* TransferFcn: '<S3>/Power amplifier and coil' */
  vrmaglev_sldrt_B.Poweramplifierandcoil = 0.0;
  vrmaglev_sldrt_B.Poweramplifierandcoil +=
    vrmaglev_sldrt_P.Poweramplifierandcoil_C *
    vrmaglev_sldrt_X.Poweramplifierandcoil_CSTATE;

  /* Product: '<S3>/Motion force' */
  vrmaglev_sldrt_B.Motionforce = vrmaglev_sldrt_B.variablegap *
    vrmaglev_sldrt_B.Poweramplifierandcoil *
    vrmaglev_sldrt_B.Poweramplifierandcoil;

  /* Integrator: '<S3>/velocity' */
  vrmaglev_sldrt_B.velocity = vrmaglev_sldrt_X.velocity_CSTATE;

  /* DeadZone: '<S9>/Distance out of limits' */
  if (vrmaglev_sldrt_B.position > vrmaglev_sldrt_P.Distanceoutoflimits_End) {
    /* DeadZone: '<S9>/Distance out of limits' */
    vrmaglev_sldrt_B.Distanceoutoflimits = vrmaglev_sldrt_B.position -
      vrmaglev_sldrt_P.Distanceoutoflimits_End;
  } else if (vrmaglev_sldrt_B.position >=
             vrmaglev_sldrt_P.Distanceoutoflimits_Start) {
    /* DeadZone: '<S9>/Distance out of limits' */
    vrmaglev_sldrt_B.Distanceoutoflimits = 0.0;
  } else {
    /* DeadZone: '<S9>/Distance out of limits' */
    vrmaglev_sldrt_B.Distanceoutoflimits = vrmaglev_sldrt_B.position -
      vrmaglev_sldrt_P.Distanceoutoflimits_Start;
  }

  /* End of DeadZone: '<S9>/Distance out of limits' */

  /* RelationalOperator: '<S9>/Outside Limits?' incorporates:
   *  Constant: '<S9>/0'
   */
  vrmaglev_sldrt_B.OutsideLimits = (vrmaglev_sldrt_P.u_Value !=
    vrmaglev_sldrt_B.Distanceoutoflimits);

  /* Product: '<S9>/Just on//off  switch ' */
  vrmaglev_sldrt_B.Justonoffswitch = vrmaglev_sldrt_B.velocity *
    vrmaglev_sldrt_B.OutsideLimits;

  /* Gain: '<S9>/limit damping' */
  vrmaglev_sldrt_B.limitdamping = vrmaglev_sldrt_P.limitdamping_Gain *
    vrmaglev_sldrt_B.Justonoffswitch;

  /* Gain: '<S9>/limit elesticity' */
  vrmaglev_sldrt_B.limitelesticity = vrmaglev_sldrt_P.limitelesticity_Gain *
    vrmaglev_sldrt_B.Distanceoutoflimits;

  /* Sum: '<S9>/Fc1' */
  vrmaglev_sldrt_B.Fc1 = vrmaglev_sldrt_B.limitdamping +
    vrmaglev_sldrt_B.limitelesticity;

  /* Gain: '<S3>/Ball damping' */
  vrmaglev_sldrt_B.Balldamping = vrmaglev_sldrt_P.Balldamping_Gain *
    vrmaglev_sldrt_B.velocity;

  /* Sum: '<S3>/Fc' incorporates:
   *  Constant: '<S3>/Gravity force'
   */
  vrmaglev_sldrt_B.Fc = ((vrmaglev_sldrt_B.Motionforce +
    vrmaglev_sldrt_P.Gravityforce_Value) + vrmaglev_sldrt_B.Fc1) -
    vrmaglev_sldrt_B.Balldamping;

  /* Gain: '<S3>/1//m' */
  vrmaglev_sldrt_B.um = vrmaglev_sldrt_P.um_Gain * vrmaglev_sldrt_B.Fc;

  /* Sum: '<Root>/Sum1' incorporates:
   *  Constant: '<Root>/Constant'
   */
  vrmaglev_sldrt_B.Sum1 = vrmaglev_sldrt_P.Constant_Value_f -
    vrmaglev_sldrt_B.FeedForward;

  /* Product: '<Root>/Product' */
  vrmaglev_sldrt_B.Product = vrmaglev_sldrt_B.Sum2_f * vrmaglev_sldrt_B.Sum1;

  /* Saturate: '<Root>/Saturation' */
  tmp = vrmaglev_sldrt_B.Product;
  u1 = vrmaglev_sldrt_P.Saturation_LowerSat;
  u2 = vrmaglev_sldrt_P.Saturation_UpperSat;
  if (tmp > u2) {
    /* Saturate: '<Root>/Saturation' */
    vrmaglev_sldrt_B.Saturation = u2;
  } else if (tmp < u1) {
    /* Saturate: '<Root>/Saturation' */
    vrmaglev_sldrt_B.Saturation = u1;
  } else {
    /* Saturate: '<Root>/Saturation' */
    vrmaglev_sldrt_B.Saturation = tmp;
  }

  /* End of Saturate: '<Root>/Saturation' */

  /* Gain: '<S8>/D//A converter gain' */
  vrmaglev_sldrt_B.DAconvertergain = vrmaglev_sldrt_P.DAconvertergain_Gain *
    vrmaglev_sldrt_B.Saturation;

  /* Saturate: '<S8>/DA converter  saturation' */
  tmp = vrmaglev_sldrt_B.DAconvertergain;
  u1 = vrmaglev_sldrt_P.DAconvertersaturation_LowerSat;
  u2 = vrmaglev_sldrt_P.DAconvertersaturation_UpperSat;
  if (tmp > u2) {
    /* Saturate: '<S8>/DA converter  saturation' */
    vrmaglev_sldrt_B.DAconvertersaturation = u2;
  } else if (tmp < u1) {
    /* Saturate: '<S8>/DA converter  saturation' */
    vrmaglev_sldrt_B.DAconvertersaturation = u1;
  } else {
    /* Saturate: '<S8>/DA converter  saturation' */
    vrmaglev_sldrt_B.DAconvertersaturation = tmp;
  }

  /* End of Saturate: '<S8>/DA converter  saturation' */
}

/* Model update function */
void vrmaglev_sldrt_update(void)
{
  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update for UnitDelay: '<S6>/Unit Delay' */
    vrmaglev_sldrt_DW.UnitDelay_DSTATE = vrmaglev_sldrt_B.Switch1;

    /* Update for UnitDelay: '<S2>/Unit Delay' */
    vrmaglev_sldrt_DW.UnitDelay_DSTATE_a = vrmaglev_sldrt_B.Sum;
  }

  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M)) {
    rt_ertODEUpdateContinuousStates(&vrmaglev_sldrt_M->solverInfo);
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++vrmaglev_sldrt_M->Timing.clockTick0)) {
    ++vrmaglev_sldrt_M->Timing.clockTickH0;
  }

  vrmaglev_sldrt_M->Timing.t[0] = rtsiGetSolverStopTime
    (&vrmaglev_sldrt_M->solverInfo);

  {
    /* Update absolute timer for sample time: [0.001s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++vrmaglev_sldrt_M->Timing.clockTick1)) {
      ++vrmaglev_sldrt_M->Timing.clockTickH1;
    }

    vrmaglev_sldrt_M->Timing.t[1] = vrmaglev_sldrt_M->Timing.clockTick1 *
      vrmaglev_sldrt_M->Timing.stepSize1 + vrmaglev_sldrt_M->Timing.clockTickH1 *
      vrmaglev_sldrt_M->Timing.stepSize1 * 4294967296.0;
  }

  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[2] == 0) {
    /* Update absolute timer for sample time: [0.02s, 0.0s] */
    /* The "clockTick2" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick2"
     * and "Timing.stepSize2". Size of "clockTick2" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick2 and the high bits
     * Timing.clockTickH2. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++vrmaglev_sldrt_M->Timing.clockTick2)) {
      ++vrmaglev_sldrt_M->Timing.clockTickH2;
    }

    vrmaglev_sldrt_M->Timing.t[2] = vrmaglev_sldrt_M->Timing.clockTick2 *
      vrmaglev_sldrt_M->Timing.stepSize2 + vrmaglev_sldrt_M->Timing.clockTickH2 *
      vrmaglev_sldrt_M->Timing.stepSize2 * 4294967296.0;
  }

  if (rtmIsMajorTimeStep(vrmaglev_sldrt_M) &&
      vrmaglev_sldrt_M->Timing.TaskCounters.TID[3] == 0) {
    /* Update absolute timer for sample time: [0.1s, 0.0s] */
    /* The "clockTick3" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick3"
     * and "Timing.stepSize3". Size of "clockTick3" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick3 and the high bits
     * Timing.clockTickH3. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++vrmaglev_sldrt_M->Timing.clockTick3)) {
      ++vrmaglev_sldrt_M->Timing.clockTickH3;
    }

    vrmaglev_sldrt_M->Timing.t[3] = vrmaglev_sldrt_M->Timing.clockTick3 *
      vrmaglev_sldrt_M->Timing.stepSize3 + vrmaglev_sldrt_M->Timing.clockTickH3 *
      vrmaglev_sldrt_M->Timing.stepSize3 * 4294967296.0;
  }

  rate_scheduler();
}

/* Derivatives for root system: '<Root>' */
void vrmaglev_sldrt_derivatives(void)
{
  XDot_vrmaglev_sldrt_T *_rtXdot;
  boolean_T lsat;
  boolean_T usat;
  _rtXdot = ((XDot_vrmaglev_sldrt_T *) vrmaglev_sldrt_M->derivs);

  /* Derivatives for StateSpace: '<Root>/Analog Filter Design' */
  _rtXdot->AnalogFilterDesign_CSTATE[0] = 0.0;
  _rtXdot->AnalogFilterDesign_CSTATE[1] = 0.0;
  _rtXdot->AnalogFilterDesign_CSTATE[0] +=
    vrmaglev_sldrt_P.AnalogFilterDesign_A[0] *
    vrmaglev_sldrt_X.AnalogFilterDesign_CSTATE[0];
  _rtXdot->AnalogFilterDesign_CSTATE[0] +=
    vrmaglev_sldrt_P.AnalogFilterDesign_A[1] *
    vrmaglev_sldrt_X.AnalogFilterDesign_CSTATE[1];
  _rtXdot->AnalogFilterDesign_CSTATE[1] +=
    vrmaglev_sldrt_P.AnalogFilterDesign_A[2] *
    vrmaglev_sldrt_X.AnalogFilterDesign_CSTATE[0];
  _rtXdot->AnalogFilterDesign_CSTATE[0] += vrmaglev_sldrt_P.AnalogFilterDesign_B
    * vrmaglev_sldrt_B.ZeroOrderHold;

  /* Derivatives for Integrator: '<S3>/position' */
  lsat = (vrmaglev_sldrt_X.position_CSTATE <= vrmaglev_sldrt_P.position_LowerSat);
  usat = (vrmaglev_sldrt_X.position_CSTATE >= vrmaglev_sldrt_P.position_UpperSat);
  if (((!lsat) && (!usat)) || (lsat && (vrmaglev_sldrt_B.velocity > 0.0)) ||
      (usat && (vrmaglev_sldrt_B.velocity < 0.0))) {
    _rtXdot->position_CSTATE = vrmaglev_sldrt_B.velocity;
  } else {
    /* in saturation */
    _rtXdot->position_CSTATE = 0.0;
  }

  /* End of Derivatives for Integrator: '<S3>/position' */

  /* Derivatives for TransferFcn: '<S3>/Power amplifier and coil' */
  _rtXdot->Poweramplifierandcoil_CSTATE = 0.0;
  _rtXdot->Poweramplifierandcoil_CSTATE +=
    vrmaglev_sldrt_P.Poweramplifierandcoil_A *
    vrmaglev_sldrt_X.Poweramplifierandcoil_CSTATE;
  _rtXdot->Poweramplifierandcoil_CSTATE +=
    vrmaglev_sldrt_B.DAconvertersaturation;

  /* Derivatives for Integrator: '<S3>/velocity' */
  _rtXdot->velocity_CSTATE = vrmaglev_sldrt_B.um;
}

/* Model initialize function */
void vrmaglev_sldrt_initialize(void)
{
  /* InitializeConditions for StateSpace: '<Root>/Analog Filter Design' */
  vrmaglev_sldrt_X.AnalogFilterDesign_CSTATE[0] =
    vrmaglev_sldrt_P.AnalogFilterDesign_InitialCondition;
  vrmaglev_sldrt_X.AnalogFilterDesign_CSTATE[1] =
    vrmaglev_sldrt_P.AnalogFilterDesign_InitialCondition;

  /* InitializeConditions for Integrator: '<S3>/position' */
  vrmaglev_sldrt_X.position_CSTATE = vrmaglev_sldrt_P.position_IC;

  /* InitializeConditions for UnitDelay: '<S6>/Unit Delay' */
  vrmaglev_sldrt_DW.UnitDelay_DSTATE =
    vrmaglev_sldrt_P.DiscreteTimeLimitedIntegrator_X0;

  /* InitializeConditions for UnitDelay: '<S2>/Unit Delay' */
  vrmaglev_sldrt_DW.UnitDelay_DSTATE_a =
    vrmaglev_sldrt_P.UnitDelay_InitialCondition;

  /* InitializeConditions for TransferFcn: '<S3>/Power amplifier and coil' */
  vrmaglev_sldrt_X.Poweramplifierandcoil_CSTATE = 0.0;

  /* InitializeConditions for Integrator: '<S3>/velocity' */
  vrmaglev_sldrt_X.velocity_CSTATE = vrmaglev_sldrt_P.velocity_IC;
}

/* Model terminate function */
void vrmaglev_sldrt_terminate(void)
{
  /* (no terminate code required) */
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/

/* Solver interface called by GRT_Main */
#ifndef USE_GENERATED_SOLVER

void rt_ODECreateIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEDestroyIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEUpdateContinuousStates(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

#endif

void MdlOutputs(int_T tid)
{
  vrmaglev_sldrt_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  vrmaglev_sldrt_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  vrmaglev_sldrt_initialize();
}

void MdlTerminate(void)
{
  vrmaglev_sldrt_terminate();
}

/* Registration function */
RT_MODEL_vrmaglev_sldrt_T *vrmaglev_sldrt(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* non-finite (run-time) assignments */
  vrmaglev_sldrt_P.Constant_Value[0] = rtNaN;
  vrmaglev_sldrt_P.Constant_Value[1] = rtNaN;
  vrmaglev_sldrt_P.Constant_Value[2] = rtNaN;

  /* initialize real-time model */
  (void) memset((void *)vrmaglev_sldrt_M, 0,
                sizeof(RT_MODEL_vrmaglev_sldrt_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&vrmaglev_sldrt_M->solverInfo,
                          &vrmaglev_sldrt_M->Timing.simTimeStep);
    rtsiSetTPtr(&vrmaglev_sldrt_M->solverInfo, &rtmGetTPtr(vrmaglev_sldrt_M));
    rtsiSetStepSizePtr(&vrmaglev_sldrt_M->solverInfo,
                       &vrmaglev_sldrt_M->Timing.stepSize0);
    rtsiSetdXPtr(&vrmaglev_sldrt_M->solverInfo, &vrmaglev_sldrt_M->derivs);
    rtsiSetContStatesPtr(&vrmaglev_sldrt_M->solverInfo, (real_T **)
                         &vrmaglev_sldrt_M->contStates);
    rtsiSetNumContStatesPtr(&vrmaglev_sldrt_M->solverInfo,
      &vrmaglev_sldrt_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&vrmaglev_sldrt_M->solverInfo,
      &vrmaglev_sldrt_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&vrmaglev_sldrt_M->solverInfo,
      &vrmaglev_sldrt_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&vrmaglev_sldrt_M->solverInfo,
      &vrmaglev_sldrt_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&vrmaglev_sldrt_M->solverInfo, (&rtmGetErrorStatus
      (vrmaglev_sldrt_M)));
    rtsiSetRTModelPtr(&vrmaglev_sldrt_M->solverInfo, vrmaglev_sldrt_M);
  }

  rtsiSetSimTimeStep(&vrmaglev_sldrt_M->solverInfo, MAJOR_TIME_STEP);
  vrmaglev_sldrt_M->intgData.y = vrmaglev_sldrt_M->odeY;
  vrmaglev_sldrt_M->intgData.f[0] = vrmaglev_sldrt_M->odeF[0];
  vrmaglev_sldrt_M->intgData.f[1] = vrmaglev_sldrt_M->odeF[1];
  vrmaglev_sldrt_M->intgData.f[2] = vrmaglev_sldrt_M->odeF[2];
  vrmaglev_sldrt_M->intgData.f[3] = vrmaglev_sldrt_M->odeF[3];
  vrmaglev_sldrt_M->intgData.f[4] = vrmaglev_sldrt_M->odeF[4];
  vrmaglev_sldrt_M->intgData.f[5] = vrmaglev_sldrt_M->odeF[5];
  vrmaglev_sldrt_M->contStates = ((real_T *) &vrmaglev_sldrt_X);
  rtsiSetSolverData(&vrmaglev_sldrt_M->solverInfo, (void *)
                    &vrmaglev_sldrt_M->intgData);
  rtsiSetSolverName(&vrmaglev_sldrt_M->solverInfo,"ode5");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = vrmaglev_sldrt_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    mdlTsMap[2] = 2;
    mdlTsMap[3] = 3;
    vrmaglev_sldrt_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    vrmaglev_sldrt_M->Timing.sampleTimes =
      (&vrmaglev_sldrt_M->Timing.sampleTimesArray[0]);
    vrmaglev_sldrt_M->Timing.offsetTimes =
      (&vrmaglev_sldrt_M->Timing.offsetTimesArray[0]);

    /* task periods */
    vrmaglev_sldrt_M->Timing.sampleTimes[0] = (0.0);
    vrmaglev_sldrt_M->Timing.sampleTimes[1] = (0.001);
    vrmaglev_sldrt_M->Timing.sampleTimes[2] = (0.02);
    vrmaglev_sldrt_M->Timing.sampleTimes[3] = (0.1);

    /* task offsets */
    vrmaglev_sldrt_M->Timing.offsetTimes[0] = (0.0);
    vrmaglev_sldrt_M->Timing.offsetTimes[1] = (0.0);
    vrmaglev_sldrt_M->Timing.offsetTimes[2] = (0.0);
    vrmaglev_sldrt_M->Timing.offsetTimes[3] = (0.0);
  }

  rtmSetTPtr(vrmaglev_sldrt_M, &vrmaglev_sldrt_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = vrmaglev_sldrt_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    mdlSampleHits[2] = 1;
    mdlSampleHits[3] = 1;
    vrmaglev_sldrt_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(vrmaglev_sldrt_M, -1);
  vrmaglev_sldrt_M->Timing.stepSize0 = 0.001;
  vrmaglev_sldrt_M->Timing.stepSize1 = 0.001;
  vrmaglev_sldrt_M->Timing.stepSize2 = 0.02;
  vrmaglev_sldrt_M->Timing.stepSize3 = 0.1;

  /* External mode info */
  vrmaglev_sldrt_M->Sizes.checksums[0] = (2511362312U);
  vrmaglev_sldrt_M->Sizes.checksums[1] = (2423826409U);
  vrmaglev_sldrt_M->Sizes.checksums[2] = (305271173U);
  vrmaglev_sldrt_M->Sizes.checksums[3] = (767920855U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    vrmaglev_sldrt_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(vrmaglev_sldrt_M->extModeInfo,
      &vrmaglev_sldrt_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(vrmaglev_sldrt_M->extModeInfo,
                        vrmaglev_sldrt_M->Sizes.checksums);
    rteiSetTPtr(vrmaglev_sldrt_M->extModeInfo, rtmGetTPtr(vrmaglev_sldrt_M));
  }

  vrmaglev_sldrt_M->solverInfoPtr = (&vrmaglev_sldrt_M->solverInfo);
  vrmaglev_sldrt_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&vrmaglev_sldrt_M->solverInfo, 0.001);
  rtsiSetSolverMode(&vrmaglev_sldrt_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  vrmaglev_sldrt_M->blockIO = ((void *) &vrmaglev_sldrt_B);

  {
    vrmaglev_sldrt_B.SignalGenerator = 0.0;
    vrmaglev_sldrt_B.Sum2 = 0.0;
    vrmaglev_sldrt_B.AnalogFilterDesign = 0.0;
    vrmaglev_sldrt_B.position = 0.0;
    vrmaglev_sldrt_B.Positionsensorgainandoffset = 0.0;
    vrmaglev_sldrt_B.ADconvertergain = 0.0;
    vrmaglev_sldrt_B.Positionlimits = 0.0;
    vrmaglev_sldrt_B.ZeroOrderHold = 0.0;
    vrmaglev_sldrt_B.BypassFilter = 0.0;
    vrmaglev_sldrt_B.BallPresenceDetectionValueThresholdBallNotPresent = 0.0;
    vrmaglev_sldrt_B.Assignment[0] = 0.0;
    vrmaglev_sldrt_B.Assignment[1] = 0.0;
    vrmaglev_sldrt_B.Assignment[2] = 0.0;
    vrmaglev_sldrt_B.Sum = 0.0;
    vrmaglev_sldrt_B.Ki = 0.0;
    vrmaglev_sldrt_B.Gain = 0.0;
    vrmaglev_sldrt_B.UnitDelay = 0.0;
    vrmaglev_sldrt_B.Sum_k = 0.0;
    vrmaglev_sldrt_B.Relationaloperator = 0.0;
    vrmaglev_sldrt_B.Switch = 0.0;
    vrmaglev_sldrt_B.Relationaloperator1 = 0.0;
    vrmaglev_sldrt_B.Switch1 = 0.0;
    vrmaglev_sldrt_B.UnitDelay_b = 0.0;
    vrmaglev_sldrt_B.Sum3 = 0.0;
    vrmaglev_sldrt_B.Gain1 = 0.0;
    vrmaglev_sldrt_B.Kd = 0.0;
    vrmaglev_sldrt_B.Kp = 0.0;
    vrmaglev_sldrt_B.Sum2_f = 0.0;
    vrmaglev_sldrt_B.FeedForward = 0.0;
    vrmaglev_sldrt_B.variablegap = 0.0;
    vrmaglev_sldrt_B.Poweramplifierandcoil = 0.0;
    vrmaglev_sldrt_B.Motionforce = 0.0;
    vrmaglev_sldrt_B.velocity = 0.0;
    vrmaglev_sldrt_B.Distanceoutoflimits = 0.0;
    vrmaglev_sldrt_B.OutsideLimits = 0.0;
    vrmaglev_sldrt_B.Justonoffswitch = 0.0;
    vrmaglev_sldrt_B.limitdamping = 0.0;
    vrmaglev_sldrt_B.limitelesticity = 0.0;
    vrmaglev_sldrt_B.Fc1 = 0.0;
    vrmaglev_sldrt_B.Balldamping = 0.0;
    vrmaglev_sldrt_B.Fc = 0.0;
    vrmaglev_sldrt_B.um = 0.0;
    vrmaglev_sldrt_B.Sum1 = 0.0;
    vrmaglev_sldrt_B.Product = 0.0;
    vrmaglev_sldrt_B.Saturation = 0.0;
    vrmaglev_sldrt_B.DAconvertergain = 0.0;
    vrmaglev_sldrt_B.DAconvertersaturation = 0.0;
  }

  /* parameters */
  vrmaglev_sldrt_M->defaultParam = ((real_T *)&vrmaglev_sldrt_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &vrmaglev_sldrt_X;
    vrmaglev_sldrt_M->contStates = (x);
    (void) memset((void *)&vrmaglev_sldrt_X, 0,
                  sizeof(X_vrmaglev_sldrt_T));
  }

  /* states (dwork) */
  vrmaglev_sldrt_M->dwork = ((void *) &vrmaglev_sldrt_DW);
  (void) memset((void *)&vrmaglev_sldrt_DW, 0,
                sizeof(DW_vrmaglev_sldrt_T));
  vrmaglev_sldrt_DW.UnitDelay_DSTATE = 0.0;
  vrmaglev_sldrt_DW.UnitDelay_DSTATE_a = 0.0;

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    vrmaglev_sldrt_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize Sizes */
  vrmaglev_sldrt_M->Sizes.numContStates = (5);/* Number of continuous states */
  vrmaglev_sldrt_M->Sizes.numPeriodicContStates = (0);
                                      /* Number of periodic continuous states */
  vrmaglev_sldrt_M->Sizes.numY = (0);  /* Number of model outputs */
  vrmaglev_sldrt_M->Sizes.numU = (0);  /* Number of model inputs */
  vrmaglev_sldrt_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  vrmaglev_sldrt_M->Sizes.numSampTimes = (4);/* Number of sample times */
  vrmaglev_sldrt_M->Sizes.numBlocks = (55);/* Number of blocks */
  vrmaglev_sldrt_M->Sizes.numBlockIO = (45);/* Number of block outputs */
  vrmaglev_sldrt_M->Sizes.numBlockPrms = (49);/* Sum of parameter "widths" */
  return vrmaglev_sldrt_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
