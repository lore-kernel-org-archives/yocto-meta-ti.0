Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3914.1580361089015102259
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 21:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DAABFE015BA; Wed, 29 Jan 2020 21:11:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EBC0E007AE
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 21:11:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5034540C0C;
	Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lz3mDt0SvCCo; Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2662140C06;
	Thu, 30 Jan 2020 05:11:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AEB0616FE4C;
	Thu, 30 Jan 2020 00:11:22 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 2/4] linux-ti-staging: upgrade to 5.4
Date: Thu, 30 Jan 2020 00:11:18 -0500
Message-Id: <1580361080-40866-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580361080-40866-1-git-send-email-denis@denix.org>
References: <1580361080-40866-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{linux-ti-staging-4.19 => linux-ti-staging-5.4}/defconfig  |  0
 .../dra7xx/defconfig                                           |  0
 .../k2g/defconfig                                              |  0
 .../k3/defconfig                                               |  0
 .../keystone/defconfig                                         |  0
 .../omapl138/defconfig                                         |  0
 .../ti33x/defconfig                                            |  0
 .../ti43x/defconfig                                            |  0
 .../defconfig                                                  |  0
 .../dra7xx/defconfig                                           |  0
 .../k2g/defconfig                                              |  0
 .../k3/defconfig                                               |  0
 .../keystone/defconfig                                         |  0
 .../ti33x/defconfig                                            |  0
 .../ti43x/defconfig                                            |  0
 ...{linux-ti-staging-rt_4.19.bb => linux-ti-staging-rt_5.4.bb} | 10 +++++-----
 .../defconfig                                                  |  0
 .../dra7xx/defconfig                                           |  0
 .../k2g/defconfig                                              |  0
 .../k3/defconfig                                               |  0
 .../keystone/defconfig                                         |  0
 .../omapl138/defconfig                                         |  0
 .../ti33x/defconfig                                            |  0
 .../ti43x/defconfig                                            |  0
 ...staging-systest_4.19.bb => linux-ti-staging-systest_5.4.bb} |  4 ++--
 .../{linux-ti-staging_4.19.bb => linux-ti-staging_5.4.bb}      |  8 ++++----
 26 files changed, 11 insertions(+), 11 deletions(-)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/k3/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/omapl138/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.19 => linux-ti-staging-5.4}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.19 => linux-ti-staging-rt-5.4}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.19 => linux-ti-staging-rt-5.4}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.19 => linux-ti-staging-rt-5.4}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.19 => linux-ti-staging-rt-5.4}/k3/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.19 => linux-ti-staging-rt-5.4}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.19 => linux-ti-staging-rt-5.4}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt-4.19 => linux-ti-staging-rt-5.4}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-rt_4.19.bb => linux-ti-staging-rt_5.4.bb} (35%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/dra7xx/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/k2g/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/k3/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/keystone/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/omapl138/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/ti33x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest-4.19 => linux-ti-staging-systest-5.4}/ti43x/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-systest_4.19.bb => linux-ti-staging-systest_5.4.bb} (55%)
 rename recipes-kernel/linux/{linux-ti-staging_4.19.bb => linux-ti-staging_5.4.bb} (95%)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/k3/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/omapl138/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.19/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.19/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.19/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.19/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-5.4/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.19/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.19/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-5.4/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.19/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.19/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-5.4/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.19/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.19/k3/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.19/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.19/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-5.4/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.19/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.19/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-5.4/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.19/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-4.19/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-rt-5.4/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
similarity index 35%
rename from recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
rename to recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 5c56b28..0490427 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -1,10 +1,10 @@
-require linux-ti-staging_4.19.bb
+require linux-ti-staging_5.4.bb
 
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
-BRANCH = "ti-rt-linux-4.19.y"
+BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "69c51d6d57c150155bea8dd032bd8ce7835cf234"
-PV = "4.19.94+git${SRCPV}"
+SRCREV = "1866b83701a617b8634739f183f4ba44ab3357c1"
+PV = "5.4.13+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/dra7xx/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/k2g/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/k2g/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/k3/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/keystone/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/omapl138/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/ti33x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.19/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-4.19/ti43x/defconfig
rename to recipes-kernel/linux/linux-ti-staging-systest-5.4/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.19.bb b/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
similarity index 55%
rename from recipes-kernel/linux/linux-ti-staging-systest_4.19.bb
rename to recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
index 6f02f1a..a240457 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
@@ -1,5 +1,5 @@
-require linux-ti-staging_4.19.bb
+require linux-ti-staging_5.4.bb
 
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
similarity index 95%
rename from recipes-kernel/linux/linux-ti-staging_4.19.bb
rename to recipes-kernel/linux/linux-ti-staging_5.4.bb
index ab9653e..0280579 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -11,7 +11,7 @@ require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
@@ -58,10 +58,10 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-4.19.y"
+BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "5a23bc00e08d26bb83952953d909c95b42fab70c"
-PV = "4.19.94+git${SRCPV}"
+SRCREV = "c65c87b98f8d1b647c13b5bb36e5ffbad5805ff1"
+PV = "5.4.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.7.4

