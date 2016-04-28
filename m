Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7993E00E00; Thu, 28 Apr 2016 12:00:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35345E00E0F
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 12:00:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0EE9952A83; Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160428190039.0EE9952A83@arago-project.org>
Date: Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 4.4. 8 and latest domain merges
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
X-List-Received-Date: Thu, 28 Apr 2016 19:00:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ed03cab5fb9f85d9874b819eeb9b072e965b3b66
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ed03cab5fb9f85d9874b819eeb9b072e965b3b66

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 28 20:14:07 2016 +0000

linux-ti-staging: update to 4.4.8 and latest domain merges

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index af7e352..dd999ff 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "01711ca3dbed322591d9e0c2c20eb57afa2110e7"
+SRCREV = "ed3375a3d4d0a8cbc1e48811e51fe03521652789"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 4d4c14a..12517e9 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -70,8 +70,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "a4f797e3abb23234fb1fdf6694faaf91822f1a1c"
-PV = "4.4.7+git${SRCPV}"
+SRCREV = "c789f902e73f46e198dd09c443d7a36473137f33"
+PV = "4.4.8+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
@@ -79,10 +79,10 @@ PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
 
-# SoC specific config fragments are not enabled yet
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_dra7xx = " ${KERNEL_CONFIG_DIR}/dra7_only.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_k2g-evm = " ${KERNEL_CONFIG_DIR}/k2g_only.cfg"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
 


