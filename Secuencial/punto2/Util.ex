defmodule Util do
  @moduledoc """
  Módulo con funciones para mostrar mensajes
  y capturar datos desde consola.
  """

  @doc """
  Permite capturar datos desde consola.
  Puede recibir:
  :real
  :entero
  :texto
  """
  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        mostrar_error("Error, se espera que ingrese un número real")
        ingresar(mensaje, :real)
    end
  end

  def ingresar(mensaje, :entero) do
    mensaje
    |> ingresar(:texto)
    |> String.to_integer()
  end

  def ingresar(mensaje, :texto) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def mostrar_error(mensaje) do
    IO.puts(mensaje)
  end
end
