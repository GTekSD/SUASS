<span style="font-size:1.35em;">If you have '''Nokia Belle Feature Pack 2''', such as on the [[Nokia 808 PureView]], go to [[Jailbreaking Nokia Belle FP2 devices|its own page]].</span>

<hr>

This guide will show you how to '''jailbreak''' or hack your [[Symbian OS|Symbian]] [[S60]] device.

All the files needed are shown throughout the tutorial, but you can also find everything [https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg here].
== About ==
Jailbreaking will let you '''install any SIS apps''', even unsigned apps, without getting certificate errors. This will also give you '''access to "private" system folders''', for example letting you dump [[Java ME]] apps installed on the phone. Another benefit is that you can '''apply patches''' to the phone, such as silencing the camera shutter sound or changing shortcut key actions.

Jailbreaking is not required on Series 60 1st or 2nd Edition, as they didn't have ''platform security'', so any apps could freely be installed.

== Tutorial ==
=== Trend Micro Mobile Security method ===
==== 1. Allowing unsigned installations (Eseries) ====
<span style="color:red;">'''This step only applies to [[Nokia Eseries|Eseries]] devices. If you aren't using one, skip this step.'''</span>

Open the app manager, which can usually be found in the Installations or Tools folder. Go to <code>Options</code> → <code>Settings</code> and set <code>Software installation</code> to <code>All</code>.

==== 2. Installing X-plore ====
X-plore is a popular file manager app for Symbian phones.

If you don't have it already, download [https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/TShiDDIb x-plore_s60_3rd_1_64.sisx] and install it on your phone. If you have issues installing it, set your phone's date to 2022 and try again.

==== 3. Extracting tmquarantine ====
Download [https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/eDok3TiT tmquarantine.zip] and send it to your phone. Use X-plore to extract it to the C: drive root.

There should now be a <code>C:/tmquarantine</code> folder with 4 files in it.

==== 4. Installing Mobile Security ====
Download [https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/HeoUXLbJ Mobile Security.sis]. Set your phone's date to 2012 and install Mobile Security.

If it asks you to reboot your phone, select <code>No</code>.

==== 5. Restoring the quarantine ====
Open '''Mobile Security''' and go to Options → Quarantine list → Options → Mark/Unmark → Mark all, then Options → Restore → Yes.

After this, you can uninstall Mobile Security.

==== 6. Installing ROMPatcher+ ====
Download [https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/PaxGzJAK RomPatcherPlus_3.1_LiteVersion.sisx] and install it on your phone.

==== 7. Applying patches ====
Open '''ROMPatcher+''' and select both of the patches <code>Install Server RP+</code> and <code>Open4All RP+</code>.

Also on both of them, go to Options → Add to Auto.

If you got a red cross on the Install Server, download installserver.exe for [https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/3HwgCJpS Symbian 9.1] or [https://mega.nz/file/n81CmIrQ#b5YFGAxxxFmhPohXiungAadTE1SF4Jx-JnOsAc0hxKM Symbian 9.2]. <span style="color:red;">This is not an exe that you run on your computer</span>, instead send it to your phone and copy it to <code>C:/sys/bin</code> using X-plore (make sure to enable Open4All beforehand). If you did this, you don't need to apply the Install Server patch.

==== Important note ====
The Trend Micro Mobile Security method above <span style="color:red;">'''will only work on Nokia phones'''</span>; trying to install it on S60 phones from other brands (LG, Samsung, Sony Ericsson, etc.) will show "Unsupported Device. This Mobile Security version can only be installed on Nokia S60 phones." error message during installation, and the app will fail to launch.

As there are no archived versions of Mobile Security compatible with non-Nokia phones (provided if one exists at all), an alternate method using '''Symantec Symbian Hack''' must be used instead.

=== Alternate method using Symantec Symbian Hack ===

'''This method also works on all Symbian S60 devices starting from 3rd Edition, as well as on S60 phones from other brands that cannot be hacked via Trend Micro Mobile Security hack'''.

First, '''insert a SIM card in the phone''' (or Norton will complain about expired license, though you may insert a SIM card after installing Norton, and does not necessarily need to have active service), install X-plore, then download [https://mega.nz/folder/jH4QAL5J#jUQJTDDSmU-5z_GJBCMJAg/file/eX4EQQSY NortonHackLDD.zip] and send it to your phone. Extract the files, run NortonSymbianHackLDD.sis, and follow through the installation process.

Once it's installed, open '''Norton''', select AntiVirus → Quarantine list, then Options → Restore all → Yes. Then uninstall Symantec Symbian Hack from the Application Manager, delete the <code>C:\shared\</code> folder, set your phone's date to 2012, and follow steps 6 and 7 above for ROMPatcher+. You may remove a SIM card from the phone at this point.

=== Alternate method using the CProfDriver_SISX.ldd hack ===

'''This method works on almost all Symbian S60 devices starting from 3rd Edition, as well as on S60 phones from other brands. <span style="color:green;">It doesn't require a SIM card.'''</span>

If Norton/Trend Micro method doesn't work, in such cases you see red cross on both patches in ROMPatcher, for example on earlier [[Nokia E90 Communicator]] firmwares, or you have red cross on InstallServer RP+ even if installserver.exe file is in the correct directory, you can use this package to jailbreak your phone.

This package contains four .sis programs: '''CapsOn''', '''CapsOff''', '''HelloCarbide''' and '''X-plore'''. First, download the [https://phoneky.com/applications/?s=download&id=y0y15175 .sis program package] and send it to your phone. Set the phone date to 05/11/2007. Run the installation of the drakkariou_iw6pb2qz.sis file and select the OS type (Pre-FP1/FP1/FP2). For other devices, such as [[Nokia E50|E50]], [[Nokia E51|E51]], [[Nokia E61|E61]]  and some others, you need to install a dedicated program package. 

Run '''X-plore'''. Press 0 on the keypad or go to Menu → Tools → Configuration and check the first four boxes if they are not checked. Minimize the application in the background and run '''HelloCarbide'''. Inside the program, select Options → Menu1 and click Yes. The program will close. Return to X-plore and extract two files from Hack.zip: <code>installserver.exe</code> and <code>CProfDriver_SISX.ldd</code> to the <code>C:/sys/bin</code> folder. Restart the phone.

If you want to see hidden folders, run the '''CapsOff''' application, or run the '''CapsOn''' application to hide them again.

You can set the current date now and try installing an unsigned app.

=== Have fun! ===
If you had any issues with the tutorial, feel free to add a message on the [[Talk:Jailbreaking S60 devices|talk page]] or join our [[Main Page#Discord server|Discord]].

Now you can set your phone's date back to today's date. Make sure you disable the patches from ROMPatcher+ when you want to play [[N-Gage 2.0]] games.

[[Category:Help Topics]]
