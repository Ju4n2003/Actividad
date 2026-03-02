defmodule Parqueadero do
  @moduledoc """
  Módulo que calcula la tarifa final de un parqueadero
  según el tiempo de permanencia y diferentes descuentos.

  ## Reglas de tarifa base
    - Hasta 2 horas : $3000
    - De 3 a 5 horas: $3000 + $2500 por cada hora adicional
    - De 6 a 8 horas: tarifa anterior + $2000 por cada hora adicional
    - Más de 8 horas: tarifa fija de $18000
  ## Descuentos aplicables
    - Cliente frecuente (1) : 15%
    - Vehículo eléctrico (1) : 20%
    - Fin de semana (1) : 10%
  Los descuentos son acumulables.
  """

  @doc """
  Función principal del programa.
  Solicita al usuario:
    - Horas de permanencia
    - Tipo de cliente
    - Tipo de vehículo
    - Tipo de día
  Luego calcula la tarifa y muestra el resultado.
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

   @doc """
  Calcula la tarifa base y la tarifa final con descuentos.

  ## Parámetros
    - horas (integer): Cantidad de horas en el parqueadero.
    - cliente (integer): Tipo de cliente.
    - vehiculo (integer): Tipo de vehículo.
    - dia (integer): Tipo de día.

  ## Retorna
    - {base, total}:
        - base (integer): Tarifa sin descuentos.
        - total (float): Tarifa con descuentos aplicados.
  """

  def calcular(horas, cliente, vehiculo, dia) do
    base = tarifa_base(horas)

    descuento =
      desc_cliente(cliente) +
        desc_vehiculo(vehiculo) +
        desc_dia(dia)

    {base, base - base * descuento}
  end

  @doc false
  # Calcula la tarifa base según las horas.

  defp tarifa_base(horas) do
    cond do
      horas <= 2 -> 3000
      horas <= 5 -> 3000 + (horas - 2) * 2500
      horas <= 8 -> 3000 + 3 * 2500 + (horas - 5) * 2000
      true -> 18000
    end
  end

  @doc false
  # Muestra la tarifa base y final al usuario.

  defp mostrar_resultado({base, total}) do
    Util.mostrar_mensaje("Tarifa base: $#{base}")
    Util.mostrar_mensaje("Tarifa final: $#{Integer.to_string(round(total))}")
  end

  @doc false
  # Descuento por tipo de cliente.

  defp desc_cliente(1), do: 0.15
  defp desc_cliente(_), do: 0

  @doc false
  # Descuento por tipo de vehículo.

  defp desc_vehiculo(1), do: 0.20
  defp desc_vehiculo(_), do: 0

  @doc false
  # Descuento según el día.

  defp desc_dia(1), do: 0.10
  defp desc_dia(_), do: 0
end

Parqueadero.main()
