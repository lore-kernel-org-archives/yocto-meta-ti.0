Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AE9C4167D
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 19:33:21 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2541.1702323199329259733
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 11:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y9EEoaHI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BBJXIHW054735;
	Mon, 11 Dec 2023 13:33:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702323198;
	bh=RGwvs+q/+FKI7WZpm1SJfEEqbGiNps7q3ytgbkB9WkU=;
	h=From:To:Subject:Date;
	b=Y9EEoaHI+KUtk9O4sYcDAmKKuS/y92vGIksu9P6Lx90yAMLyMWGtodNNS+s3lf+xa
	 upHD8muXQx/Ryw885rp1wMZzWs+XZaDSyA2x0V50sQkqIrRvgZ2MXYAHdlKgvAiiad
	 OiqVnpqUtPGGSx9JCXUKz+HirCHwW+0A90kFZwyw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BBJXI0R077519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Dec 2023 13:33:18 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Dec 2023 13:33:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Dec 2023 13:33:17 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BBJXHfo034353;
	Mon, 11 Dec 2023 13:33:17 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rCm1l-0007Ci-G5; Mon, 11 Dec 2023 13:33:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-staging: Add 6.6 kernel in prep for LTS migration
Date: Mon, 11 Dec 2023 13:33:17 -0600
Message-ID: <20231211193317.27652-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Dec 2023 19:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17346

We are preparing to migrate our kernel version to 6.6.  As we are still
working on the migration, mark the default preference low for this
version.  We will enable building with this kernel in a meta-arago brand
in the near future.  Once the migration is complete, we will remove the
6.1 kernel and make this the default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux/linux-ti-staging-6.6/defconfig      |  2 +
 .../linux/linux-ti-staging-6.6/k3/defconfig   |  2 +
 .../linux-ti-staging-6.6/omapl138/defconfig   |  1 +
 .../linux-ti-staging-6.6/ti33x/defconfig      |  2 +
 .../linux-ti-staging-6.6/ti43x/defconfig      |  2 +
 .../linux/linux-ti-staging-rt-6.6/defconfig   |  2 +
 .../linux-ti-staging-rt-6.6/k3/defconfig      |  2 +
 .../omapl138/defconfig                        |  2 +
 .../linux-ti-staging-rt-6.6/ti33x/defconfig   |  2 +
 .../linux-ti-staging-rt-6.6/ti43x/defconfig   |  2 +
 .../linux/linux-ti-staging-rt_6.6.bb          | 16 +++++++
 .../linux-ti-staging-systest-6.6/defconfig    |  2 +
 .../linux-ti-staging-systest-6.6/k3/defconfig |  2 +
 .../omapl138/defconfig                        |  1 +
 .../linux/linux-ti-staging-systest_6.6.bb     |  7 +++
 .../linux/linux-ti-staging_6.6.bb             | 44 +++++++++++++++++++
 16 files changed, 91 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti33x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti43x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti33x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti43x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/defconfig
new file mode 100644
index 00000000..24b53cf7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/k3/defconfig
new file mode 100644
index 00000000..ef1d3efd
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/omapl138/defconfig
new file mode 100644
index 00000000..099493af
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/omapl138/defconfig
@@ -0,0 +1 @@
+use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti33x/defconfig
new file mode 100644
index 00000000..e6a967e1
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti33x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti43x/defconfig
new file mode 100644
index 00000000..e6a967e1
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/ti43x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/defconfig
new file mode 100644
index 00000000..43089dc8
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/k3/defconfig
new file mode 100644
index 00000000..47d78664
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/omapl138/defconfig
new file mode 100644
index 00000000..2c829c0b
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/omapl138/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=davinci_all_defconfig
+config-fragment=kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti33x/defconfig
new file mode 100644
index 00000000..5de2b229
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti33x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti43x/defconfig
new file mode 100644
index 00000000..5de2b229
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.6/ti43x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
new file mode 100644
index 00000000..4928aa88
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -0,0 +1,16 @@
+require linux-ti-staging_6.6.bb
+
+DEFAULT_PREFERENCE = "-1"
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
+
+#BRANCH = "ti-rt-linux-6.6.y"
+BRANCH = "ti-linux-6.6.y"
+
+SRCREV = "ffc253263a1375a65fa6c9f62a893e9767fbebfa"
+
+include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
+
+PV = "6.6.0+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig
new file mode 100644
index 00000000..24b53cf7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig
new file mode 100644
index 00000000..ef1d3efd
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig
new file mode 100644
index 00000000..099493af
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig
@@ -0,0 +1 @@
+use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
new file mode 100644
index 00000000..21090904
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
@@ -0,0 +1,7 @@
+require linux-ti-staging_6.6.bb
+
+DEFAULT_PREFERENCE = "-1"
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
new file mode 100644
index 00000000..adc10a01
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -0,0 +1,44 @@
+SECTION = "kernel"
+SUMMARY = "Linux kernel for TI devices"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+inherit ti-secdev
+inherit kernel
+
+DEFAULT_PREFERENCE = "-1"
+
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/ti-kernel.inc
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
+
+DEPENDS += "gmp-native libmpc-native"
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
+
+S = "${WORKDIR}/git"
+
+BRANCH ?= "ti-linux-6.6.y"
+
+SRCREV ?= "ffc253263a1375a65fa6c9f62a893e9767fbebfa"
+PV = "6.6.0+git${SRCPV}"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR:append = "b"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig"
+
+# Special configuration for remoteproc/rpmsg IPC modules
+module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
+module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
+module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
+KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
-- 
2.17.1


