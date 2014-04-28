watch( '.*\.rb' ) do
  system 'time rake'
	system 'echo "Finished at" `date`'
	system 'osascript -e \'display notification "Tankulator recompiled!" with title "Watchr"\''
end
