Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E3BBE0152F
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 21:39:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O4dPoB013439
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 23:39:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O4dOkd018599
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 23:39:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 23:39:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O4dOZk028393;
	Mon, 23 Sep 2013 23:39:24 -0500
Date: Tue, 24 Sep 2013 00:39:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130924043924.GJ4390@edge>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
	<1379989631-8098-4-git-send-email-denis@denix.org>
	<78C276BE-E2AF-46CF-9931-4247D6182123@ti.com>
MIME-Version: 1.0
In-Reply-To: <78C276BE-E2AF-46CF-9931-4247D6182123@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Rini,
	Tom" <trini@ti.com>
Subject: Re: [PATCH 4/4] ti33x, ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Tue, 24 Sep 2013 04:39:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 24, 2013 at 03:36:47AM +0000, Cooper Jr., Franklin wrote:
> What is the benefit of this switch?
> 
> Although outdated a lot of posts talking about uImage vs zImage seems to 
> favor uImage due to additional functionality that it provides.

I guess this is a more generic question addressed to Tom...


> > On Sep 23, 2013, at 9:28 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > * To be used with latest u-boot, that prefers zImage over uImage
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > Cc: Tom Rini <trini@ti.com>
> > ---
> > conf/machine/include/omap-a15.inc | 2 +-
> > conf/machine/include/ti33x.inc    | 2 +-
> > conf/machine/include/ti43x.inc    | 2 +-
> > 3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> > index 623f2df..aba122a 100644
> > --- a/conf/machine/include/omap-a15.inc
> > +++ b/conf/machine/include/omap-a15.inc
> > @@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
> > PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> > PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> > 
> > -KERNEL_IMAGETYPE = "uImage"
> > +KERNEL_IMAGETYPE = "zImage"
> > 
> > UBOOT_ARCH = "arm"
> > UBOOT_ENTRYPOINT = "0x80008000"
> > diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> > index 12b80c6..7f02042 100644
> > --- a/conf/machine/include/ti33x.inc
> > +++ b/conf/machine/include/ti33x.inc
> > @@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
> > PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> > PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> > 
> > -KERNEL_IMAGETYPE = "uImage"
> > +KERNEL_IMAGETYPE = "zImage"
> > 
> > UBOOT_ARCH = "arm"
> > UBOOT_MACHINE = "am335x_evm_config"
> > diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> > index 62da105..adb66e3 100644
> > --- a/conf/machine/include/ti43x.inc
> > +++ b/conf/machine/include/ti43x.inc
> > @@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
> > PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> > PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> > 
> > -KERNEL_IMAGETYPE = "uImage"
> > +KERNEL_IMAGETYPE = "zImage"
> > 
> > UBOOT_ARCH = "arm"
> > UBOOT_MACHINE = "am43xx_evm_config"
> > -- 
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

