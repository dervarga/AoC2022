import unittest
from calories import calories
# input: file, "sections" separated by empty line
# output: number, (calories the elf carrying most calories carries)


class TestScript(unittest.TestCase):
    def test_z(self):
        print("IN TEST")
        print(self)
        assert calories([]) == 0

    def test_o(self):
        assert calories([1]) == 1
        assert calories([2]) == 2

    def test_m(self):
        assert calories([1,2]) == 2
        assert calories([2,1]) == 2
