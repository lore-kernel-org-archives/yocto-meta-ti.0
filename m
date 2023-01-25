Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6CAC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 23:37:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.62002.1674689843580759710
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 15:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E60F440C06;
	Wed, 25 Jan 2023 23:37:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esidcQg2PhOg; Wed, 25 Jan 2023 23:37:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9EA9B40301;
	Wed, 25 Jan 2023 23:37:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 18BF2163708; Wed, 25 Jan 2023 18:36:57 -0500 (EST)
Date: Wed, 25 Jan 2023 18:36:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: "Shilwant, Chirag" <c-shilwant@ti.com>,
	"Bajjuri, Praneeth" <praneeth@ti.com>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	"Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
	"Bhagat, Paresh" <p-bhagat@ti.com>, "Gupta, Gyan" <g-gupta@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH v2 1/2] conf: machine: am62xx-evm:
 Add Support for AM62xx HS-SE
Message-ID: <20230125233657.GB22689@denix.org>
References: <20230124051418.1201453-1-c-shilwant@ti.com>
 <ed5e6b0a-2e47-6d82-b23e-525afc3ddb1b@ti.com>
 <8e959c31249645538f048e9f56873b0d@ti.com>
 <80bdc280-1a5d-1968-202e-0c692c318b35@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80bdc280-1a5d-1968-202e-0c692c318b35@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 23:37:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15658

And one of the key goals is to keep the tree bisectable, so when adding=20
multiple changes as separate patches, the order is crucial.


On Wed, Jan 25, 2023 at 02:44:44PM -0600, Ryan Eatmon wrote:
>=20
> Yes.  But that single patch was trying to do two different
> platforms. So splitting them was needed.  In this case you are
> submitting support for a new platform but breaking the
> implementation into multiple commits.
>=20
> Multiple commits is okay for times when you submitting multiple
> changes where each commit is stand alone, but taken together they
> add support for a feature/change.
>=20
> In this case, the single change is adding the new platform and the
> multiple commits are not stand alone.  The first just defines the
> platform but it would still be incorrect.  And the second patch is
> pointless without the first.  So merging them into a single commit
> make sense.
>=20
>=20
> On 1/24/2023 23:18, Shilwant, Chirag wrote:
> >I would prefer to see this as a single patch.
> >
> >>Well after we added AM62Q HS-SE and AM62A support in single
> >>commit, Praneeth has suggested us to split the patchesif
> >>possible as reviewing becomes difficult if we have everything in
> >single patch. Also, Denys mentioned that single patch or patch
> >series will also do. Hence, to satisfy both conditions kept it as
> >2 separate patches in one series with all conf in a patch and
> >signing stuff in other =F0=9F=98=8A
> >
> >----------------------------------------------------------------------=
--
> >*From:* Eatmon, Ryan
> >*Sent:* 25 January 2023 04:21:18
> >*To:* Shilwant, Chirag; Bajjuri, Praneeth; Denys Dmytriyenko;
> >meta-ti@lists.yoctoproject.org
> >*Cc:* Adivi, Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan
> >*Subject:* Re: [meta-ti][dunfell][PATCH v2 1/2] conf: machine:
> >am62xx-evm: Add Support for AM62xx HS-SE
> >
> >I would prefer to see this as a single patch.=C2=A0 Adding in support =
for a
> >new platform should roll-up all of the needed changes at the same time
> >and not sequence them out in multiple commits.=C2=A0 The only time we =
do this
> >is when not all of the pieces of firmware are in place but we want to =
go
> >ahead and add the platform into the builds.
> >
> >Also, please address Andrew's question about the DM firmware, and abou=
t
> >pulling in past Reviewed-by/Acked-by on the patches.
> >
> >
> >On 1/23/2023 23:14, Chirag Shilwant wrote:
> >>- Add machine conf for AM62xx HS-SE.
> >>- The wic images will boot on AM62x GP devices by default. To boot on=
 AM62x HS-SE, simply switch out the SYSFW image:
> >>
> >>$ cd /mnt/sd-card/boot
> >>$ mv tiboot3-am62x-hs-evm.bin tiboot3.bin
> >>
> >>Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >>---
> >>=C2=A0=C2=A0 ...-evm-k3r5.conf =3D> am62xx-evm-k3r5-gp.conf} |=C2=A0 =
3 +++
> >>=C2=A0=C2=A0 conf/machine/am62xx-evm-k3r5-hs-se.conf=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
> >>=C2=A0=C2=A0 conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++++
> >>=C2=A0=C2=A0 conf/machine/include/am62xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++--
> >>=C2=A0=C2=A0 4 files changed, 37 insertions(+), 2 deletions(-)
> >>=C2=A0=C2=A0 rename conf/machine/{am62xx-evm-k3r5.conf =3D> am62xx-ev=
m-k3r5-gp.conf} (67%)
> >>=C2=A0=C2=A0 create mode 100644 conf/machine/am62xx-evm-k3r5-hs-se.co=
nf
> >>
> >>diff --git a/conf/machine/am62xx-evm-k3r5.conf b/conf/machine/am62xx-=
evm-k3r5-gp.conf
> >>similarity index 67%
> >>rename from conf/machine/am62xx-evm-k3r5.conf
> >>rename to conf/machine/am62xx-evm-k3r5-gp.conf
> >>index 724a8d4a..d9867bc7 100644
> >>--- a/conf/machine/am62xx-evm-k3r5.conf
> >>+++ b/conf/machine/am62xx-evm-k3r5-gp.conf
> >>@@ -9,3 +9,6 @@ SYSFW_CONFIG =3D "evm"
> >>=C2=A0=C2=A0 SYSFW_SUFFIX =3D "gp"
> >>=C2=A0=C2=A0 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> >>+
> >>+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
> >>+UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_=
SUFFIX}"
> >>diff --git a/conf/machine/am62xx-evm-k3r5-hs-se.conf b/conf/machine/a=
m62xx-evm-k3r5-hs-se.conf
> >>new file mode 100644
> >>index 00000000..913e69fa
> >>--- /dev/null
> >>+++ b/conf/machine/am62xx-evm-k3r5-hs-se.conf
> >>@@ -0,0 +1,21 @@
> >>+#@TYPE: Machine
> >>+#@NAME: AM62xx HS-SE EVM (R5F)
> >>+#@DESCRIPTION: Machine configuration for the TI AM62xx HS-SE EVM (R5=
F core)
> >>+
> >>+# Booting HS-SE requires different SYSFW, the rest is handled at run=
time
> >>+
> >>+require conf/machine/include/k3r5.inc
> >>+SOC_FAMILY_append =3D ":k3r5-hs-se"
> >>+
> >>+SYSFW_SOC =3D "am62x"
> >>+SYSFW_CONFIG =3D "evm"
> >>+SYSFW_SUFFIX =3D "hs"
> >>+
> >>+SYSFW_TIBOOT3_SYMLINK =3D ""
> >>+
> >>+UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> >>+
> >>+SPL_BINARY =3D ""
> >>+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
> >>+UBOOT_IMAGE =3D "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBO=
OT_SUFFIX}"
> >>+UBOOT_SYMLINK =3D "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
> >>diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.c=
onf
> >>index 3d9e3b90..b4904eca 100644
> >>--- a/conf/machine/am62xx-evm.conf
> >>+++ b/conf/machine/am62xx-evm.conf
> >>@@ -19,3 +19,7 @@ KERNEL_DEVICETREE =3D " \
> >>=C2=A0=C2=A0 "
> >>=C2=A0=C2=A0 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
> >>+
> >>+SPL_BINARY =3D "tispl.bin_HS"
> >>+UBOOT_BINARY =3D "u-boot.img_HS"
> >>+UBOOT_SYMLINK =3D "u-boot.img"
> >>diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/a=
m62xx.inc
> >>index 0231235f..912318e9 100644
> >>--- a/conf/machine/include/am62xx.inc
> >>+++ b/conf/machine/include/am62xx.inc
> >>@@ -8,8 +8,15 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
> >>=C2=A0=C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
> >>-do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
> >>-do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
> >>+BBMULTICONFIG =3D "k3r5-gp"
> >>+do_image_wic[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
> >>+do_image_tar[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
> >>+
> >>+# Since default tiboot3.bin on AM62x is for GP, add a version for HS=
-SE
> >>+BBMULTICONFIG +=3D "k3r5-hs-se"
> >>+IMAGE_BOOT_FILES +=3D " tiboot3-am62x-hs-evm.bin"
> >>+do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> >>+do_image_tar[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> >>=C2=A0=C2=A0 TFA_BOARD =3D "lite"
> >>=C2=A0=C2=A0 OPTEEMACHINE =3D "k3-am62x"

