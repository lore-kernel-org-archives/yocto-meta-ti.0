Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2042E0075B
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 11:31:27 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0DJVO6P030878;
	Mon, 13 Jan 2014 13:31:24 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DJVO79012013;
	Mon, 13 Jan 2014 13:31:24 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 Jan 2014 13:31:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DJVOCf022266;
	Mon, 13 Jan 2014 13:31:24 -0600
Date: Mon, 13 Jan 2014 14:31:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
Message-ID: <20140113193123.GA5631@edge>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA337F7@USNYGRMBX4.raymondcorp.local>
MIME-Version: 1.0
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA337F7@USNYGRMBX4.raymondcorp.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: USB keyboard not recognized with poky build AM335x-SK
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
X-List-Received-Date: Mon, 13 Jan 2014 19:31:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 13, 2014 at 07:26:19PM +0000, Vanderpool Josh wrote:
> bitbake -e core-image-basic | grep 'DISTRO_FEATURES='
> DISTRO_FEATURES="alsa argp bluetooth ext2 irda largefile pcmcia
> usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ipv4 ipv6
> libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets
> libc-charsets libc-crypt         libc-crypt-ufc libc-db-aliases
> libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse            
>         libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales
> libc-locale-code                     libc-memusage libc-nis
> libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams
> libc-sunrpc                     libc-utmp libc-utmpx libc-wordexp
> libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc    
> libc-posix-wchar-io largefile opengl ptest multiarch wayland pulseaudio
> sysvinit"
> POKY_DEFAULT_DISTRO_FEATURES="largefile opengl ptest multiarch wayland"
> 
> Build Configuration:
> BB_VERSION        = "1.21.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.5+snapshot-20140113"
> TUNE_FEATURES     = "armv7a vfp neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta             
> meta-yocto        = "master:005af45191ded6185c618c708181b31281e43092"
> meta-ti           = "master:85c35541100affcdc47bb72619a59ce1c0d0ef85"
> meta-qt5          = "master:72ca958ebfb61640c614ec865196d68fba2576c2"
> meta-ruby         = "master:4e7073b2ebee64f669b688fde3c1200589d8cb04"

Thanks.
Can you please double-check that you are using 3.12.4 version of the kernel on 
your SK board?

-- 
Denys

