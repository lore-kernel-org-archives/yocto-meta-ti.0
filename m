Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1E6DE014E2
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 02:49:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5R9nQCv011557;
	Thu, 27 Jun 2013 04:49:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5R9nQGm029376;
	Thu, 27 Jun 2013 04:49:26 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 04:49:26 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5R9nOB5007332;	Thu, 27 Jun 2013 04:49:25 -0500
Message-ID: <51CC0AA3.5030208@ti.com>
Date: Thu, 27 Jun 2013 15:19:23 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Sudhangathan B S <sudhangathan@gmail.com>
References: <CAGX3a9_DovM8ooOp7LwrzTPPGHQa6GCmJrPQSQLGGhjVjbCWyg@mail.gmail.com>
In-Reply-To: <CAGX3a9_DovM8ooOp7LwrzTPPGHQa6GCmJrPQSQLGGhjVjbCWyg@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Jun 2013 09:49:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/27/2013 12:08 PM, Sudhangathan B S wrote:
> Ok.. I got where "oe_runmake" function is, but still couldn't zero-in on
> the problem..!!
> 
> Any suggestions on how to proceed.?
> 
> ---------------------------------
> Sudhangathan BS
> Ph:(+91) 9731-905-205 <tel:%28%2B91%29%209731-905-205>
> ---------------------------------
> 
> 
> On Wed, Jun 26, 2013 at 9:28 AM, Sudhangathan B S
> <sudhangathan@gmail.com <mailto:sudhangathan@gmail.com>> wrote:
> 
>     On my way to install 2.6.32 kernel for the Beagle board image. I
>     need this kernel to work with the leopard imaging/aptina camera
>     module/sensors. I'm encountering this "oe_runmake failed" issue. I
>     have strong feeling it is Yocto or the meta-ti layers, which is not
>     set properly. On the web i got related issues, but they are too old,
>     and were related to OE.
> 
>     I'm using danny branch. I had downloaded meta-ti, openembedded-core,
>     and meta-oe as .zip files meant for danny branch. Thanks to Denys
>     D@ti for help. I integrated meta-ti with yocto, and also built the
>     image with the default 3.2 kernel, and further with 2.6.37 kernel
>     too, successfully.
> 
>     I have also included partial terminal output below.!
> 
>     These are a few lines from
>     /home/asahota/danny-try/danny-8.0/meta-ti/conf/machine/beagleboard.conf
>     *******START
>     #@TYPE: Machine
>     #@NAME: Beagleboard machine
>     #@DESCRIPTION: Machine configuration for the http://beagleboard.org/
>     board
> 
>     require conf/machine/include/omap3.inc
> 
>     # Only has DVI connector for external screen
>     GUI_MACHINE_CLASS = "bigscreen"
> 
>     #PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
>     PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"               
>     <---- change
>     PREFERRED_VERSION_linux-omap-psp = "2.6.32"
>     PREFERRED_PROVIDER_virtual/bootloader = "u-boot-beagleboard"
>     PREFERRED_PROVIDER_u-boot = "u-boot-beagleboard"
> 
>     IMAGE_FSTYPES += "tar.gz ubi"
>     EXTRA_IMAGECMD_jffs2 = "-lnp"
> 
>     SERIAL_CONSOLE = "115200 ttyO2"
> 
>     UBOOT_MACHINE = "omap3_beagle_config"
>     *******END
> 
> 
>     These are the FIRST few lines of my terminal output, for the command
>     bitbake core-image-sato
>     *******START
>     WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been
>     validated with this version of the build system; you may possibly
>     experience unexpected failures. It is recommended that you use a
>     tested distribution.
>     Loading cache: 100%
>     |###################################################################################################################################|
>     ETA:  00:00:00
>     Loaded 1210 entries from dependency cache.
> 
>     Build Configuration:
>     BB_VERSION        = "1.16.0"
>     TARGET_ARCH       = "arm"
>     TARGET_OS         = "linux-gnueabi"
>     MACHINE           = "beagleboard"
>     DISTRO            = "poky"
>     DISTRO_VERSION    = "1.3"
>     TUNE_FEATURES     = "armv7a vfp neon cortexa8"
>     TARGET_FPU        = "vfp-neon"
>     meta             
>     meta-yocto       
>     meta-ti          
>     meta-yocto-bsp    = "<unknown>:<unknown>"
> 
>     NOTE: Resolving any missing task queue dependencies
>     NOTE: Preparing runqueue
>     NOTE: Executing SetScene Tasks
>     *******END
> 
> 
>     These are the LAST few lines of my terminal output, for the command
>     bitbake -vvv core-image-sato
>     *******START
>     | include/linux/pagemap.h: In function 'fault_in_pages_readable':
>     | include/linux/pagemap.h:413:16: warning: variable 'c' set but not
>     used [-Wunused-but-set-variable]
>     |   LD      fs/ubifs/ubifs.o
>     |   LD      fs/ubifs/built-in.o
>     |   LD      fs/built-in.o
>     | ERROR: oe_runmake failed
>     | ERROR: Function failed: do_compileconfigs (see
>     /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/temp/log.do_compileconfigs.28440
>     for further information)

Have you had a look at the log file? The issue seems to be with kernel
compilation rather than with yocto. oe_runmake only calls make on the
kernel tree. So, can you see if building the kernel (in the build/tmp
folder) manually works? Also check the defconfig file that is used
manually vs. the recipe.


>     ERROR: Task 805
>     (/home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
>     <http://linux-omap-psp_2.6.32.bb>, do_compileconfigs) failed with
>     exit code '1'
>     NOTE: Tasks Summary: Attempted 5104 tasks of which 5097 didn't need
>     to be rerun and 1 failed.
>     No currently running tasks (5104 of 5135)
> 
>     Summary: 1 task failed:
>      
>     /home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
>     <http://linux-omap-psp_2.6.32.bb>, do_compileconfigs
>     Summary: There was 1 WARNING message shown.
>     Summary: There was 1 ERROR message shown, returning a non-zero exit
>     code.
>     *****END
> 
>     I spent a lot of time tracing the error in the YP folders and files.
>     It was somewhere near kernel_do_configure. But I couldn't get where
>     "oe_runmake" is. Couldn't continue debugging.
> 
>     ---------------------------------
>     Sudhangathan BS
>     Ph:(+91) 9731-905-205 <tel:%28%2B91%29%209731-905-205>
>     ---------------------------------
> 
> 
> 
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


