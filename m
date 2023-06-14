Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5598EB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:52:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.16378.1686757969407283363
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 08:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 94B7540C37;
	Wed, 14 Jun 2023 15:52:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KxjwzMsWG42; Wed, 14 Jun 2023 15:52:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F0F7740A46;
	Wed, 14 Jun 2023 15:52:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1A9BB163A60; Wed, 14 Jun 2023 11:51:46 -0400 (EDT)
Date: Wed, 14 Jun 2023 11:51:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org, praneeth@ti.com,
	denys@konsulko.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, khasim@ti.com, nsekhar@ti.com, afd@ti.com,
	rs@ti.com, n-jain1@ti.com
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2]
 u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for AM62x
Message-ID: <20230614155146.GX9226@denix.org>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
 <20230614145436.GW9226@denix.org>
 <3edc9efe-20b4-bb49-09a4-6df4cd39ca1a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3edc9efe-20b4-bb49-09a4-6df4cd39ca1a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 15:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16724

On Wed, Jun 14, 2023 at 08:53:07PM +0530, Devarsh Thakkar wrote:
> Hi Denys,
> 
> Thanks for the review,
> 
> On 14/06/23 20:24, Denys Dmytriyenko wrote:
> > On Wed, Jun 14, 2023 at 08:03:05PM +0530, Devarsh Thakkar via lists.yoctoproject.org wrote:
> >> Early splash screen support for AM62x has been enabled in u-boot
> >> and it requires bitmap tarball to be present in boot partition
> >> as per the default environment settings done in u-boot [1].
> >>
> >> Copy the ti logo bitmap tarball to boot partition of wic image in order
> >> to enable out of box early display on AM62x.
> >>
> >> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env
> >>
> >> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >> ---
> >> V2: Rename ti logo tarball as per suggested changes (same is being
> >>     done in ti-u-boot too)
> >> ---
> >>  .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >> index e6da84cb..c948e1ed 100644
> >> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >> @@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
> >>  
> >>  SRCREV = "1f510931dcc90e6f28f7fed757ad5000d4382e22"
> >>  
> >> +do_install:append:am62xx() {
> >> +	install -d ${D}/boot
> >> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> >> +}
> >> +
> >> +do_deploy:append:am62xx() {
> >> +	install -d ${DEPLOYDIR}
> >> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> > 
> > Any specific reason you also need to deploy this loose file?
> > 
> 
> I think the boot partition script which is ran as part of do_image_wic expects
> IMAGE_BOOTFILES to be present in deploy directory, I remember getting below
> error without doing so :
> 
> | ERROR: _exec_cmd: install -m 0644 -D
> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/deploy/images/am62xx-evm/ti.gz
> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/tmp-wic/hdd/boot/ti.gz
> returned '1' instead of 0
> | output: install: cannot stat
> '/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/deploy/images/am62xx-evm/ti.gz':
> No such file or directory
> | WARNING:
> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/run.do_image_wic.1581619:162
> exit 1 from 'BUILDDIR="/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build"
> PSEUDO_UNLOAD=1 wic create "$wks" --vars
> "/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/sysroots/am62xx-evm/imgdata/"
> -e "tisdk-default-image" -o "$build_wic/" -w "$tmp_wic"'

So, is this logo expected by U-boot to reside in the boot partition of SD 
card, or in the /boot directory of the rootfs?
The first is handled by do_deploy and IMAGE_BOOTFILES, while the second is 
handled by do_install. I wonder if doing both is going to be confusing...


> One more reason to do so was to allow user ease of use, to copy the logo too
> from deploy folder along with other boot files (if not flashing from wic
> image) since the same is set in am62x.env and if logo is not present in boot
> partition then it throws some error message although the device still boots.

