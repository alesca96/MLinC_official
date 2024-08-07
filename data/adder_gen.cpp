#define ADDER_GEN_H
#define NN_IMPLEMENTATION
#include "..\include\nn.h"

/* Macros: */
#define BITS 4

int main()
{
    /* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
    /* Dataset for training: */
    size_t n = (1 << BITS);
    size_t rows = n * n;
    Mat t = mat_alloc(rows, 2 * BITS + BITS + 1);
    Mat ti = {0};
    ti.es = &el(t, 0, 0); // mat_alloc(rows, 2 * BITS);
    ti.rows = t.rows;
    ti.cols = BITS + 1;
    ti.stride = t.stride;

    Mat to = {0};
    to.es = &el(t, 0, 2 * BITS); // mat_alloc(rows, BITS + 1);
    to.rows = t.rows;
    to.cols = 2 * BITS;
    to.stride = t.stride;

    for (size_t i = 0; i < ti.rows; ++i)
    {
        size_t x = i / n;
        size_t y = i % n;
        size_t z = x + y;
        for (size_t j = 0; j < BITS; ++j)
        {
            el(ti, i, j) = (x >> j) & 1;
            el(ti, i, j + BITS) = (y >> j) & 1;
            el(to, i, j) = (z >> j) & 1;
        }
        el(to, i, BITS) = z >= n;
    }
    // Save all data
    const char *out_file_path = "./adder.mat";
    FILE *out = fopen(out_file_path, "wb");
    if (out == NULL)
    {
        fprintf(stderr, "ERROR: could not open file %s\n", out_file_path);
        return 1;
    }
    mat_save(out, t);
    fclose(out);
    printf("Generated %s.\n", out_file_path);

    return 0;
}
