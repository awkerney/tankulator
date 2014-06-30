watch( '.*\.rb' ) do
	puts 'Rebuilding gem'
  system 'time rake rebuild'
	system 'echo "Finished at" `date`'
	system "osascript -e 'display notification \"Tankulator recompiled!\" with title \"Watchr\"'"
end