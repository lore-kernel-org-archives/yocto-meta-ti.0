Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA38BE00994; Fri,  1 May 2015 12:57:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 847A5E0098A
	for <meta-ti@yoctoproject.org>; Fri,  1 May 2015 12:57:07 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41Jv3iE014199;
	Fri, 1 May 2015 14:57:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41Jv2v6006131;
	Fri, 1 May 2015 14:57:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 14:57:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41Jv12X006750;
	Fri, 1 May 2015 14:57:02 -0500
Date: Fri, 1 May 2015 15:57:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Craig McQueen <craig.mcqueen@innerrange.com>
Message-ID: <20150501195701.GD29290@edge>
References: <5500469A22567C4BAF673A6E86AFA3A402227F4FA9C6@IR-CENTRAL.corp.innerrange.com>
MIME-Version: 1.0
In-Reply-To: <5500469A22567C4BAF673A6E86AFA3A402227F4FA9C6@IR-CENTRAL.corp.innerrange.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Deploying linux-ti-staging initramfs kernel into /boot
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
X-List-Received-Date: Fri, 01 May 2015 19:57:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 29, 2015 at 04:07:51PM +1000, Craig McQueen wrote:
> I'm using linux-ti-staging kernel 3.14.x with Yocto dizzy, for a build for 
> BeagleBone Black based system.
> 
> I'd like to use initramfs in my kernel. So I've set INITRAMFS_IMAGE in my 
> linux-ti-staging_3.14.bbappend, and INITRAMFS_IMAGE_BUNDLE = "1" in 
> local.conf. Now in build dir tmp/deploy/images/<boardname> I'm getting 
> zImage-initramfs-<boardname>.bin being built fine.
> 
> However, I'm not getting an initramfs image being deployed to /boot, but 
> just a plain zImage without an initramfs.
> 
> Looking in the build directory 
> tmp/work/<boardname>-poky-linux-gnueabi/linux-ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc7/packages-split/kernel-image/boot 
> I see there is:
> 
> zImage-3.14.39
> zImage-initramfs-<boardname>.bin
> 
> --however the zImage-initramfs-<boardname>.bin file isn't being included in 
> deploy-rpms/<boardname>/kernel-image-3.14.39-3.14.39-r22b+gitrAUTOINC+ba552b4bc7.<boardname>.rpm 
> for some reason.
> 
> But, if I change my linux-ti-staging_3.14.bbappend to include any one of the 
> following lines, then the kernel-image .rpm file _does_ include both zImage 
> files:
> 
> RDEPENDS_kernel-base = ""
> RDEPENDS_kernel-base = "kernel-devicetree"
> RDEPENDS_kernel-base = "kernel-image"
> 
> But if I put:
> 
> RDEPENDS_kernel-base = "kernel-image kernel-devicetree"
> 
> --then there is no zImage-initramfs-<boardname>.bin in the kernel-image 
> .rpm. This seems very confusing.
> 
> Why would zImage-initramfs-<boardname>.bin disappear from the kernel-image 
> package when the linux-ti-staging RDEPENDS_kernel-base specifies both 
> kernel-image and kernel-devicetree, but not other cases?

This all sounds like a very weird bug somewhere. Have you tried opkg instead 
of rpm? See if it's specific to one or another package manager...

-- 
Denys

