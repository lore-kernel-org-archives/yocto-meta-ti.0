Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D8EC02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:49:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.94631.1738604951240000044
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 09:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AE7940C67;
	Mon,  3 Feb 2025 17:49:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8El2JaXOly5; Mon,  3 Feb 2025 17:49:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2BBA2407E5;
	Mon,  3 Feb 2025 17:49:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5305B1641F7; Mon,  3 Feb 2025 12:49:03 -0500 (EST)
Date: Mon, 3 Feb 2025 12:49:03 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-limaye@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org,
	u-kumar1@ti.com, m-chawdhry@ti.com, r-ravikumar@ti.com,
	s-sinha@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am69: Update
 filenames for initial bootloader tiboot3
Message-ID: <20250203174903.GD21608@denix.org>
References: <20250203132307.2862016-1-a-limaye@ti.com>
 <3e299711-bbf8-4176-a101-0baec7df9772@ti.com>
 <b19caa47-d7c2-42bf-bd7c-54953a45ceb5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <b19caa47-d7c2-42bf-bd7c-54953a45ceb5@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Feb 2025 17:49:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18250

On Mon, Feb 03, 2025 at 08:55:49PM +0530, Aniket Limaye via lists.yoctopr=
oject.org wrote:
>=20
>=20
> On 03/02/25 20:16, Ryan Eatmon wrote:
> >
> >
> >On 2/3/2025 7:18 AM, Aniket Limaye wrote:
> >>Update the filenames for tiboot3.bin variants built by the u-boot rec=
ipe
> >>and also the files expected by the wic image.
> >>
> >>So far am69-sk and j784s4-evm have shared the same binman include fil=
e
> >>and hence the same filenames for u-boot images. However, with the
> >>configs and the devicetree being different, the same built binary doe=
s
> >>not support both boards. Hence the filenames of images built for am69=
-sk
> >>should reflect support for the same. The corresponding
> >>
> >>This change is currently only applicable to ti-u-boot-2025.01, and he=
nce
> >>it is restricted to the override bsp-ti-6_12.
> >
> >Actually... I would prefer to align all of the defaults with the
> >current default BSP.=A0 Which right now is 6.12.
> >
> >So can you flip this patch around?=A0 Make the default be the new
> >name and add multiple settings for the old name on the other
> >BSPs?=A0 I think it would be more confusing to try and unravel the
> >twisty maze of settings otherwise if we don't have a standard.
> >
>=20
> Yeah I can do that... I was wondering the same but thought I would
> keep the patch smaller by adding an override for only the BSP that
> requires it, instead of override for every other BSP. But yeah since
> overrides will not be required for upstream eventually, makes sense
> to do it the other way around from the get go. Will send a v2
>=20
> Another question I had was about the SYSFW_* variables... These are
> ONLY being used by SPL_BINARY variable defined in k3r5.inc for the
> u-boot recipe. Should I rename those variables to UBOOT_*, since it
> is quite confusing currently.
> Eg: SYSFW_SOC =3D am69 but will use tifs binary with j784s4 and
> produce tiboot3-am69-*.bin

Before binman addition to U-boot, all those SYSFW_* variables were used b=
y=20
ti-sci-fw recipe to build and package SYSFW:
https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-bsp/ti-sc=
i-fw/ti-sci-fw_git.bb?id=3D835811cf8586926cf78a961d090f4e6150432235

These days most of K3 devices package SYSFW into tiboot3.bin, which is R5=
 SPL,=20
but first two K3 devices (am65 and j721e) had SYSFW as a separate FIT ima=
ge.

Also, different variants of tiboot3.bin (GP vs HS, multiple SRs) were bui=
lt=20
using multiconfigs (sometimes a lot of multiconfigs), but these days all=20
variants are built at the same time by binman. So, SPL_BINARY variable, w=
hich=20
gets composed from SYSFW_* variables, now only controls what is the defau=
lt=20
tiboot3.bin symlink...


> Infact why not define SPL_BINARY directly in <board>-k3r5.conf
> instead of having these additional unnecessary variables to
> configure the SPL_BINARY from k3r5.inc
>=20
> Maybe I'll address this in v2 as well...
>=20
> >
> >>Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> >>---
> >>This patch needs to be merged in sync with the corresponding patch fo=
r
> >>ti-u-boot-2025.01.
> >>
> >>The u-boot patch has also been posted to upstream u-boot and when mer=
ged
> >>there, the next/upstream BSP packages will also need this change.
> >>https://lore.kernel.org/u-boot/20250106-b4-upstream-j742s2-v2-2-42d61=
29ce333@ti.com/
> >>---
> >>=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 2 ++
> >>=A0 meta-ti-bsp/conf/machine/include/am69.inc=A0 | 7 ++++---
> >>=A0 2 files changed, 6 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>index 9d2b4cd6..376d8153 100644
> >>--- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>+++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>@@ -5,7 +5,9 @@
> >>=A0 require conf/machine/include/k3r5.inc
> >>=A0 SYSFW_SOC =3D "j784s4"
> >>+SYSFW_SOC:bsp-ti-6_12 =3D "am69"
> >>=A0 SYSFW_CONFIG =3D "evm"
> >>+SYSFW_CONFIG:bsp-ti-6_12 =3D "sk"
> >>=A0 SYSFW_SUFFIX =3D "hs-fs"
> >>=A0 UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
> >>diff --git a/meta-ti-bsp/conf/machine/include/am69.inc
> >>b/meta-ti-bsp/conf/machine/include/am69.inc
> >>index da8a5a8b..e82d58e2 100644
> >>--- a/meta-ti-bsp/conf/machine/include/am69.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/am69.inc
> >>@@ -9,10 +9,11 @@ require conf/machine/include/mesa-pvr.inc
> >>=A0 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PRO=
VIDER}"
> >>=A0 # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
> >>-IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
> >>+# Add tiboot3.bin for all SOC types, to the wic image.
> >>+BSP_BOOTLOADER_FILES =3D "tiboot3-j784s4-hs-fs-evm.bin
> >>tiboot3-j784s4-hs-evm.bin"
> >>+BSP_BOOTLOADER_FILES:bsp-ti-6_12 =3D "tiboot3-am69-hs-fs-sk.bin
> >>tiboot3-am69-hs-sk.bin"
> >>-# Since default tiboot3.bin on AM69 is for HS-FS, add a version
> >>for SR1.0 HS-SE
> >>-IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-evm.bin"
> >>+IMAGE_BOOT_FILES +=3D "${BSP_BOOTLOADER_FILES}"
> >>=A0 TFA_BOARD =3D "j784s4"
> >

