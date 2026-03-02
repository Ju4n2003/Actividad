defmodule SaludoHora do
  @moduledoc """
  Módulo que solicita el nombre del usuario y genera un saludo
  dependiendo de la hora actual del sistema.

  El saludo cambia según el siguiente rango horario:
    - 00:00 - 11:59 = Buenos días
    - 12:00 - 17:59 = Buenas tardes
    - 18:00 - 23:59 = Buenas noches

  """
  @doc """
  Función principal del programa.
  Solicita el nombre del usuario, genera el saludo correspondiente
  según la hora actual y lo muestra en pantalla.
  """
  def main do
    "Ingrese su nombre: "
    |> Util.ingresar(:texto)
    |> generar_saludo()
    |> Util.mostrar_mensaje()
  end

  @doc """
  Genera un saludo personalizado según la hora actual.
  ## Parámetros

    - nombre: El nombre del usuario para personalizar el saludo.
  ## Retorna
  String: mensaje de saludo correspondiente a la hora actual.
  """

  def generar_saludo(nombre) do
    :calendar.local_time()
    |> elem(1)
    |> elem(0)
    |> mensaje(nombre)
  end

  @doc false
    # Función privada que determina el tipo de saludo
  # según la hora recibida.

  defp mensaje(hora, nombre) do
    cond do
      hora <= 11 -> "Buenos días #{nombre}"
      hora <= 17 -> "Buenas tardes #{nombre}"
      true -> "Buenas noches #{nombre}"
    end
  end
end

SaludoHora.main()
