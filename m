Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 323CFE005B9
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 06:32:19 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rALEWH43002191;
	Thu, 21 Nov 2013 08:32:17 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALEWHUF005371;
	Thu, 21 Nov 2013 08:32:17 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 21 Nov 2013 08:32:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALEWHO1025627;
	Thu, 21 Nov 2013 08:32:17 -0600
Date: Thu, 21 Nov 2013 09:32:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: tom alex <tomalex333@gmail.com>
Message-ID: <20131121143216.GL29952@edge>
References: <CAOMiE0npnVX_MgFMGNPKkoyQWyUm2Otp0Mu4U7-AH_jGRqh_mg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMiE0npnVX_MgFMGNPKkoyQWyUm2Otp0Mu4U7-AH_jGRqh_mg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: X11 configuration in pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2013 14:32:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks like there is a pattern in recent questions:
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2997


On Thu, Nov 21, 2013 at 03:24:32PM +0530, tom alex wrote:
> Hi,
> 
> I am running a graphics application in pandaboard (using meta-ivi and
> meta-ti). I am using these options for pvr support.
> 
> In-order to support graphics in X11 (hardware graphics acceleration) I have
> used these options for Xserver
> 
> XSERVER += "xserver-xorg \
>   xserver-xorg-module-exa \
>   xf86-input-evdev \
>   xserver-xf86-config \
>   xserver-xorg-extension-dbe \
>   xserver-xorg-extension-dri \
>   xserver-xorg-extension-dri2 \
>   xserver-xorg-extension-extmod \
>   xserver-xorg-extension-glx \
>   xf86-input-mouse \
>   xf86-input-keyboard \
>   mesa-driver-swrast \
>   xf86-video-omap"
> 
> With these option when I start X am getting a error :
> 
> Failed to load module "omap_pvr" (module does not exist, 0)
> 
> I am using the kernel version 3.4.11, From the Xorg log I come to know that
> X org uses soft EXA mode (not PVR mode). Aslo I found that omap_pvr_drv.so
> file is missing in /usr/xorg/modules/driver/ path. For your reference I
> have attached the X log.
> 
> How can I enable PVR EXA mode ?
> 
> Please help.
> 
> Thanks
> 
> Tom

> [1792016.462] 
> X.Org X Server 1.14.0
> Release Date: 2013-03-05
> [1792016.462] X Protocol Version 11, Revision 0
> [1792016.462] Build Operating System: Linux 3.2.0-52-generic-pae i686 
> [1792016.462] Current Operating System: Linux pandaboard 3.4.11 #1 SMP PREEMPT Mon Nov 18 12:32:04 IST 2013 armv7l
> [1792016.463] Kernel command line: console=tty0 console=ttyO2,115200n8 mpurate=auto vram=12M omapfb.mode=dvi:1024x768MR-16@60 omapfb.debug=y omapdss.def_disp=dvi root=/dev/mmcblk0p2 rw rootfstype=ext3 rootwait
> [1792016.463] Build Date: 13 November 2013  03:55:34PM
> [1792016.463]  
> [1792016.463] Current version of pixman: 0.30.2
> [1792016.464] 	Before reporting problems, check http://wiki.x.org
> 	to make sure that you have the latest version.
> [1792016.464] Markers: (--) probed, (**) from config file, (==) default setting,
> 	(++) from command line, (!!) notice, (II) informational,
> 	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> [1792016.465] (==) Log file: "/var/log/Xorg.0.log", Time: Sat Jan  1 00:00:21 2000
> [1792016.470] (==) Using config file: "/etc/X11/xorg.conf"
> [1792016.470] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
> [1792016.480] (==) No Layout section.  Using the first Screen section.
> [1792016.480] (**) |-->Screen "Screen" (0)
> [1792016.480] (**) |   |-->Monitor "<default monitor>"
> [1792016.480] (**) |   |-->Device "Video Device"
> [1792016.480] (==) No monitor specified for screen "Screen".
> 	Using a default monitor configuration.
> [1792016.480] (==) Automatically adding devices
> [1792016.480] (==) Automatically enabling devices
> [1792016.480] (==) Automatically adding GPU devices
> [1792016.508] (WW) The directory "/usr/share/fonts/X11/misc/" does not exist.
> [1792016.508] 	Entry deleted from font path.
> [1792016.508] (WW) The directory "/usr/share/fonts/X11/TTF/" does not exist.
> [1792016.508] 	Entry deleted from font path.
> [1792016.508] (WW) The directory "/usr/share/fonts/X11/OTF/" does not exist.
> [1792016.508] 	Entry deleted from font path.
> [1792016.508] (WW) The directory "/usr/share/fonts/X11/Type1/" does not exist.
> [1792016.508] 	Entry deleted from font path.
> [1792016.508] (WW) The directory "/usr/share/fonts/X11/100dpi/" does not exist.
> [1792016.508] 	Entry deleted from font path.
> [1792016.508] (WW) The directory "/usr/share/fonts/X11/75dpi/" does not exist.
> [1792016.508] 	Entry deleted from font path.
> [1792016.508] (==) FontPath set to:
> 	
> [1792016.508] (==) ModulePath set to "/usr/lib/xorg/modules"
> [1792016.508] (II) The server relies on udev to provide the list of input devices.
> 	If no devices become available, reconfigure udev or disable AutoAddDevices.
> [1792016.508] (II) Loader magic: 0x1a6848
> [1792016.508] (II) Module ABI versions:
> [1792016.508] 	X.Org ANSI C Emulation: 0.4
> [1792016.508] 	X.Org Video Driver: 14.1
> [1792016.508] 	X.Org XInput driver : 19.1
> [1792016.508] 	X.Org Server Extension : 7.0
> [1792016.509] (II) config/udev: Adding drm device (/dev/dri/card0)
> [1792016.512] Initializing built-in extension Generic Event Extension
> [1792016.513] Initializing built-in extension SHAPE
> [1792016.513] Initializing built-in extension MIT-SHM
> [1792016.513] Initializing built-in extension XInputExtension
> [1792016.513] Initializing built-in extension XTEST
> [1792016.513] Initializing built-in extension BIG-REQUESTS
> [1792016.513] Initializing built-in extension SYNC
> [1792016.513] Initializing built-in extension XKEYBOARD
> [1792016.513] Initializing built-in extension XC-MISC
> [1792016.514] Initializing built-in extension XFIXES
> [1792016.514] Initializing built-in extension RENDER
> [1792016.514] Initializing built-in extension RANDR
> [1792016.514] Initializing built-in extension COMPOSITE
> [1792016.514] Initializing built-in extension DAMAGE
> [1792016.514] Initializing built-in extension MIT-SCREEN-SAVER
> [1792016.514] Initializing built-in extension DOUBLE-BUFFER
> [1792016.514] Initializing built-in extension DPMS
> [1792016.514] Initializing built-in extension X-Resource
> [1792016.515] Initializing built-in extension XVideo
> [1792016.515] Initializing built-in extension XVideo-MotionCompensation
> [1792016.535] Initializing built-in extension XFree86-VidModeExtension
> [1792016.555] Initializing built-in extension XFree86-DGA
> [1792016.574] Initializing built-in extension XFree86-DRI
> [1792016.592] Initializing built-in extension DRI2
> [1792016.592] (II) LoadModule: "glx"
> [1792016.598] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
> [1792016.632] (II) Module glx: vendor="X.Org Foundation"
> [1792016.632] 	compiled for 1.14.0, module version = 1.0.0
> [1792016.632] 	ABI class: X.Org Server Extension, version 7.0
> [1792016.632] (==) AIGLX enabled
> [1792016.650] Loading extension GLX
> [1792016.651] (II) LoadModule: "omap"
> [1792016.651] (II) Loading /usr/lib/xorg/modules/drivers/omap_drv.so
> [1792016.660] (II) Module omap: vendor="X.Org Foundation"
> [1792016.660] 	compiled for 1.14.0, module version = 0.83.0
> [1792016.660] 	Module class: X.Org Video Driver
> [1792016.660] 	ABI class: X.Org Video Driver, version 14.1
> [1792016.660] (II) OMAP: Driver for TI OMAP: OMAP3430 with PowerVR SGX530,
> 	OMAP3630 with PowerVR SGX530, OMAP4430 with PowerVR SGX540,
> 	OMAP4460 with PowerVR SGX540, OMAP5430 with PowerVR SGX544 MP,
> 	OMAP5432 with PowerVR SGX544 MP
> [1792016.660] (--) using VT number 2
> 
> [1792016.680] (WW) Falling back to old probe method for omap
> [1792016.680] (EE) ERROR: Did not find any matching device section in configuration file
> [1792016.680] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
> [1792016.680] (II) OMAP(0): Creating default Display subsection in Screen section
> 	"Screen" for depth/fbbpp 24/32
> [1792016.680] (==) OMAP(0): Depth 24, (==) framebuffer bpp 32
> [1792016.680] (==) OMAP(0): RGB weight 888
> [1792016.680] (==) OMAP(0): Using gamma correction (1.0, 1.0, 1.0)
> [1792016.680] (==) OMAP(0): Default visual is TrueColor
> [1792016.685] (II) OMAP(0): Found chipset: OMAP4460 with PowerVR SGX540
> [1792016.685] (**) OMAP(0): Option "Debug" "false"
> [1792016.685] (**) OMAP(0): Option "HWcursor" "false"
> [1792016.685] (II) OMAP(0): Using SW cursor
> [1792016.685] (II) OMAP(0): Setting the video modes ...
> [1792016.686] (II) OMAP(0): Output DVI-D-1 has no monitor section
> [1792016.686] (II) OMAP(0): Output HDMI-1 has no monitor section
> [1792016.687] (II) OMAP(0): EDID for output DVI-D-1
> [1792016.687] (II) OMAP(0): Manufacturer: DEL  Model: a088  Serial#: 858934861
> [1792016.687] (II) OMAP(0): Year: 2013  Week: 17
> [1792016.687] (II) OMAP(0): EDID Version: 1.3
> [1792016.687] (II) OMAP(0): Digital Display Input
> [1792016.687] (II) OMAP(0): Max Image Size [cm]: horiz.: 41  vert.: 26
> [1792016.687] (II) OMAP(0): Gamma: 2.20
> [1792016.687] (II) OMAP(0): DPMS capabilities: StandBy Suspend Off
> [1792016.687] (II) OMAP(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
> [1792016.687] (II) OMAP(0): First detailed timing is preferred mode
> [1792016.687] (II) OMAP(0): redX: 0.642 redY: 0.340   greenX: 0.314 greenY: 0.618
> [1792016.687] (II) OMAP(0): blueX: 0.154 blueY: 0.061   whiteX: 0.313 whiteY: 0.329
> [1792016.687] (II) OMAP(0): Supported established timings:
> [1792016.687] (II) OMAP(0): 720x400@70Hz
> [1792016.687] (II) OMAP(0): 640x480@60Hz
> [1792016.687] (II) OMAP(0): 640x480@75Hz
> [1792016.687] (II) OMAP(0): 800x600@60Hz
> [1792016.687] (II) OMAP(0): 800x600@75Hz
> [1792016.687] (II) OMAP(0): 1024x768@60Hz
> [1792016.687] (II) OMAP(0): 1024x768@75Hz
> [1792016.687] (II) OMAP(0): 1280x1024@75Hz
> [1792016.687] (II) OMAP(0): Manufacturer's mask: 0
> [1792016.687] (II) OMAP(0): Supported standard timings:
> [1792016.687] (II) OMAP(0): #0: hsize: 1440  vsize 900  refresh: 60  vid: 149
> [1792016.687] (II) OMAP(0): #1: hsize: 1152  vsize 864  refresh: 75  vid: 20337
> [1792016.687] (II) OMAP(0): #2: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
> [1792016.687] (II) OMAP(0): #3: hsize: 1440  vsize 900  refresh: 75  vid: 3989
> [1792016.687] (II) OMAP(0): #4: hsize: 1280  vsize 800  refresh: 60  vid: 129
> [1792016.688] (II) OMAP(0): Supported detailed timing:
> [1792016.688] (II) OMAP(0): clock: 106.5 MHz   Image Size:  408 x 255 mm
> [1792016.688] (II) OMAP(0): h_active: 1440  h_sync: 1520  h_sync_end 1672 h_blank_end 1904 h_border: 0
> [1792016.688] (II) OMAP(0): v_active: 900  v_sync: 903  v_sync_end 909 v_blanking: 934 v_border: 0
> [1792016.688] (II) OMAP(0): Serial No: YJGD134M32NM
> [1792016.688] (II) OMAP(0): Monitor name: DELL P1913
> [1792016.688] (II) OMAP(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 81 kHz, PixClock max 145 MHz
> [1792016.688] (II) OMAP(0): EDID (in hex):
> [1792016.688] (II) OMAP(0): 	00ffffffffffff0010ac88a04d4e3233
> [1792016.688] (II) OMAP(0): 	1117010380291a78ea49a5a457509e27
> [1792016.688] (II) OMAP(0): 	0f5054a54b009500714f8180950f8100
> [1792016.688] (II) OMAP(0): 	0101010101019a29a0d0518422305098
> [1792016.688] (II) OMAP(0): 	360098ff1000001c000000ff00594a47
> [1792016.688] (II) OMAP(0): 	443133344d33324e4d0a000000fc0044
> [1792016.688] (II) OMAP(0): 	454c4c2050313931330a2020000000fd
> [1792016.688] (II) OMAP(0): 	00384c1e510e000a20202020202000eb
> [1792016.688] (II) OMAP(0): EDID for output HDMI-1
> [1792016.688] (II) OMAP(0): Manufacturer: DEL  Model: a088  Serial#: 858934861
> [1792016.688] (II) OMAP(0): Year: 2013  Week: 17
> [1792016.688] (II) OMAP(0): EDID Version: 1.3
> [1792016.688] (II) OMAP(0): Digital Display Input
> [1792016.688] (II) OMAP(0): Max Image Size [cm]: horiz.: 41  vert.: 26
> [1792016.688] (II) OMAP(0): Gamma: 2.20
> [1792016.688] (II) OMAP(0): DPMS capabilities: StandBy Suspend Off
> [1792016.688] (II) OMAP(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
> [1792016.688] (II) OMAP(0): First detailed timing is preferred mode
> [1792016.688] (II) OMAP(0): redX: 0.642 redY: 0.340   greenX: 0.314 greenY: 0.618
> [1792016.688] (II) OMAP(0): blueX: 0.154 blueY: 0.061   whiteX: 0.313 whiteY: 0.329
> [1792016.688] (II) OMAP(0): Supported established timings:
> [1792016.688] (II) OMAP(0): 720x400@70Hz
> [1792016.688] (II) OMAP(0): 640x480@60Hz
> [1792016.688] (II) OMAP(0): 640x480@75Hz
> [1792016.688] (II) OMAP(0): 800x600@60Hz
> [1792016.688] (II) OMAP(0): 800x600@75Hz
> [1792016.689] (II) OMAP(0): 1024x768@60Hz
> [1792016.689] (II) OMAP(0): 1024x768@75Hz
> [1792016.689] (II) OMAP(0): 1280x1024@75Hz
> [1792016.689] (II) OMAP(0): Manufacturer's mask: 0
> [1792016.689] (II) OMAP(0): Supported standard timings:
> [1792016.689] (II) OMAP(0): #0: hsize: 1440  vsize 900  refresh: 60  vid: 149
> [1792016.689] (II) OMAP(0): #1: hsize: 1152  vsize 864  refresh: 75  vid: 20337
> [1792016.689] (II) OMAP(0): #2: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
> [1792016.689] (II) OMAP(0): #3: hsize: 1440  vsize 900  refresh: 75  vid: 3989
> [1792016.689] (II) OMAP(0): #4: hsize: 1280  vsize 800  refresh: 60  vid: 129
> [1792016.689] (II) OMAP(0): Supported detailed timing:
> [1792016.689] (II) OMAP(0): clock: 106.5 MHz   Image Size:  408 x 255 mm
> [1792016.689] (II) OMAP(0): h_active: 1440  h_sync: 1520  h_sync_end 1672 h_blank_end 1904 h_border: 0
> [1792016.689] (II) OMAP(0): v_active: 900  v_sync: 903  v_sync_end 909 v_blanking: 934 v_border: 0
> [1792016.689] (II) OMAP(0): Serial No: YJGD134M32NM
> [1792016.689] (II) OMAP(0): Monitor name: DELL P1913
> [1792016.689] (II) OMAP(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 81 kHz, PixClock max 145 MHz
> [1792016.689] (II) OMAP(0): EDID (in hex):
> [1792016.689] (II) OMAP(0): 	00ffffffffffff0010ac88a04d4e3233
> [1792016.689] (II) OMAP(0): 	1117010380291a78ea49a5a457509e27
> [1792016.689] (II) OMAP(0): 	0f5054a54b009500714f8180950f8100
> [1792016.689] (II) OMAP(0): 	0101010101019a29a0d0518422305098
> [1792016.689] (II) OMAP(0): 	360098ff1000001c000000ff00594a47
> [1792016.689] (II) OMAP(0): 	443133344d33324e4d0a000000fc0044
> [1792016.689] (II) OMAP(0): 	454c4c2050313931330a2020000000fd
> [1792016.689] (II) OMAP(0): 	00384c1e510e000a20202020202000eb
> [1792016.689] (II) OMAP(0): EDID vendor "DEL", prod id 41096
> [1792016.689] (II) OMAP(0): Using EDID range info for horizontal sync
> [1792016.689] (II) OMAP(0): Using EDID range info for vertical refresh
> [1792016.689] (II) OMAP(0): Printing DDC gathered Modelines:
> [1792016.689] (II) OMAP(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
> [1792016.689] (II) OMAP(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
> [1792016.689] (II) OMAP(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1440x900"x0.0  136.75  1440 1536 1688 1936  900 903 909 942 -hsync +vsync (70.6 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
> [1792016.690] (II) OMAP(0): Printing probed modes for output HDMI-1
> [1792016.690] (II) OMAP(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
> [1792016.690] (II) OMAP(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
> [1792016.690] (II) OMAP(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
> [1792016.690] (II) OMAP(0): Output DVI-D-1 disconnected
> [1792016.690] (II) OMAP(0): Output HDMI-1 connected
> [1792016.690] (II) OMAP(0): Using exact sizes for initial modes
> [1792016.690] (II) OMAP(0): Output HDMI-1 using initial mode 1440x900
> [1792016.690] (II) OMAP(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
> [1792016.690] (II) OMAP(0): Got KMS resources
> [1792016.690] (**) OMAP(0): Display dimensions: (410, 260) mm
> [1792016.691] (**) OMAP(0): DPI set to (89, 87)
> [1792016.691] (II) Loading sub module "dri2"
> [1792016.691] (II) LoadModule: "dri2"
> [1792016.691] (II) Module "dri2" already built-in
> [1792016.691] (II) Loading sub module "exa"
> [1792016.691] (II) LoadModule: "exa"
> [1792016.691] (II) Loading /usr/lib/xorg/modules/libexa.so
> [1792016.701] (II) Module exa: vendor="X.Org Foundation"
> [1792016.701] 	compiled for 1.14.0, module version = 2.6.0
> [1792016.701] 	ABI class: X.Org Video Driver, version 14.1
> [1792016.701] (II) Loading sub module "fb"
> [1792016.701] (II) LoadModule: "fb"
> [1792016.701] (II) Loading /usr/lib/xorg/modules/libfb.so
> [1792016.716] (II) Module fb: vendor="X.Org Foundation"
> [1792016.716] 	compiled for 1.14.0, module version = 1.0.0
> [1792016.716] 	ABI class: X.Org ANSI C Emulation, version 0.4
> [1792016.716] (II) Loading sub module "omap_pvr"
> [1792016.716] (II) LoadModule: "omap_pvr"
> [1792016.717] (WW) Warning, couldn't open module omap_pvr
> [1792016.717] (II) UnloadModule: "omap_pvr"
> [1792016.717] (II) Unloading omap_pvr
> [1792016.717] (EE) OMAP: Failed to load module "omap_pvr" (module does not exist, 0)
> [1792016.717] (II) OMAP(0): Cannot load the omap_pvr sub-module
> [1792016.717] (--) Depth 24 pixmap format is 32 bpp
> [1792016.742] (II) OMAP(0): Soft EXA mode
> [1792016.742] (II) EXA(0): Driver allocated offscreen pixmaps
> [1792016.742] (II) EXA(0): Driver registered support for the following operations:
> [1792016.742] (II)         Solid
> [1792016.742] (II)         Copy
> [1792016.742] (II)         Composite (RENDER acceleration)
> [1792016.742] (II) OMAP(0): [DRI2] Setup complete
> [1792016.742] (II) OMAP(0): [DRI2]   DRI driver: omap
> [1792016.742] (EE) OMAP(0): ERROR: Could not initialize XV
> [1792016.742] (==) OMAP(0): Backing store disabled
> [1792016.742] (==) OMAP(0): Silken mouse enabled
> [1792016.842] (II) OMAP(0): RandR 1.2 enabled, ignore the following RandR disabled message.
> [1792016.843] (==) OMAP(0): DPMS enabled
> [1792016.843] (--) RandR disabled
> [1792016.875] (EE) AIGLX error: dlopen of /usr/lib/dri/omap_dri.so failed (/usr/lib/dri/omap_dri.so: cannot open shared object file: No such file or directory)
> [1792016.875] (EE) AIGLX: reverting to software rendering
> [1792016.875] (II) AIGLX: Screen 0 is not DRI capable
> [1792017.062] (II) AIGLX: Loaded and initialized swrast
> [1792017.062] (II) GLX: Initialized DRISWRAST GL provider for screen 0
> [1792017.064] (II) OMAP(0): Setting screen physical size to 381 x 238
> [1792017.356] (II) config/udev: Adding input device gpio-keys (/dev/input/event1)
> [1792017.356] (II) No input driver specified, ignoring this device.
> [1792017.356] (II) This device may have been added with another device file.
> [1792017.357] (II) config/udev: Adding input device PandaES Headset Jack (/dev/input/event0)
> [1792017.357] (II) No input driver specified, ignoring this device.
> [1792017.357] (II) This device may have been added with another device file.
> [1792017.358] (II) config/udev: Adding drm device (/dev/dri/card0)
> [1792017.360] (II) config/udev: Adding input device Dell Dell USB Entry Keyboard (/dev/input/event2)
> [1792017.360] (**) Dell Dell USB Entry Keyboard: Applying InputClass "evdev keyboard catchall"
> [1792017.360] (II) LoadModule: "evdev"
> [1792017.361] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
> [1792017.369] (II) Module evdev: vendor="X.Org Foundation"
> [1792017.369] 	compiled for 1.14.0, module version = 2.8.1
> [1792017.369] 	Module class: X.Org XInput Driver
> [1792017.369] 	ABI class: X.Org XInput driver, version 19.1
> [1792017.369] (II) Using input driver 'evdev' for 'Dell Dell USB Entry Keyboard'
> [1792017.369] (**) Dell Dell USB Entry Keyboard: always reports core events
> [1792017.369] (**) evdev: Dell Dell USB Entry Keyboard: Device: "/dev/input/event2"
> [1792017.369] (--) evdev: Dell Dell USB Entry Keyboard: Vendor 0x413c Product 0x2107
> [1792017.369] (--) evdev: Dell Dell USB Entry Keyboard: Found keys
> [1792017.369] (II) evdev: Dell Dell USB Entry Keyboard: Configuring as keyboard
> [1792017.370] (**) Option "config_info" "udev:/sys/devices/platform/usbhs_omap/ehci-omap.0/usb1/1-1/1-1.3/1-1.3:1.0/input/input2/event2"
> [1792017.370] (II) XINPUT: Adding extended input device "Dell Dell USB Entry Keyboard" (type: KEYBOARD, id 6)
> [1792017.370] (**) Option "xkb_rules" "evdev"
> [1792017.370] (**) Option "xkb_model" "pc104"
> [1792017.370] (**) Option "xkb_layout" "us"

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


