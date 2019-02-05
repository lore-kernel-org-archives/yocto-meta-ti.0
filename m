Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCBC6E00B43; Mon,  4 Feb 2019 20:16:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 474D8E00AB0
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2019 20:16:06 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA6CF40BA7;
	Tue,  5 Feb 2019 04:09:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vOwtuEyRAww7; Tue,  5 Feb 2019 04:09:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD87D40951;
	Tue,  5 Feb 2019 04:09:15 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2F44716A4DF;
	Mon,  4 Feb 2019 23:09:14 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon,  4 Feb 2019 23:09:10 -0500
Message-Id: <1549339752-5045-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/3] linux-ti-staging: update to 4.19.15
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2019 04:16:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../defconfig                                                |  0
 .../dra7xx/defconfig                                         |  0
 .../k2g/defconfig                                            |  0
 .../k3/defconfig                                             |  0
 .../keystone/defconfig                                       |  0
 .../omapl138/defconfig                                       |  0
 .../ti33x/defconfig                                          |  0
 .../ti43x/defconfig                                          |  0
 .../defconfig                                                |  0
 .../dra7xx/defconfig                                         |  0
 .../k2g/defconfig                                            |  0
 .../k3/defconfig                                             |  0
 .../keystone/defconfig                                       |  0
 .../ti33x/defconfig                                          |  0
 .../ti43x/defconfig                                          |  0
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb             | 10 ----------
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb             | 10 ++++++++++
 .../defconfig                                                |  0
 .../dra7xx/defconfig                                         |  0
 .../k2g/defconfig                                            |  0
 .../k3/defconfig                                             |  0
 .../keystone/defconfig                                       |  0
 .../omapl138/defconfig                                       |  0
 .../ti33x/defconfig                                          |  0
 .../ti43x/defconfig                                          |  0
 ...ging-systest_4.14.bb => linux-ti-staging-systest_4.19.bb} |  4 ++--
 .../{linux-ti-staging_4.14.bb => linux-ti-staging_4.19.bb}   | 12 ++++++------
 27 files changed, 18 insertions(+), 18 deletions(-)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/k3/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/omapl138/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.14 => linux-ti-staging-4.19}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.14 => linux-ti-staging-rt-4.19}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.14 => linux-ti-staging-rt-4.19}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.14 => linux-ti-staging-rt-4.19}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.14 => linux-ti-staging-rt-4.19}/k3/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.14 => linux-ti-staging-rt-4.19}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.14 => linux-ti-staging-rt-4.19}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.14 => linux-ti-staging-rt-4.19}/ti43x/defconfig (100%)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/k3/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/omapl138/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.14 => linux-ti-staging-systest-4.19}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest_4.14.bb => linux-ti-staging-systest_4.19.bb} (55%)
 rename recipes-kernel/linux/{linux-ti-staging_4.14.bb => linux-ti-staging_4.19.bb} (90%)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/k3/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/omapl138/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.14/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.19/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.14/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-4.19/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.19/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.14/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.19/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.19/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.14/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.19/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.19/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.14/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.19/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.19/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.14/k3/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.19/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.19/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.14/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.19/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.19/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.14/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.19/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.19/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.14/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-4.19/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
deleted file mode 100644
index a351ef8..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require linux-ti-staging_4.14.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
-
-BRANCH = "ti-rt-linux-4.14.y"
-
-SRCREV = "aab33cfa0d3aed1fb463f6a6e62236db6b04fc5f"
-PV = "4.14.79+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
new file mode 100644
index 0000000..e6e4c1b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -0,0 +1,10 @@
+require linux-ti-staging_4.19.bb
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
+
+BRANCH = "ti-rt-linux-4.19.y"
+
+SRCREV = "54cdc562d6d233f43e5ffce60562d6fe110adf90"
+PV = "4.19.15+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/k3/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/omapl138/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.14/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.19/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.14/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-4.19/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.14.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.19.bb
similarity index 55%
rename from recipes-kernel/linux/linux-ti-staging-systest_4.14.bb
rename to recipes-kernel/linux/linux-ti-staging-systest_4.19.bb
index 5fa8fe2..6f02f1a 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-systest_4.19.bb
@@ -1,5 +1,5 @@
-require linux-ti-staging_4.14.bb
+require linux-ti-staging_4.19.bb
 
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
similarity index 90%
rename from recipes-kernel/linux/linux-ti-staging_4.14.bb
rename to recipes-kernel/linux/linux-ti-staging_4.19.bb
index 18fae41..97a96a4 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -1,7 +1,7 @@
 SECTION = "kernel"
 DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 inherit kernel
 
@@ -11,7 +11,7 @@ require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
@@ -54,13 +54,13 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-lsk-linux-4.14.y"
+BRANCH = "ti-linux-4.19.y"
 
-SRCREV = "3438de34744b2eba32456bf8e3f44b19e3061331"
-PV = "4.14.79+git${SRCPV}"
+SRCREV = "efb32b0ef31152f612fcefae8f7511e88da957be"
+PV = "4.19.15+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.7.4


