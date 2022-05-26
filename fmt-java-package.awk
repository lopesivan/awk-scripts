#!/usr/bin/awk -f

# echo www.42algoritmos.com.br |awk -F. -f fmt-java-package.awk
# br.com._42algoritmos

##DEBUG
#BEGIN { printf("%s\n", "=== Legalizing Package Names ===")}
{
  # -F'.''
  # n = split($0, v)
  n = split($0, v,".")
  k = 0

  for (i in v)
  {
    if(v[i]=="www")
    {
      k=1
      continue
    }

    if(v[i] ~ /^[0-9]/)
    {
      v[i] ="_"v[i]""
    }

  }

  for (i=n; i>k; i--)
  {
    printf "%s", v[i]

    if (i>k+1)
      printf "%s", "."
  }
  print ""
}

##DEBUG
#END { printf "%s: \n", "Package Name Prefix"}
