publish:
	git remote set-url origin git@github.com:skagone/science_tools.git
	git config --global user.email skagone@gmail.com
	git config --global user.name skagone
	git config --global push.default simple
	git add .
	git commit -m "automatic git update from Makefile"
	git push
