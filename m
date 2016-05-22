Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95570E00D7E; Sun, 22 May 2016 09:32:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65ED4E00DE3
	for <meta-ti@yoctoproject.org>; Sun, 22 May 2016 09:31:56 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7782C529C2; Sun, 22 May 2016 16:31:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160522163155.7782C529C2@arago-project.org>
Date: Sun, 22 May 2016 16:31:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machine: add opencl feature to corresponding platforms
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
X-List-Received-Date: Sun, 22 May 2016 16:32:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fb7e4fb69d884f94a5d55dfb22d840a5155f689f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fb7e4fb69d884f94a5d55dfb22d840a5155f689f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 19 20:39:08 2016 +0000

machine: add opencl feature to corresponding platforms

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/dra7xx.inc |    2 +-
 conf/machine/k2e-evm.conf       |    2 ++
 conf/machine/k2hk-evm.conf      |    2 ++
 conf/machine/k2l-evm.conf       |    2 ++
 4 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index 857e1b3..42941fd 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
 
-MACHINE_FEATURES += "pci"
+MACHINE_FEATURES += "pci opencl"
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 0735357..eef9583 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/keystone.inc
 
+MACHINE_FEATURES += "opencl"
+
 UBOOT_MACHINE = "k2e_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2e"
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index d375b24..4c33f37 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/keystone.inc
 
+MACHINE_FEATURES += "opencl"
+
 UBOOT_MACHINE = "k2hk_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2hk"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index c7b712b..cf540f4 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/keystone.inc
 
+MACHINE_FEATURES += "opencl"
+
 UBOOT_MACHINE = "k2l_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2l"


