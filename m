Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 587DAE00848; Thu, 11 Sep 2014 08:02:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19ADCE00744
	for <meta-ti@yoctoproject.org>; Thu, 11 Sep 2014 08:02:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C127552007; Thu, 11 Sep 2014 15:02:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140911150229.C127552007@arago-project.org>
Date: Thu, 11 Sep 2014 15:02:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : dra7xx: add "pci" to MACHINE_FEATURES
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
X-List-Received-Date: Thu, 11 Sep 2014 15:02:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 0c73d5f10540d396046d192ee9cda7eb8f93e20c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0c73d5f10540d396046d192ee9cda7eb8f93e20c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep 10 08:30:09 2014 +0000

dra7xx: add "pci" to MACHINE_FEATURES

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/dra7xx.inc   |    2 ++
 conf/machine/include/omap-a15.inc |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index fd0ecfe..857e1b3 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,2 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
+
+MACHINE_FEATURES += "pci"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index d7ddb62..3654c3a 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -5,7 +5,7 @@ DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r5"
+MACHINE_KERNEL_PR = "r6"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"


