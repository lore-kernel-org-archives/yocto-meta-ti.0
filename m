Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74AABE00F2D; Wed, 27 Jul 2016 18:36:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68A19E00F2C
	for <meta-ti@yoctoproject.org>; Wed, 27 Jul 2016 18:36:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7323652A8C; Thu, 28 Jul 2016 01:36:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160728013624.7323652A8C@arago-project.org>
Date: Thu, 28 Jul 2016 01:36:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf: set lower DEFAULTTUNE across machines
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
X-List-Received-Date: Thu, 28 Jul 2016 01:36:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6747b4f3451c9a99c3752467aff2030572d8c5fb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6747b4f3451c9a99c3752467aff2030572d8c5fb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jul 26 05:53:09 2016 +0000

conf: set lower DEFAULTTUNE across machines

Set DEFAULTTUNE optimization in BSP from specific Cortex level to more generic
armv7a, but keep thumb, neon and hard-float options enabled due to numerous BSP
components requiring them. While enabling additional Cortex optimization might
gain a tiny performance improvement, it makes binary feeds incompatible between
A8, A9 and A15 machines, leads to unnecessary rebuilds and hides potential
packaging or recipe issues. Hence the decision to enable Cortex optimization
should be left to the Distro.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    2 +-
 conf/machine/include/omap-a15.inc |    2 +-
 conf/machine/include/omap3.inc    |    2 +-
 conf/machine/include/omap4.inc    |    2 +-
 conf/machine/include/ti33x.inc    |    2 +-
 conf/machine/include/ti43x.inc    |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 1253312..dd1cbae 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -1,7 +1,7 @@
 SOC_FAMILY = "keystone"
 require conf/machine/include/soc-family.inc
 
-DEFAULTTUNE ?= "cortexa15thf-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 9316998..a434456 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -1,7 +1,7 @@
 SOC_FAMILY = "omap-a15"
 require conf/machine/include/soc-family.inc
 
-DEFAULTTUNE ?= "cortexa15thf-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 3a84140..4fe4cb3 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,7 +1,7 @@
 SOC_FAMILY = "omap3"
 require conf/machine/include/soc-family.inc
 
-DEFAULTTUNE ?= "cortexa8thf-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa8.inc
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index deb3316..5d0ce5e 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -1,7 +1,7 @@
 SOC_FAMILY = "omap4"
 require conf/machine/include/soc-family.inc
 
-DEFAULTTUNE ?= "cortexa9thf-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa9.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index fa2ead5..6d1a45b 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -1,7 +1,7 @@
 SOC_FAMILY = "ti33x"
 require conf/machine/include/soc-family.inc
 
-DEFAULTTUNE ?= "cortexa8thf-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa8.inc
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index a603059..807a42e 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -1,7 +1,7 @@
 SOC_FAMILY = "ti43x"
 require conf/machine/include/soc-family.inc
 
-DEFAULTTUNE ?= "cortexa9thf-neon"
+DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa9.inc
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"


