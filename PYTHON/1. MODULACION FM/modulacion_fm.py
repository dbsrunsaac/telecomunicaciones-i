# librerias
import numpy as np
import scipy.fftpack as fourier
import matplotlib.pyplot as plt
import scipy.io.wavfile as waves
import winsound


# Escala de tiempo
Ts = 0.001
Fs = 1/Ts
n = Ts*np.arange(0, 32)

#  Definiendo la señal
a = 2
fm = 60

print(1/fm)

wm = 2*np.pi*fm
ft = a*np.sin(wm*n)

plt.plot(n, ft)
plt.title("Señal de tiempo")
plt.xlabel("Tiempo")
plt.ylabel("Voltaje")
plt.show()


# %matplotlib inline
# La transformada de Fourier
fz = fourier.fft(ft)
M_fz = abs(fz)

# Definimos el Vector de Frecuencias
f = Fs*np.arange(0, len(ft)) / len(ft)  

plt.stem(f, M_fz)
plt.xlabel("Frecuencia")
plt.ylabel("Amplitud")
plt.show()

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 2*np.pi, 100)
y1 = np.sin(x)
y2 = np.cos(x)

plt.plot(x, y1, label='Seno')
plt.plot(x, y2, label='Coseno')

plt.title("Funciones seno y coseno")
plt.xlabel("x")
plt.ylabel("Amplitud")
plt.legend()
plt.grid()
plt.show()

