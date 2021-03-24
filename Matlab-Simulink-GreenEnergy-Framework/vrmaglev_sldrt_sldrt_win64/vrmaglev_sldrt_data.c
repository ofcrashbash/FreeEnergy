/*
 * vrmaglev_sldrt_data.c
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

/* Block parameters (default storage) */
P_vrmaglev_sldrt_T vrmaglev_sldrt_P = {
  /* Variable: Ts
   * Referenced by:
   *   '<S2>/Gain1'
   *   '<S6>/Gain'
   */
  0.001,

  /* Mask Parameter: DiscreteTimePID_Kd
   * Referenced by: '<S2>/Kd'
   */
  0.03,

  /* Mask Parameter: DiscreteTimePID_Ki
   * Referenced by: '<S2>/Ki'
   */
  10.0,

  /* Mask Parameter: DiscreteTimePID_Kp
   * Referenced by: '<S2>/Kp'
   */
  1.0,

  /* Mask Parameter: DiscreteTimeLimitedIntegrator_X0
   * Referenced by: '<S6>/Unit Delay'
   */
  0.0,

  /* Mask Parameter: DiscreteTimeLimitedIntegrator_lower_limit
   * Referenced by: '<S6>/Constant1'
   */
  0.0,

  /* Mask Parameter: DiscreteTimeLimitedIntegrator_upper_limit
   * Referenced by: '<S6>/Constant'
   */
  2.0,

  /* Expression: 0.5
   * Referenced by: '<Root>/Setpoint Offset'
   */
  0.5,

  /* Expression: 0.2
   * Referenced by: '<Root>/Signal Generator'
   */
  0.2,

  /* Computed Parameter: SignalGenerator_Frequency
   * Referenced by: '<Root>/Signal Generator'
   */
  0.79577471545947676,

  /* Computed Parameter: AnalogFilterDesign_A
   * Referenced by: '<Root>/Analog Filter Design'
   */
  { -888.57658763167319, -628.31853071795865, 628.31853071795865 },

  /* Computed Parameter: AnalogFilterDesign_B
   * Referenced by: '<Root>/Analog Filter Design'
   */
  628.31853071795865,

  /* Computed Parameter: AnalogFilterDesign_C
   * Referenced by: '<Root>/Analog Filter Design'
   */
  1.0,

  /* Expression: 0
   * Referenced by: '<Root>/Analog Filter Design'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S3>/position'
   */
  0.0,

  /* Expression: 0.005
   * Referenced by: '<S3>/position'
   */
  0.005,

  /* Expression: 0
   * Referenced by: '<S3>/position'
   */
  0.0,

  /* Expression: 0.2
   * Referenced by: '<S7>/A//D converter gain'
   */
  0.2,

  /* Expression: 0.998
   * Referenced by: '<S3>/Position limits'
   */
  0.998,

  /* Expression: 0
   * Referenced by: '<S3>/Position limits'
   */
  0.0,

  /* Expression: NaN+zeros(1,outwidth)
   * Referenced by: '<S5>/Constant'
   */
  { 0.0, 0.0, 0.0 },

  /* Expression: -0.5
   * Referenced by: '<S1>/Position of  Hidden Ball'
   */
  -0.5,

  /* Expression: 0.998
   * Referenced by: '<S1>/Ball Presence Detection Value > Threshold = Ball Not Present'
   */
  0.998,

  /* Expression: 1
   * Referenced by: '<Root>/Constant'
   */
  1.0,

  /* Expression: 0.5
   * Referenced by: '<S6>/Switch'
   */
  0.5,

  /* Expression: 0.5
   * Referenced by: '<S6>/Switch1'
   */
  0.5,

  /* Expression: 0
   * Referenced by: '<S2>/Unit Delay'
   */
  0.0,

  /* Expression: 0.94
   * Referenced by: '<Root>/FeedForward'
   */
  0.94,

  /* Computed Parameter: Poweramplifierandcoil_A
   * Referenced by: '<S3>/Power amplifier and coil'
   */
  -333.33333333333331,

  /* Computed Parameter: Poweramplifierandcoil_C
   * Referenced by: '<S3>/Power amplifier and coil'
   */
  99.999999999999986,

  /* Expression: -0.082
   * Referenced by: '<S3>/Gravity force'
   */
  -0.082,

  /* Expression: 0
   * Referenced by: '<S3>/velocity'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S9>/0'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S9>/Distance out of limits'
   */
  0.0,

  /* Expression: 0.005
   * Referenced by: '<S9>/Distance out of limits'
   */
  0.005,

  /* Expression: 34
   * Referenced by: '<S9>/limit damping'
   */
  34.0,

  /* Expression: 3.3e5
   * Referenced by: '<S9>/limit elesticity'
   */
  330000.0,

  /* Expression: 0.02
   * Referenced by: '<S3>/Ball damping'
   */
  0.02,

  /* Expression: 1/0.00837
   * Referenced by: '<S3>/1//m'
   */
  119.47431302270012,

  /* Expression: 1
   * Referenced by: '<Root>/Saturation'
   */
  1.0,

  /* Expression: 0
   * Referenced by: '<Root>/Saturation'
   */
  0.0,

  /* Expression: 5
   * Referenced by: '<S8>/D//A converter gain'
   */
  5.0,

  /* Expression: 5
   * Referenced by: '<S8>/DA converter  saturation'
   */
  5.0,

  /* Expression: -5
   * Referenced by: '<S8>/DA converter  saturation'
   */
  -5.0,

  /* Computed Parameter: BypassFilter_CurrentSetting
   * Referenced by: '<Root>/Bypass Filter'
   */
  1U
};
