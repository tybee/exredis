defmodule Exredis.Api do
  @moduledoc """
  High-level API
  """

  import Exredis, only: [query: 2]

  @type c  :: pid
  @type k  :: binary
  @type kv :: list
  @type v  :: binary | list | :undefined

  ##
  # Keys
  ##

  @spec del(c, k) :: v
  def del(c, k), do:
    c |> query ["DEL", k]

  @spec keys(c, k) :: v
  def keys(c, k), do:
    c |> query ["KEYS", k]

  ##
  # Strings
  ##

  @spec get(c, k) :: v
  def get(c, k), do:
    c |> query ["GET", k]

  @spec set(c, k, v) :: binary
  def set(c, k, v), do:
    c |> query ["SET", k, v]

  @spec mset(c, kv) :: v
  def mset(c, kv), do:
    c |> query ["MSET" | kv]

  @spec mget(c, kv) :: v
  def mget(c, kv), do:
    c |> query ["MGET" | kv]

  ##
  # Pub/Sub
  ##

  @spec publish(c, k, v) :: any
  def publish(client, channel, message), do:
    client |> query ["PUBLISH", channel, message]

  ##
  # Server
  ##

  @spec flushall(c) :: v
  def flushall(c), do:
    c |> query ["FLUSHALL"]

end
