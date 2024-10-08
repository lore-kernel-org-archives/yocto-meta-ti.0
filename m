Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68A0CF0423
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:52:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6695.1728420741551746786
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rd0eRpuP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498KqKQd050111;
	Tue, 8 Oct 2024 15:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728420740;
	bh=H4EeSmtKRPh/FtiEi9I0GNq0jfpzFhRtWefr9DL798U=;
	h=From:To:Subject:Date;
	b=rd0eRpuPEzo7UtqyCaWkh+NHudQsN1QQjO4F9p3aFIbxnP7Mj2M7ZrlNJng+zBfym
	 +7JG71wc/y5C2LHh6vLKJz1lEpM4PMI3ehnSlTct87t9MF2/sqwcau6u6qk8dhvUbL
	 oGFyClQxAy1z/8xHmScYJmq2myTynTONNtmetYUk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 498KqKq4016089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Oct 2024 15:52:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 15:52:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 15:52:19 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KqJpL074165;
	Tue, 8 Oct 2024 15:52:19 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syHBr-00013r-RJ; Tue, 08 Oct 2024 15:52:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH v2 1/4] linux-ti-staging: Add v6.12 recipe
Date: Tue, 8 Oct 2024 15:52:16 -0500
Message-ID: <20241008205219.4037-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17996

Adding needed recipes for initial testing and development of the 6.12
kernel for the next LTS.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added --find-copies-harder option.

 .../linux/linux-ti-staging-6.12/defconfig              |  2 ++
 .../linux/linux-ti-staging-6.12/k3/defconfig           |  2 ++
 .../omapl138/defconfig                                 |  0
 .../linux/linux-ti-staging-6.12/ti33x/defconfig        |  2 ++
 .../linux/linux-ti-staging-6.12/ti43x/defconfig        |  2 ++
 .../linux/linux-ti-staging-rt-6.12/defconfig           |  2 ++
 .../linux/linux-ti-staging-rt-6.12/k3/defconfig        |  2 ++
 .../omapl138/defconfig                                 |  1 +
 .../linux/linux-ti-staging-rt-6.12/ti33x/defconfig     |  2 ++
 .../linux/linux-ti-staging-rt-6.12/ti43x/defconfig     |  2 ++
 ...i-staging-rt_6.6.bb => linux-ti-staging-rt_6.12.bb} | 10 ++--------
 .../linux/linux-ti-staging-systest-6.12/defconfig      |  2 ++
 .../linux/linux-ti-staging-systest-6.12/k3/defconfig   |  2 ++
 .../omapl138/defconfig                                 |  0
 .../linux/linux-ti-staging-systest_6.12.bb             |  7 +++++++
 ...inux-ti-staging_6.1.bb => linux-ti-staging_6.12.bb} | 10 ++++++----
 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc         |  4 ++++
 17 files changed, 40 insertions(+), 12 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.1 => linux-ti-staging-6.12}/omapl138/defconfig (100%)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.6 => linux-ti-staging-rt-6.12}/omapl138/defconfig (70%)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt_6.6.bb => linux-ti-staging-rt_6.12.bb} (55%)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.1 => linux-ti-staging-systest-6.12}/omapl138/defconfig (100%)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging_6.1.bb => linux-ti-staging_6.12.bb} (87%)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
new file mode 100644
index 00000000..9d579e41
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
new file mode 100644
index 00000000..fd07b34e
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
new file mode 100644
index 00000000..9d579e41
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
new file mode 100644
index 00000000..9d579e41
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
new file mode 100644
index 00000000..9d579e41
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
new file mode 100644
index 00000000..fd07b34e
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl138/defconfig
similarity index 70%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/omapl138/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl138/defconfig
index 099493af..3d890b6e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.6/omapl138/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl138/defconfig
@@ -1 +1,2 @@
 use-kernel-config=davinci_all_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
new file mode 100644
index 00000000..9d579e41
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
new file mode 100644
index 00000000..9d579e41
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
similarity index 55%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index c73a1880..9e5c4ee4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -1,15 +1,9 @@
-require linux-ti-staging_6.6.bb
+require linux-ti-staging_6.12.bb
 
 KERNEL_LOCALVERSION:append = "-rt"
 
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
-
-BRANCH = "ti-rt-linux-6.6.y"
-
-SRCREV = "d05688f353d10af170286db56535443184202eab"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
-
-PV = "6.6.44+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
new file mode 100644
index 00000000..9d579e41
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
new file mode 100644
index 00000000..fd07b34e
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
new file mode 100644
index 00000000..8ce23368
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
@@ -0,0 +1,7 @@
+require linux-ti-staging_6.12.bb
+
+DEFAULT_PREFERENCE = "-1"
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
similarity index 87%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 840233fd..f6f8732b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 inherit ti-secdev
 inherit kernel
 
+DEFAULT_PREFERENCE = "-1"
+
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
@@ -14,17 +16,17 @@ include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else '
 DEPENDS += "gmp-native libmpc-native"
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
-BRANCH ?= "ti-linux-6.1.y"
+BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "da449d8c3cf600b0346a6696e1e3cc431422e765"
-PV = "6.1.105+git"
+SRCREV ?= "9852d85ec9d492ebef56dc5f229416c925758edc"
+PV = "6.12-rc1+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "https"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index 4bcbc27e..09cfdb12 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -20,6 +20,10 @@ KERNEL_PATCHES:bsp-mainline = " \
     file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
 "
 
+KERNEL_PATCHES:bsp-ti-6_12 = " \
+    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
+"
+
 KERNEL_PATCHES:bsp-ti-6_6 = " \
     file://0001-vt-conmakehash-improve-reproducibility.patch \
 "
-- 
2.17.1


