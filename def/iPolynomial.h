#ifndef I_POLYNOMIAL_H
#define I_POLYNOMIAL_H
#include <string>

using namespace std;

class iPolynomial{

public:
    // An operation to get the degree (G) of the polynomial form
    virtual unsigned int getDegree(void) const = 0;

    // An operation to get the coefficient of the k-th term (ak)
    virtual unsigned int getCoeficient(unsigned int ) const = 0;

    // An operation to set the coefficient of the k-th term (ak)
    virtual void setCoeficient(const unsigned int , const int ) = 0;

    // An operation to evaluate the polynomial form for a specific value of X
    virtual double evaluate(const double ) const = 0;

    // An operation to check the equality of two polynomial forms
    virtual bool isEqual(const iPolynomial &) const = 0;

    // An operation to generate a string with the polynomial form
    virtual string print(void) const = 0;

    // An operation to sum to the polynomial form another polynomial form (q)
    virtual iPolynomial& sum(const iPolynomial &) const = 0;

    // Overload Operator
    virtual iPolynomial& operator+= (const iPolynomial &) const = 0;

protected:

};
#endif