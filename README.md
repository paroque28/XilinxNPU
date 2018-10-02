## Red Neural Simple

# Ejecucion 

```bash
    octave main.m
```
# Configuracion
Modifique las varibles que estan el el archivo main.
 ```octave
    numClasses = 3 
    NumNeuron=4
    lambda = 1 % salto de lambdas
    threshold = 0.0001 % condicion de parada
    total = 1000
    batchproportion = 1 % batchsize en porcentaje
    batchSize = total*batchproportion
    style = "horizontal" %estilo de grafico
 ```