Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09B5BE00B53; Sun,  8 Nov 2015 15:44:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Sun, 08 Nov 2015 15:44:27 PST
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB1E8E00B36
	for <meta-ti@yoctoproject.org>; Sun,  8 Nov 2015 15:44:27 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXI002SCPT4MN20@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 08 Nov 2015 16:44:08 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=AE7VHKvy8aenieBuqjoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B03E5161CF1;	Sun,
	8 Nov 2015 17:43:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sun, 08 Nov 2015 17:43:52 -0500
Message-id: <1447022632-27060-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1447022632-27060-1-git-send-email-denis@denix.org>
References: <1447022632-27060-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] linux-ti-staging-rt: introduce RT version of staging kernel
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
X-List-Received-Date: Sun, 08 Nov 2015 23:44:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest         | 1 +
 recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig               | 1 +
 .../linux/linux-ti-staging-rt-4.1/keystone/configs/systest           | 1 +
 recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig      | 1 +
 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb                      | 5 +++++
 5 files changed, 9 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb

diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest b/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
new file mode 100644
index 0000000..28b995e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/rt_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig
new file mode 100644
index 0000000..2091fca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/rt_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest
new file mode 100644
index 0000000..68cfc25
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/multi_core_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
new file mode 100644
index 0000000..470cf11
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
new file mode 100644
index 0000000..82e3bc7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -0,0 +1,5 @@
+require linux-ti-staging_4.1.bb
+
+BRANCH = "ti-rt-linux-4.1.y"
+
+SRCREV = "c6d2ee60de8003e5491ab131307570581529029f"
-- 
2.2.0


