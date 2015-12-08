print sum(len(s[:-1]) - len(eval(s)) for s in open('input.txt'))
print sum(2+s.count('\\')+s.count('"') for s in open('input.txt'))