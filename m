Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B53AE00863; Thu, 21 Jan 2016 22:01:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E610E007B5
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 22:01:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4D259529A5; Fri, 22 Jan 2016 06:01:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160122060140.4D259529A5@arago-project.org>
Date: Fri, 22 Jan 2016 06:01:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to the latest, use RT defconfig for Keystone
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
X-List-Received-Date: Fri, 22 Jan 2016 06:01:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 14d341f9c50dcf3e34c4f256ce8e23341f6f6934
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=14d341f9c50dcf3e34c4f256ce8e23341f6f6934

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jan 22 11:59:49 2016 +0000

linux-ti-staging: update to the latest, use RT defconfig for Keystone

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-rt-4.1/configs/systest  |    1 -
 .../keystone/configs/systest                       |    1 -
 .../linux-ti-staging-rt-4.1/keystone/defconfig     |    2 +-
 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb    |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |    4 ++--
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest b/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
deleted file mode 100644
index 28b995e..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/rt_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest
deleted file mode 100644
index 68cfc25..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/multi_core_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
index 470cf11..6d28753 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/multi_core_defconfig_fragment
+use-combined-config=ti_config_fragments/rt_multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
index ae958de..7577669 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
 
 BRANCH = "ti-rt-linux-4.1.y"
 
-SRCREV = "e1438117e08a772a560d4f4226c889d5fe48e4fd"
+SRCREV = "715422100565b5362c11ffa446b330ff86e8849c"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index e02e5cd..742c55c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -59,11 +59,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "e1438117e08a772a560d4f4226c889d5fe48e4fd"
+SRCREV = "b7b07f10f6eada41d3903b1b1dc854659aac3ae6"
 PV = "4.1.15+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


