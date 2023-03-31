Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6B3C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 00:15:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.43097.1680221730746025947
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 17:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 12CA940C24;
	Fri, 31 Mar 2023 00:15:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YY2tNBtdMkE0; Fri, 31 Mar 2023 00:15:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D2738406B5;
	Fri, 31 Mar 2023 00:15:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 010A01637E5; Thu, 30 Mar 2023 20:14:51 -0400 (EDT)
Date: Thu, 30 Mar 2023 20:14:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 4/4] kernel-fitimage: Add
 signing of fitImage entries for 5.10 kernel
Message-ID: <20230331001451.GC18050@denix.org>
References: <20230330212440.19437-1-reatmon@ti.com>
 <20230330212440.19437-5-reatmon@ti.com>
 <1751580B6CF411F3.12651@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1751580B6CF411F3.12651@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 00:15:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16271

On Thu, Mar 30, 2023 at 08:01:42PM -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 30, 2023 at 04:24:40PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> > While we are mirgrating to kernel v6.1 and u-boot 2023.04, we want to
> > keep kernel 5.10 and u-boot 2021.01 "working" for anyone looking at
> > kirkstone.
> 
> 
> >  One of the changes we are looking at changing is the signing of entries 
> > in the fitImage.
> 
> You might want to rephrase this one :)
> 
> 
> > To try and acheive a limited parity with dunfell while we work on the
> > migration, this creates a class that implements the logic that was in
> > dunfell and applies that class to the 5.10 kernel.
> 
> Maybe mention falling back to using SECDEV tooling for now instead of 
> uboot-sign class, with the plan to get back and clean it up later?
> 
> 
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>

The comments are minor and can be addressed while merging w/o resending a new 
revision, so:

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> > ---
> >  .../classes/kernel-fitimage-ti-u-boot.bbclass | 214 ++++++++++++++++++
> >  .../linux/linux-ti-staging_5.10.bb            |   2 +
> >  2 files changed, 216 insertions(+)
> >  create mode 100644 meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass
> > 
> > diff --git a/meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass b/meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass
> > new file mode 100644
> > index 00000000..503c6d25
> > --- /dev/null
> > +++ b/meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass
> > @@ -0,0 +1,214 @@
> > +
> > +inherit ti-secdev
> > +
> > +# The TI u-boot requires that the kernel image is signed.  To not overload the
> > +# entire kernel-fitimage.bbclass from oe-core, we just overwrite one function
> > +# and do the signing in there.
> 
> I'm wondering how the inherit ordering is handled in this case and whether 
> there are any chances of a race - which fitimage_assemble will be used?
> 
> 
> > +#
> > +# Assemble fitImage
> > +#
> > +# $1 ... .its filename
> > +# $2 ... fitImage name
> > +# $3 ... include ramdisk
> > +fitimage_assemble() {
> > +	kernelcount=1
> > +	dtbcount=""
> > +	DTBS=""
> > +	ramdiskcount=$3
> > +	setupcount=""
> > +	bootscr_id=""
> > +	rm -f $1 arch/${ARCH}/boot/$2
> > +
> > +	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
> > +		bbfatal "Keys used to sign images and configuration nodes must be different."
> > +	fi
> 
> <snip>
> 
> 
> > +}
> > +
> > +fitimage_ti_secure() {
> > +	if test -n "${TI_SECURE_DEV_PKG}"; then
> > +		export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> > +		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh $1 $2
> > +	else
> > +		cp $1 $2
> > +	fi
> > +}
> > +
> > diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> > index cc67188a..f3793baf 100644
> > --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> > +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> > @@ -3,6 +3,8 @@ SUMMARY = "Linux kernel for TI devices"
> >  LICENSE = "GPL-2.0-only"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >  
> > +KERNEL_CLASSES += "${@bb.utils.contains('TFA_PLATFORM', 'k3', 'kernel-fitimage-ti-u-boot', '', d)}"
> 
> "contains" does a substring search, a bit faster to use "conditional" here:
> 
> KERNEL_CLASSES += "${@oe.utils.cconditional('TFA_PLATFORM', 'k3', 'kernel-fitimage-ti-u-boot', '', d)}"
> 
> or even a simple Python if-else directly:
> 
> KERNEL_CLASSES += "${@ 'kernel-fitimage-ti-u-boot' if d.getVar('TFA_PLATFORM') == 'k3' else ''}"
> 
> 
> > +
> >  inherit kernel
> >  
> >  DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
> > -- 
> > 2.17.1

