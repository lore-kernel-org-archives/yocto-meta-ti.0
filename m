Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1F8C004D4
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:41:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.64434.1674178854643970069
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 17:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCA9840CA7
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoDGUjwZ3FQA for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9AEE40C52
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B9339163701
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 2/7] conf: machine: j784s4: Move common defines into j784s4.inc
Date: Fri, 20 Jan 2023 01:40:45 +0000
Message-Id: <20230120014050.1988728-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120014050.1988728-1-denis@denix.org>
References: <20230120014050.1988728-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15601

From: Andrew Davis <afd@ti.com>

Like we do with J721e, J7200, and J721s2, use a SoC header include file
to define common properties. This eases adding new boards based on these
SoC.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2 - no changes

 meta-ti-bsp/conf/machine/include/j784s4.inc | 10 ++++++++++
 meta-ti-bsp/conf/machine/j784s4-evm.conf    |  4 +---
 2 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/j784s4.inc

diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
new file mode 100644
index 00000000..d7a598d6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -0,0 +1,10 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append =3D ":j784s4"
+
+MACHINE_FEATURES +=3D "gpu"
+
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index 96acca13..10d8aad0 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -2,9 +2,7 @@
 #@NAME: J784S4 EVM
 #@DESCRIPTION: Machine configuration for the TI J784S4 EVM
=20
-require conf/machine/include/j7.inc
-
-MACHINE_FEATURES +=3D "gpu"
+require conf/machine/include/j784s4.inc
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
--=20
2.25.1


