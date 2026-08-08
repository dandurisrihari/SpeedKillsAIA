#!/usr/bin/env python3

import unittest

from src.kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestDynamicBaselineInstrumentation(unittest.TestCase):
    def test_functions_emit_one_time_dynamic_baseline_probes(self):
        source_code = """\
static int first_function(void) {
    return 1;
}

static void second_function(void)
{
    first_function();
}
"""
        instrumenter = KernelInstrumenter(enabled_types={'functions'})

        instrumented_code = instrumenter.instrument_code(source_code, 'functions')

        self.assertIn(
            'static int first_function(void) {\n'
            '    printk_once(KERN_INFO "[Dynamic Baseline] first_function\\n");',
            instrumented_code,
        )
        self.assertIn(
            'static void second_function(void)\n{\n'
            '    printk_once(KERN_INFO "[Dynamic Baseline] second_function\\n");',
            instrumented_code,
        )
        self.assertEqual(instrumented_code.count('[Dynamic Baseline]'), 2)

        reinstrumented_code = instrumenter.instrument_code(instrumented_code, 'functions')
        self.assertEqual(reinstrumented_code.count('[Dynamic Baseline]'), 2)


if __name__ == '__main__':
    unittest.main()