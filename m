Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F9C8E00A92; Mon,  9 Nov 2015 11:34:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA9EBE008D2
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 11:34:07 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 85DA252AB7; Mon,  9 Nov 2015 19:34:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151109193407.85DA252AB7@arago-project.org>
Date: Mon,  9 Nov 2015 19:34:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging-rt: introduce RT version of staging kernel
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
X-List-Received-Date: Mon, 09 Nov 2015 19:34:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 23391d519f88d8d27104ca90b5e02303fec1d319
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=23391d519f88d8d27104ca90b5e02303fec1d319

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov  9 04:43:52 2015 +0000

linux-ti-staging-rt: introduce RT version of staging kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-rt-4.1/configs/systest  |    1 +
 .../linux/linux-ti-staging-rt-4.1/defconfig        |    1 +
 .../keystone/configs/systest                       |    1 +
 .../linux-ti-staging-rt-4.1/keystone/defconfig     |    1 +
 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb    |    5 +++++
 5 files changed, 9 insertions(+), 0 deletions(-)

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


