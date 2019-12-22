# https://github.com/pytorch/pytorch/issues/2001#issuecomment-405675488
import sys
from functools import reduce

from torch.nn.modules.module import _addindent

def summary_0(model, file=sys.stderr):
    def repr(model):
        # We treat the extra repr like the sub-module, one item per line
        extra_lines = []
        extra_repr = model.extra_repr()
        # empty string will be split into list ['']
        if extra_repr:
            extra_lines = extra_repr.split('\n')
        child_lines = []
        total_params = 0
        for key, module in model._modules.items():
            mod_str, num_params = repr(module)
            mod_str = _addindent(mod_str, 2)
            child_lines.append('(' + key + '): ' + mod_str)
            total_params += num_params
        lines = extra_lines + child_lines

        # print(lines)

        for name, p in model._parameters.items():
            total_params += reduce(lambda x, y: x * y, p.shape)

        main_str = model._get_name() + '('
        if lines:
            # simple one-liner info, which most builtin Modules will use
            if len(extra_lines) == 1 and not child_lines:
                main_str += extra_lines[0]
            else:
                main_str += '\n  ' + '\n  '.join(lines) + '\n'

        main_str += ')'
        # print(main_str)

        if file is sys.stderr:
            main_str += ', \033[92m{:,}\033[0m params'.format(total_params)
        else:
            main_str += ', {:,} params'.format(total_params)
        return main_str, total_params

    string, count = repr(model)
    if file is not None:
        # pass
        print(string, file=file)
    # return count


if __name__ == "__main__":
    import numpy as np
    import torch
    from torch import nn

    N = 500  # Input size
    H = 100  # Hidden layer size
    O = 10   # Output size

    w1 = np.random.randn(N, H)
    b1 = np.random.randn(H)

    w2 = np.random.randn(H, O)
    b2 = np.random.randn(O)

    model_pt = nn.Sequential(nn.Linear(N, H),
                      nn.ReLU(),
                      nn.Linear(H, O),
                      nn.Softmax(dim=0)
                      )

    print(model_pt)

    summary_0(model_pt)    