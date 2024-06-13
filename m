Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A8DC41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 17:23:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.182.1718299386048919198
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 10:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F154B40CC4;
	Thu, 13 Jun 2024 17:23:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tu_NkbKfQPi8; Thu, 13 Jun 2024 17:23:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8AC540CC7;
	Thu, 13 Jun 2024 17:23:03 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8C494163FA5;
	Thu, 13 Jun 2024 13:23:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 4/4] conf/machine: use the default TI BSP for BeaglePlay
Date: Thu, 13 Jun 2024 13:22:54 -0400
Message-Id: <20240613172254.770920-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613172254.770920-1-denis@denix.org>
References: <20240613172254.770920-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jun 2024 17:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17722

From: Denys Dmytriyenko <denys@konsulko.com>

BeaglePlay gains official support from latest TI lts-6.6 baseline, so set
it as the default. Other Beagle platforms will still use BB.org as defaul=
t.

And these defaults can still be changed with TI_DEFAULT_BSP setting in a
distro config or by end user in the local.conf

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagle-x15.conf           | 3 ++-
 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf | 3 ++-
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf      | 3 ++-
 meta-ti-bsp/conf/machine/beaglebone.conf           | 3 ++-
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf      | 1 -
 meta-ti-bsp/conf/machine/beagleplay.conf           | 1 -
 meta-ti-bsp/conf/machine/include/beagle.inc        | 1 -
 7 files changed, 8 insertions(+), 7 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/beagle.inc

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/=
machine/beagle-x15.conf
index 15815119..53ea0e67 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -2,7 +2,8 @@
 #@NAME: BeagleBoard X15
 #@DESCRIPTION: Machine configuration for the BeagleBoard X15
=20
-require conf/machine/include/beagle.inc
+TI_DEFAULT_BSP ?=3D "bb_org"
+
 require conf/machine/include/am57xx.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti=
-bsp/conf/machine/beaglebone-ai64-k3r5.conf
index 85669cca..4a2a9491 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
@@ -2,7 +2,8 @@
 #@NAME: BeagleBone AI-64 (R5F)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
=20
-require conf/machine/include/beagle.inc
+TI_DEFAULT_BSP ?=3D "bb_org"
+
 require conf/machine/include/k3r5.inc
=20
 SYSFW_SOC =3D "j721e"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index 618e27d7..c7bfd6e6 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -2,7 +2,8 @@
 #@NAME: BeagleBone AI-64 (A72)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 board (A72=
 core)
=20
-require conf/machine/include/beagle.inc
+TI_DEFAULT_BSP ?=3D "bb_org"
+
 require conf/machine/include/j721e.inc
=20
 UBOOT_MACHINE =3D "j721e_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index 9f5f41e0..0ee7aa39 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -2,7 +2,8 @@
 #@NAME: BeagleBone machine
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone=
 board
=20
-require conf/machine/include/beagle.inc
+TI_DEFAULT_BSP ?=3D "bb_org"
+
 require conf/machine/include/ti33x.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/=
conf/machine/beagleplay-k3r5.conf
index 16503f09..338a6fbf 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -2,7 +2,6 @@
 #@NAME: BeaglePlay (R5F)
 #@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
=20
-require conf/machine/include/beagle.inc
 require conf/machine/include/k3r5.inc
=20
 SYSFW_SOC =3D "am62x"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 6f042d03..8c83198a 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -2,7 +2,6 @@
 #@NAME: BeaglePlay (A53)
 #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
=20
-require conf/machine//include/beagle.inc
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":am62xx"
=20
diff --git a/meta-ti-bsp/conf/machine/include/beagle.inc b/meta-ti-bsp/co=
nf/machine/include/beagle.inc
deleted file mode 100644
index e5050096..00000000
--- a/meta-ti-bsp/conf/machine/include/beagle.inc
+++ /dev/null
@@ -1 +0,0 @@
-TI_DEFAULT_BSP ?=3D "bb_org"
--=20
2.25.1


