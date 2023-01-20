Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C358C678DC
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:41:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.64435.1674178854877121925
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 17:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF67640C13
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbPKpdoTK2i0 for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD5DC40CA2
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C9789163706
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 5/7] conf: machine: Remove OPTEEOUTPUTMACHINE definition
Date: Fri, 20 Jan 2023 01:40:48 +0000
Message-Id: <20230120014050.1988728-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120014050.1988728-1-denis@denix.org>
References: <20230120014050.1988728-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15602

From: Andrew Davis <afd@ti.com>

This was used in the base Linaro optee-os_git.bb recipe, it is
no longer used, remove it from our boards.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2 - no changes

 meta-ti-bsp/conf/machine/am437x-hs-evm.conf | 1 -
 meta-ti-bsp/conf/machine/am57xx-hs-evm.conf | 1 -
 meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf | 1 -
 meta-ti-bsp/conf/machine/include/am62xx.inc | 1 -
 meta-ti-bsp/conf/machine/include/am64xx.inc | 1 -
 meta-ti-bsp/conf/machine/include/am65xx.inc | 1 -
 meta-ti-bsp/conf/machine/include/j7200.inc  | 1 -
 meta-ti-bsp/conf/machine/include/j721e.inc  | 1 -
 meta-ti-bsp/conf/machine/include/j721s2.inc | 1 -
 meta-ti-bsp/conf/machine/include/j784s4.inc | 1 -
 10 files changed, 10 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am437x-hs-evm.conf
index 68b808d2..cdd664ac 100644
--- a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
@@ -15,6 +15,5 @@ TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_CAT}/am4x"
=20
 OPTEEMACHINE =3D "ti-am43xx"
 OPTEEFLAVOR =3D "am43xx"
-OPTEEOUTPUTMACHINE =3D "ti"
=20
 EXTRA_IMAGEDEPENDS +=3D "optee-os"
diff --git a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am57xx-hs-evm.conf
index 5232cbd9..1e63f5d2 100644
--- a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
@@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_AUTO}/am5x"
=20
 OPTEEMACHINE =3D "ti-am57xx"
 OPTEEFLAVOR =3D "am57xx"
-OPTEEOUTPUTMACHINE =3D "ti"
 OPTEEPAGER =3D "y"
=20
 EXTRA_IMAGEDEPENDS +=3D "optee-os"
diff --git a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/dra7xx-hs-evm.conf
index 49630081..810d53ed 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
@@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_AUTO}/dra7"
=20
 OPTEEMACHINE =3D "ti-dra7xx"
 OPTEEFLAVOR =3D "dra7xx"
-OPTEEOUTPUTMACHINE =3D "ti"
 OPTEEPAGER =3D "y"
=20
 EXTRA_IMAGEDEPENDS +=3D "optee-os"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index a5aad994..9d8bc87c 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -19,4 +19,3 @@ TFA_BOARD =3D "lite"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
 OPTEEMACHINE =3D "k3-am62x"
-OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 055f6036..7c46b630 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -33,4 +33,3 @@ do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci=
-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am64x"
-OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 80aa6d27..14e0d07f 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -38,4 +38,3 @@ do_image_wic[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do=
_deploy"
 do_image_tar[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
=20
 OPTEEMACHINE =3D "k3-am65x"
-OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/con=
f/machine/include/j7200.inc
index 3aedb3f8..1eaf7806 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -2,4 +2,3 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j7200"
=20
 OPTEEMACHINE =3D "k3-j721e"
-OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 8a6c2bec..34569a01 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721e"
=20
 OPTEEMACHINE =3D "k3-j721e"
-OPTEEOUTPUTMACHINE =3D "k3"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 4959ad8f..2a60458e 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721s2"
=20
 OPTEEMACHINE =3D "k3-j721e"
-OPTEEOUTPUTMACHINE =3D "k3"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index 83d7c760..e2f053ac 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j784s4"
=20
 OPTEEMACHINE =3D "k3-j721e"
-OPTEEOUTPUTMACHINE =3D "k3"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
--=20
2.25.1


