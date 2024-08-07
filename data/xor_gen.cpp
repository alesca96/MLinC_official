#define XOR_GEN_H
#define NN_IMPLEMENTATION
#include "..\include\nn.h"

/* Macros: */
#define BITS 4

int main()
{
    /* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
    /* Dataset for training: */
    Mat t = mat_alloc(4, 3);

    for (size_t i = 0; i < 2; ++i)
    {
        for (size_t j = 0; j < 2; ++j)
        {
            size_t row = i * 2 + j;
            el(t, row, 0) = i;
            el(t, row, 1) = j;
            el(t, row, 2) = i ^ j;
        }
    }

    // Save all data
    const char *out_file_path = "./xor.mat";
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
