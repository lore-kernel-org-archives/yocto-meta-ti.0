Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CD5CD6131
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 19:58:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.73764.1696881507515000053
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 12:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8253740C86;
	Mon,  9 Oct 2023 19:58:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKy8jMsQk5Yt; Mon,  9 Oct 2023 19:58:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3EDD40C81;
	Mon,  9 Oct 2023 19:58:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 43B81163CD8; Mon,  9 Oct 2023 15:58:21 -0400 (EDT)
Date: Mon, 9 Oct 2023 15:58:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: afd@ti.com, Julien Panis <jpanis@baylibre.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone] u-boot-ti: Fix SPL binary name
 for SD/MMC media on HS boards
Message-ID: <20231009195821.GB2408@denix.org>
References: <20230929122555.10794-1-jpanis@baylibre.com>
 <0f34de43-bdd5-47cf-bcff-b0e0dbb666aa@baylibre.com>
 <34336d8c-86e3-df50-ff28-3c5632e4479e@ti.com>
 <a167fb89-d2bb-42f4-8bfa-62dfb389e79f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a167fb89-d2bb-42f4-8bfa-62dfb389e79f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 19:58:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17082

On Mon, Oct 02, 2023 at 11:44:42AM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
>=20
> On 10/2/2023 10:30 AM, Andrew Davis via lists.yoctoproject.org wrote:
> >On 10/2/23 9:06 AM, Julien Panis wrote:
> >>On 9/29/23 14:25, Julien Panis wrote:
> >>>The SPL binary built by u-boot for SD/MMC/eMMC media on HS platforms=
 is
> >>>u-boot-spl_HS_MLO. Thanks to this fix, the binary is properly instal=
led
> >>>and deployed.
> >>>
> >>>Signed-off-by: Julien Panis <jpanis@baylibre.com>
> >>>---
> >>>=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 6 +++---
> >>>=A0 1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>index d9a3a520e857..9ca0fb44d127 100644
> >>>--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>@@ -100,9 +100,9 @@ UBOOT_HS_XLD_IMAGE =3D
> >>>"u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
> >>>=A0 UBOOT_HS_XLD_SYMLINK =3D "u-boot-spl_HS_X-LOADER-${MACHINE}"
> >>>=A0 # HS MLO
> >>>-UBOOT_HS_MLO_BINARY =3D "u-boot_HS_MLO"
> >>>-UBOOT_HS_MLO_IMAGE =3D "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
> >>>-UBOOT_HS_MLO_SYMLINK =3D "u-boot_HS_MLO-${MACHINE}"
> >>>+UBOOT_HS_MLO_BINARY =3D "u-boot-spl_HS_MLO"
> >>>+UBOOT_HS_MLO_IMAGE =3D "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
> >>>+UBOOT_HS_MLO_SYMLINK =3D "u-boot-spl_HS_MLO-${MACHINE}"
> >>>=A0 # HS ISSW
> >>>=A0 UBOOT_HS_ISSW_BINARY =3D "u-boot-spl_HS_ISSW"
> >>
> >>I'm not sure that this patch should be applied actually.
> >>In doc/README.ti-secure, u-boot_HS_MLO is mentioned for
> >>Keystone2 Secure Devices.
> >>So, maybe this name was used intentionally...(?)
> >>
> >
> >On Keystone2 HS, we do not use SPL, so the ROM loaded image (MLO) is t=
he
> >normal U-Boot image, we name it u-boot_HS_MLO. For others that do use =
SPL
> >the ROM image is the SPL, and it is called u-boot-spl_HS_MLO.
> >
> >So this patch has the right idea, just we should add another deployed =
image
> >var in addition to this one, not replace it, maybe:
> >
> >SPL_HS_MLO_BINARY =3D "u-boot-spl_HS_MLO"
> >...
>=20
> And add the appropriate install code later in the file as well.

Was this supposed to be changed from UBOOT_HS_MLO_* -> SPL_HS_MLO_* per t=
he=20
discussion above? Or did I miss something and the old patch got merged:

https://git.yoctoproject.org/meta-ti/commit/?id=3D5306d61211edecf3d04cd9e=
8c0b64cd4a0ef3549

--=20
Denys

