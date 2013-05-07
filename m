Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2547E0127D
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 15:40:14 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47MeDir009198
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 17:40:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47MeD0j020936
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 17:40:13 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 17:40:13 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r47MeDj8018318;
	Tue, 7 May 2013 17:40:13 -0500
Date: Tue, 7 May 2013 18:40:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
Message-ID: <20130507224012.GJ12982@edge>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: trini@ti.com, "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph support
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
X-List-Received-Date: Tue, 07 May 2013 22:40:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 07, 2013 at 06:07:10PM -0400, Karicheri, Muralidharan wrote:
> >> > -COMPATIBLE_MACHINE = "keystone"
> >> > +COMPATIBLE_MACHINE = "keystone-evm"
> >> 
> >> This is also not needed - you are changing recipe compatibility from a broader
> >> Keystone SOC to a more strict Keystone EVM. Right now it is pretty much the
> >> same, but in the future there maybe more machines in a Keystone SOC family.
> >> 
> 
> What is the dependency pulled in for keystone? generic tuning for a15 and 
> similar. What defines "keystone" here so that I better understand the big 
> picture?

Here's "keystone" SOC family:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include/keystone.inc

It is included by the "keystone-evm" machine:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/keystone-evm.conf

The point is to group all machines based on the same SOC and be able to 
address them all with just SOC family name, instead of listing them one by 
one.

For more real life examples see "ti33x" SOC family used by "am335x-evm" and 
"beaglebone" machines. Or "omap3" SOC used by "am37x-evm", "am3517-evm" and 
"beagleboard".


> >> > -SRC_URI = "git://arago-project.org/git/projects/u-boot-
> >> keystone.git;protocol=git;branch=${BRANCH}"
> >> > +PR = "r3+gitr${SRCPV}"
> >> > +
> >> > +# for nightly switch the two below
> >> > +#SRC_URI = "git://arago-project.org/git/projects/u-boot-
> >> keystone.git;protocol=git;branch=${BRANCH}"
> >> > +SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-
> >> keystone.git;protocol=git;branch=${BRANCH}"
> >> 
> >> See below about pointing SRC_URI to an internal git server.
> >> 
> >> 
> >> >  BRANCH = "master"
> >> >
> >> > -# DEV.MCSDK-03.00.00.07
> >> > -SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
> >> 
> >> Please use the format above - it avoid unnecessary breakages when
> >> git-ls-remote is not working...
> 
> Adding a commit id means every time we push something to master, I need to 
> go and change this. This is not practical. Better point to the tip for 
> getting the latest for nightly. What am I missing?

The problem is that meta-ti is public and constantly used by many people 
outside of TI - every time they parse the recipe, it will hit the server. If 
you point to arago-project.org, it may bring it down, as we have seen before. 
If you point it to your internal git server, that is not accessible from 
outside of TI, it will break parsing for everyone and render meta-ti unusable!

See my next comment for details on how to do it in meta-arago instead.


> >> > +# for nightly switch the two below
> >> > +#SRCREV = "DEV.MCSDK-2013-01.10"
> >> > +SRCREV = "${AUTOREV}"
> >> 
> >> Same as before - please no AUTOREVs in meta-ti.
> >> 
> >> If you need to track daily/nightly progress from an internal git server,
> >> please use a .bbappend in meta-arago, while keeping meta-ti pointing to a
> >> piblic git server and using a specific commit ID. Let me know if you need
> >> existing examples - we just released Core TI-SDK 2013.04.00 which used to
> >> track the latest linux-ti-staging kernel by setting AUTOREV in meta-arago.
> >> 
> 
> I don't know. Please give me an example or help me figure this out.

Use something as simple as below, but for the kernel:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=32ec5282fd0248581d57ed2a0d66d4c47c275e8c


> >> > +	cd ${DEPLOY_DIR_IMAGE}
> >> > +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> >> > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> >> > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> >> > +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> >> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> >> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> >> > +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
> >> > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
> >> > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
> >> > +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> >> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> >> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> >> > +}
> >> 
> >> As we just spoke - let's try to generalize this format and combine it with
> >> other similar requirements, like SPL-UART etc. There was a thread back in
> >> February about this...
> 
> This is where I have disagreement. Let us restart the discussion. Who are 
> the stake holders? Discuss it in this thread rather than using an old 
> thread. I have copied here Carlos. I don't have bandwidth to spend too much 
> time on this. Let us discuss it and identify what is required to be done.

Sure, let's discuss. I encourage everyone to participate, especially Carlos 
and Tom.

-- 
Denys

