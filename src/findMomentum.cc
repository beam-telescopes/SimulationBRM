#ifndef MEASUREMENT_H
#include "../include/measurement.h"
#endif

int main(int argc, char *argv[]){

  double target = 0.07784;
  double current = 1400.;

  if (argc==3) {
    target=atof(argv[1]);
    current=atof(argv[2]);
  }else{
    cout << "Usage:" << endl << "./findMomentum [deflection angle in radian] [magnet current in A]" << endl;
    return 0;
  }

    

  Measurement meas(current, target);

  meas.findMomentum();
  cout << "The momentum was: " << meas.getMomentum() << endl;

}
