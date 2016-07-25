Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53CD1E00C44; Mon, 25 Jul 2016 16:53:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38D54E00C40
	for <meta-ti@yoctoproject.org>; Mon, 25 Jul 2016 16:53:28 -0700 (PDT)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OAW003E1ACMG280@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 25 Jul 2016 18:53:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=rJvLH1BknI5sEH4zMOQA:9
Received: by 100.15.86.14 with SMTP id 7e45711c; Mon, 25 Jul 2016 23:53:22 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 935EF161B38;	Mon, 25 Jul 2016 19:53:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Jul 2016 19:53:09 -0400
Message-id: <1469490789-10912-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] conf: set lower DEFAULTTUNE across machines
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
X-List-Received-Date: Mon, 25 Jul 2016 23:53:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Set DEFAULTTUNE optimization in BSP from specific Cortex level to more generic
armv7a, but keep thumb, neon and hard-float options enabled due to numerous BSP
components requiring them. While enabling additional Cortex optimization might
gain a tiny performance improvement, it makes binary feeds incompatible between
A8, A9 and A15 machines, leads to unnecessary rebuilds and hides potential
packaging or recipe issues. Hence the decision to enable Cortex optimization
should be left to the Distro.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc | 2 +-
 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/include/omap3.inc    | 2 +-
 conf/machine/include/omap4.inc    | 2 +-
 conf/machine/include/ti33x.inc    | 2 +-
 conf/machine/include/ti43x.inc    | 2 +-
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
-- 
2.7.4


