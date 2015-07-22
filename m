Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88CC9E00A3B; Wed, 22 Jul 2015 11:36:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 394D1E009EB
	for <meta-ti@yoctoproject.org>; Wed, 22 Jul 2015 11:36:33 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NRW001U5JOE0DH0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 22 Jul 2015 13:36:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=iFZMDSFXVobv2KMRWPsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AEFAB161B11;	Wed,
	22 Jul 2015 14:36:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 22 Jul 2015 14:36:14 -0400
Message-id: <1437590174-30492-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] linux-ti-staging 4.1: update to latest 4.1.3 and more staging work
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
X-List-Received-Date: Wed, 22 Jul 2015 18:36:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index e35d9b4..f736fb5 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -47,11 +47,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.1.y"
 
-SRCREV = "cc5a77a85f37210fd33bad5a313914a070e893f1"
-PV = "4.1.1+git${SRCPV}"
+SRCREV = "c969194276d42fed25b70f89fe23e68978007107"
+PV = "4.1.3+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


