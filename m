Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A13EE00D5C; Fri,  4 Sep 2015 13:13:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7801E00C30
	for <meta-ti@yoctoproject.org>; Fri,  4 Sep 2015 13:13:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F1E2F52A87; Fri,  4 Sep 2015 20:13:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150904201349.F1E2F52A87@arago-project.org>
Date: Fri,  4 Sep 2015 20:13:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: SGX patches went into kernel, drop them locally
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
X-List-Received-Date: Fri, 04 Sep 2015 20:13:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 008e80c27f3103685a642dd0bbc9647aedb8e3f6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=008e80c27f3103685a642dd0bbc9647aedb8e3f6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep  5 02:07:03 2015 +0000

linux-ti-staging: SGX patches went into kernel, drop them locally

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |   17 ++---------------
 1 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 4ecab8e..a423ca7 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -50,11 +50,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "1d476946dc0c881868ffd78cd2be30740ce0dea1"
+SRCREV = "3adfb503c87468c448ee30191511184fb0c65dd0"
 PV = "4.1.6+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "g"
+MACHINE_KERNEL_PR_append = "h"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -70,16 +70,3 @@ KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
-
-GFX_PATCHES =  "file://0005-arm-Export-cache-flush-management-symbols-when-MULTI.patch \
-                file://0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch \
-                file://0007-ARM-dts-am437x-add-DT-node-for-gpu.patch \
-                file://0008-ARM-OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch"
-
-SRC_URI_append_omap-a15 = " ${GFX_PATCHES} file://sgx.cfg"
-SRC_URI_append_ti33x = " ${GFX_PATCHES} file://sgx.cfg"
-SRC_URI_append_ti43x = " ${GFX_PATCHES} file://sgx.cfg"
-
-KERNEL_CONFIG_FRAGMENTS_append_omap-a15 = " ${WORKDIR}/sgx.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/sgx.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/sgx.cfg"


