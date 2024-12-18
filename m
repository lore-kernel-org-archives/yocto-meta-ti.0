Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F221FE7718A
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 20:49:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.115500.1734554967749334170
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 12:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B52E40CBE;
	Wed, 18 Dec 2024 20:49:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axu1P4Vgrj6D; Wed, 18 Dec 2024 20:49:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DED1340CB0;
	Wed, 18 Dec 2024 20:49:25 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 90B7A164139;
	Wed, 18 Dec 2024 15:49:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 06/13] conf/machine: move remaining Beagle platforms to meta-beagle
Date: Wed, 18 Dec 2024 15:49:16 -0500
Message-Id: <20241218204923.2601088-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218204923.2601088-1-denis@denix.org>
References: <20241218204923.2601088-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2024 20:49:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18138

From: Denys Dmytriyenko <denys@konsulko.com>

Include beagle-bsp.inc to define "bb_org" BSP settings and select that
as a default.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagle-x15.conf      | 3 +--
 .../conf/machine/beaglebone-ai64-k3r5.conf                     | 3 +--
 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebone-ai64.conf | 3 +--
 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebone.conf      | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagle-x15.conf (94%)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebone-ai64-k3r5.=
conf (94%)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebone-ai64.conf =
(96%)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebone.conf (95%)

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-beagle/conf/=
machine/beagle-x15.conf
similarity index 94%
rename from meta-ti-bsp/conf/machine/beagle-x15.conf
rename to meta-beagle/conf/machine/beagle-x15.conf
index 6f8c435b..e9ab5d40 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBoard X15
 #@DESCRIPTION: Machine configuration for the BeagleBoard X15
=20
-TI_PREFERRED_BSP ?=3D "bb_org"
-
 require conf/machine/include/am57xx.inc
+require conf/machine/include/beagle-bsp.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-be=
agle/conf/machine/beaglebone-ai64-k3r5.conf
similarity index 94%
rename from meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
rename to meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
index d415a212..95d3abc0 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBone AI-64 (R5F)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
=20
-TI_PREFERRED_BSP ?=3D "bb_org"
-
 require conf/machine/include/k3r5.inc
+require conf/machine/include/beagle-bsp.inc
=20
 SYSFW_SOC =3D "j721e"
 SYSFW_CONFIG =3D "evm"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-beagle/=
conf/machine/beaglebone-ai64.conf
similarity index 96%
rename from meta-ti-bsp/conf/machine/beaglebone-ai64.conf
rename to meta-beagle/conf/machine/beaglebone-ai64.conf
index 56e1ed4e..faffd0bb 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBone AI-64 (A72)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 board (A72=
 core)
=20
-TI_PREFERRED_BSP ?=3D "bb_org"
-
 require conf/machine/include/j721e.inc
+require conf/machine/include/beagle-bsp.inc
=20
 IMAGE_SR1_1_HS_FS_FILES:bsp-bb_org =3D ""
 IMAGE_SR2_HS_SE_FILES:bsp-bb_org =3D ""
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-beagle/conf/=
machine/beaglebone.conf
similarity index 95%
rename from meta-ti-bsp/conf/machine/beaglebone.conf
rename to meta-beagle/conf/machine/beaglebone.conf
index 0db4d304..6048383b 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBone machine
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone=
 board
=20
-TI_PREFERRED_BSP ?=3D "bb_org"
-
 require conf/machine/include/ti33x.inc
+require conf/machine/include/beagle-bsp.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
--=20
2.25.1


