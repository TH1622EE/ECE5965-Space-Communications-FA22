# ECE 5965 - Introduction to Space Communications - Project 2

## Convolutional Encoding and Decoding

### Convolutional Coding Notation

Convolutional coding (CC) uses the notation $CC(n,k,K) = CC(n,k,L)$, where:

    n = the # of output bits
    k = the # of input bits
    K = the number of bits the encoder uses to encode n bits

The code rate (n/k) is the number of bits shifted into the register at every discrete interval divided by the number of bits produced at the output as a result of the coding sequence.

The constraint length (K) is the number of k-bit shifts that a single bit can influence in the encoder output. Simply put, constraint length is the number of bits that the encoder uses to encode n bits.

Parity equations are produced by using the total number of encoded data bits within our constraing length (K) of the input stream as the arguments of a generator polynomial g(x[n], x[n-1], x[n-2], ...) which are used to "generate" the parity equations. The number of parity equations is equivalent to the number of output bits (n). Therefore, for a convolutional configuration of (n,k,K) = (2,1,3), we would need two (2) parity equations. For example, if we selected g(1,1,1) and g(1,1,0), the corresponding polynomial equations would be:

$$P_0[n] = x[n] \oplus x[n-1] \oplus x[n-2]$$

$$P_1[n] = x[n] \oplus x[n-1]$$

Furthermore, it is important to note that having greater separation between the values of the generator polynomials will provide the best results. For example, (1,1,1) of a 3-bit binary sequence would translate to a decimal value of 7, and (1,1,0) of a 3-bit binary sequence would translate to a decimal value of 6. This would imply a convolutional code (CC) configuration of (7,6) relative to our generator polynomials. If we were to modify the second generator polynomial arguments to (1,0,1), this would translate to a decimal value of 5, which would give us a CC configuration of (7,5) relative to our generator polynomials, which would also provide better results.

### Example of Transition Table

The following is an example of a transition table having a convolutional configuration of (2,1,3) using generator polynomial configurations of $G_1(1,1,1)$ and $G_2(1,1,0)$ to determine the parity equations used, and the output pair \textit{(n)} for every possible state for an input of 1 or 0 for each state:

| Input Bit | Input State   | Output State  | Output Bits |
| :--       | :--           | :--           | :--         |
| $k_i$     | $S_0 S_1 S_2$ | $S_0 S_1 S_2$ | $n_1 n_2$   |
| 0         | 000           | 000           | 00          |
| 1         | 000           | 100           | 11          |
| 0         | 001           | 000           | 00          |
| 1         | 001           | 100           | 11          |
| 0         | 010           | 001           | 10          |
| 1         | 010           | 101           | 01          |
| 0         | 011           | 001           | 10          |
| 1         | 011           | 101           | 01          |
| 0         | 100           | 010           | 11          |
| 1         | 100           | 110           | 00          |
| 0         | 101           | 010           | 11          |
| 1         | 101           | 110           | 00          |
| 0         | 110           | 011           | 01          |
| 1         | 110           | 111           | 10          |
| 0         | 111           | 011           | 01          |
| 1         | 111           | 111           | 10          |

It is important to note that when using the $\oplus$ operation on more than two bits, IFF **all of an odd number of bits** are true, the value is returned true (1). In Computer Science this is known as exclusive disjunction, and it is used to determine if there is an odd number of 1 bits, which is the parity bit returned by a parity function (such as in this case).

### Convolutional Encoder/Decoder Design Considerations

The greater the value of n (output bits) the greater the resilience of bit errors, but the trade-off is that a proportionally higher amount of communications bandwidth is required for coding overhead. In practice, it is ideal to select the lowest value of n and L possible while providing a low-enough probability of bit error.

## Instructor Assigned Questions

### Questions Specific to the Convolutional Encoder

1. This code has a constraint length of 9. What is meant by the constraint length of a
convolutional code.
2. How many memory elements are used to implement a constraint length, K, code?
3. What is the polynomial representation for this code (show your work)?
4. What is the minimum free distance of this code (see the references)?
5. What are the bounds on the coding gain of this code using the minimum free
distance?
6. Assume the data rate through the encoder is at 9.6 kBPS. From your software
implementation of the encoder, approximately how many MIPS would be needed to implement
this coder in software (show how you arrived at this estimate)?

### Questions specific to the Convolutional Decoder

1. Assume the data rate through the decoder is at 9.6 kBPS. From your software
implementation of the decoder, approximately how many MIPS would be needed to implement
this coder in software (show how you arrived at this estimate)?
2. For the uncoded system, what theoretical SNR is needed to achieve a BER of 10^-3?
You can use the plots from the lecture.
3. For the simulated system, what BER was obtained at the theoretical SNR?
4. For the simulated system, what SNR was needed to obtain a BER of 10^-3?
5. How many samples were processed in obtaining your BER results. How did you
arrive at this number of samples (see above)?
6. What is the coding gain from your simulation results? How does this coding gain
compare to the theoretical value? What coding gain is achieved with hard decisions?
