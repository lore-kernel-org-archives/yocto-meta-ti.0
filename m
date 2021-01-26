Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.18352.1611690684095069024
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jan 2021 11:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 603EE40C2C
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Jan 2021 19:51:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bd16H9D87ePW for <meta-ti@lists.yoctoproject.org>;
	Tue, 26 Jan 2021 19:51:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C9DD40BCF
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Jan 2021 19:51:23 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EF0051743CA;
	Tue, 26 Jan 2021 14:51:22 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [dunfell/master][PATCH] linux-ti-staging, u-boot-ti-staging: lower default preference
Date: Tue, 26 Jan 2021 14:51:22 -0500
Message-Id: <1611690682-7309-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

Latest versions of Linux kernel (5.10) and U-boot (2021.01) are not yet ready
for prime time in meta-ti and some features are still being migrated and causing
issues. The recipes are meant for development and not yet for production.

Normally selection of the version is done with PREFERRED_VERSION by the Distro
(e.g. Arago), but if not specified by a Distro (Poky, distroless, etc.), the
default is to use the latest version. Hence need to change the default to not
automatically pick the latest version that is not ready yet.

This can be removed/reverted once those versions are ready to be picked by
default.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 2 ++
 recipes-kernel/linux/linux-ti-staging_5.10.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index d5b7fd5..e0818c8 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -5,3 +5,5 @@ PR = "r1"
 BRANCH = "ti-u-boot-2021.01"
 
 SRCREV = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index e317e3a..4982079 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -41,3 +41,5 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
 module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
 KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
+
+DEFAULT_PREFERENCE = "-1"
-- 
2.7.4

