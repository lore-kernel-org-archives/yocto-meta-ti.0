Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6080FC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 20:38:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1246.1665693506226899041
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 13:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3321B40DD4;
	Thu, 13 Oct 2022 20:38:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAMcAC6U1eUK; Thu, 13 Oct 2022 20:38:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 04D7940DCE;
	Thu, 13 Oct 2022 20:38:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 46562174A39; Thu, 13 Oct 2022 16:38:19 -0400 (EDT)
Date: Thu, 13 Oct 2022 16:38:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2] u-boot: Change depends from lzop
 to lzo
Message-ID: <20221013203819.GL22689@denix.org>
References: <20221013182602.9318-1-reatmon@ti.com>
 <20221013192440.GJ22689@denix.org>
 <334f2a4e-d192-0989-ecc5-ff4b09666c66@ti.com>
 <ac31ed0c-499d-8a2a-6717-6710f408f0ed@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ac31ed0c-499d-8a2a-6717-6710f408f0ed@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 20:38:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15169

On Thu, Oct 13, 2022 at 03:15:19PM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 10/13/2022 3:10 PM, Andrew Davis wrote:
> >On 10/13/22 2:24 PM, Denys Dmytriyenko wrote:
> >>On Thu, Oct 13, 2022 at 01:26:02PM -0500, Ryan Eatmon via
> >>lists.yoctoproject.org wrote:
> >>>lzop has disappeared from upstream master, but lzo is there.
> >>
> >>lzop is actually a compression tool, while lzo is just a library.
> >>so, I don't believe this change is correct/complete.
> >>
> >
> >Do we use this? Might be better to just drop the DEPENDS.
>=20
> I was wondering the same thing.  lzop is clearly gone from master
> upstream.  So we either need to find a replacement, or we need to
> remove it.
>=20
>=20
> Here is the commit that removed it:
>=20
> commit dea5e8863792dc7bb3324b543e04da4c94a060aa
> Author: Ross Burton <ross.burton@arm.com>
> Date:   Tue May 24 16:23:58 2022 +0100
>=20
>     lzop: remove recipe from oe-core
>=20
>     There are no users of lzop in oe-core, and there hasn't been a
> release of
>     lzop since 2017.
>=20
>     Signed-off-by: Ross Burton <ross.burton@arm.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
>=20
> Denys, as the person who added the lzop-native requirement in u-boot
> in the first place, can you think of anything?

lzop has been moved from oe-core to meta-oe, so it's not completely gone:

https://git.openembedded.org/meta-openembedded/commit/?id=3D90ff53b8df1e3=
259cbc201c658a4f3f4dddf3aa8

Even oe-core still has some conditional dependencies on lzop-native, assu=
ming=20
you use meta-oe layer. But normally it is not enabled by default.

When FIT image gets generated, it can compress the kernel image using eit=
her=20
the default gzip compression algorithm, or lzo one. It is selected by=20
FIT_KERNEL_COMP_ALG variable:

https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/k=
ernel-uboot.bbclass

So, unless you specifically change that variable to "lzo" for FIT image b=
ased=20
HS platforms, you don't need a dependency on lzop-native. Otherwise, you =
need=20
meta-oe layer in your stack.


> >Andrew
> >
> >>
> >>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>---
> >>>v2: Fixed typo lzpo -> lzop
> >>>
> >>>=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
> >>>=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>index d29c80cf..88018541 100644
> >>>--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>>@@ -23,7 +23,7 @@ SRC_URI =3D
> >>>"${UBOOT_GIT_URI};protocol=3D${UBOOT_GIT_PROTOCOL};branch=3D${BRANCH=
}"
> >>>=A0 PV:append =3D "+git${SRCPV}"
> >>>=A0 # u-boot needs devtree compiler to parse dts files
> >>>-DEPENDS +=3D "dtc-native bc-native lzop-native flex-native
> >>>bison-native python3-setuptools-native"
> >>>+DEPENDS +=3D "dtc-native bc-native lzo-native flex-native
> >>>bison-native python3-setuptools-native"
> >>>=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> >>>--=20
> >>>2.17.1

