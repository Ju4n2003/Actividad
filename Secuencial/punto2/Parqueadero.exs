defmodule Parqueadero do
  @moduledoc """
  Calcula la tarifa de un parqueadero.
  """

  def main do
    horas = Util.ingresar("Horas: ", :entero)
    cliente = Util.ingresar("Cliente (1=frecuente, 2=regular): ", :entero)
    vehiculo = Util.ingresar("Vehículo (1=eléctrico, 2=convencional): ", :entero)
    dia = Util.ingresar("Día (1=fin de semana, 2=entre semana): ", :entero)

    horas
    |> calcular(cliente, vehiculo, dia)
    |> mostrar_resultado()
  end

  def calcular(horas, cliente, vehiculo, dia) do
    base = tarifa_base(horas)

    descuento =
      desc_cliente(cliente) +
        desc_vehiculo(vehiculo) +
        desc_dia(dia)

    {base, base - base * descuento}
  end

  defp tarifa_base(horas) do
    cond do
      horas <= 2 -> 3000
      horas <= 5 -> 3000 + (horas - 2) * 2500
      horas <= 8 -> 3000 + 3 * 2500 + (horas - 5) * 2000
      true -> 18000
    end
  end

  defp mostrar_resultado({base, total}) do
    Util.mostrar_mensaje("Tarifa base: $#{base}")
    Util.mostrar_mensaje("Tarifa final: $#{Integer.to_string(round(total))}")
  end

  defp desc_cliente(1), do: 0.15
  defp desc_cliente(_), do: 0

  defp desc_vehiculo(1), do: 0.20
  defp desc_vehiculo(_), do: 0

  defp desc_dia(1), do: 0.10
  defp desc_dia(_), do: 0
end

Parqueadero.main()
