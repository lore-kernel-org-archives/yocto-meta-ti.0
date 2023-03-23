Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABD0C7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 22:52:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.87863.1679611943892985557
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Mar 2023 15:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Fub+ef1K;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32NMqM3H000572;
	Thu, 23 Mar 2023 17:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679611942;
	bh=PZYALzFTVZS+GxgW3OVR3vzoYq4EGR4JqvAAResC2VU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Fub+ef1KgtxAbJMS9U7Bhs4Z6qCwrSugy+mpqOT81OoqXzlrR1ReKG3ib7nnP3g/N
	 k4rTVehOwDMDfAN8JBO1nB/adGp29RKee2k/mgb2hJ1ofOagreSPFXZdmB3Rjw+O4k
	 gib0NLBndaQ359DLCZ4gYZXH9+mKKbaQ/ebuS4Ck=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32NMqMI9099609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Mar 2023 17:52:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Mar 2023 17:52:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Mar 2023 17:52:22 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32NMqMYR053424;
	Thu, 23 Mar 2023 17:52:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pfTnC-0003Tv-8Z; Thu, 23 Mar 2023 17:52:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v5 2/3] linux-ti-staging: Add 6.1 kernel in prep for LTS migration
Date: Thu, 23 Mar 2023 17:52:20 -0500
Message-ID: <20230323225221.12918-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323225221.12918-1-reatmon@ti.com>
References: <20230323225221.12918-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Mar 2023 22:52:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16243

We are preparing to migrate our kernel version to 6.1.  As we are still
working on the migration, mark the default preference low for this
version.  We will enable building with this kernel in a meta-arago brand
in the near future.  Once the migration is complete, we will remove the
5.10 kernel and make this the default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
v3: Set DEFAULT_PREFERENCE for new rt and systest recipes.
v2: Added rt and systest versions of the kernel.

 .../linux/linux-ti-staging-6.1/defconfig      |  2 +
 .../linux/linux-ti-staging-6.1/k3/defconfig   |  2 +
 .../linux-ti-staging-6.1/omapl138/defconfig   |  1 +
 .../linux/linux-ti-staging-rt-6.1/defconfig   |  2 +
 .../linux-ti-staging-rt-6.1/k3/defconfig      |  2 +
 .../omapl138/defconfig                        |  1 +
 .../linux/linux-ti-staging-rt_6.1.bb          | 12 ++++++
 .../linux-ti-staging-systest-6.1/defconfig    |  2 +
 .../linux-ti-staging-systest-6.1/k3/defconfig |  2 +
 .../omapl138/defconfig                        |  1 +
 .../linux/linux-ti-staging-systest_6.1.bb     |  7 ++++
 .../linux/linux-ti-staging_6.1.bb             | 39 +++++++++++++++++++
 12 files changed, 73 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
new file mode 100644
index 00000000..24b53cf7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
new file mode 100644
index 00000000..ef1d3efd
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
new file mode 100644
index 00000000..099493af
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
@@ -0,0 +1 @@
+use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
new file mode 100644
index 00000000..24b53cf7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
new file mode 100644
index 00000000..ef1d3efd
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
new file mode 100644
index 00000000..099493af
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
@@ -0,0 +1 @@
+use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
new file mode 100644
index 00000000..8b978e09
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -0,0 +1,12 @@
+require linux-ti-staging_6.1.bb
+
+DEFAULT_PREFERENCE = "-1"
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
+
+BRANCH = "ti-rt-linux-6.1.y"
+
+SRCREV = "b7d4fb88264d2b094035871fa676592eb8e83b25"
+PV = "6.1+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
new file mode 100644
index 00000000..24b53cf7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
new file mode 100644
index 00000000..ef1d3efd
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
new file mode 100644
index 00000000..099493af
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
@@ -0,0 +1 @@
+use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
new file mode 100644
index 00000000..1c30d27c
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
@@ -0,0 +1,7 @@
+require linux-ti-staging_6.1.bb
+
+DEFAULT_PREFERENCE = "-1"
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
new file mode 100644
index 00000000..654951eb
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -0,0 +1,39 @@
+SECTION = "kernel"
+SUMMARY = "Linux kernel for TI devices"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+inherit kernel
+
+DEFAULT_PREFERENCE = "-1"
+
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/kernel-rdepends.inc
+require recipes-kernel/linux/ti-kernel.inc
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+
+DEPENDS += "gmp-native libmpc-native"
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-6.1.y"
+
+SRCREV = "7b7231fbf048963b434d76a3cb866165365b14e0"
+PV = "6.1+git${SRCPV}"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR:append = "b"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig"
+
+FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
-- 
2.17.1


