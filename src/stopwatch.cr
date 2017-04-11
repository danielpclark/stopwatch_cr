require "./stopwatch/version"

##
# Stopwatch
#
# Project namespace for Stopwatch.
module Stopwatch
  ##
  # Timer
  #
  # Object that behaves as a stop watch timer.
  class Timer
    @mark : Time?
    def initialize
      @stamps = [] of Float64
      @mark = nil
    end

    # Start & Mark time with this `mark` method.
    #
    # @return [Time, Array<Float64>] First time returns Time start. From then on it returns `times` method result. @see #times
    def mark : Time | Array(Float64)
      if @mark
        last = @mark.not_nil!
        @stamps << -(last - (@mark = Time.now)).total_seconds
      else
        @mark = Time.now
      end
    end

    # Boolean check for any times `mark`ed.  Must mark atleast twice for this to be true.
    #
    # @return [true,false]
    def time? : Bool
      !times.empty?
    end

    # Human display of total time elapsed in hours, minutes, and seconds.
    #
    # @return [String] String of hh:mm:ss
    def h : String # human
      "%02d:%02d:%02d" % [total/3600%24, total/60%60, total%60]
    end

    # Average of times.  If `time?` if false this will raise an error.
    #
    # @return [Float64,Error]
    def average : Float64
      ttl = total.fdiv(times.size)
      raise "Can't call average without timestamps!" if ttl.nan?
      ttl
    end

    # Human representation of average seconds per `mark`.
    #
    # @return [String] String representation of average or empty for none.
    def ha : String
      "%0.2f second average" % average
    rescue
      ""
    end

    # A collection of times `mark`ed.  Each represented in Float64 of seconds since the last `mark`.
    #
    # @return [Array<Float64>] Returns array of times marked.
    def times : Array(Float64)
      @stamps
    end

    # Last time `mark`ed.
    #
    # @return [Float64,nil] Returns the last time `mark`ed, or else `nil`.
    def last : Float64?
      @stamps.last
    end

    # Total time accumulated.
    #
    # @return [Integer,Float64] Returns total time since start.
    def total : Int32 | Float64
      ttl = 0.0
      @stamps.each do |val|
        ttl += val
      end
      ttl
    end
  end
end
