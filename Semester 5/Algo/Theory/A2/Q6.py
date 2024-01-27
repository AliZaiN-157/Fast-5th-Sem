names = ['ihab', 'abid', 'afif', 'fadi', 'adib', 'hadi', 'ibad']

def radix_sort(names, index):
    if len(names) <= 1:
        return names

    buckets = [[] for _ in range(9)]
    for name in names:
        print(name, index)
        buckets[ord(name[index]) - ord('a')].append(name)
        print(buckets)

    names = []
    for bucket in buckets:
        names.extend(radix_sort(bucket, index + 1))

    return names

print(radix_sort(names, 0))





