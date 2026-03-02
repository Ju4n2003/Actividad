defmodule Usuario do
  @moduledoc """
  moduolo que valida un nombre de usuario.

  ## Reglas de validación:
    - Debe tener entre 5 y 12 caracteres.
    - Debe estar completamente en minúsculas.
    - No debe contener espacios.
    - No debe contener los caracteres especiales: @ # $ %
    - Debe contener al menos una letra (a-z).

  Si el usuario cumple todas las reglas, se considera válido.
  En caso contrario, se retornan los mensajes de error correspondientes.
  """

  @doc """
  Función principal del programa.

  Solicita un nombre de usuario al usuario,
  lo valida y muestra el resultado en pantalla.
  """

  def main do
    "Ingrese usuario: "
    |> Util.ingresar(:texto)
    |> validar()
    |> mostrar_resultado()
  end

  @doc """
  Valida un nombre de usuario según las reglas definidas.

  ## Parámetros

    - usuario (String): Nombre de usuario a validar.

  ## Retorna

    - {:ok, mensaje} si el usuario es válido.
    - {:error, lista_errores} si hay errores de validación.
  """

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

  @doc false
  # Muestra el resultado de la validación.

  defp mostrar_resultado({:ok, mensaje}) do
    Util.mostrar_mensaje(mensaje)
  end

  defp mostrar_resultado({:error, errores}) do
    errores |> Enum.each(&Util.mostrar_mensaje/1)
  end

  @doc false
  # Valida que la longitud esté entre 5 y 12 caracteres.

  defp validar_longitud(lista, u) do
    if String.length(u) < 5 or String.length(u) > 12 do
      lista ++ ["Debe tener entre 5 y 12 caracteres"]
    else
      lista
    end
  end

  @doc false
  # Valida que el usuario esté completamente en minúsculas.

  defp validar_minusculas(lista, u) do
    if u != String.downcase(u) do
      lista ++ ["Debe estar en minúscula"]
    else
      lista
    end
  end

  @doc false
  # Valida que no contenga espacios.

  defp validar_espacios(lista, u) do
    if String.contains?(u, " ") do
      lista ++ ["No debe contener espacios"]
    else
      lista
    end
  end

  @doc false
  # Valida que no contenga ciertos caracteres especiales.

  defp validar_especiales(lista, u) do
    if String.match?(u, ~r/[@#$%]/) do
      lista ++ ["No debe contener @ # $ %"]
    else
      lista
    end
  end

    @doc false
  # Valida que contenga al menos una letra.

  defp validar_letra(lista, u) do
    if String.match?(u, ~r/[a-z]/) do
      lista
    else
      lista ++ ["Debe contener al menos una letra"]
    end
  end
end
Usuario.main()
