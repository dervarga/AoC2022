import array as arr

filename = 'input.txt'


# def intersect():
#    a = {1, 2, 3}
#    b = {1, 2, 3, 5, 6}
#    c = {6}
#    print(a.issubset(b))
#    print(b.issubset(a))
#    print(c.issubset(b))

def create_parts(line):
    stripped = line.rstrip()
    parts = stripped.split(',')
    a1 = parts[0]
    a2 = parts[1]
    a1_start, a1_end = a1.split('-')
    a2_start, a2_end = a2.split('-')
    a1_start_num, a1_end_num = int(a1_start), int(a1_end)
    a2_start_num, a2_end_num = int(a2_start), int(a2_end)
    a1_set = set(range(a1_start_num, a1_end_num))
    a2_set = set(range(a2_start_num, a2_end_num))
    return [a1_start_num, a1_end_num, a2_start_num, a2_end_num, a1_set, a2_set]


def camp_cleanup():
    intersected = 0
    overlapped = 0
    part_two_overlapped = 0
    with open(filename) as file:
        for line in file:
            a1_start_num, \
                a1_end_num, \
                a2_start_num, \
                a2_end_num, \
                a1_set, \
                a2_set = create_parts(line)
            intersected_a = a1_start_num >= a2_start_num and a1_end_num <= a2_end_num
            intersected_b = a2_start_num >= a1_start_num and a2_end_num <= a1_end_num
            is_intersected = intersected_a or intersected_b

            is_overlapped = a1_end_num >= a2_start_num and a1_start_num <= a2_end_num

            if is_intersected:
                intersected += 1

            if is_overlapped:
                overlapped += 1

    print(overlapped, intersected)

    file.close()


camp_cleanup()
# intersect()
