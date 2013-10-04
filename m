Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B469E0044C
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 14:50:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94LomW1007831;
	Fri, 4 Oct 2013 16:50:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94LomrH006225;
	Fri, 4 Oct 2013 16:50:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 4 Oct 2013 16:50:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94Lol7t013798;
	Fri, 4 Oct 2013 16:50:47 -0500
Date: Fri, 4 Oct 2013 17:50:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Message-ID: <20131004215047.GD3672@edge>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
	<CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
	<20131004182321.GA3672@edge>
	<CA+gsK-ofzwiKXqVCQ-=_kcvZJu+aaWqa07-DgVYTh91VB70OvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+gsK-ofzwiKXqVCQ-=_kcvZJu+aaWqa07-DgVYTh91VB70OvQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Fri, 04 Oct 2013 21:50:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 04, 2013 at 02:00:44PM -0700, Rudolf Streif wrote:
> Thanks, Denys. I appreciate your help.

You are very welcome.


> > FAT boot partition is no longer preferred place for kernel images and DTB
> > files - U-boot now wants to see them in /boot directory of the rootfs.
> >
> That is actually a good thing. But I assume one will still need the FAT
> partition for MLO and u-boot itself.

Correct, you still need FAT boot partition for MLO and u-boot.


> Unfortunately, the do_rootfs task does not put dtb or kernel into /boot yet.

You are just using the wrong image :)
core-image-minimal is not installing any kernel modules, hence no kernel 
image and no kernel device trees.
Kernel image being pulled by default into /boot was there for long time. And I 
pushed the patch earlier today for pulling device trees into /boot. But that 
only happens when your image installs anything from the kernel, which 
core-image-minimal doesn't do. Try core-image-base instead.


> > Ok, let's debug why you are not getting any DTB files produced. There
> > should
> > be at least 3 of them for the case of am335x-evm, as it covers EVM, EVM-SK
> > and
> > BeagleBone.
> >
> They are not created. I changed the machine to beaglebone to test. No
> dtb's created although the build process finishes without errors.

The machine is not the problem - the problem is the layer setup, as I 
suspected... See below.
If you build for beaglebone, you'll only get DTB for beaglebone. If you build 
for am335x-evm, you'll get 3 DTBs for EVM, EVM-SK and beaglebone, as I 
mentioned before.


> > Can you show me your bblayers.conf file, please?
> >
> 
> Of course:
> 
> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> # changes incompatibly
> LCONF_VERSION = "6"
> 
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
> 
> BBLAYERS ?= " \
>   /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta \
>   /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta-yocto \
> 
> /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta-yocto-bsp \
>   /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/bsp/meta-ti \
>   "

So, I see the problem here - you placed meta-ti layer at the very bottom, 
which prevents it from overriding any files in other layers. Specifically, 
meta-ti has a newer linux-dtb.inc to handle in-tree compilation of DTBs and 
the new syntax, which happened recently around 3.10-3.12 timeframe...

The way you set it up, you are not using linux-dtb.inc from meta-ti, but 
instead using an old one from oe-core (poky/meta in your case). This 
particular file has been updated in the master branch of OE-Core and Poky, but 
not in Dylan, because Poky/Dylan was frozen on 3.8, like you said before.
We needed the newer one in Dylan, because we have 3.12 in there as well as in 
the master.

So, the solution is to have meta-ti before meta. I'm also wondering why you 
have meta-yocto and meta-yocto-bsp after meta, but I will leave that to Poky 
maintainers... Also, if you have meta-yocto-bsp before meta-ti, you will have 
issues with beagleboard machine and recipes in meta-ti, as both those BSP 
layers define beagleboard machine. But you don't seem to use beagleboard now. 
BTW, meta-yocto-bsp is a reference BSP, you don't need it if you have real BSP

So, I usually compose layer stack as follows:
* Distro
* Apps
* BSP
* Core

This way you have the most flexibility overriding different things in higher 
layers from their originals in lower core layers.

In your case, Distro = meta-yocto, Apps is empty, BSP is meta-ti _and_ 
meta-yocto-bsp, and Core is meta. Try switching them around.

-- 
Denys

