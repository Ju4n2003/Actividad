defmodule SaludoHora do
  @moduledoc """
  Saluda al usuario según la hora actual.
  """
  def main do
    "Ingrese su nombre: "
    |> Util.ingresar(:texto)
    |> generar_saludo()
    |> Util.mostrar_mensaje()
  end

  def generar_saludo(nombre) do
    :calendar.local_time()
    |> elem(1)
    |> elem(0)
    |> mensaje(nombre)
  end

  defp mensaje(hora, nombre) do
    cond do
      hora <= 11 -> "Buenos días #{nombre}"
      hora <= 17 -> "Buenas tardes #{nombre}"
      true -> "Buenas noches #{nombre}"
    end
  end
end

SaludoHora.main()
