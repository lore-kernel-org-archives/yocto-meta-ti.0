Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0058E67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 18:47:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65851.1766342855288231388
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 21 Dec 2025 10:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C1D440C81;
	Sun, 21 Dec 2025 18:47:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cPt_PicgJFA; Sun, 21 Dec 2025 18:47:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 39C40406B5;
	Sun, 21 Dec 2025 18:47:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 52D52176DE5; Sun, 21 Dec 2025 13:47:31 -0500 (EST)
Date: Sun, 21 Dec 2025 13:47:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Haixiao.Yan.CN@windriver.com
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [scarthgap][PATCH v2] trusted-firmware-a/optee-os:
 Add LPM support on few platforms
Message-ID: <20251221184731.GZ11121@denix.org>
References: <20251128184125.3220124-1-m-chawdhry@ti.com>
 <20251128185058.4131726-1-prc@list.ti.com>
 <281355.1766243294658107429@lists.yoctoproject.org>
 <c0dadd48-6d6b-444f-8ff9-170919398571@ti.com>
 <c4181c69-e719-494f-9864-563a22cd7980@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c4181c69-e719-494f-9864-563a22cd7980@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 21 Dec 2025 18:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19387

On Sun, Dec 21, 2025 at 08:09:57AM +0800, Yan, Haixiao (CN) via lists.yoc=
toproject.org wrote:
>=20
> On 12/21/2025 1:10 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >CAUTION: This email comes from a non Wind River email account!
> >Do not click links or open attachments unless you recognize the
> >sender and know the content is safe.
> >
> >On 12/20/2025 9:08 AM, Yan, Haixiao (CN) via
> >lists.yoctoproject.org wrote:
> >>This patch failed to apply on scarthgap.
> >>the version of trusted-firmware-a is 2.10.4, the patch is not
> >>suitable for this version.
> >
> >The recipe in meta-ti-bsp that applies this patch, also moves the
> >version to 2.13+.=A0 So I'm not sure how you are trying to apply this
> >patch to meta-ti scarthgap against a 2.10 trusted-firmware-a version.
> >
> >Clearly you are trying to do something more than taking meta-ti-bsp
> >scarthgap at face value.=A0 Do you have your own layer in your build t=
hat
> >is also changing the SRCREV of trusted-firmware-a to a version that
> >might not accept these patches?
> >
> >
>=20
> There is no 2.13+ version=A0trusted-firmware-a on=A0scarthgap.
>=20
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/trusted=
-firmware-a/trusted-firmware-a_2.10.4.bb?h=3Dscarthgap
>=20
> $ bitbake-layers show-recipes trusted-firmware-a
> NOTE: Starting bitbake server...
> Loading cache: 100% |##################################################=
###################|
> Time: 0:00:02
> Loaded 15169 entries from dependency cache.
> =3D=3D=3D Matching recipes: =3D=3D=3D
> trusted-firmware-a:
> =A0 meta-arm=A0 =A0 =A0 =A0 =A0 =A0 =A02.10+git
>=20
> $ bitbake-layers show-appends | grep trusted-firmware-a
> trusted-firmware-a_2.10.4.bb:
> layers/meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
> layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend

^^^ This bbappend in meta-ti-bsp conditionally includes the following fil=
e:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted=
-firmware-a/trusted-firmware-a-ti.inc?h=3Dscarthgap

Which bumps the version from meta-arm to 2.13+, as Ryan explained above.


> =A0layers/ti-j7xxx/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend

^^^ I would recommend inspecting this bbappend in your "ti-j7xxx" layer t=
o see=20
if it conflicts with the one in meta-ti-bsp...


> trusted-firmware-a_2.10.4.bb (skipped):
> layers/meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
> layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
>=20
> =A0layers/ti-j7xxx/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
>=20
>=20
> Thanks,
>=20
> Haixiao
>=20
> >>NOTE: Applying patch
> >>'0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch' (..=
/layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a/0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch)
> >>
> >>NOTE: Applying patch
> >>'0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch' (../la=
yers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a/0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch)
> >>ERROR: Applying patch
> >>'0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch'
> >>on target directory '/build-ti/tmp-glibc/work/ti_j78xx-wrs-linux/trus=
ted-firmware-a/2.10+git/git'
> >>CmdError('quilt --quiltrc /build-ti/tmp-glibc/work/ti_j78xx-wrs-linux=
/trusted-firmware-a/2.10+git/recipe-sysroot-native/etc/quiltrc
> >>push', 0, "stdout: Applying patch
> >>0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch
> >>can't find file to patch at input line 39
> >>Perhaps you used the wrong -p or --strip option?
> >>The text leading up to this was:
> >>--------------------------
> >>|From c79ff3679a4360bb848b01d4036c365533fcf791 Mon Sep 17 00:00:00 20=
01
> >>|From: Richard Genoud <richard.genoud@bootlin.com>
> >>|Date: Tue, 11 Feb 2025 18:20:17 +0100
> >>|Subject: [PATCH 2/3] feat(ti): add message to encrypt tfa
> >>during suspend
> >>|
> >>|At suspend, BL31 with its context will be encrypted by TIFS in DDR.
> >>|Encryption is needed for security matters, so that the BL31 is not
> >>|modified before entering suspend or early at resume.
> >>|
> >>|We only need the encryption function here because the
> >>decryption message
> >>|will be send by the R5 SPL at resume.
> >>|
> >>|Also introduce the LPM_ENCRYPT_IMAGE cap signals that FW has
> >>the support
> >>|to encrypt the image using the TISCI_MSG_LPM_ENCRYPT tisci message.
> >>|
> >>|This is useful in suspend to ram cases where we would like to
> >>|store the encrypted image of a secure fw instead of the original ima=
ge
> >>|itself in the DDR.
> >>|
> >>|Check for LPM_ENCRYPT_IMAGE flag in the FW capabilities, and only th=
en
> >>|call encrypt.
> >>|
> >>|Upstream-Status: Pending
> >>|
> >>|Change-Id: I266472da87dd0821493019b2d9853f8886f33811
> >>|Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> >>|Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> >>|---
> >>| drivers/ti/ti_sci/ti_sci.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 36 ++++++++=
+++++++++++++++++++++
> >>| drivers/ti/ti_sci/ti_sci.h=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 7 ++++++
> >>| drivers/ti/ti_sci/ti_sci_protocol.h | 32 +++++++++++++++++++++++++
> >>| plat/ti/k3/common/k3_psci.c=A0=A0=A0=A0=A0=A0=A0=A0 | 10 ++++++++
> >>| 4 files changed, 85 insertions(+)
> >>|
> >>|diff --git a/drivers/ti/ti_sci/ti_sci.c b/drivers/ti/ti_sci/ti_sci.c
> >>|index f0813e5b0..ee5f7166f 100644
> >>|--- a/drivers/ti/ti_sci/ti_sci.c
> >>|+++ b/drivers/ti/ti_sci/ti_sci.c
> >>--------------------------
> >>No file to patch.=A0 Skipping patch.
> >>1 out of 1 hunk ignored
> >>can't find file to patch at input line 83
> >>Perhaps you used the wrong -p or --strip option?
> >>The text leading up to this was:
> >>--------------------------
> >>|diff --git a/drivers/ti/ti_sci/ti_sci.h b/drivers/ti/ti_sci/ti_sci.h
> >>|index 1f1963274..2afa11317 100644
> >>|--- a/drivers/ti/ti_sci/ti_sci.h
> >>|+++ b/drivers/ti/ti_sci/ti_sci.h
> >>--------------------------
> >>No file to patch.=A0 Skipping patch.
> >>2 out of 2 hunks ignored
> >>can't find file to patch at input line 107
> >>Perhaps you used the wrong -p or --strip option?
> >>The text leading up to this was:
> >>--------------------------
> >>|diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h
> >>b/drivers/ti/ti_sci/ti_sci_protocol.h
> >>|index bdd24622a..a165cda99 100644
> >>|--- a/drivers/ti/ti_sci/ti_sci_protocol.h
> >>|+++ b/drivers/ti/ti_sci/ti_sci_protocol.h
> >>--------------------------
> >>No file to patch.=A0 Skipping patch.
> >>3 out of 3 hunks ignored
> >>patching file plat/ti/k3/common/k3_psci.c
> >>Hunk #2 succeeded at 269 with fuzz 1 (offset -14 lines).
> >>Hunk #3 succeeded at 321 (offset -32 lines).
> >>Patch
> >>0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch
> >>does not apply (enforce with -f)

