Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27972C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:48:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.60474.1718639319550056488
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 08:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4A2040AB7;
	Mon, 17 Jun 2024 15:48:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBymru1HD0Op; Mon, 17 Jun 2024 15:48:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA2C840A0B;
	Mon, 17 Jun 2024 15:48:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 714B8163FAF; Mon, 17 Jun 2024 11:48:35 -0400 (EDT)
Date: Mon, 17 Jun 2024 11:48:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Limaye, Aniket" <a-limaye@ti.com>
Cc: meta-ti@lists.yoctoproject.org, "Francis, Neha" <n-francis@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH 2/4] conf/machine/j721e:
 some BSPs don't support all SR and HS variants
Message-ID: <20240617154835.GC5475@denix.org>
References: <20240613172254.770920-1-denis@denix.org>
 <20240613172254.770920-2-denis@denix.org>
 <f67f2fee-fa34-47b7-bad3-e7b9fa2a0a43@ti.com>
 <20240614163833.GY21287@denix.org>
 <45006745-7575-407f-997d-5f95d3f0154c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45006745-7575-407f-997d-5f95d3f0154c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 15:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17758

On Mon, Jun 17, 2024 at 07:31:59PM +0530, Limaye, Aniket wrote:
>=20
> On 6/14/2024 10:08 PM, Denys Dmytriyenko wrote:
> >On Fri, Jun 14, 2024 at 03:50:14PM +0530, Aniket Limaye via lists.yoct=
oproject.org wrote:
> >>Hi Denys,
> >>
> >>On 6/13/2024 10:52 PM, Denys Dmytriyenko wrote:
> >>>From: Denys Dmytriyenko<denys@=E2=80=8Akonsulko.=E2=80=8Acom>  Adjus=
t
> >>>IMAGE_BOOT_FILES list as some BSPs do not support all combinations
> >>>of SR1.=E2=80=8A1, SR2.=E2=80=8A0, HS-FS and HS-SE variants. Signed-=
off-by: Denys
> >>>Dmytriyenko<denys@=E2=80=8Akonsulko.=E2=80=8Acom>  ---
> >>>meta-ti-bsp/conf/machine/include/j721e.=E2=80=8Ainc
> >>>ZjQcmQRYFpfptBannerStart
> >>>From: Denys Dmytriyenko<denys@konsulko.com>
> >>>Adjust IMAGE_BOOT_FILES list as some BSPs do not support all combina=
tions
> >>>of SR1.1, SR2.0, HS-FS and HS-SE variants.
> >>>
> >>>Signed-off-by: Denys Dmytriyenko<denys@konsulko.com>
> >>>---
> >>Same change is needed for J7200 as well. At the current commit
> >>pointed by u-boot-ti-mainline=C2=A0[1], j7200 only has support for be=
low:
> >>GP , SR2.0 HS-FS , SR2.0 HS-SE
> >>
> >>Hence also suggest below for j7200.inc:
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc
> >>b/meta-ti-bsp/conf/machine/include/j7200.inc
> >>index caa79876..2a11e3dd 100644
> >>--- a/meta-ti-bsp/conf/machine/include/j7200.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
> >>@@ -5,10 +5,14 @@ SOC_FAMILY:append =3D ":j7200"
> >> =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"
> >>
> >> =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version =
for
> >>SR1.0 HS-FS
> >>-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"
> >>+IMAGE_SR1_HS_FS_FILES =3D "tiboot3-j7200-hs-fs-evm.bin"
> >>+IMAGE_SR1_HS_FS_FILES:bsp-mainline =3D ""
> >>+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_FS_FILES}"
> >>
> >> =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version =
for
> >>SR1.0 HS-SE
> >>-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"
> >>+IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j7200-hs-evm.bin"
> >>+IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""
> >>+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"
> >>
> >> =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version =
for
> >>SR2.0 HS-FS
> >> =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"
> >>
> >>
> >>[1]:https://source.denx.de/u-boot/u-boot/-/blob/866ca972d6c3cabeaf6db=
ac431e8e08bb30b3c8e/arch/arm/dts/k3-j7200-binman.dtsi
> >Thanks! Patches are welcome.
> >
> >It wasn't possible for me to test all platforms for all 4 supported "B=
SPs" - I
> >only focused on all Beagles and few EVMs, so some could have been miss=
ed,
> >especially for the "mainline" BSP.
>=20
> Denys,
>=20
> Yeah that makes sense... was only wondering if you'd want to send
> the patch in the same series...
> I see your v2 though... will send patches for other platforms for
> Jacinto based on that.

Yeah, v2 was a simple variable rename - I didn't do any additional change=
s.


> Btw, I forgot to mention earlier but I like the rework being done in
> the patch!

Thanks.



> >>>  meta-ti-bsp/conf/machine/include/j721e.inc | 18 ++++++++++--------
> >>>  1 file changed, 10 insertions(+), 8 deletions(-)
> >>>
> >>>diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bs=
p/conf/machine/include/j721e.inc
> >>>index a54c3f2f..62487aa9 100644
> >>>--- a/meta-ti-bsp/conf/machine/include/j721e.inc
> >>>+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> >>>@@ -13,20 +13,22 @@ IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
> >>>  IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
> >>>  # Since default on J721e is for GP, add a version for SR1.1 HS-FS
> >>>-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
> >>>-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
> >>>+IMAGE_SR1_1_HS_FS_FILES =3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysf=
w-j721e_sr1_1-hs-fs-evm.itb"
> >>>+IMAGE_SR1_1_HS_FS_FILES:bsp-mainline =3D ""
> >>>+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_FS_FILES}"
> >>>  # Since default on J721e is for GP, add a version for SR1.1 HS-SE
> >>>-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
> >>>-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
> >>>+IMAGE_SR1_1_HS_SE_FILES =3D "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j=
721e_sr1_1-hs-evm.itb"
> >>>+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_SE_FILES}"
> >>>  # Since default on J721e is for GP, add a version for SR2.0 HS-FS
> >>>-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
> >>>-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
> >>>+IMAGE_SR2_HS_FS_FILES =3D "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j7=
21e_sr2-hs-fs-evm.itb"
> >>>+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_FS_FILES}"
> >>>  # Since default on J721e is for GP, add a version for SR2.0 HS-SE
> >>>-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
> >>>-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
> >>>+IMAGE_SR2_HS_SE_FILES =3D "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e=
_sr2-hs-evm.itb"
> >>>+IMAGE_SR2_HS_SE_FILES:bsp-mainline =3D ""
> >>>+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_SE_FILES}"
> >>>  TFA_BOARD =3D "generic"
> >>>--=20
> >>>2.25.1

