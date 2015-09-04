Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAD93E00BBC; Fri,  4 Sep 2015 13:07:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 924FBE00AE4
	for <meta-ti@yoctoproject.org>; Fri,  4 Sep 2015 13:07:05 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NU600FHS57S3X70@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 04 Sep 2015 15:07:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=PmkLh0T9h0TAP35X7OQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4D4D1161BD2;	Fri,
	4 Sep 2015 16:07:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 04 Sep 2015 16:07:03 -0400
Message-id: <1441397223-23790-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-ti-staging: SGX patches went into kernel, drop them locally
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
X-List-Received-Date: Fri, 04 Sep 2015 20:07:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.1.bb | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

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
-- 
2.2.0


