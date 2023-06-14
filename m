Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4FEEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 23:18:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6274.1686784731212293175
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 16:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78FDE40C30;
	Wed, 14 Jun 2023 23:18:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8vyhKQWEPWE; Wed, 14 Jun 2023 23:18:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF23640A46;
	Wed, 14 Jun 2023 23:18:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E0059163A6A; Wed, 14 Jun 2023 19:17:53 -0400 (EDT)
Date: Wed, 14 Jun 2023 19:17:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, denys@konsulko.com, nm@ti.com, vigneshr@ti.com,
	a-bhatia1@ti.com, j-luthra@ti.com, khasim@ti.com, nsekhar@ti.com,
	afd@ti.com, rs@ti.com, n-jain1@ti.com
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2]
 u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for AM62x
Message-ID: <20230614231753.GA1518@denix.org>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
 <20230614145436.GW9226@denix.org>
 <3edc9efe-20b4-bb49-09a4-6df4cd39ca1a@ti.com>
 <20230614155146.GX9226@denix.org>
 <e9d8598c-5718-2fb7-5e05-dd517467d20c@ti.com>
 <6baddf54-c8c7-669f-53dc-5e952ba3d2fa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <6baddf54-c8c7-669f-53dc-5e952ba3d2fa@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 23:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16728

On Wed, Jun 14, 2023 at 01:16:13PM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 6/14/2023 11:57 AM, Devarsh Thakkar wrote:
> >
> >
> >On 14/06/23 21:21, Denys Dmytriyenko wrote:
> >>On Wed, Jun 14, 2023 at 08:53:07PM +0530, Devarsh Thakkar wrote:
> >>>Hi Denys,
> >>>
> >>>Thanks for the review,
> >>>
> >>>On 14/06/23 20:24, Denys Dmytriyenko wrote:
> >>>>On Wed, Jun 14, 2023 at 08:03:05PM +0530, Devarsh Thakkar
> >>>>via lists.yoctoproject.org wrote:
> >>>>>Early splash screen support for AM62x has been enabled in u-boot
> >>>>>and it requires bitmap tarball to be present in boot partition
> >>>>>as per the default environment settings done in u-boot [1].
> >>>>>
> >>>>>Copy the ti logo bitmap tarball to boot partition of wic
> >>>>>image in order
> >>>>>to enable out of box early display on AM62x.
> >>>>>
> >>>>>[1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62=
x/am62x.env
> >>>>>
> >>>>>Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >>>>>---
> >>>>>V2: Rename ti logo tarball as per suggested changes (same is being
> >>>>>=A0=A0=A0=A0 done in ti-u-boot too)
> >>>>>---
> >>>>>=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=A0=A0=A0=A0=
=A0
> >>>>>| 9 +++++++++
> >>>>>=A0 1 file changed, 9 insertions(+)
> >>>>>
> >>>>>diff --git
> >>>>>a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >>>>>b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >>>>>index e6da84cb..c948e1ed 100644
> >>>>>--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >>>>>+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >>>>>@@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
> >>>>>=A0 SRCREV =3D "1f510931dcc90e6f28f7fed757ad5000d4382e22"
> >>>>>+do_install:append:am62xx() {
> >>>>>+=A0=A0=A0 install -d ${D}/boot
> >>>>>+=A0=A0=A0 install -m 0644
> >>>>>${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> >>>>>+}
> >>>>>+
> >>>>>+do_deploy:append:am62xx() {
> >>>>>+=A0=A0=A0 install -d ${DEPLOYDIR}
> >>>>>+=A0=A0=A0 install -m 0644
> >>>>>${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> >>>>
> >>>>Any specific reason you also need to deploy this loose file?
> >>>>
> >>>
> >>>I think the boot partition script which is ran as part of
> >>>do_image_wic expects
> >>>IMAGE_BOOTFILES to be present in deploy directory, I remember
> >>>getting below
> >>>error without doing so :
> >>>
> >>>| ERROR: _exec_cmd: install -m 0644 -D
> >>>/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defau=
lt-glibc/deploy/images/am62xx-evm/ti.gz
> >>>/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defau=
lt-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/tmp-wic/hdd/=
boot/ti.gz
> >>>returned '1' instead of 0
> >>>| output: install: cannot stat
> >>>'/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defa=
ult-glibc/deploy/images/am62xx-evm/ti.gz':
> >>>No such file or directory
> >>>| WARNING:
> >>>/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defau=
lt-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/run.do_=
image_wic.1581619:162
> >>>exit 1 from
> >>>'BUILDDIR=3D"/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build"
> >>>PSEUDO_UNLOAD=3D1 wic create "$wks" --vars
> >>>"/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defa=
ult-glibc/sysroots/am62xx-evm/imgdata/"
> >>>-e "tisdk-default-image" -o "$build_wic/" -w "$tmp_wic"'
> >>
> >>So, is this logo expected by U-boot to reside in the boot partition o=
f SD
> >>card, or in the /boot directory of the rootfs?
> >>The first is handled by do_deploy and IMAGE_BOOTFILES, while the
> >>second is
> >>handled by do_install. I wonder if doing both is going to be confusin=
g...
> >>
> >>
> >
> >Yes, this logo is expected to reside in boot partition of SD only
> >per current implementation in ti-u-boot.
>=20
> So then it only requires do_deploy and IMAGE_BOOTFILES since that
> puts items into the boot partition... Do we need the do_install?

Well, thinking a bit more about this, we do the same for all other binari=
es=20
from U-boot build in u-boot-ti.inc and even upstream u-boot.inc - we inst=
all=20
and deploy them. The installed files go into /boot directory and end up i=
n=20
corresponding IPK package, but we do not install it, hence the files are =
not=20
in the rootfs. So this should be fine as is...


> >>>One more reason to do so was to allow user ease of use, to
> >>>copy the logo too
> >>>from deploy folder along with other boot files (if not flashing from=
 wic
> >>>image) since the same is set in am62x.env and if logo is not
> >>>present in boot
> >>>partition then it throws some error message although the
> >>>device still boots.

