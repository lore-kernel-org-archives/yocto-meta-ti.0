Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2277CE00722
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 07:52:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5REqVFQ004468;
	Thu, 27 Jun 2013 09:52:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5REqVhY007251;
	Thu, 27 Jun 2013 09:52:31 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 09:52:30 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5REqUs3016955;
	Thu, 27 Jun 2013 09:52:30 -0500
Date: Thu, 27 Jun 2013 10:52:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sudhangathan B S <sudhangathan@gmail.com>
Message-ID: <20130627145229.GP28379@edge>
References: <CAGX3a98FisUxo2x_xv0c-+4_AaZbf+1762PSFZhxZJU+D4bBTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGX3a98FisUxo2x_xv0c-+4_AaZbf+1762PSFZhxZJU+D4bBTw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: oe_runmake failed issue for 2.6.32 kernel
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
X-List-Received-Date: Thu, 27 Jun 2013 14:52:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 27, 2013 at 08:16:36PM +0530, Sudhangathan B S wrote:
> Exactly..!!
> 
> I got this..!

Your toolchain is too new for that old kernel:

http://www.denx.de/wiki/view/ELDK-5/FrequentlyAskedQuestionsAndAnswers#Cannot_compile_Linux_kernel_vers


> *****Start**************************************************************************************************
> In file included from arch/arm/mm/flush.c:12:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used
> [-Wunused-but-set-variable]
> 
>   CC      arch/arm/mach-omap2/mux.o
> 
>   LD      usr/built-in.o
> 
>   CC      arch/arm/mm/mmu.o
> 
>   CC      arch/arm/mach-omap2/devices.o
> 
> /tmp/ccA8lCEo.s:
> Assembler messages:
> 
> /tmp/ccA8lCEo.s:309:
> Error:
> selected processor does not support ARM mode `smc #0'
> 
> 
> /tmp/ccA8lCEo.s:349:
> Error:
> selected processor does not support ARM mode `smc #0'
> 
> 
> make[1]: *** [arch/arm/kernel/sysfs_v7.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> 
>   CC      arch/arm/mm/vmregion.o
> 
>   CC      arch/arm/mach-omap2/serial.o
> 
> In file included from arch/arm/mm/fault-armv.c:18:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> *****END************************************************************************************
> 
> So now it appears like a kernel configuration mismatch..?
> 
> I have included the full terminal output.! as it was run with verbose
> command.
> 
> ---------------------------------
> Sudhangathan BS
> Ph:(+91) 9731-905-205
> ---------------------------------
> 
> 
> On Thu, Jun 27, 2013 at 7:45 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Wed, Jun 26, 2013 at 09:28:38AM +0530, Sudhangathan B S wrote:
> > > On my way to install 2.6.32 kernel for the Beagle board image. I need
> > this
> > > kernel to work with the leopard imaging/aptina camera module/sensors. I'm
> > > encountering this "oe_runmake failed" issue. I have strong feeling it is
> > > Yocto or the meta-ti layers, which is not set properly. On the web i got
> > > related issues, but they are too old, and were related to OE.
> > >
> > > I'm using danny branch. I had downloaded meta-ti, openembedded-core, and
> > > meta-oe as .zip files meant for danny branch. Thanks to Denys D@ti for
> > > help. I integrated meta-ti with yocto, and also built the image with the
> > > default 3.2 kernel, and further with 2.6.37 kernel too, successfully.
> > >
> > > I have also included partial terminal output below.!
> > >
> > > These are a few lines from
> > > /home/asahota/danny-try/danny-8.0/meta-ti/conf/machine/beagleboard.conf
> > > *******START
> > > #@TYPE: Machine
> > > #@NAME: Beagleboard machine
> > > #@DESCRIPTION: Machine configuration for the http://beagleboard.org/board
> > >
> > > require conf/machine/include/omap3.inc
> > >
> > > # Only has DVI connector for external screen
> > > GUI_MACHINE_CLASS = "bigscreen"
> > >
> > > #PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
> > > PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"                <----
> > > change
> > > PREFERRED_VERSION_linux-omap-psp = "2.6.32"
> > > PREFERRED_PROVIDER_virtual/bootloader = "u-boot-beagleboard"
> > > PREFERRED_PROVIDER_u-boot = "u-boot-beagleboard"
> > >
> > > IMAGE_FSTYPES += "tar.gz ubi"
> > > EXTRA_IMAGECMD_jffs2 = "-lnp"
> > >
> > > SERIAL_CONSOLE = "115200 ttyO2"
> > >
> > > UBOOT_MACHINE = "omap3_beagle_config"
> > > *******END
> > >
> > >
> > > These are the FIRST few lines of my terminal output, for the command
> > > bitbake core-image-sato
> > > *******START
> > > WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
> > with
> > > this version of the build system; you may possibly experience unexpected
> > > failures. It is recommended that you use a tested distribution.
> > > Loading cache: 100%
> > >
> > |###################################################################################################################################|
> > > ETA:  00:00:00
> > > Loaded 1210 entries from dependency cache.
> > >
> > > Build Configuration:
> > > BB_VERSION        = "1.16.0"
> > > TARGET_ARCH       = "arm"
> > > TARGET_OS         = "linux-gnueabi"
> > > MACHINE           = "beagleboard"
> > > DISTRO            = "poky"
> > > DISTRO_VERSION    = "1.3"
> > > TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> > > TARGET_FPU        = "vfp-neon"
> > > meta
> > > meta-yocto
> > > meta-ti
> > > meta-yocto-bsp    = "<unknown>:<unknown>"
> > >
> > > NOTE: Resolving any missing task queue dependencies
> > > NOTE: Preparing runqueue
> > > NOTE: Executing SetScene Tasks
> > > *******END
> > >
> > >
> > > These are the LAST few lines of my terminal output, for the command
> > bitbake
> > > -vvv core-image-sato
> > > *******START
> > > | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> > > | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used
> > > [-Wunused-but-set-variable]
> > >  |   LD      fs/ubifs/ubifs.o
> > > |   LD      fs/ubifs/built-in.o
> > > |   LD      fs/built-in.o
> > > | ERROR: oe_runmake failed
> > > | ERROR: Function failed: do_compileconfigs (see
> > >
> > /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/temp/log.do_compileconfigs.28440
> > > for further information)
> >
> > That is not enough backlog to see the error. You should scroll back until
> > you
> > see the error message.
> >
> >
> > > ERROR: Task 805
> > > (/home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/
> > > linux-omap-psp_2.6.32.bb, do_compileconfigs) failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 5104 tasks of which 5097 didn't need to be
> > > rerun and 1 failed.
> > > No currently running tasks (5104 of 5135)
> > >
> > > Summary: 1 task failed:
> > >   /home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/
> > > linux-omap-psp_2.6.32.bb, do_compileconfigs
> > > Summary: There was 1 WARNING message shown.
> > > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> > > *****END
> > >
> > > I spent a lot of time tracing the error in the YP folders and files. It
> > was
> > > somewhere near kernel_do_configure. But I couldn't get where "oe_runmake"
> > > is. Couldn't continue debugging.
> > >
> > > ---------------------------------
> > > Sudhangathan BS
> > > Ph:(+91) 9731-905-205
> > > ---------------------------------
> >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >

> asahota@asahota-Inspiron-N5010:~/danny-try/danny-8.0/build$ bitbake -vvv core-image-sato
> WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
> Loading cache: 100% |###################################################################################################################################| ETA:  00:00:00
> Loaded 1210 entries from dependency cache.
> 
> Build Configuration:
> BB_VERSION        = "1.16.0"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3"
> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta              
> meta-yocto        
> meta-ti           
> meta-yocto-bsp    = "<unknown>:<unknown>"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: selecting pseudo-native to satisfy virtual/fakeroot-native due to PREFERRED_PROVIDERS
> NOTE: selecting u-boot-beagleboard to satisfy u-boot due to PREFERRED_PROVIDERS
> NOTE: selecting opkg-native to satisfy opkg-native due to PREFERRED_PROVIDERS
> NOTE: selecting opkg-native to satisfy virtual/update-alternatives-native due to PREFERRED_PROVIDERS
> NOTE: selecting pigz-native to satisfy gzip-native due to PREFERRED_PROVIDERS
> NOTE: selecting eglibc-locale to satisfy runtime locale-base-en-us due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime locale-base-en-gb due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc to satisfy runtime libsegfault due to PREFERRED_PROVIDER_virtual/libc = eglibc
> NOTE: selecting eglibc to satisfy runtime eglibc-dev due to PREFERRED_PROVIDER_virtual/libc = eglibc
> NOTE: selecting eglibc to satisfy runtime eglibc due to PREFERRED_PROVIDER_virtual/libc = eglibc
> NOTE: selecting u-boot-beagleboard to satisfy runtime u-boot-beagleboard due to PREFERRED_PROVIDER_virtual/bootloader = u-boot-beagleboard
> NOTE: selecting u-boot-beagleboard to satisfy runtime u-boot-beagleboard-dev due to PREFERRED_PROVIDER_virtual/bootloader = u-boot-beagleboard
> NOTE: selecting gcc-cross-initial to satisfy virtual/arm-poky-linux-gnueabi-gcc-initial due to PREFERRED_PROVIDERS
> NOTE: selecting linux-libc-headers to satisfy linux-libc-headers due to PREFERRED_PROVIDERS
> NOTE: selecting eglibc-initial to satisfy virtual/arm-poky-linux-gnueabi-libc-initial due to PREFERRED_PROVIDERS
> NOTE: selecting gcc-cross to satisfy virtual/arm-poky-linux-gnueabi-gcc due to PREFERRED_PROVIDERS
> NOTE: selecting gcc-runtime to satisfy virtual/arm-poky-linux-gnueabi-compilerlibs due to PREFERRED_PROVIDERS
> NOTE: selecting eglibc to satisfy virtual/libc due to PREFERRED_PROVIDERS
> NOTE: selecting linux-omap-psp to satisfy virtual/kernel due to PREFERRED_PROVIDERS
> NOTE: selecting gettext to satisfy virtual/gettext due to PREFERRED_PROVIDERS
> NOTE: selecting nativesdk-eglibc to satisfy virtual/nativesdk-libc due to PREFERRED_PROVIDERS
> NOTE: selecting db to satisfy virtual/db due to PREFERRED_PROVIDERS
> NOTE: selecting libgcc to satisfy runtime libgcc due to PREFERRED_PROVIDER_libgcc = libgcc
> NOTE: selecting libgcc to satisfy runtime libgcc-dev due to PREFERRED_PROVIDER_libgcc = libgcc
> NOTE: selecting gcc-runtime to satisfy runtime libstdc++ due to PREFERRED_PROVIDER_virtual/arm-poky-linux-gnueabi-compilerlibs = gcc-runtime
> NOTE: selecting gcc-runtime to satisfy runtime libstdc++-dev due to PREFERRED_PROVIDER_virtual/arm-poky-linux-gnueabi-compilerlibs = gcc-runtime
> NOTE: selecting eglibc to satisfy runtime eglibc-dbg due to PREFERRED_PROVIDER_virtual/libc = eglibc
> NOTE: selecting eglibc to satisfy runtime eglibc-utils due to PREFERRED_PROVIDER_virtual/libc = eglibc
> NOTE: selecting eglibc to satisfy runtime eglibc-thread-db due to PREFERRED_PROVIDER_virtual/libc = eglibc
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-localedata-i18n due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-gconv-ibm850 due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-gconv-cp1252 due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-gconv-iso8859-1 due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-gconv-iso8859-15 due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting opkg to satisfy runtime update-alternatives-cworth due to PREFERRED_PROVIDER_opkg = opkg
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nfs due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-msdos due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-vfat due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nls-iso8859-1 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nls-cp437 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nls-utf8 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-input due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-uinput due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-rtc-dev due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-rtc-proc due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-rtc-sysfs due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-unix due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-bluetooth due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-l2cap due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-rfcomm due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-hci-vhci due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-bnep due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-hidp due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-hci-uart due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-sco due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-hci-usb due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-pxa27x_udc due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-gadgetfs due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-g-file-storage due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-g-serial due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-g-ether due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-zd1211rw due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ieee80211-crypt due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ieee80211-crypt-ccmp due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ieee80211-crypt-tkip due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ieee80211-crypt-wep due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ecb due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-arc4 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-crypto_algapi due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-cryptomgr due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-michael-mic due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-aes-generic due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-aes due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-uhci-hcd due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ohci-hcd due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ehci-hcd due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-usbcore due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-usbhid due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-usbnet due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-sd-mod due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-scsi-mod due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-usbmouse due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-mousedev due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-usbserial due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-usb-storage due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-af-packet due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-cdc-acm due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-cdc-wdm due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-snd-mixer-oss due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-snd-pcm-oss due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-smsc95xx due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-snd-soc-twl4030 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-rtc-twl due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-snd-soc-omap due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-snd-soc-omap-mcbsp due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-snd-soc-omap3beagle due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ipv6 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting nativesdk-opkg to satisfy runtime nativesdk-opkg due to PREFERRED_PROVIDER_nativesdk-opkg = nativesdk-opkg
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-gconvs due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-localedatas due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-charmaps due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting eglibc-locale to satisfy runtime eglibc-locale due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting linux-libc-headers to satisfy runtime linux-libc-headers-dev due to PREFERRED_PROVIDER_linux-libc-headers = linux-libc-headers
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-base due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-image due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting gettext to satisfy runtime gettext-dev due to PREFERRED_PROVIDER_virtual/gettext = gettext
> NOTE: selecting gettext to satisfy runtime gettext due to PREFERRED_PROVIDER_virtual/gettext = gettext
> NOTE: selecting db to satisfy runtime db-dev due to PREFERRED_PROVIDER_virtual/db = db
> NOTE: selecting db to satisfy runtime db due to PREFERRED_PROVIDER_virtual/db = db
> NOTE: selecting nativesdk-eglibc to satisfy runtime nativesdk-eglibc due to PREFERRED_PROVIDER_virtual/nativesdk-libc = nativesdk-eglibc
> NOTE: selecting nativesdk-eglibc to satisfy runtime nativesdk-eglibc-dev due to PREFERRED_PROVIDER_virtual/nativesdk-libc = nativesdk-eglibc
> NOTE: selecting nativesdk-eglibc to satisfy runtime nativesdk-libsegfault due to PREFERRED_PROVIDER_virtual/nativesdk-libc = nativesdk-eglibc
> NOTE: selecting binutils-cross to satisfy virtual/arm-poky-linux-gnueabi-binutils due to PREFERRED_PROVIDERS
> NOTE: selecting eglibc to satisfy virtual/arm-poky-linux-gnueabi-libc-for-gcc due to PREFERRED_PROVIDERS
> NOTE: selecting gcc-cross to satisfy virtual/arm-poky-linux-gnueabi-g++ due to PREFERRED_PROVIDERS
> NOTE: selecting libgcc to satisfy libgcc due to PREFERRED_PROVIDERS
> NOTE: selecting eglibc to satisfy virtual/libiconv due to PREFERRED_PROVIDERS
> NOTE: selecting eglibc to satisfy virtual/libintl due to PREFERRED_PROVIDERS
> NOTE: selecting nativesdk-eglibc to satisfy virtual/nativesdk-i686-pokysdk-linux-libc-for-gcc due to PREFERRED_PROVIDERS
> NOTE: selecting nativesdk-libgcc to satisfy nativesdk-libgcc due to PREFERRED_PROVIDERS
> NOTE: selecting nativesdk-linux-libc-headers to satisfy nativesdk-linux-libc-headers due to PREFERRED_PROVIDERS
> NOTE: selecting nativesdk-eglibc-initial to satisfy virtual/nativesdk-i686-pokysdk-linux-libc-initial due to PREFERRED_PROVIDERS
> NOTE: selecting dbus-glib to satisfy dbus-glib due to PREFERRED_PROVIDERS
> NOTE: selecting mesa-dri to satisfy virtual/libgl due to PREFERRED_PROVIDERS
> NOTE: selecting libx11 to satisfy virtual/libx11 due to PREFERRED_PROVIDERS
> NOTE: selecting opkg to satisfy runtime opkg-dev due to PREFERRED_PROVIDER_opkg = opkg
> NOTE: selecting opkg to satisfy runtime opkg due to PREFERRED_PROVIDER_opkg = opkg
> NOTE: selecting xserver-xorg to satisfy runtime xserver-xorg due to PREFERRED_PROVIDER_virtual/xserver-xf86 = xserver-xorg
> NOTE: selecting nativesdk-opkg to satisfy runtime nativesdk-opkg-dev due to PREFERRED_PROVIDER_nativesdk-opkg = nativesdk-opkg
> NOTE: selecting nativesdk-libgcc to satisfy runtime nativesdk-libgcc due to PREFERRED_PROVIDER_nativesdk-libgcc = nativesdk-libgcc
> NOTE: selecting nativesdk-linux-libc-headers to satisfy runtime nativesdk-linux-libc-headers-dev due to PREFERRED_PROVIDER_nativesdk-linux-libc-headers = nativesdk-linux-libc-headers
> NOTE: selecting dbus-glib to satisfy runtime dbus-glib-dev due to PREFERRED_PROVIDER_dbus-glib = dbus-glib
> NOTE: selecting dbus-glib to satisfy runtime dbus-glib due to PREFERRED_PROVIDER_dbus-glib = dbus-glib
> NOTE: selecting gdk-pixbuf to satisfy runtime gdk-pixbuf-loader-png due to PREFERRED_PROVIDER_gdk-pixbuf = gdk-pixbuf
> NOTE: selecting gdk-pixbuf to satisfy runtime gdk-pixbuf-loader-jpeg due to PREFERRED_PROVIDER_gdk-pixbuf = gdk-pixbuf
> NOTE: selecting gdk-pixbuf to satisfy runtime gdk-pixbuf-loader-gif due to PREFERRED_PROVIDER_gdk-pixbuf = gdk-pixbuf
> NOTE: selecting gdk-pixbuf to satisfy runtime gdk-pixbuf-loader-xpm due to PREFERRED_PROVIDER_gdk-pixbuf = gdk-pixbuf
> NOTE: selecting eglibc-locale to satisfy runtime glibc-gconv-iso8859-1 due to PREFERRED_PROVIDER_virtual/libc-locale = eglibc-locale
> NOTE: selecting mesa-dri to satisfy runtime mesa-dri due to PREFERRED_PROVIDER_virtual/libgl = mesa-dri
> NOTE: selecting mesa-dri to satisfy runtime mesa-dri-dev due to PREFERRED_PROVIDER_virtual/libgl = mesa-dri
> NOTE: selecting libx11 to satisfy runtime libx11-dev due to PREFERRED_PROVIDER_virtual/libx11 = libx11
> NOTE: selecting libx11 to satisfy runtime libx11 due to PREFERRED_PROVIDER_virtual/libx11 = libx11
> NOTE: selecting dbus-glib-native to satisfy dbus-glib-native due to PREFERRED_PROVIDERS
> NOTE: selecting gdk-pixbuf to satisfy gdk-pixbuf due to PREFERRED_PROVIDERS
> NOTE: selecting nativesdk-eglibc to satisfy virtual/nativesdk-libiconv due to PREFERRED_PROVIDERS
> NOTE: selecting nativesdk-eglibc to satisfy virtual/nativesdk-libintl due to PREFERRED_PROVIDERS
> NOTE: selecting xserver-xorg to satisfy virtual/xserver due to PREFERRED_PROVIDERS
> NOTE: selecting xserver-xorg to satisfy runtime xserver-xorg-dev due to PREFERRED_PROVIDER_virtual/xserver-xf86 = xserver-xorg
> NOTE: selecting xserver-xorg to satisfy runtime xserver-xorg-security-policy due to PREFERRED_PROVIDER_virtual/xserver-xf86 = xserver-xorg
> NOTE: selecting gdk-pixbuf to satisfy runtime gdk-pixbuf due to PREFERRED_PROVIDER_gdk-pixbuf = gdk-pixbuf
> NOTE: selecting gdk-pixbuf to satisfy runtime gdk-pixbuf-dev due to PREFERRED_PROVIDER_gdk-pixbuf = gdk-pixbuf
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-x-tables due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ip-tables due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-iptable-filter due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-iptable-nat due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nf-defrag-ipv4 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nf-conntrack due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nf-conntrack-ipv4 due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-nf-nat due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: selecting linux-omap-psp to satisfy runtime kernel-module-ipt-masquerade due to PREFERRED_PROVIDER_virtual/kernel = linux-omap-psp
> NOTE: Preparing runqueue
> NOTE: Marking Active Tasks
> NOTE: Pruned 7277 inactive tasks, 5135 left
> NOTE: Assign Weightings
> NOTE: Compute totals (have 1 endpoint(s))
> NOTE: Executing SetScene Tasks
> + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> + sstate_unpack_package
> + mkdir -p /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/sstate-install-populate-lic/
> 
> + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/sstate-install-populate-lic/
> + tar -xvzf /home/asahota/danny-try/danny-8.0/build/sstate-cache/e8/sstate-linux-omap-psp-beagleboard-poky-linux-gnueabi-2.6.32-r0-beagleboard-2-e8512aa270fc93c77c7dea6f3f0ef18a_populate-lic.tgz
> 
> linux-omap-psp/
> 
> linux-omap-psp/COPYING
> linux-omap-psp/generic_GPLv2
> 
> NOTE: Executing RunQueue Tasks
> + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> + do_quiltfixup
> + rm /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.pc -rf
> 
> 
> + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> + do_configure
> + sed -i -e s/getline/parseline/g /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/scripts/unifdef.c
> 
> + echo 
> 
> + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm ]
> + install -m 0644 /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> 
> + echo CONFIG_LOGO=y
> + echo CONFIG_LOGO_LINUX_CLUT224=y
> 
> + [ linux-gnueabi = linux-gnueabi -o linux-gnueabi = linux-uclibceabi ]
> + echo CONFIG_AEABI=y
> + [ 1 = 1 ]
> + echo CONFIG_OABI_COMPAT=y
> + [  = thumb ]
> + [ yes = yes ]
> + sed -i -e /CONFIG_ARM_ERRATA_430973/d /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig
> 
> + echo CONFIG_ARM_ERRATA_430973=y
> + 
> [ le = be ]
> + echo CONFIG_CMDLINE=" debug "
> + sed -e /CONFIG_AEABI/d -e /CONFIG_OABI_COMPAT=/d -e /CONFIG_CMDLINE=/d -e /CONFIG_CPU_BIG_ENDIAN/d -e /CONFIG_LOGO=/d -e /CONFIG_LOGO_LINUX_CLUT224=/d -e /CONFIG_LOCALVERSION/d -e /CONFIG_LOCALVERSION_AUTO/d
> 
> + echo CONFIG_LOCALVERSION=""
> 
> + echo # CONFIG_LOCALVERSION_AUTO is not set
> + [ 0 = 1 ]
> + [  = 1 ]
> + [ ! -z  ]
> + yes 
> 
> + oe_runmake oldconfig
> + [ xmake = x ]
> + bbnote make -j 32 oldconfig
> + echo NOTE: make -j 32 oldconfig
> NOTE: make -j 32 oldconfig
> + make -j 32 oldconfig
> 
>   HOSTCC  scripts/basic/fixdep
> 
>   HOSTCC  scripts/basic/docproc
> 
>   HOSTCC  scripts/basic/hash
> 
>   HOSTCC  scripts/kconfig/conf.o
> 
> scripts/kconfig/conf.c: In function 'conf_sym':
> scripts/kconfig/conf.c:159:6: warning: variable 'type' set but not used [-Wunused-but-set-variable]
> 
> scripts/kconfig/conf.c: In function 'conf_choice':
> scripts/kconfig/conf.c:231:6: warning: variable 'type' set but not used [-Wunused-but-set-variable]
> 
> scripts/kconfig/conf.c:307:9: warning: ignoring return value of 'fgets', declared with attribute warn_unused_result [-Wunused-result]
> 
> scripts/kconfig/conf.c: In function 'conf_askvalue':
> scripts/kconfig/conf.c:105:8: warning: ignoring return value of 'fgets', declared with attribute warn_unused_result [-Wunused-result]
> 
>   HOSTCC  scripts/kconfig/kxgettext.o
> 
>   SHIPPED scripts/kconfig/lex.zconf.c
>   SHIPPED scripts/kconfig/zconf.tab.c
> 
>   SHIPPED scripts/kconfig/zconf.hash.c
> 
>   HOSTCC  scripts/kconfig/zconf.tab.o
> 
>   HOSTLD  scripts/kconfig/conf
> 
> scripts/kconfig/conf -o arch/arm/Kconfig
> 
> .config:346:warning: override: reassigning to symbol OABI_COMPAT
> 
> #
> # configuration written to .config
> #
> 
> + kernel_do_configure
> + touch
>  /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion
> 
> + [ -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig ]
> + [ ! -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.config ]
> 
> + yes 
> + oe_runmake oldconfig
> + [ xmake = x ]
> + bbnote make -j 32 oldconfig
> + echo NOTE: make -j 32 oldconfig
> NOTE: make -j 32 oldconfig
> + make -j 32
>  oldconfig
> 
> scripts/kconfig/conf -o arch/arm/Kconfig
> 
> #
> # configuration written to .config
> #
> 
> + [ ! -z  ]
> + 
> test -e scripts/Makefile.fwinst
> + sed -i -e s:-m0644:-m 0644:g scripts/Makefile.fwinst
> 
> 
> + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> + do_preparekernel
> + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> + oe_runmake prepare CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + [ xmake = x ]
> + bbnote make -j 32 prepare CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + echo NOTE: make -j 32 prepare CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> NOTE: make -j 32 prepare CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + make -j 32 prepare CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> 
> scripts/kconfig/conf -s arch/arm/Kconfig
> 
>   CHK     include/linux/version.h
> 
>   UPD     include/linux/version.h
> 
>   SYMLINK include/asm -> include/asm-arm
> 
>   Generating include/asm-arm/mach-types.h
> 
>   CHK     include/linux/utsrelease.h
> 
>   UPD     include/linux/utsrelease.h
> 
>   CC      kernel/bounds.s
> 
>   GEN     include/linux/bounds.h
> 
>   CC      arch/arm/kernel/asm-offsets.s
> 
>   GEN     include/asm/asm-offsets.h
> 
>   CALL    scripts/checksyscalls.sh
> 
> <stdin>:1523:2: warning: #warning syscall recvmmsg not implemented [-Wcpp]
> 
> 
> + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> + do_compileconfigs
> + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/configs ]
> + [ -e
>  /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/empty ]
> + echo Multiple configs found, building those first
> Multiple configs found, building those first
> + cp /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig.save
> 
> + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> + cp /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/cpuidle /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig
> 
> + echo CONFIG_IKCONFIG=y
> 
> + echo CONFIG_IKCONFIG_PROC=y
> + do_configure
> 
> + sed -i -e s/getline/parseline/g /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/scripts/unifdef.c
> 
> + echo 
> 
> + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm ]
> + install -m 0644 /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> 
> + echo CONFIG_LOGO=y
> 
> + echo CONFIG_LOGO_LINUX_CLUT224=y
> + [ linux-gnueabi = linux-gnueabi -o linux-gnueabi = linux-uclibceabi ]
> + echo CONFIG_AEABI=y
> + [ 1 = 1 ]
> + echo CONFIG_OABI_COMPAT=y
> + [  = thumb ]
> + [ yes = yes ]
> + sed -i -e /CONFIG_ARM_ERRATA_430973/d /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig
> 
> + echo CONFIG_ARM_ERRATA_430973=y
> + [
>  le = be ]
> + echo CONFIG_CMDLINE=" debug "
> + sed -e /CONFIG_AEABI/d -e /CONFIG_OABI_COMPAT=/d -e /CONFIG_CMDLINE=/d -e /CONFIG_CPU_BIG_ENDIAN/d -e /CONFIG_LOGO=/d -e /CONFIG_LOGO_LINUX_CLUT224=/d -e /CONFIG_LOCALVERSION/d -e /CONFIG_LOCALVERSION_AUTO/d
> 
> + echo CONFIG_LOCALVERSION=""
> 
> + echo # CONFIG_LOCALVERSION_AUTO is not set
> + [ 0 = 1 ]
> + [  = 1 ]
> + [ ! -z  ]
> + + oe_runmake oldconfig
> yes 
> + [ xmake = x ]
> 
> + bbnote make -j 32 oldconfig
> + echo NOTE: make -j 32 oldconfig
> NOTE: make -j 32 oldconfig
> + make -j 32 oldconfig
> 
> scripts/kconfig/conf -o arch/arm/Kconfig
> 
> .config:345:warning: override: reassigning to symbol OABI_COMPAT
> 
> .config:3054:warning: override: reassigning to symbol IKCONFIG
> .config:3055:warning: override: reassigning to symbol IKCONFIG_PROC
> 
> *
> * Restart config...
> *
> *
> * OCF Configuration
> *
> OCF (Open Cryptograhic Framework) (OCF_OCF) [N/m/y/?] (NEW) 
> #
> # configuration written to .config
> #
> 
> + kernel_do_configure
> 
> + touch /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion
> 
> + [ -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig ]
> + [ ! -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.config ]
> 
> + yes 
> + oe_runmake oldconfig
> + [ xmake = x ]
> + bbnote make -j 32 oldconfig
> + echo NOTE: make -j 32 oldconfig
> NOTE: make -j 32 oldconfig
> + make -j
>  32 oldconfig
> 
> scripts/kconfig/conf -o arch/arm/Kconfig
> 
> #
> # configuration written to .config
> #
> 
> + [ ! -z  ]
> 
> + test -e scripts/Makefile.fwinst
> + sed -i -e s:-m0644:-m 0644:g scripts/Makefile.fwinst
> 
> + kernel_do_compile
> + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> 
> + oe_runmake include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + [ xmake = x ]
> + bbnote make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + echo NOTE: make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> NOTE: make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> 
>   CHK     include/linux/version.h
> 
> + oe_runmake uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + [ xmake = x ]
> + bbnote make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + echo NOTE: make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> NOTE: make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> + make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> 
> scripts/kconfig/conf -s arch/arm/Kconfig
> 
>   CHK     include/linux/version.h
> 
>   SYMLINK include/asm -> include/asm-arm
> 
> make[1]: `include/asm-arm/mach-types.h' is up to date.
> 
>   CHK     include/linux/utsrelease.h
> 
>   HOSTCC  scripts/kallsyms
> 
>   HOSTCC  scripts/pnmtologo
> 
>   HOSTCC  scripts/conmakehash
> 
>   HOSTCC  scripts/bin2c
> 
>   SHIPPED scripts/genksyms/lex.c
> 
>   SHIPPED scripts/genksyms/parse.h
> 
>   HOSTCC  scripts/genksyms/genksyms.o
> 
>   CC      scripts/mod/empty.o
> 
>   SHIPPED scripts/genksyms/keywords.c
> 
>   HOSTCC  scripts/mod/mk_elfconfig
> 
>   SHIPPED scripts/genksyms/parse.c
> 
>   HOSTCC  scripts/genksyms/lex.o
> 
>   HOSTCC  scripts/genksyms/parse.o
> 
> scripts/kallsyms.c: In function 'read_symbol':
> 
> 
> scripts/kallsyms.c:112:9: warning: ignoring return value of 'fgets', declared with attribute warn_unused_result [-Wunused-result]
> 
> 
>   MKELF   scripts/mod/elfconfig.h
> 
>   HOSTCC  scripts/mod/file2alias.o
> 
>   HOSTCC  scripts/mod/modpost.o
> 
>   HOSTCC  scripts/mod/sumversion.o
> 
> scripts/mod/modpost.c: In function 'get_markers':
> 
> 
> scripts/mod/modpost.c:1562:12: warning: ignoring return value of 'asprintf', declared with attribute warn_unused_result [-Wunused-result]
> 
> 
> scripts/mod/modpost.c: In function 'add_marker':
> 
> 
> scripts/mod/modpost.c:1982:10: warning: ignoring return value of 'asprintf', declared with attribute warn_unused_result [-Wunused-result]
> 
> 
>   HOSTLD  scripts/genksyms/genksyms
> 
>   HOSTLD  scripts/mod/modpost
> 
>   CALL    scripts/checksyscalls.sh
> 
> <stdin>:1523:2: warning: #warning syscall recvmmsg not implemented [-Wcpp]
> 
>   CC      init/main.o
> 
>   CHK     include/linux/compile.h
> 
>   CC      init/do_mounts.o
> 
>   CC      init/do_mounts_initrd.o
> 
>   CC      init/do_mounts_rd.o
> 
>   CC      init/initramfs.o
> 
>   CC      init/calibrate.o
> 
>   UPD     include/linux/compile.h
> 
>   HOSTCC  usr/gen_init_cpio
> 
>   CC      init/version.o
> 
>   CC      arch/arm/kernel/compat.o
> 
>   CC      arch/arm/kernel/elf.o
> 
>   AS      arch/arm/kernel/entry-armv.o
> 
>   AS      arch/arm/kernel/entry-common.o
> 
>   CC      arch/arm/kernel/irq.o
> 
>   CC      arch/arm/kernel/process.o
> 
>   CC      arch/arm/kernel/ptrace.o
> 
>   CC      arch/arm/kernel/return_address.o
> 
>   CC      arch/arm/kernel/setup.o
> 
>   CC      arch/arm/kernel/signal.o
> 
>   CC      arch/arm/kernel/sys_arm.o
> 
> In file included from include/linux/blkdev.h:12:0,
>                  from init/do_mounts.h:2,
>                  from init/do_mounts_initrd.c:11:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
>   CC      arch/arm/kernel/stacktrace.o
> 
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/kernel/time.o
> 
>   CC      arch/arm/kernel/traps.o
> 
> In file included from include/linux/blkdev.h:12:0,
>                  from init/do_mounts.h:2,
>                  from init/do_mounts_rd.c:11:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
>   CC      arch/arm/kernel/armksyms.o
> 
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/kernel/module.o
> 
>   CC      arch/arm/kernel/machine_kexec.o
> 
>   AS      arch/arm/kernel/relocate_kernel.o
> 
>   CC      arch/arm/kernel/atags.o
> 
>   CC      arch/arm/kernel/thumbee.o
> 
>   CC      arch/arm/kernel/unwind.o
> 
>   CC      arch/arm/kernel/sysfs_v7.o
> 
>   CC      arch/arm/kernel/io.o
> 
>   AS      arch/arm/kernel/head.o
> 
>   CC      arch/arm/mm/dma-mapping.o
> 
>   CC      arch/arm/kernel/init_task.o
> 
> In file included from include/linux/mempolicy.h:62:0,
>                  from init/main.c:52:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
> In file included from include/linux/nfs_fs.h:44:0,
>                  from init/do_mounts.c:19:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   LDS     arch/arm/kernel/vmlinux.lds
> 
>   CC      arch/arm/mm/extable.o
> 
>   CC      arch/arm/mm/fault.o
> 
>   CC      arch/arm/common/clkdev.o
> 
> arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
> 
>   CC      arch/arm/mm/init.o
> 
>   CC      arch/arm/mm/iomap.o
> 
>   CC      arch/arm/mm/fault-armv.o
> 
> arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
> 
>   CC      arch/arm/mm/flush.o
> 
>   CC      arch/arm/mm/ioremap.o
> 
>   CC      arch/arm/mm/mmap.o
> 
>   CC      arch/arm/mm/pgd.o
> 
>   CC      arch/arm/mach-omap2/id.o
> 
>   CC      arch/arm/mach-omap2/io.o
> 
>   GEN     usr/initramfs_data.cpio
> 
>   CC      arch/arm/mach-omap2/control.o
> 
>   AS      usr/initramfs_data.o
> 
> In file included from arch/arm/mm/flush.c:12:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      arch/arm/mach-omap2/mux.o
> 
>   LD      usr/built-in.o
> 
>   CC      arch/arm/mm/mmu.o
> 
>   CC      arch/arm/mach-omap2/devices.o
> 
> /tmp/ccA8lCEo.s: 
> Assembler messages:
> 
> /tmp/ccA8lCEo.s:309: 
> Error: 
> selected processor does not support ARM mode `smc #0'
> 
> 
> /tmp/ccA8lCEo.s:349: 
> Error: 
> selected processor does not support ARM mode `smc #0'
> 
> 
> make[1]: *** [arch/arm/kernel/sysfs_v7.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> 
>   CC      arch/arm/mm/vmregion.o
> 
>   CC      arch/arm/mach-omap2/serial.o
> 
> In file included from arch/arm/mm/fault-armv.c:18:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
> arch/arm/mm/dma-mapping.c: In function '__dma_alloc':
> 
> 
> arch/arm/mm/dma-mapping.c:218:25: warning: array subscript is above array bounds [-Warray-bounds]
> 
> 
>   CC      arch/arm/mm/proc-syms.o
> 
>   CC      arch/arm/plat-omap/common.o
> 
>   CC      arch/arm/mm/alignment.o
> 
> arch/arm/mm/dma-mapping.c: In function 'dma_free_coherent':
> 
> 
> arch/arm/mm/dma-mapping.c:262:25: warning: array subscript is above array bounds [-Warray-bounds]
> 
> 
>   CC      arch/arm/plat-omap/sram.o
> 
>   LD      arch/arm/common/built-in.o
> 
>   CC      arch/arm/plat-omap/clock.o
> 
>   CC      arch/arm/mach-omap2/gpmc.o
> 
>   CC      arch/arm/mach-omap2/timer-gp.o
> 
>   AS      arch/arm/mm/abort-ev7.o
> 
>   CC      arch/arm/mach-omap2/irq.o
> 
>   AS      arch/arm/mm/pabort-v7.o
> 
>   CC      arch/arm/vfp/vfpmodule.o
> 
>   AS      arch/arm/vfp/entry.o
> 
>   CC      arch/arm/plat-omap/devices.o
> 
>   LD      init/mounts.o
> 
>   CC      arch/arm/plat-omap/dma.o
> 
>   LD      init/built-in.o
> 
>   CC      arch/arm/mach-omap2/sdrc.o
> 
>   CC      arch/arm/plat-omap/mux.o
> 
>   CC      arch/arm/mach-omap2/omap_hwmod.o
> 
>   AS      arch/arm/vfp/vfphw.o
> 
> arch/arm/mach-omap2/devices.c: In function 'omap_hsmmc_reset':
> 
> 
> arch/arm/mach-omap2/devices.c:499:7: warning: variable 'v' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/mach-omap2/prcm.o
> 
>   CC      arch/arm/mach-omap2/powerdomain.o
> 
>   CC      arch/arm/mach-omap2/clock.o
> 
>   CC      arch/arm/vfp/vfpsingle.o
> 
>   CC      arch/arm/mach-omap2/clock_common_data.o
> 
>   AS      arch/arm/mm/cache-v7.o
> 
>   CC      kernel/sched.o
> 
>   CC      arch/arm/mm/copypage-v6.o
> 
> arch/arm/mach-omap2/serial.c: In function 'omap_uart_enable_irqs':
> 
> 
> arch/arm/mach-omap2/serial.c:481:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/mm/context.o
> 
>   CC      arch/arm/plat-omap/gpio.o
> 
>   AS      arch/arm/mm/tlb-v7.o
> 
>   CC      mm/bootmem.o
> 
>   CC      mm/filemap.o
> 
>   CC      arch/arm/plat-omap/usb.o
> 
>   AS      arch/arm/mm/proc-v7.o
> 
>   CC      arch/arm/mach-omap2/clockdomain.o
> 
> arch/arm/plat-omap/dma.c: In function 'omap_enable_channel_irq':
> 
> 
> arch/arm/plat-omap/dma.c:621:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/plat-omap/fb.o
> 
>   CC      arch/arm/plat-omap/io.o
> 
>   CC      arch/arm/mach-omap2/dpll.o
> 
>   CC      arch/arm/plat-omap/omap_device.o
> 
>   CC      arch/arm/mach-omap2/mcbsp.o
> 
>   AS      arch/arm/mach-omap2/sram34xx.o
> 
>   CC      arch/arm/mach-omap2/mux34xx.o
> 
>   CC      arch/arm/mach-omap2/pm34xx.o
> 
>   CC      arch/arm/mach-omap2/cpuidle34xx.o
> 
> arch/arm/mm/alignment.c: In function 'do_alignment':
> arch/arm/mm/alignment.c:294:15: warning: 'offset.un' may be used uninitialized in this function [-Wmaybe-uninitialized]
> arch/arm/mm/alignment.c:716:21: note: 'offset.un' was declared here
> 
> arch/arm/plat-omap/gpio.c: In function 'gpio_get':
> 
> 
> arch/arm/plat-omap/gpio.c:1599:16: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/vfp/vfpdouble.o
> 
>   CC      arch/arm/plat-omap/mcbsp.o
> 
>   CC      mm/mempool.o
> 
> In file included from include/linux/blkdev.h:12:0,
>                  from kernel/sched.c:48:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      mm/oom_kill.o
> 
> In file included from mm/filemap.c:23:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/plat-omap/iommu.o
> 
>   AS      arch/arm/mach-omap2/sleep34xx.o
> 
>   CC      mm/fadvise.o
> 
>   CC      mm/maccess.o
> 
> make: *** [arch/arm/kernel] Error 2
> make: *** Waiting for unfinished jobs....
> 
> arch/arm/mach-omap2/sleep34xx.S: 
> Assembler messages:
> 
> arch/arm/mach-omap2/sleep34xx.S:73: 
> Warning: 
> swp{b} use is deprecated for this architecture
> 
> 
>   CC      mm/page_alloc.o
> 
>   CC      arch/arm/mach-omap2/pm-debug.o
> 
>   CC      arch/arm/mach-omap2/smartreflex.o
> 
>   CC      arch/arm/mach-omap2/cm.o
> 
>   CC      arch/arm/plat-omap/iovmm.o
> 
> mm/filemap.c: In function 'generic_perform_write':
> 
> 
> mm/filemap.c:2166:11: warning: variable 'index' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/plat-omap/cpu-omap.o
> 
> arch/arm/plat-omap/mcbsp.c: In function 'omap_mcbsp_spi_master_xmit_word_poll':
> 
> 
> arch/arm/plat-omap/mcbsp.c:806:44: warning: variable 'word_msb' set but not used [-Wunused-but-set-variable]
> 
> 
> arch/arm/plat-omap/mcbsp.c:806:34: warning: variable 'word_lsb' set but not used [-Wunused-but-set-variable]
> 
> 
> arch/arm/plat-omap/mcbsp.c: In function 'omap_mcbsp_set_spi_mode':
> 
> 
> arch/arm/plat-omap/mcbsp.c:1079:21: warning: variable 'mcbsp' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/plat-omap/dmtimer.o
> 
>   CC      arch/arm/mach-omap2/clock34xx.o
> 
>   CC      arch/arm/mach-omap2/clock34xx_data.o
> 
>   CC      arch/arm/mach-omap2/resource34xx.o
> 
>   CC      mm/page-writeback.o
> 
>   CC      arch/arm/plat-omap/i2c.o
> 
> In file included from include/linux/blkdev.h:12:0,
>                  from mm/mempool.c:15:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/mach-omap2/iommu2.o
> 
> kernel/sched.c: In function 'alloc_fair_sched_group':
> 
> 
> kernel/sched.c:9831:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/mach-omap2/omap3-iommu.o
> 
> In file included from mm/fadvise.c:14:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> arch/arm/plat-omap/iovmm.c: In function 'sgtable_fill_vmalloc':
> 
> 
> arch/arm/plat-omap/iovmm.c:378:8: warning: variable 'va_end' set but not used [-Wunused-but-set-variable]
> 
> 
> arch/arm/plat-omap/iovmm.c: In function 'sgtable_fill_kmalloc':
> 
> 
> arch/arm/plat-omap/iovmm.c:410:8: warning: variable 'va' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/mach-omap2/i2c.o
> 
>   LD      arch/arm/mm/built-in.o
> 
>   CC      arch/arm/plat-omap/omap-pm-srf.o
> 
>   CC      arch/arm/plat-omap/resource.o
> 
>   CC      mm/readahead.o
> 
>   CC      mm/swap.o
> 
> In file included from mm/page_alloc.c:21:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
> arch/arm/mach-omap2/smartreflex.c: In function 'sr_voltagescale_vcbypass':
> 
> arch/arm/mach-omap2/smartreflex.c:1096:26: warning: variable 'current_opp_no' set but not used [-Wunused-but-set-variable]
> 
>   CC      arch/arm/mach-omap2/board-omap3beagle.o
> 
>   CC      mm/truncate.o
> 
> arch/arm/mach-omap2/resource34xx.c: In function 'init_freq':
> arch/arm/mach-omap2/resource34xx.c:424:8: warning: variable 'linked_res_name' set but not used [-Wunused-but-set-variable]
> 
>   CC      arch/arm/mach-omap2/mmc-twl4030.o
> 
>   CC      arch/arm/mach-omap2/board-omap3beagle-camera.o
> 
> In file included from mm/page-writeback.c:21:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      arch/arm/mach-omap2/usb-musb.o
> 
> In file included from include/linux/blkdev.h:12:0,
>                  from mm/readahead.c:14:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
> arch/arm/plat-omap/resource.c:79:32: warning: 'resource_lookup' defined but not used [-Wunused-function]
> 
> 
>   CC      kernel/fork.o
> 
>   CC      kernel/exec_domain.o
> 
> arch/arm/mach-omap2/smartreflex.c: In function 'sr_set_efuse_nvalues':
> 
> 
> arch/arm/mach-omap2/smartreflex.c:292:31: warning: 'opp6_senPgain' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> 
> arch/arm/mach-omap2/smartreflex.c:276:6: note: 'opp6_senPgain' was declared here
> 
> 
> arch/arm/mach-omap2/smartreflex.c:293:17: warning: 'opp6_senPRN' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> 
> arch/arm/mach-omap2/smartreflex.c:276:36: note: 'opp6_senPRN' was declared here
> 
> 
> arch/arm/mach-omap2/smartreflex.c:292:57: warning: 'opp6_senNgain' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> 
> arch/arm/mach-omap2/smartreflex.c:276:21: note: 'opp6_senNgain' was declared here
> 
> 
> arch/arm/mach-omap2/smartreflex.c:292:40: warning: 'opp6_senNRN' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> 
> arch/arm/mach-omap2/smartreflex.c:276:49: note: 'opp6_senNRN' was declared here
> 
> 
>   CC      arch/arm/mach-omap2/usb-ehci.o
> 
>   CC      kernel/panic.o
> 
>   CC      mm/vmscan.o
> 
>   CC      kernel/printk.o
> 
>   CC      kernel/cpu.o
> 
>   CC      kernel/exit.o
> 
> In file included from mm/truncate.c:15:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/itimer.o
> 
> In file included from mm/swap.c:21:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   TIMEC   kernel/timeconst.h
> 
>   CC      mm/shmem.o
> 
>   CC      mm/prio_tree.o
> 
>   CC      mm/util.o
> 
>   CC      mm/mmzone.o
> 
>   CC      mm/vmstat.o
> 
>   CC      kernel/softirq.o
> 
>   CC      kernel/resource.o
> 
> In file included from include/linux/mempolicy.h:62:0,
>                  from kernel/fork.c:21:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/sysctl.o
> 
>   CC      mm/backing-dev.o
> 
>   LD      arch/arm/vfp/vfp.o
> 
>   LD      arch/arm/vfp/built-in.o
> 
> In file included from mm/vmscan.c:19:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      mm/page_isolation.o
> 
>   CC      kernel/sysctl_binary.o
> 
>   CC      kernel/capability.o
> 
> In file included from include/linux/mempolicy.h:62:0,
>                  from kernel/exit.c:31:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   LD      arch/arm/plat-omap/built-in.o
> 
>   CC      kernel/ptrace.o
> 
>   CC      kernel/timer.o
> 
>   CC      kernel/user.o
> 
>   CC      mm/mm_init.o
> 
>   CC      mm/mmu_context.o
> 
> In file included from mm/shmem.c:27:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      mm/fremap.o
> 
> In file included from mm/backing-dev.c:7:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
>   CC      kernel/signal.o
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      kernel/sys.o
> 
>   CC      mm/highmem.o
> 
>   CC      kernel/kmod.o
> 
>   CC      kernel/workqueue.o
> 
>   CC      mm/madvise.o
> 
> In file included from include/linux/mempolicy.h:62:0,
>                  from kernel/workqueue.c:31:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   LD      arch/arm/mach-omap2/built-in.o
> 
> In file included from mm/highmem.c:23:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/pid.o
> 
>   CC      kernel/rcupdate.o
> 
> In file included from kernel/ptrace.c:16:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      kernel/extable.o
> 
>   CC      kernel/params.o
> 
> In file included from mm/madvise.c:9:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> In file included from include/linux/nfs_fs.h:44:0,
>                  from kernel/sysctl.c:47:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      mm/memory.o
> 
>   CC      kernel/posix-timers.o
> 
> In file included from mm/fremap.c:13:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      mm/mincore.o
> 
>   CC      mm/mlock.o
> 
>   CC      mm/mmap.o
> 
>   CC      mm/mprotect.o
> 
>   CC      kernel/kthread.o
> 
>   CC      mm/mremap.o
> 
>   CC      kernel/wait.o
> 
>   CC      kernel/kfifo.o
> 
>   CC      mm/msync.o
> 
> In file included from mm/memory.c:47:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      mm/rmap.o
> 
>   CC      kernel/sys_ni.o
> 
> mm/memory.c: In function 'free_pgd_range':
> 
> 
> mm/memory.c:238:16: warning: variable 'start' set but not used [-Wunused-but-set-variable]
> 
> 
> mm/memory.c: In function 'copy_pte_range':
> 
> 
> mm/memory.c:647:24: warning: variable 'orig_dst_pte' set but not used [-Wunused-but-set-variable]
> 
> 
> mm/memory.c:647:9: warning: variable 'orig_src_pte' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/posix-cpu-timers.o
> 
> In file included from mm/mincore.c:11:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/mutex.o
> 
>   CC      mm/vmalloc.o
> 
> In file included from mm/mlock.c:13:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
> In file included from mm/mmap.c:14:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> In file included from include/linux/mempolicy.h:62:0,
>                  from mm/mprotect.c:19:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      kernel/hrtimer.o
> 
> In file included from include/linux/ksm.h:12:0,
>                  from mm/mremap.c:14:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      kernel/rwsem.o
> 
>   CC      mm/pagewalk.o
> 
> mm/mmap.c: In function 'acct_stack_growth':
> mm/mmap.c:1555:16: warning: variable 'new_start' set but not used [-Wunused-but-set-variable]
> 
>   CC      kernel/nsproxy.o
> 
> mm/mmap.c: In function 'mmap_init':
> mm/mmap.c:2508:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> 
>   CC      mm/init-mm.o
> 
> In file included from mm/rmap.c:47:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      kernel/srcu.o
> 
>   CC      kernel/semaphore.o
> 
>   CC      kernel/notifier.o
> 
>   CC      kernel/ksysfs.o
> 
>   CC      mm/page_io.o
> 
>   CC      mm/swap_state.o
> 
> mm/pagewalk.c: In function 'walk_page_range':
> 
> 
> mm/pagewalk.c:111:25: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      mm/swapfile.o
> 
> kernel/hrtimer.c: In function 'hrtimer_get_remaining':
> kernel/hrtimer.c:1099:29: warning: variable 'base' set but not used [-Wunused-but-set-variable]
> 
>   CC      mm/thrash.o
> 
>   CC      kernel/pm_qos_params.o
> 
>   CC      kernel/sched_clock.o
> 
>   CC      kernel/cred.o
> 
>   CC      kernel/async.o
> 
>   CC      kernel/groups.o
> 
>   CC      kernel/freezer.o
> 
>   CC      mm/dmapool.o
> 
>   CC      kernel/profile.o
> 
> In file included from mm/page_io.c:15:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/stacktrace.o
> 
> In file included from mm/swap_state.c:15:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/irq/handle.o
> 
>   CC      mm/shmem_acl.o
> 
>   CC      kernel/power/main.o
> 
> In file included from mm/swapfile.c:15:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
>   CC      kernel/power/console.o
> 
>   CC      kernel/time/timekeeping.o
> 
>   CC      mm/slab.o
> 
>   CC      kernel/time/ntp.o
> 
>   CC      kernel/trace/trace_clock.o
> 
>   CC      kernel/mutex-debug.o
> 
>   CC      kernel/futex.o
> 
>   CC      kernel/time/clocksource.o
> 
>   CC      kernel/time/jiffies.o
> 
>   CC      kernel/time/timer_list.o
> 
> In file included from include/linux/mempolicy.h:62:0,
>                  from mm/slab.c:111:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
> mm/slab.c: In function 'cache_reap':
> 
> 
> mm/slab.c:4090:8: warning: variable 'freed' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/time/timecompare.o
> 
>   CC      kernel/rtmutex.o
> 
> In file included from include/linux/mempolicy.h:62:0,
>                  from include/linux/shmem_fs.h:5,
>                  from mm/shmem_acl.c:10:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/up.o
> 
> In file included from kernel/futex.c:55:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/uid16.o
> 
>   CC      kernel/trace/ring_buffer.o
> 
>   CC      kernel/module.o
> 
>   CC      kernel/power/process.o
> 
>   CC      kernel/irq/manage.o
> 
>   CC      kernel/kallsyms.o
> 
>   CC      kernel/power/suspend.o
> 
>   CC      kernel/time/timeconv.o
> 
>   CC      kernel/time/clockevents.o
> 
>   CC      kernel/irq/spurious.o
> 
>   CC      kernel/trace/trace.o
> 
>   CC      kernel/power/poweroff.o
> 
>   CC      kernel/acct.o
> 
>   CC      kernel/irq/resend.o
> 
>   CC      kernel/trace/trace_output.o
> 
>   CC      kernel/time/tick-common.o
> 
>   CC      kernel/kexec.o
> 
>   CC      kernel/trace/trace_stat.o
> 
>   GZIP    kernel/config_data.gz
> 
>   CC      kernel/irq/chip.o
> 
> kernel/irq/manage.c: In function '__setup_irq':
> 
> 
> kernel/irq/manage.c:611:14: warning: variable 'old_name' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/softlockup.o
> 
>   CC      kernel/time/tick-oneshot.o
> 
> kernel/trace/ring_buffer.c: In function 'rb_advance_iter':
> 
> 
> kernel/trace/ring_buffer.c:2957:22: warning: variable 'buffer' set but not used [-Wunused-but-set-variable]
> 
> 
> kernel/module.c: In function 'use_module':
> 
> 
> kernel/module.c:510:6: warning: variable 'no_warn' set but not used [-Wunused-but-set-variable]
> 
> 
> In file included from kernel/trace/trace.c:24:0:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/trace/trace_printk.o
> 
> kernel/trace/trace.c: In function 'ftrace_trace_userstack':
> 
> 
> kernel/trace/trace.c:1160:21: warning: variable 'trace' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/hung_task.o
> 
>   CC      kernel/time/tick-sched.o
> 
> In file included from include/linux/blkdev.h:12:0,
>                  from kernel/acct.c:60:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/irq/devres.o
> 
>   CC      kernel/trace/trace_sched_switch.o
> 
>   CC      kernel/rcutree.o
> 
>   CC      kernel/irq/autoprobe.o
> 
>   CC      kernel/time/timer_stats.o
> 
>   CC      kernel/trace/trace_nop.o
> 
>   CC      kernel/irq/proc.o
> 
>   CC      kernel/utsname_sysctl.o
> 
>   CC      kernel/trace/blktrace.o
> 
>   CC      kernel/irq/pm.o
> 
>   LD      kernel/power/built-in.o
> 
>   CC      kernel/delayacct.o
> 
>   CC      kernel/taskstats.o
> 
>   CC      kernel/tsacct.o
> 
>   CC      kernel/tracepoint.o
> 
>   CC      kernel/slow-work.o
> 
>   CC      kernel/trace/trace_events.o
> 
>   CC      kernel/trace/trace_export.o
> 
>   CC      kernel/time.o
> 
>   IKCFG   kernel/config_data.h
> 
>   CC      kernel/trace/trace_events_filter.o
> 
>   CC      kernel/configs.o
> 
> In file included from include/linux/blkdev.h:12:0,
>                  from kernel/trace/blktrace.c:19:
> include/linux/pagemap.h: In function 'fault_in_pages_readable':
> 
> 
> include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> 
> 
>   CC      kernel/trace/power-traces.o
> 
>   LD      kernel/irq/built-in.o
> 
>   LD      kernel/time/built-in.o
> 
>   LD      mm/built-in.o
> 
>   LD      kernel/trace/built-in.o
> 
>   LD      kernel/built-in.o
> 
> + die oe_runmake failed
> + bbfatal oe_runmake failed
> + echo ERROR: oe_runmake failed
> ERROR: oe_runmake failed
> + exit 1
> 
> ERROR: Function failed: do_compileconfigs (see /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/temp/log.do_compileconfigs.19137 for further information)
> ERROR: Logfile of failure stored in: /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/temp/log.do_compileconfigs.19137
> Log data follows:
> | DEBUG: Executing shell function do_compileconfigs
> | + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> | + do_compileconfigs
> | + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/configs ]
> | + [ -e
> | + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> | + do_compileconfigs
> | + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/configs ]
> | + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/empty ]
> | + echo Multiple configs found, building those first
> | Multiple configs found, building those first
> | + cp /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig.save
> | 
> |  /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/empty ]
> | + echo Multiple configs found, building those first
> | Multiple configs found, building those first
> | + cp /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig.save
> | + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> | + cp /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/cpuidle /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig
> | 
> | + cd /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git
> | + cp /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/configs/cpuidle /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig
> | + echo CONFIG_IKCONFIG=y
> | 
> | + echo CONFIG_IKCONFIG=y
> | + echo CONFIG_IKCONFIG_PROC=y
> | + do_configure
> | 
> | + echo CONFIG_IKCONFIG_PROC=y
> | + do_configure
> | + sed -i -e s/getline/parseline/g /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/scripts/unifdef.c
> | 
> | + sed -i -e s/getline/parseline/g /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/scripts/unifdef.c
> | + echo
> | 
> | + echo
> | + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm ]
> | + install -m 0644 /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> | 
> | + [ -e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm ]
> | + install -m 0644 /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/./logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> | + echo CONFIG_LOGO=y
> | 
> | + echo CONFIG_LOGO=y
> | + echo CONFIG_LOGO_LINUX_CLUT224=y
> | + [ linux-gnueabi = linux-gnueabi -o linux-gnueabi = linux-uclibceabi ]
> | + echo CONFIG_AEABI=y
> | + [ 1 = 1 ]
> | + echo CONFIG_OABI_COMPAT=y
> | + [  = thumb ]
> | + [ yes = yes ]
> | + sed -i -e /CONFIG_ARM_ERRATA_430973/d /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig
> | 
> | + echo CONFIG_LOGO_LINUX_CLUT224=y
> | + [ linux-gnueabi = linux-gnueabi -o linux-gnueabi = linux-uclibceabi ]
> | + echo CONFIG_AEABI=y
> | + [ 1 = 1 ]
> | + echo CONFIG_OABI_COMPAT=y
> | + [  = thumb ]
> | + [ yes = yes ]
> | + sed -i -e /CONFIG_ARM_ERRATA_430973/d /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig
> | + echo CONFIG_ARM_ERRATA_430973=y
> | + [
> | + echo CONFIG_ARM_ERRATA_430973=y
> | + [ le = be ]
> | + echo CONFIG_CMDLINE=" debug "
> | + sed -e /CONFIG_AEABI/d -e /CONFIG_OABI_COMPAT=/d -e /CONFIG_CMDLINE=/d -e /CONFIG_CPU_BIG_ENDIAN/d -e /CONFIG_LOGO=/d -e /CONFIG_LOGO_LINUX_CLUT224=/d -e /CONFIG_LOCALVERSION/d -e /CONFIG_LOCALVERSION_AUTO/d
> | 
> |  le = be ]
> | + echo CONFIG_CMDLINE=" debug "
> | + sed -e /CONFIG_AEABI/d -e /CONFIG_OABI_COMPAT=/d -e /CONFIG_CMDLINE=/d -e /CONFIG_CPU_BIG_ENDIAN/d -e /CONFIG_LOGO=/d -e /CONFIG_LOGO_LINUX_CLUT224=/d -e /CONFIG_LOCALVERSION/d -e /CONFIG_LOCALVERSION_AUTO/d
> | + echo CONFIG_LOCALVERSION=""
> | 
> | + echo CONFIG_LOCALVERSION=""
> | + echo # CONFIG_LOCALVERSION_AUTO is not set
> | + [ 0 = 1 ]
> | + [  = 1 ]
> | + [ ! -z  ]
> | + + oe_runmake oldconfig
> | yes
> | + [ xmake = x ]
> | 
> | + echo # CONFIG_LOCALVERSION_AUTO is not set
> | + [ 0 = 1 ]
> | + [  = 1 ]
> | + [ ! -z  ]
> | + + oe_runmake oldconfig
> | yes
> | + [ xmake = x ]
> | + bbnote make -j 32 oldconfig
> | + echo NOTE: make -j 32 oldconfig
> | NOTE: make -j 32 oldconfig
> | + make -j 32 oldconfig
> | 
> | + bbnote make -j 32 oldconfig
> | + echo NOTE: make -j 32 oldconfig
> | NOTE: make -j 32 oldconfig
> | + make -j 32 oldconfig
> | scripts/kconfig/conf -o arch/arm/Kconfig
> | 
> | scripts/kconfig/conf -o arch/arm/Kconfig
> | .config:345:warning: override: reassigning to symbol OABI_COMPAT
> | 
> | .config:345:warning: override: reassigning to symbol OABI_COMPAT
> | .config:3054:warning: override: reassigning to symbol IKCONFIG
> | .config:3055:warning: override: reassigning to symbol IKCONFIG_PROC
> | 
> | .config:3054:warning: override: reassigning to symbol IKCONFIG
> | .config:3055:warning: override: reassigning to symbol IKCONFIG_PROC
> | *
> | * Restart config...
> | *
> | *
> | * OCF Configuration
> | *
> | OCF (Open Cryptograhic Framework) (OCF_OCF) [N/m/y/?] (NEW)
> | *
> | * Restart config...
> | *
> | *
> | * OCF Configuration
> | *
> | OCF (Open Cryptograhic Framework) (OCF_OCF) [N/m/y/?] (NEW) #
> | # configuration written to .config
> | #
> | 
> | #
> | # configuration written to .config
> | #
> | + kernel_do_configure
> | 
> | + kernel_do_configure
> | + touch /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion
> | 
> | + touch /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.scmversion
> | + [ -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig ]
> | + [ ! -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.config ]
> | 
> | + [ -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/defconfig ]
> | + [ ! -f /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/git/.config ]
> | + yes
> | + oe_runmake oldconfig
> | + [ xmake = x ]
> | + bbnote make -j 32 oldconfig
> | + echo NOTE: make -j 32 oldconfig
> | NOTE: make -j 32 oldconfig
> | + make -j
> | + yes
> | + oe_runmake oldconfig
> | + [ xmake = x ]
> | + bbnote make -j 32 oldconfig
> | + echo NOTE: make -j 32 oldconfig
> | NOTE: make -j 32 oldconfig
> | + make -j 32 oldconfig
> | 
> |  32 oldconfig
> | scripts/kconfig/conf -o arch/arm/Kconfig
> | 
> | scripts/kconfig/conf -o arch/arm/Kconfig
> | #
> | # configuration written to .config
> | #
> | 
> | #
> | # configuration written to .config
> | #
> | + [ ! -z  ]
> | 
> | + [ ! -z  ]
> | + test -e scripts/Makefile.fwinst
> | + sed -i -e s:-m0644:-m 0644:g scripts/Makefile.fwinst
> | 
> | + test -e scripts/Makefile.fwinst
> | + sed -i -e s:-m0644:-m 0644:g scripts/Makefile.fwinst
> | + kernel_do_compile
> | + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> | 
> | + kernel_do_compile
> | + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> | + oe_runmake include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + [ xmake = x ]
> | + bbnote make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + echo NOTE: make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | NOTE: make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | 
> | + oe_runmake include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + [ xmake = x ]
> | + bbnote make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + echo NOTE: make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | NOTE: make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + make -j 32 include/linux/version.h CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> |   CHK     include/linux/version.h
> | 
> |   CHK     include/linux/version.h
> | + oe_runmake uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + [ xmake = x ]
> | + bbnote make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + echo NOTE: make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | NOTE: make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | 
> | + oe_runmake uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + [ xmake = x ]
> | + bbnote make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + echo NOTE: make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | NOTE: make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | + make -j 32 uImage CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard LD=arm-poky-linux-gnueabi-ld   --sysroot=/home/asahota/danny-try/danny-8.0/build/tmp/sysroots/beagleboard
> | scripts/kconfig/conf -s arch/arm/Kconfig
> | 
> | scripts/kconfig/conf -s arch/arm/Kconfig
> |   CHK     include/linux/version.h
> | 
> |   CHK     include/linux/version.h
> |   SYMLINK include/asm -> include/asm-arm
> | 
> |   SYMLINK include/asm -> include/asm-arm
> | make[1]: `include/asm-arm/mach-types.h' is up to date.
> | 
> | make[1]: `include/asm-arm/mach-types.h' is up to date.
> |   CHK     include/linux/utsrelease.h
> | 
> |   CHK     include/linux/utsrelease.h
> |   HOSTCC  scripts/kallsyms
> | 
> |   HOSTCC  scripts/kallsyms
> |   HOSTCC  scripts/pnmtologo
> | 
> |   HOSTCC  scripts/pnmtologo
> |   HOSTCC  scripts/conmakehash
> | 
> |   HOSTCC  scripts/conmakehash
> |   HOSTCC  scripts/bin2c
> | 
> |   HOSTCC  scripts/bin2c
> |   SHIPPED scripts/genksyms/lex.c
> | 
> |   SHIPPED scripts/genksyms/lex.c
> |   SHIPPED scripts/genksyms/parse.h
> | 
> |   SHIPPED scripts/genksyms/parse.h
> |   HOSTCC  scripts/genksyms/genksyms.o
> | 
> |   HOSTCC  scripts/genksyms/genksyms.o
> |   CC      scripts/mod/empty.o
> | 
> |   CC      scripts/mod/empty.o
> |   SHIPPED scripts/genksyms/keywords.c
> | 
> |   SHIPPED scripts/genksyms/keywords.c
> |   HOSTCC  scripts/mod/mk_elfconfig
> | 
> |   HOSTCC  scripts/mod/mk_elfconfig
> |   SHIPPED scripts/genksyms/parse.c
> | 
> |   SHIPPED scripts/genksyms/parse.c
> |   HOSTCC  scripts/genksyms/lex.o
> | 
> |   HOSTCC  scripts/genksyms/lex.o
> |   HOSTCC  scripts/genksyms/parse.o
> | 
> |   HOSTCC  scripts/genksyms/parse.o
> | scripts/kallsyms.c: In function 'read_symbol':
> | scripts/kallsyms.c: In function 'read_symbol':
> | 
> | 
> | scripts/kallsyms.c:112:9: warning: ignoring return value of 'fgets', declared with attribute warn_unused_result [-Wunused-result]
> | scripts/kallsyms.c:112:9: warning: ignoring return value of 'fgets', declared with attribute warn_unused_result [-Wunused-result]
> | 
> | 
> |   MKELF   scripts/mod/elfconfig.h
> | 
> |   MKELF   scripts/mod/elfconfig.h
> |   HOSTCC  scripts/mod/file2alias.o
> | 
> |   HOSTCC  scripts/mod/file2alias.o
> |   HOSTCC  scripts/mod/modpost.o
> | 
> |   HOSTCC  scripts/mod/modpost.o
> |   HOSTCC  scripts/mod/sumversion.o
> | 
> |   HOSTCC  scripts/mod/sumversion.o
> | scripts/mod/modpost.c: In function 'get_markers':
> | scripts/mod/modpost.c: In function 'get_markers':
> | 
> | 
> | scripts/mod/modpost.c:1562:12: warning: ignoring return value of 'asprintf', declared with attribute warn_unused_result [-Wunused-result]
> | scripts/mod/modpost.c:1562:12: warning: ignoring return value of 'asprintf', declared with attribute warn_unused_result [-Wunused-result]
> | 
> | 
> | scripts/mod/modpost.c: In function 'add_marker':
> | scripts/mod/modpost.c: In function 'add_marker':
> | 
> | 
> | scripts/mod/modpost.c:1982:10: warning: ignoring return value of 'asprintf', declared with attribute warn_unused_result [-Wunused-result]
> | scripts/mod/modpost.c:1982:10: warning: ignoring return value of 'asprintf', declared with attribute warn_unused_result [-Wunused-result]
> | 
> | 
> |   HOSTLD  scripts/genksyms/genksyms
> | 
> |   HOSTLD  scripts/genksyms/genksyms
> |   HOSTLD  scripts/mod/modpost
> | 
> |   HOSTLD  scripts/mod/modpost
> |   CALL    scripts/checksyscalls.sh
> | 
> |   CALL    scripts/checksyscalls.sh
> | <stdin>:1523:2: warning: #warning syscall recvmmsg not implemented [-Wcpp]
> | 
> | <stdin>:1523:2: warning: #warning syscall recvmmsg not implemented [-Wcpp]
> |   CC      init/main.o
> | 
> |   CC      init/main.o
> |   CHK     include/linux/compile.h
> | 
> |   CHK     include/linux/compile.h
> |   CC      init/do_mounts.o
> | 
> |   CC      init/do_mounts.o
> |   CC      init/do_mounts_initrd.o
> | 
> |   CC      init/do_mounts_initrd.o
> |   CC      init/do_mounts_rd.o
> | 
> |   CC      init/do_mounts_rd.o
> |   CC      init/initramfs.o
> | 
> |   CC      init/initramfs.o
> |   CC      init/calibrate.o
> | 
> |   CC      init/calibrate.o
> |   UPD     include/linux/compile.h
> | 
> |   UPD     include/linux/compile.h
> |   HOSTCC  usr/gen_init_cpio
> | 
> |   HOSTCC  usr/gen_init_cpio
> |   CC      init/version.o
> | 
> |   CC      init/version.o
> |   CC      arch/arm/kernel/compat.o
> | 
> |   CC      arch/arm/kernel/compat.o
> |   CC      arch/arm/kernel/elf.o
> | 
> |   CC      arch/arm/kernel/elf.o
> |   AS      arch/arm/kernel/entry-armv.o
> | 
> |   AS      arch/arm/kernel/entry-armv.o
> |   AS      arch/arm/kernel/entry-common.o
> | 
> |   AS      arch/arm/kernel/entry-common.o
> |   CC      arch/arm/kernel/irq.o
> | 
> |   CC      arch/arm/kernel/irq.o
> |   CC      arch/arm/kernel/process.o
> | 
> |   CC      arch/arm/kernel/process.o
> |   CC      arch/arm/kernel/ptrace.o
> | 
> |   CC      arch/arm/kernel/ptrace.o
> |   CC      arch/arm/kernel/return_address.o
> | 
> |   CC      arch/arm/kernel/return_address.o
> |   CC      arch/arm/kernel/setup.o
> | 
> |   CC      arch/arm/kernel/setup.o
> |   CC      arch/arm/kernel/signal.o
> | 
> |   CC      arch/arm/kernel/signal.o
> |   CC      arch/arm/kernel/sys_arm.o
> | 
> |   CC      arch/arm/kernel/sys_arm.o
> | In file included from include/linux/blkdev.h:12:0,
> |                  from init/do_mounts.h:2,
> |                  from init/do_mounts_initrd.c:11:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/blkdev.h:12:0,
> |                  from init/do_mounts.h:2,
> |                  from init/do_mounts_initrd.c:11:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':  CC      arch/arm/kernel/stacktrace.o
> | 
> |   CC      arch/arm/kernel/stacktrace.o
> | 
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/kernel/time.o
> | 
> |   CC      arch/arm/kernel/time.o
> |   CC      arch/arm/kernel/traps.o
> | 
> |   CC      arch/arm/kernel/traps.o
> | In file included from include/linux/blkdev.h:12:0,
> |                  from init/do_mounts.h:2,
> |                  from init/do_mounts_rd.c:11:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/blkdev.h:12:0,
> |                  from init/do_mounts.h:2,
> |                  from init/do_mounts_rd.c:11:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':  CC      arch/arm/kernel/armksyms.o
> | 
> |   CC      arch/arm/kernel/armksyms.o
> | 
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/kernel/module.o
> | 
> |   CC      arch/arm/kernel/module.o
> |   CC      arch/arm/kernel/machine_kexec.o
> | 
> |   CC      arch/arm/kernel/machine_kexec.o
> |   AS      arch/arm/kernel/relocate_kernel.o
> | 
> |   AS      arch/arm/kernel/relocate_kernel.o
> |   CC      arch/arm/kernel/atags.o
> | 
> |   CC      arch/arm/kernel/atags.o
> |   CC      arch/arm/kernel/thumbee.o
> | 
> |   CC      arch/arm/kernel/thumbee.o
> |   CC      arch/arm/kernel/unwind.o
> | 
> |   CC      arch/arm/kernel/unwind.o
> |   CC      arch/arm/kernel/sysfs_v7.o
> | 
> |   CC      arch/arm/kernel/sysfs_v7.o
> |   CC      arch/arm/kernel/io.o
> | 
> |   CC      arch/arm/kernel/io.o
> |   AS      arch/arm/kernel/head.o
> | 
> |   AS      arch/arm/kernel/head.o
> |   CC      arch/arm/mm/dma-mapping.o
> | 
> |   CC      arch/arm/mm/dma-mapping.o
> |   CC      arch/arm/kernel/init_task.o
> | 
> |   CC      arch/arm/kernel/init_task.o
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from init/main.c:52:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from init/main.c:52:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | In file included from include/linux/nfs_fs.h:44:0,
> |                  from init/do_mounts.c:19:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/nfs_fs.h:44:0,
> |                  from init/do_mounts.c:19:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   LDS     arch/arm/kernel/vmlinux.lds
> | 
> |   LDS     arch/arm/kernel/vmlinux.lds
> |   CC      arch/arm/mm/extable.o
> | 
> |   CC      arch/arm/mm/extable.o
> |   CC      arch/arm/mm/fault.o
> | 
> |   CC      arch/arm/mm/fault.o
> |   CC      arch/arm/common/clkdev.o
> | 
> |   CC      arch/arm/common/clkdev.o
> | arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
> | 
> | arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
> |   CC      arch/arm/mm/init.o
> | 
> |   CC      arch/arm/mm/init.o
> |   CC      arch/arm/mm/iomap.o
> | 
> |   CC      arch/arm/mm/iomap.o
> |   CC      arch/arm/mm/fault-armv.o
> | 
> |   CC      arch/arm/mm/fault-armv.o
> | arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
> | 
> | arch/arm/kernel/return_address.c:61:2: warning: #warning "TODO: return_address should use unwind tables" [-Wcpp]
> |   CC      arch/arm/mm/flush.o
> | 
> |   CC      arch/arm/mm/flush.o
> |   CC      arch/arm/mm/ioremap.o
> | 
> |   CC      arch/arm/mm/ioremap.o
> |   CC      arch/arm/mm/mmap.o
> | 
> |   CC      arch/arm/mm/mmap.o
> |   CC      arch/arm/mm/pgd.o
> | 
> |   CC      arch/arm/mm/pgd.o
> |   CC      arch/arm/mach-omap2/id.o
> | 
> |   CC      arch/arm/mach-omap2/id.o
> |   CC      arch/arm/mach-omap2/io.o
> | 
> |   CC      arch/arm/mach-omap2/io.o
> |   GEN     usr/initramfs_data.cpio
> | 
> |   GEN     usr/initramfs_data.cpio
> |   CC      arch/arm/mach-omap2/control.o
> | 
> |   CC      arch/arm/mach-omap2/control.o
> |   AS      usr/initramfs_data.o
> | 
> |   AS      usr/initramfs_data.o
> | In file included from arch/arm/mm/flush.c:12:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from arch/arm/mm/flush.c:12:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      arch/arm/mach-omap2/mux.o
> | 
> |   CC      arch/arm/mach-omap2/mux.o
> |   LD      usr/built-in.o
> | 
> |   LD      usr/built-in.o
> |   CC      arch/arm/mm/mmu.o
> | 
> |   CC      arch/arm/mm/mmu.o
> |   CC      arch/arm/mach-omap2/devices.o
> | 
> |   CC      arch/arm/mach-omap2/devices.o
> | /tmp/ccA8lCEo.s:
> | /tmp/ccA8lCEo.s: Assembler messages:
> | 
> | Assembler messages:
> | /tmp/ccA8lCEo.s:309:
> | /tmp/ccA8lCEo.s:309: Error:
> | Error: selected processor does not support ARM mode `smc #0'
> | selected processor does not support ARM mode `smc #0'
> | 
> | 
> | /tmp/ccA8lCEo.s:349:
> | /tmp/ccA8lCEo.s:349: Error:
> | Error: selected processor does not support ARM mode `smc #0'
> | selected processor does not support ARM mode `smc #0'
> | 
> | 
> | make[1]: *** [arch/arm/kernel/sysfs_v7.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | 
> | make[1]: *** [arch/arm/kernel/sysfs_v7.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> |   CC      arch/arm/mm/vmregion.o
> | 
> |   CC      arch/arm/mm/vmregion.o
> |   CC      arch/arm/mach-omap2/serial.o
> | 
> |   CC      arch/arm/mach-omap2/serial.o
> | In file included from arch/arm/mm/fault-armv.c:18:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from arch/arm/mm/fault-armv.c:18:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | arch/arm/mm/dma-mapping.c: In function '__dma_alloc':
> | arch/arm/mm/dma-mapping.c: In function '__dma_alloc':
> | 
> | 
> | arch/arm/mm/dma-mapping.c:218:25: warning: array subscript is above array bounds [-Warray-bounds]
> | arch/arm/mm/dma-mapping.c:218:25: warning: array subscript is above array bounds [-Warray-bounds]
> | 
> | 
> |   CC      arch/arm/mm/proc-syms.o
> | 
> |   CC      arch/arm/mm/proc-syms.o
> |   CC      arch/arm/plat-omap/common.o
> | 
> |   CC      arch/arm/plat-omap/common.o
> |   CC      arch/arm/mm/alignment.o
> | 
> |   CC      arch/arm/mm/alignment.o
> | arch/arm/mm/dma-mapping.c: In function 'dma_free_coherent':
> | arch/arm/mm/dma-mapping.c: In function 'dma_free_coherent':
> | 
> | 
> | arch/arm/mm/dma-mapping.c:262:25: warning: array subscript is above array bounds [-Warray-bounds]
> | arch/arm/mm/dma-mapping.c:262:25: warning: array subscript is above array bounds [-Warray-bounds]
> | 
> | 
> |   CC      arch/arm/plat-omap/sram.o
> | 
> |   CC      arch/arm/plat-omap/sram.o
> |   LD      arch/arm/common/built-in.o
> | 
> |   LD      arch/arm/common/built-in.o
> |   CC      arch/arm/plat-omap/clock.o
> | 
> |   CC      arch/arm/plat-omap/clock.o
> |   CC      arch/arm/mach-omap2/gpmc.o
> | 
> |   CC      arch/arm/mach-omap2/gpmc.o
> |   CC      arch/arm/mach-omap2/timer-gp.o
> | 
> |   CC      arch/arm/mach-omap2/timer-gp.o
> |   AS      arch/arm/mm/abort-ev7.o
> | 
> |   AS      arch/arm/mm/abort-ev7.o
> |   CC      arch/arm/mach-omap2/irq.o
> | 
> |   CC      arch/arm/mach-omap2/irq.o
> |   AS      arch/arm/mm/pabort-v7.o
> | 
> |   AS      arch/arm/mm/pabort-v7.o
> |   CC      arch/arm/vfp/vfpmodule.o
> | 
> |   CC      arch/arm/vfp/vfpmodule.o
> |   AS      arch/arm/vfp/entry.o
> | 
> |   AS      arch/arm/vfp/entry.o
> |   CC      arch/arm/plat-omap/devices.o
> | 
> |   CC      arch/arm/plat-omap/devices.o
> |   LD      init/mounts.o
> | 
> |   LD      init/mounts.o
> |   CC      arch/arm/plat-omap/dma.o
> | 
> |   CC      arch/arm/plat-omap/dma.o
> |   LD      init/built-in.o
> | 
> |   LD      init/built-in.o
> |   CC      arch/arm/mach-omap2/sdrc.o
> | 
> |   CC      arch/arm/mach-omap2/sdrc.o
> |   CC      arch/arm/plat-omap/mux.o
> | 
> |   CC      arch/arm/plat-omap/mux.o
> |   CC      arch/arm/mach-omap2/omap_hwmod.o
> | 
> |   CC      arch/arm/mach-omap2/omap_hwmod.o
> |   AS      arch/arm/vfp/vfphw.o
> | 
> |   AS      arch/arm/vfp/vfphw.o
> | arch/arm/mach-omap2/devices.c: In function 'omap_hsmmc_reset':
> | arch/arm/mach-omap2/devices.c: In function 'omap_hsmmc_reset':
> | 
> | 
> | arch/arm/mach-omap2/devices.c:499:7: warning: variable 'v' set but not used [-Wunused-but-set-variable]
> | arch/arm/mach-omap2/devices.c:499:7: warning: variable 'v' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/mach-omap2/prcm.o
> | 
> |   CC      arch/arm/mach-omap2/prcm.o
> |   CC      arch/arm/mach-omap2/powerdomain.o
> | 
> |   CC      arch/arm/mach-omap2/powerdomain.o
> |   CC      arch/arm/mach-omap2/clock.o
> | 
> |   CC      arch/arm/mach-omap2/clock.o
> |   CC      arch/arm/vfp/vfpsingle.o
> | 
> |   CC      arch/arm/vfp/vfpsingle.o
> |   CC      arch/arm/mach-omap2/clock_common_data.o
> | 
> |   CC      arch/arm/mach-omap2/clock_common_data.o
> |   AS      arch/arm/mm/cache-v7.o
> | 
> |   AS      arch/arm/mm/cache-v7.o
> |   CC      kernel/sched.o
> | 
> |   CC      kernel/sched.o
> |   CC      arch/arm/mm/copypage-v6.o
> | 
> |   CC      arch/arm/mm/copypage-v6.o
> | arch/arm/mach-omap2/serial.c: In function 'omap_uart_enable_irqs':
> | arch/arm/mach-omap2/serial.c: In function 'omap_uart_enable_irqs':
> | 
> | 
> | arch/arm/mach-omap2/serial.c:481:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> | arch/arm/mach-omap2/serial.c:481:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/mm/context.o
> | 
> |   CC      arch/arm/mm/context.o
> |   CC      arch/arm/plat-omap/gpio.o
> | 
> |   CC      arch/arm/plat-omap/gpio.o
> |   AS      arch/arm/mm/tlb-v7.o
> | 
> |   AS      arch/arm/mm/tlb-v7.o
> |   CC      mm/bootmem.o
> | 
> |   CC      mm/bootmem.o
> |   CC      mm/filemap.o
> | 
> |   CC      mm/filemap.o
> |   CC      arch/arm/plat-omap/usb.o
> | 
> |   CC      arch/arm/plat-omap/usb.o
> |   AS      arch/arm/mm/proc-v7.o
> | 
> |   AS      arch/arm/mm/proc-v7.o
> |   CC      arch/arm/mach-omap2/clockdomain.o
> | 
> |   CC      arch/arm/mach-omap2/clockdomain.o
> | arch/arm/plat-omap/dma.c: In function 'omap_enable_channel_irq':
> | arch/arm/plat-omap/dma.c: In function 'omap_enable_channel_irq':
> | 
> | 
> | arch/arm/plat-omap/dma.c:621:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/dma.c:621:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/plat-omap/fb.o
> | 
> |   CC      arch/arm/plat-omap/fb.o
> |   CC      arch/arm/plat-omap/io.o
> | 
> |   CC      arch/arm/plat-omap/io.o
> |   CC      arch/arm/mach-omap2/dpll.o
> | 
> |   CC      arch/arm/mach-omap2/dpll.o
> |   CC      arch/arm/plat-omap/omap_device.o
> | 
> |   CC      arch/arm/plat-omap/omap_device.o
> |   CC      arch/arm/mach-omap2/mcbsp.o
> | 
> |   CC      arch/arm/mach-omap2/mcbsp.o
> |   AS      arch/arm/mach-omap2/sram34xx.o
> | 
> |   AS      arch/arm/mach-omap2/sram34xx.o
> |   CC      arch/arm/mach-omap2/mux34xx.o
> | 
> |   CC      arch/arm/mach-omap2/mux34xx.o
> |   CC      arch/arm/mach-omap2/pm34xx.o
> | 
> |   CC      arch/arm/mach-omap2/pm34xx.o
> |   CC      arch/arm/mach-omap2/cpuidle34xx.o
> | 
> |   CC      arch/arm/mach-omap2/cpuidle34xx.o
> | arch/arm/mm/alignment.c: In function 'do_alignment':
> | arch/arm/mm/alignment.c:294:15: warning: 'offset.un' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | arch/arm/mm/alignment.c:716:21: note: 'offset.un' was declared here
> | 
> | arch/arm/mm/alignment.c: In function 'do_alignment':
> | arch/arm/mm/alignment.c:294:15: warning: 'offset.un' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | arch/arm/mm/alignment.c:716:21: note: 'offset.un' was declared here
> | arch/arm/plat-omap/gpio.c: In function 'gpio_get':
> | arch/arm/plat-omap/gpio.c: In function 'gpio_get':
> | 
> | 
> | arch/arm/plat-omap/gpio.c:1599:16: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/gpio.c:1599:16: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/vfp/vfpdouble.o
> | 
> |   CC      arch/arm/vfp/vfpdouble.o
> |   CC      arch/arm/plat-omap/mcbsp.o
> | 
> |   CC      arch/arm/plat-omap/mcbsp.o
> |   CC      mm/mempool.o
> | 
> |   CC      mm/mempool.o
> | In file included from include/linux/blkdev.h:12:0,
> |                  from kernel/sched.c:48:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from include/linux/blkdev.h:12:0,
> |                  from kernel/sched.c:48:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      mm/oom_kill.o
> | 
> |   CC      mm/oom_kill.o
> | In file included from mm/filemap.c:23:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/filemap.c:23:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/plat-omap/iommu.o
> | 
> |   CC      arch/arm/plat-omap/iommu.o
> |   AS      arch/arm/mach-omap2/sleep34xx.o
> | 
> |   AS      arch/arm/mach-omap2/sleep34xx.o
> |   CC      mm/fadvise.o
> | 
> |   CC      mm/fadvise.o
> |   CC      mm/maccess.o
> | 
> |   CC      mm/maccess.o
> | make: *** [arch/arm/kernel] Error 2
> | make: *** Waiting for unfinished jobs....
> | 
> | make: *** [arch/arm/kernel] Error 2
> | make: *** Waiting for unfinished jobs....
> | arch/arm/mach-omap2/sleep34xx.S:
> | arch/arm/mach-omap2/sleep34xx.S: Assembler messages:
> | 
> | Assembler messages:
> | arch/arm/mach-omap2/sleep34xx.S:73:
> | arch/arm/mach-omap2/sleep34xx.S:73: Warning:
> | Warning: swp{b} use is deprecated for this architecture
> | swp{b} use is deprecated for this architecture
> | 
> | 
> |   CC      mm/page_alloc.o
> | 
> |   CC      mm/page_alloc.o
> |   CC      arch/arm/mach-omap2/pm-debug.o
> | 
> |   CC      arch/arm/mach-omap2/pm-debug.o
> |   CC      arch/arm/mach-omap2/smartreflex.o
> | 
> |   CC      arch/arm/mach-omap2/smartreflex.o
> |   CC      arch/arm/mach-omap2/cm.o
> | 
> |   CC      arch/arm/mach-omap2/cm.o
> |   CC      arch/arm/plat-omap/iovmm.o
> | 
> |   CC      arch/arm/plat-omap/iovmm.o
> | mm/filemap.c: In function 'generic_perform_write':
> | mm/filemap.c: In function 'generic_perform_write':
> | 
> | 
> | mm/filemap.c:2166:11: warning: variable 'index' set but not used [-Wunused-but-set-variable]
> | mm/filemap.c:2166:11: warning: variable 'index' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/plat-omap/cpu-omap.o
> | 
> |   CC      arch/arm/plat-omap/cpu-omap.o
> | arch/arm/plat-omap/mcbsp.c: In function 'omap_mcbsp_spi_master_xmit_word_poll':
> | arch/arm/plat-omap/mcbsp.c: In function 'omap_mcbsp_spi_master_xmit_word_poll':
> | 
> | 
> | arch/arm/plat-omap/mcbsp.c:806:44: warning: variable 'word_msb' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/mcbsp.c:806:44: warning: variable 'word_msb' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | arch/arm/plat-omap/mcbsp.c:806:34: warning: variable 'word_lsb' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/mcbsp.c:806:34: warning: variable 'word_lsb' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | arch/arm/plat-omap/mcbsp.c: In function 'omap_mcbsp_set_spi_mode':
> | arch/arm/plat-omap/mcbsp.c: In function 'omap_mcbsp_set_spi_mode':
> | 
> | 
> | arch/arm/plat-omap/mcbsp.c:1079:21: warning: variable 'mcbsp' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/mcbsp.c:1079:21: warning: variable 'mcbsp' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/plat-omap/dmtimer.o
> | 
> |   CC      arch/arm/plat-omap/dmtimer.o
> |   CC      arch/arm/mach-omap2/clock34xx.o
> | 
> |   CC      arch/arm/mach-omap2/clock34xx.o
> |   CC      arch/arm/mach-omap2/clock34xx_data.o
> | 
> |   CC      arch/arm/mach-omap2/clock34xx_data.o
> |   CC      arch/arm/mach-omap2/resource34xx.o
> | 
> |   CC      arch/arm/mach-omap2/resource34xx.o
> |   CC      mm/page-writeback.o
> | 
> |   CC      mm/page-writeback.o
> |   CC      arch/arm/plat-omap/i2c.o
> | 
> |   CC      arch/arm/plat-omap/i2c.o
> | In file included from include/linux/blkdev.h:12:0,
> |                  from mm/mempool.c:15:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/blkdev.h:12:0,
> |                  from mm/mempool.c:15:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/mach-omap2/iommu2.o
> | 
> |   CC      arch/arm/mach-omap2/iommu2.o
> | kernel/sched.c: In function 'alloc_fair_sched_group':
> | kernel/sched.c: In function 'alloc_fair_sched_group':
> | 
> | 
> | kernel/sched.c:9831:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
> | kernel/sched.c:9831:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/mach-omap2/omap3-iommu.o
> | 
> |   CC      arch/arm/mach-omap2/omap3-iommu.o
> | In file included from mm/fadvise.c:14:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from mm/fadvise.c:14:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/iovmm.c: In function 'sgtable_fill_vmalloc':
> | arch/arm/plat-omap/iovmm.c: In function 'sgtable_fill_vmalloc':
> | 
> | 
> | arch/arm/plat-omap/iovmm.c:378:8: warning: variable 'va_end' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/iovmm.c:378:8: warning: variable 'va_end' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | arch/arm/plat-omap/iovmm.c: In function 'sgtable_fill_kmalloc':
> | arch/arm/plat-omap/iovmm.c: In function 'sgtable_fill_kmalloc':
> | 
> | 
> | arch/arm/plat-omap/iovmm.c:410:8: warning: variable 'va' set but not used [-Wunused-but-set-variable]
> | arch/arm/plat-omap/iovmm.c:410:8: warning: variable 'va' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/mach-omap2/i2c.o
> | 
> |   CC      arch/arm/mach-omap2/i2c.o
> |   LD      arch/arm/mm/built-in.o
> | 
> |   LD      arch/arm/mm/built-in.o
> |   CC      arch/arm/plat-omap/omap-pm-srf.o
> | 
> |   CC      arch/arm/plat-omap/omap-pm-srf.o
> |   CC      arch/arm/plat-omap/resource.o
> | 
> |   CC      arch/arm/plat-omap/resource.o
> |   CC      mm/readahead.o
> | 
> |   CC      mm/readahead.o
> |   CC      mm/swap.o
> | 
> |   CC      mm/swap.o
> | In file included from mm/page_alloc.c:21:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/page_alloc.c:21:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c: In function 'sr_voltagescale_vcbypass':
> | 
> | arch/arm/mach-omap2/smartreflex.c: In function 'sr_voltagescale_vcbypass':
> | arch/arm/mach-omap2/smartreflex.c:1096:26: warning: variable 'current_opp_no' set but not used [-Wunused-but-set-variable]
> | 
> | arch/arm/mach-omap2/smartreflex.c:1096:26: warning: variable 'current_opp_no' set but not used [-Wunused-but-set-variable]
> |   CC      arch/arm/mach-omap2/board-omap3beagle.o
> | 
> |   CC      arch/arm/mach-omap2/board-omap3beagle.o
> |   CC      mm/truncate.o
> | 
> |   CC      mm/truncate.o
> | arch/arm/mach-omap2/resource34xx.c: In function 'init_freq':
> | arch/arm/mach-omap2/resource34xx.c:424:8: warning: variable 'linked_res_name' set but not used [-Wunused-but-set-variable]
> | 
> | arch/arm/mach-omap2/resource34xx.c: In function 'init_freq':
> | arch/arm/mach-omap2/resource34xx.c:424:8: warning: variable 'linked_res_name' set but not used [-Wunused-but-set-variable]
> |   CC      arch/arm/mach-omap2/mmc-twl4030.o
> | 
> |   CC      arch/arm/mach-omap2/mmc-twl4030.o
> |   CC      arch/arm/mach-omap2/board-omap3beagle-camera.o
> | 
> |   CC      arch/arm/mach-omap2/board-omap3beagle-camera.o
> | In file included from mm/page-writeback.c:21:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/page-writeback.c:21:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      arch/arm/mach-omap2/usb-musb.o
> | 
> |   CC      arch/arm/mach-omap2/usb-musb.o
> | In file included from include/linux/blkdev.h:12:0,
> |                  from mm/readahead.c:14:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/blkdev.h:12:0,
> |                  from mm/readahead.c:14:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | arch/arm/plat-omap/resource.c:79:32: warning: 'resource_lookup' defined but not used [-Wunused-function]
> | arch/arm/plat-omap/resource.c:79:32: warning: 'resource_lookup' defined but not used [-Wunused-function]
> | 
> | 
> |   CC      kernel/fork.o
> | 
> |   CC      kernel/fork.o
> |   CC      kernel/exec_domain.o
> | 
> |   CC      kernel/exec_domain.o
> | arch/arm/mach-omap2/smartreflex.c: In function 'sr_set_efuse_nvalues':
> | arch/arm/mach-omap2/smartreflex.c: In function 'sr_set_efuse_nvalues':
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:292:31: warning: 'opp6_senPgain' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | arch/arm/mach-omap2/smartreflex.c:292:31: warning: 'opp6_senPgain' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:276:6: note: 'opp6_senPgain' was declared here
> | arch/arm/mach-omap2/smartreflex.c:276:6: note: 'opp6_senPgain' was declared here
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:293:17: warning: 'opp6_senPRN' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | arch/arm/mach-omap2/smartreflex.c:293:17: warning: 'opp6_senPRN' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:276:36: note: 'opp6_senPRN' was declared here
> | arch/arm/mach-omap2/smartreflex.c:276:36: note: 'opp6_senPRN' was declared here
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:292:57: warning: 'opp6_senNgain' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | arch/arm/mach-omap2/smartreflex.c:292:57: warning: 'opp6_senNgain' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:276:21: note: 'opp6_senNgain' was declared here
> | arch/arm/mach-omap2/smartreflex.c:276:21: note: 'opp6_senNgain' was declared here
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:292:40: warning: 'opp6_senNRN' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | arch/arm/mach-omap2/smartreflex.c:292:40: warning: 'opp6_senNRN' may be used uninitialized in this function [-Wmaybe-uninitialized]
> | 
> | 
> | arch/arm/mach-omap2/smartreflex.c:276:49: note: 'opp6_senNRN' was declared here
> | arch/arm/mach-omap2/smartreflex.c:276:49: note: 'opp6_senNRN' was declared here
> | 
> | 
> |   CC      arch/arm/mach-omap2/usb-ehci.o
> | 
> |   CC      arch/arm/mach-omap2/usb-ehci.o
> |   CC      kernel/panic.o
> | 
> |   CC      kernel/panic.o
> |   CC      mm/vmscan.o
> | 
> |   CC      mm/vmscan.o
> |   CC      kernel/printk.o
> | 
> |   CC      kernel/printk.o
> |   CC      kernel/cpu.o
> | 
> |   CC      kernel/cpu.o
> |   CC      kernel/exit.o
> | 
> |   CC      kernel/exit.o
> | In file included from mm/truncate.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/truncate.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/itimer.o
> | 
> |   CC      kernel/itimer.o
> | In file included from mm/swap.c:21:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/swap.c:21:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   TIMEC   kernel/timeconst.h
> | 
> |   TIMEC   kernel/timeconst.h
> |   CC      mm/shmem.o
> | 
> |   CC      mm/shmem.o
> |   CC      mm/prio_tree.o
> | 
> |   CC      mm/prio_tree.o
> |   CC      mm/util.o
> | 
> |   CC      mm/util.o
> |   CC      mm/mmzone.o
> | 
> |   CC      mm/mmzone.o
> |   CC      mm/vmstat.o
> | 
> |   CC      mm/vmstat.o
> |   CC      kernel/softirq.o
> | 
> |   CC      kernel/softirq.o
> |   CC      kernel/resource.o
> | 
> |   CC      kernel/resource.o
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from kernel/fork.c:21:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from kernel/fork.c:21:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/sysctl.o
> | 
> |   CC      kernel/sysctl.o
> |   CC      mm/backing-dev.o
> | 
> |   CC      mm/backing-dev.o
> |   LD      arch/arm/vfp/vfp.o
> | 
> |   LD      arch/arm/vfp/vfp.o
> |   LD      arch/arm/vfp/built-in.o
> | 
> |   LD      arch/arm/vfp/built-in.o
> | In file included from mm/vmscan.c:19:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/vmscan.c:19:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      mm/page_isolation.o
> | 
> |   CC      mm/page_isolation.o
> |   CC      kernel/sysctl_binary.o
> | 
> |   CC      kernel/sysctl_binary.o
> |   CC      kernel/capability.o
> | 
> |   CC      kernel/capability.o
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from kernel/exit.c:31:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from kernel/exit.c:31:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   LD      arch/arm/plat-omap/built-in.o
> | 
> |   LD      arch/arm/plat-omap/built-in.o
> |   CC      kernel/ptrace.o
> | 
> |   CC      kernel/ptrace.o
> |   CC      kernel/timer.o
> | 
> |   CC      kernel/timer.o
> |   CC      kernel/user.o
> | 
> |   CC      kernel/user.o
> |   CC      mm/mm_init.o
> | 
> |   CC      mm/mm_init.o
> |   CC      mm/mmu_context.o
> | 
> |   CC      mm/mmu_context.o
> | In file included from mm/shmem.c:27:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from mm/shmem.c:27:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      mm/fremap.o
> | 
> |   CC      mm/fremap.o
> | In file included from mm/backing-dev.c:7:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | In file included from mm/backing-dev.c:7:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> |   CC      kernel/signal.o
> | 
> |   CC      kernel/signal.o
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      kernel/sys.o
> | 
> |   CC      kernel/sys.o
> |   CC      mm/highmem.o
> | 
> |   CC      mm/highmem.o
> |   CC      kernel/kmod.o
> | 
> |   CC      kernel/kmod.o
> |   CC      kernel/workqueue.o
> | 
> |   CC      kernel/workqueue.o
> |   CC      mm/madvise.o
> | 
> |   CC      mm/madvise.o
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from kernel/workqueue.c:31:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from kernel/workqueue.c:31:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   LD      arch/arm/mach-omap2/built-in.o
> | 
> |   LD      arch/arm/mach-omap2/built-in.o
> | In file included from mm/highmem.c:23:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/highmem.c:23:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/pid.o
> | 
> |   CC      kernel/pid.o
> |   CC      kernel/rcupdate.o
> | 
> |   CC      kernel/rcupdate.o
> | In file included from kernel/ptrace.c:16:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from kernel/ptrace.c:16:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      kernel/extable.o
> | 
> |   CC      kernel/extable.o
> |   CC      kernel/params.o
> | 
> |   CC      kernel/params.o
> | In file included from mm/madvise.c:9:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from mm/madvise.c:9:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | In file included from include/linux/nfs_fs.h:44:0,
> |                  from kernel/sysctl.c:47:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/nfs_fs.h:44:0,
> |                  from kernel/sysctl.c:47:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      mm/memory.o
> | 
> |   CC      mm/memory.o
> |   CC      kernel/posix-timers.o
> | 
> |   CC      kernel/posix-timers.o
> | In file included from mm/fremap.c:13:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/fremap.c:13:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      mm/mincore.o
> | 
> |   CC      mm/mincore.o
> |   CC      mm/mlock.o
> | 
> |   CC      mm/mlock.o
> |   CC      mm/mmap.o
> | 
> |   CC      mm/mmap.o
> |   CC      mm/mprotect.o
> | 
> |   CC      mm/mprotect.o
> |   CC      kernel/kthread.o
> | 
> |   CC      kernel/kthread.o
> |   CC      mm/mremap.o
> | 
> |   CC      mm/mremap.o
> |   CC      kernel/wait.o
> | 
> |   CC      kernel/wait.o
> |   CC      kernel/kfifo.o
> | 
> |   CC      kernel/kfifo.o
> |   CC      mm/msync.o
> | 
> |   CC      mm/msync.o
> | In file included from mm/memory.c:47:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/memory.c:47:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      mm/rmap.o
> | 
> |   CC      mm/rmap.o
> |   CC      kernel/sys_ni.o
> | 
> |   CC      kernel/sys_ni.o
> | mm/memory.c: In function 'free_pgd_range':
> | mm/memory.c: In function 'free_pgd_range':
> | 
> | 
> | mm/memory.c:238:16: warning: variable 'start' set but not used [-Wunused-but-set-variable]
> | mm/memory.c:238:16: warning: variable 'start' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | mm/memory.c: In function 'copy_pte_range':
> | mm/memory.c: In function 'copy_pte_range':
> | 
> | 
> | mm/memory.c:647:24: warning: variable 'orig_dst_pte' set but not used [-Wunused-but-set-variable]
> | mm/memory.c:647:24: warning: variable 'orig_dst_pte' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | mm/memory.c:647:9: warning: variable 'orig_src_pte' set but not used [-Wunused-but-set-variable]
> | mm/memory.c:647:9: warning: variable 'orig_src_pte' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/posix-cpu-timers.o
> | 
> |   CC      kernel/posix-cpu-timers.o
> | In file included from mm/mincore.c:11:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/mincore.c:11:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/mutex.o
> | 
> |   CC      kernel/mutex.o
> |   CC      mm/vmalloc.o
> | 
> |   CC      mm/vmalloc.o
> | In file included from mm/mlock.c:13:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/mlock.c:13:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | In file included from mm/mmap.c:14:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from mm/mmap.c:14:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from mm/mprotect.c:19:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from mm/mprotect.c:19:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      kernel/hrtimer.o
> | 
> |   CC      kernel/hrtimer.o
> | In file included from include/linux/ksm.h:12:0,
> |                  from mm/mremap.c:14:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from include/linux/ksm.h:12:0,
> |                  from mm/mremap.c:14:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      kernel/rwsem.o
> | 
> |   CC      kernel/rwsem.o
> |   CC      mm/pagewalk.o
> | 
> |   CC      mm/pagewalk.o
> | mm/mmap.c: In function 'acct_stack_growth':
> | mm/mmap.c:1555:16: warning: variable 'new_start' set but not used [-Wunused-but-set-variable]
> | 
> | mm/mmap.c: In function 'acct_stack_growth':
> | mm/mmap.c:1555:16: warning: variable 'new_start' set but not used [-Wunused-but-set-variable]
> |   CC      kernel/nsproxy.o
> | 
> |   CC      kernel/nsproxy.o
> | mm/mmap.c: In function 'mmap_init':
> | mm/mmap.c:2508:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> | 
> | mm/mmap.c: In function 'mmap_init':
> | mm/mmap.c:2508:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> |   CC      mm/init-mm.o
> | 
> |   CC      mm/init-mm.o
> | In file included from mm/rmap.c:47:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from mm/rmap.c:47:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      kernel/srcu.o
> | 
> |   CC      kernel/srcu.o
> |   CC      kernel/semaphore.o
> | 
> |   CC      kernel/semaphore.o
> |   CC      kernel/notifier.o
> | 
> |   CC      kernel/notifier.o
> |   CC      kernel/ksysfs.o
> | 
> |   CC      kernel/ksysfs.o
> |   CC      mm/page_io.o
> | 
> |   CC      mm/page_io.o
> |   CC      mm/swap_state.o
> | 
> |   CC      mm/swap_state.o
> | mm/pagewalk.c: In function 'walk_page_range':
> | mm/pagewalk.c: In function 'walk_page_range':
> | 
> | 
> | mm/pagewalk.c:111:25: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
> | mm/pagewalk.c:111:25: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      mm/swapfile.o
> | 
> |   CC      mm/swapfile.o
> | kernel/hrtimer.c: In function 'hrtimer_get_remaining':
> | kernel/hrtimer.c:1099:29: warning: variable 'base' set but not used [-Wunused-but-set-variable]
> | 
> | kernel/hrtimer.c: In function 'hrtimer_get_remaining':
> | kernel/hrtimer.c:1099:29: warning: variable 'base' set but not used [-Wunused-but-set-variable]
> |   CC      mm/thrash.o
> | 
> |   CC      mm/thrash.o
> |   CC      kernel/pm_qos_params.o
> | 
> |   CC      kernel/pm_qos_params.o
> |   CC      kernel/sched_clock.o
> | 
> |   CC      kernel/sched_clock.o
> |   CC      kernel/cred.o
> | 
> |   CC      kernel/cred.o
> |   CC      kernel/async.o
> | 
> |   CC      kernel/async.o
> |   CC      kernel/groups.o
> | 
> |   CC      kernel/groups.o
> |   CC      kernel/freezer.o
> | 
> |   CC      kernel/freezer.o
> |   CC      mm/dmapool.o
> | 
> |   CC      mm/dmapool.o
> |   CC      kernel/profile.o
> | 
> |   CC      kernel/profile.o
> | In file included from mm/page_io.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/page_io.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/stacktrace.o
> | 
> |   CC      kernel/stacktrace.o
> | In file included from mm/swap_state.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from mm/swap_state.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/irq/handle.o
> | 
> |   CC      kernel/irq/handle.o
> |   CC      mm/shmem_acl.o
> | 
> |   CC      mm/shmem_acl.o
> |   CC      kernel/power/main.o
> | 
> |   CC      kernel/power/main.o
> | In file included from mm/swapfile.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | In file included from mm/swapfile.c:15:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> |   CC      kernel/power/console.o
> | 
> |   CC      kernel/power/console.o
> |   CC      kernel/time/timekeeping.o
> | 
> |   CC      kernel/time/timekeeping.o
> |   CC      mm/slab.o
> | 
> |   CC      mm/slab.o
> |   CC      kernel/time/ntp.o
> | 
> |   CC      kernel/time/ntp.o
> |   CC      kernel/trace/trace_clock.o
> | 
> |   CC      kernel/trace/trace_clock.o
> |   CC      kernel/mutex-debug.o
> | 
> |   CC      kernel/mutex-debug.o
> |   CC      kernel/futex.o
> | 
> |   CC      kernel/futex.o
> |   CC      kernel/time/clocksource.o
> | 
> |   CC      kernel/time/clocksource.o
> |   CC      kernel/time/jiffies.o
> | 
> |   CC      kernel/time/jiffies.o
> |   CC      kernel/time/timer_list.o
> | 
> |   CC      kernel/time/timer_list.o
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from mm/slab.c:111:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from mm/slab.c:111:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | mm/slab.c: In function 'cache_reap':
> | mm/slab.c: In function 'cache_reap':
> | 
> | 
> | mm/slab.c:4090:8: warning: variable 'freed' set but not used [-Wunused-but-set-variable]
> | mm/slab.c:4090:8: warning: variable 'freed' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/time/timecompare.o
> | 
> |   CC      kernel/time/timecompare.o
> |   CC      kernel/rtmutex.o
> | 
> |   CC      kernel/rtmutex.o
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from include/linux/shmem_fs.h:5,
> |                  from mm/shmem_acl.c:10:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/mempolicy.h:62:0,
> |                  from include/linux/shmem_fs.h:5,
> |                  from mm/shmem_acl.c:10:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/up.o
> | 
> |   CC      kernel/up.o
> | In file included from kernel/futex.c:55:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from kernel/futex.c:55:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/uid16.o
> | 
> |   CC      kernel/uid16.o
> |   CC      kernel/trace/ring_buffer.o
> | 
> |   CC      kernel/trace/ring_buffer.o
> |   CC      kernel/module.o
> | 
> |   CC      kernel/module.o
> |   CC      kernel/power/process.o
> | 
> |   CC      kernel/power/process.o
> |   CC      kernel/irq/manage.o
> | 
> |   CC      kernel/irq/manage.o
> |   CC      kernel/kallsyms.o
> | 
> |   CC      kernel/kallsyms.o
> |   CC      kernel/power/suspend.o
> | 
> |   CC      kernel/power/suspend.o
> |   CC      kernel/time/timeconv.o
> | 
> |   CC      kernel/time/timeconv.o
> |   CC      kernel/time/clockevents.o
> | 
> |   CC      kernel/time/clockevents.o
> |   CC      kernel/irq/spurious.o
> | 
> |   CC      kernel/irq/spurious.o
> |   CC      kernel/trace/trace.o
> | 
> |   CC      kernel/trace/trace.o
> |   CC      kernel/power/poweroff.o
> | 
> |   CC      kernel/power/poweroff.o
> |   CC      kernel/acct.o
> | 
> |   CC      kernel/acct.o
> |   CC      kernel/irq/resend.o
> | 
> |   CC      kernel/irq/resend.o
> |   CC      kernel/trace/trace_output.o
> | 
> |   CC      kernel/trace/trace_output.o
> |   CC      kernel/time/tick-common.o
> | 
> |   CC      kernel/time/tick-common.o
> |   CC      kernel/kexec.o
> | 
> |   CC      kernel/kexec.o
> |   CC      kernel/trace/trace_stat.o
> | 
> |   CC      kernel/trace/trace_stat.o
> |   GZIP    kernel/config_data.gz
> | 
> |   GZIP    kernel/config_data.gz
> |   CC      kernel/irq/chip.o
> | 
> |   CC      kernel/irq/chip.o
> | kernel/irq/manage.c: In function '__setup_irq':
> | kernel/irq/manage.c: In function '__setup_irq':
> | 
> | 
> | kernel/irq/manage.c:611:14: warning: variable 'old_name' set but not used [-Wunused-but-set-variable]
> | kernel/irq/manage.c:611:14: warning: variable 'old_name' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/softlockup.o
> | 
> |   CC      kernel/softlockup.o
> |   CC      kernel/time/tick-oneshot.o
> | 
> |   CC      kernel/time/tick-oneshot.o
> | kernel/trace/ring_buffer.c: In function 'rb_advance_iter':
> | kernel/trace/ring_buffer.c: In function 'rb_advance_iter':
> | 
> | 
> | kernel/trace/ring_buffer.c:2957:22: warning: variable 'buffer' set but not used [-Wunused-but-set-variable]
> | kernel/trace/ring_buffer.c:2957:22: warning: variable 'buffer' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | kernel/module.c: In function 'use_module':
> | kernel/module.c: In function 'use_module':
> | 
> | 
> | kernel/module.c:510:6: warning: variable 'no_warn' set but not used [-Wunused-but-set-variable]
> | kernel/module.c:510:6: warning: variable 'no_warn' set but not used [-Wunused-but-set-variable]
> | 
> | 
> | In file included from kernel/trace/trace.c:24:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from kernel/trace/trace.c:24:0:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/trace/trace_printk.o
> | 
> |   CC      kernel/trace/trace_printk.o
> | kernel/trace/trace.c: In function 'ftrace_trace_userstack':
> | kernel/trace/trace.c: In function 'ftrace_trace_userstack':
> | 
> | 
> | kernel/trace/trace.c:1160:21: warning: variable 'trace' set but not used [-Wunused-but-set-variable]
> | kernel/trace/trace.c:1160:21: warning: variable 'trace' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/hung_task.o
> | 
> |   CC      kernel/hung_task.o
> |   CC      kernel/time/tick-sched.o
> | 
> |   CC      kernel/time/tick-sched.o
> | In file included from include/linux/blkdev.h:12:0,
> |                  from kernel/acct.c:60:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/blkdev.h:12:0,
> |                  from kernel/acct.c:60:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/irq/devres.o
> | 
> |   CC      kernel/irq/devres.o
> |   CC      kernel/trace/trace_sched_switch.o
> | 
> |   CC      kernel/trace/trace_sched_switch.o
> |   CC      kernel/rcutree.o
> | 
> |   CC      kernel/rcutree.o
> |   CC      kernel/irq/autoprobe.o
> | 
> |   CC      kernel/irq/autoprobe.o
> |   CC      kernel/time/timer_stats.o
> | 
> |   CC      kernel/time/timer_stats.o
> |   CC      kernel/trace/trace_nop.o
> | 
> |   CC      kernel/trace/trace_nop.o
> |   CC      kernel/irq/proc.o
> | 
> |   CC      kernel/irq/proc.o
> |   CC      kernel/utsname_sysctl.o
> | 
> |   CC      kernel/utsname_sysctl.o
> |   CC      kernel/trace/blktrace.o
> | 
> |   CC      kernel/trace/blktrace.o
> |   CC      kernel/irq/pm.o
> | 
> |   CC      kernel/irq/pm.o
> |   LD      kernel/power/built-in.o
> | 
> |   LD      kernel/power/built-in.o
> |   CC      kernel/delayacct.o
> | 
> |   CC      kernel/delayacct.o
> |   CC      kernel/taskstats.o
> | 
> |   CC      kernel/taskstats.o
> |   CC      kernel/tsacct.o
> | 
> |   CC      kernel/tsacct.o
> |   CC      kernel/tracepoint.o
> | 
> |   CC      kernel/tracepoint.o
> |   CC      kernel/slow-work.o
> | 
> |   CC      kernel/slow-work.o
> |   CC      kernel/trace/trace_events.o
> | 
> |   CC      kernel/trace/trace_events.o
> |   CC      kernel/trace/trace_export.o
> | 
> |   CC      kernel/trace/trace_export.o
> |   CC      kernel/time.o
> | 
> |   CC      kernel/time.o
> |   IKCFG   kernel/config_data.h
> | 
> |   IKCFG   kernel/config_data.h
> |   CC      kernel/trace/trace_events_filter.o
> | 
> |   CC      kernel/trace/trace_events_filter.o
> |   CC      kernel/configs.o
> | 
> |   CC      kernel/configs.o
> | In file included from include/linux/blkdev.h:12:0,
> |                  from kernel/trace/blktrace.c:19:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | In file included from include/linux/blkdev.h:12:0,
> |                  from kernel/trace/blktrace.c:19:
> | include/linux/pagemap.h: In function 'fault_in_pages_readable':
> | 
> | 
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | include/linux/pagemap.h:413:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
> | 
> | 
> |   CC      kernel/trace/power-traces.o
> | 
> |   CC      kernel/trace/power-traces.o
> |   LD      kernel/irq/built-in.o
> | 
> |   LD      kernel/irq/built-in.o
> |   LD      kernel/time/built-in.o
> | 
> |   LD      kernel/time/built-in.o
> |   LD      mm/built-in.o
> | 
> |   LD      mm/built-in.o
> |   LD      kernel/trace/built-in.o
> | 
> |   LD      kernel/trace/built-in.o
> |   LD      kernel/built-in.o
> | 
> |   LD      kernel/built-in.o
> | + die oe_runmake failed
> | + bbfatal oe_runmake failed
> | + echo ERROR: oe_runmake failed
> | ERROR: oe_runmake failed
> | + exit 1
> | 
> | + die oe_runmake failed
> | + bbfatal oe_runmake failed
> | + echo ERROR: oe_runmake failed
> | ERROR: oe_runmake failed
> | + exit 1
> | ERROR: Function failed: do_compileconfigs (see /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/temp/log.do_compileconfigs.19137 for further information)
> ERROR: Task 805 (/home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/linux-omap-psp_2.6.32.bb, do_compileconfigs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 5104 tasks of which 5097 didn't need to be rerun and 1 failed.
> No currently running tasks (5104 of 5135)
> 
> Summary: 1 task failed:
>   /home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/linux-omap-psp_2.6.32.bb, do_compileconfigs
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 


