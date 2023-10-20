Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AEDC25B42
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 20:45:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.65320.1697834725693095716
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 13:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 05E7041226;
	Fri, 20 Oct 2023 20:45:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VakTHL-PGO6W; Fri, 20 Oct 2023 20:45:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E80C241210;
	Fri, 20 Oct 2023 20:45:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8E2A3163D1A;
	Fri, 20 Oct 2023 16:45:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 4/5] u-boot-bb.org: add back Beagle-specific U-boot 2023.04
Date: Fri, 20 Oct 2023 20:44:57 +0000
Message-Id: <20231020204458.546852-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020204458.546852-1-denis@denix.org>
References: <20231020204458.546852-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 20:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17159

From: Denys Dmytriyenko <denys@konsulko.com>

Majority of Beagle devices use ti-u-boot repo from u-boot-ti-staging dire=
ctly.
But some latest devices may need to point to own tree with additional sup=
port
added that is not yet upstream, e.g. BeaglePlay.

Add the Beagle-specific recipe and point beagleplay to use it. Other devi=
ces
can switch to using it as well, if desired, but right now the code base i=
s the
same for other Beagle devices.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf   |  3 +++
 meta-ti-bsp/conf/machine/beagleplay.conf        |  2 ++
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb     | 17 +++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/=
conf/machine/beagleplay-k3r5.conf
index f8f08d63..c40615c9 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -4,6 +4,9 @@
=20
 require conf/machine/include/k3r5.inc
=20
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
+
 SYSFW_SOC =3D "am62x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 106019c4..6a0f697f 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -21,6 +21,8 @@ OPTEEMACHINE =3D "k3-am62x"
 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
=20
 KERNEL_DEVICETREE =3D " \
 ti/k3-am625-beagleplay.dtb \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-t=
i-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
new file mode 100644
index 00000000..5bb20213
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -0,0 +1,17 @@
+require u-boot-ti.inc
+
+SUMMARY =3D "BeagleBoard.org U-Boot"
+
+COMPATIBLE_MACHINE =3D "beagle.*"
+
+PV =3D "2023.04"
+
+UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
+UBOOT_GIT_PROTOCOL =3D "https"
+BRANCH =3D "v2023.04-ti-09.00.00.011"
+SRCREV =3D "4b8f8be8870f03d92a2b01d0d30ab912118adc82"
+
+BRANCH:beagleplay =3D "v2023.04-ti-09.00.00.011-BeaglePlay"
+BRANCH:beagleplay-k3r5 =3D "v2023.04-ti-09.00.00.011-BeaglePlay"
+SRCREV:beagleplay =3D "10afea462ea1113701f6f0f8853fdff985aa275d"
+SRCREV:beagleplay-k3r5 =3D "10afea462ea1113701f6f0f8853fdff985aa275d"
--=20
2.25.1


