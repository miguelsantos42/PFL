def is_prime(x):
  if x == 2: 
    return True
  for i in range(x-1, 1, -1):
    if x % i == 0:
      return False
  return True
  