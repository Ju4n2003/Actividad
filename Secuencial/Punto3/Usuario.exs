defmodule Usuario do
  @moduledoc """
  Valida un nombre de usuario.
  """

  def main do
    "Ingrese usuario: "
    |> Util.ingresar(:texto)
    |> validar()
    |> mostrar_resultado()
  end

  def validar(usuario) do
    errores =
      []
      |> validar_longitud(usuario)
      |> validar_minusculas(usuario)
      |> validar_espacios(usuario)
      |> validar_especiales(usuario)
      |> validar_letra(usuario)

    case errores do
      [] -> {:ok, "Usuario válido"}
      _ -> {:error, errores}
    end
  end

  defp mostrar_resultado({:ok, mensaje}) do
    Util.mostrar_mensaje(mensaje)
  end

  defp mostrar_resultado({:error, errores}) do
    errores |> Enum.each(&Util.mostrar_mensaje/1)
  end

  defp validar_longitud(lista, u) do
    if String.length(u) < 5 or String.length(u) > 12 do
      lista ++ ["Debe tener entre 5 y 12 caracteres"]
    else
      lista
    end
  end

  defp validar_minusculas(lista, u) do
    if u != String.downcase(u) do
      lista ++ ["Debe estar en minúscula"]
    else
      lista
    end
  end

  defp validar_espacios(lista, u) do
    if String.contains?(u, " ") do
      lista ++ ["No debe contener espacios"]
    else
      lista
    end
  end

  defp validar_especiales(lista, u) do
    if String.match?(u, ~r/[@#$%]/) do
      lista ++ ["No debe contener @ # $ %"]
    else
      lista
    end
  end

  defp validar_letra(lista, u) do
    if String.match?(u, ~r/[a-z]/) do
      lista
    else
      lista ++ ["Debe contener al menos una letra"]
    end
  end
end
Usuario.main()
