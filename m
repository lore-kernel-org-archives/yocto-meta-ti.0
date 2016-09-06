Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54ED6E00D44; Tue,  6 Sep 2016 09:41:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.15 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5154E00D35
	for <meta-ti@yoctoproject.org>; Tue,  6 Sep 2016 09:40:56 -0700 (PDT)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OD3000H1CZGLL60@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 06 Sep 2016 11:40:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=bF73gQBDNrAnh93EIDAA:9
Received: by 100.15.86.14 with SMTP id 54ce1c6b; Tue, 06 Sep 2016 16:40:35 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 3E97A162112;	Tue,  6 Sep 2016 12:40:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 06 Sep 2016 12:40:27 -0400
Message-id: <1473180027-16546-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] linux-ti-staging: update to the latest, change systest defconfig names
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
X-List-Received-Date: Tue, 06 Sep 2016 16:41:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb                      | 2 +-
 recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig          | 2 +-
 recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig   | 2 +-
 recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig  | 2 +-
 recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig | 2 +-
 recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig    | 2 +-
 recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig    | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb                         | 4 ++--
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index a78c758..12607d9 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "64796e7f597d7f17bbcfa18242dbf1a3da839131"
+SRCREV = "efd77c72b9d67a96c9179e0cdf850aa47feb8c21"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
index 155165d..5d051bd 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
@@ -1 +1 @@
-use-tisdk-config=ti_sdk_dbg_omap2_release
+use-tisdk-config=ti_sdk_omap2_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
index 9e250ca..2b3635c 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
@@ -1 +1 @@
-use-tisdk-config=ti_sdk_dbg_dra7x_release
+use-tisdk-config=ti_sdk_dra7x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig
index 32c70e7..abfb330 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig
@@ -1 +1 @@
-use-tisdk-config=ti_sdk_dbg_k2g_release
+use-tisdk-config=ti_sdk_k2g_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
index 4ed25d7..e95bcf9 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
@@ -1 +1 @@
-use-tisdk-config=ti_sdk_dbg_keystone_release
+use-tisdk-config=ti_sdk_keystone_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
index 4deed2c..9ab6733 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
@@ -1 +1 @@
-use-tisdk-config=ti_sdk_dbg_am3x_release
+use-tisdk-config=ti_sdk_am3x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
index 4646059..825c31c 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
@@ -1 +1 @@
-use-tisdk-config=ti_sdk_dbg_am4x_release
+use-tisdk-config=ti_sdk_am4x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 4dc7d37..4c4a8e5 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -73,11 +73,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "e581bb1caca54c56c773e0ce5e616b91b0b7b00e"
+SRCREV = "20272d4fd5fd81c551d8a31a3daddc18923b71bb"
 PV = "4.4.19+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.7.4


