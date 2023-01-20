Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD18C678DE
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:41:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.64377.1674178854874349679
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 17:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF85D40C52
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKhsVMT-m93K for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB00740C8F
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BDCCB163705
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 4/7] conf: machine: Remove j7 grouping and j7.inc
Date: Fri, 20 Jan 2023 01:40:47 +0000
Message-Id: <20230120014050.1988728-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120014050.1988728-1-denis@denix.org>
References: <20230120014050.1988728-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15603

From: Andrew Davis <afd@ti.com>

J7 is an unneeded level of grouping that is now causing issues and
leading to mistakes when adding new J7 based platforms. Each J7x
family device should use the SoC name specifically to prevent
accidentally adding or removing features that are not meant
for the new SoC.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2 - no changes

 meta-ti-bsp/conf/machine/include/j7.inc     | 5 -----
 meta-ti-bsp/conf/machine/include/j7200.inc  | 5 ++++-
 meta-ti-bsp/conf/machine/include/j721e.inc  | 5 ++++-
 meta-ti-bsp/conf/machine/include/j721s2.inc | 5 ++++-
 meta-ti-bsp/conf/machine/include/j784s4.inc | 5 ++++-
 5 files changed, 16 insertions(+), 9 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/j7.inc

diff --git a/meta-ti-bsp/conf/machine/include/j7.inc b/meta-ti-bsp/conf/m=
achine/include/j7.inc
deleted file mode 100644
index cf4cc440..00000000
--- a/meta-ti-bsp/conf/machine/include/j7.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require conf/machine/include/k3.inc
-SOC_FAMILY:append =3D ":j7"
-
-OPTEEMACHINE =3D "k3-j721e"
-OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/con=
f/machine/include/j7200.inc
index ce88567c..3aedb3f8 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -1,2 +1,5 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j7200"
+
+OPTEEMACHINE =3D "k3-j721e"
+OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index fe260178..8a6c2bec 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,6 +1,9 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721e"
=20
+OPTEEMACHINE =3D "k3-j721e"
+OPTEEOUTPUTMACHINE =3D "k3"
+
 MACHINE_FEATURES +=3D "gpu"
=20
 PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 5cd74683..4959ad8f 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,6 +1,9 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721s2"
=20
+OPTEEMACHINE =3D "k3-j721e"
+OPTEEOUTPUTMACHINE =3D "k3"
+
 MACHINE_FEATURES +=3D "gpu"
=20
 PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index d7a598d6..83d7c760 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,6 +1,9 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j784s4"
=20
+OPTEEMACHINE =3D "k3-j721e"
+OPTEEOUTPUTMACHINE =3D "k3"
+
 MACHINE_FEATURES +=3D "gpu"
=20
 PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
--=20
2.25.1


