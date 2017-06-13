Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFCFCE00ACF; Tue, 13 Jun 2017 12:02:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E326E00888
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 12:02:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3F8A220B7D;
	Tue, 13 Jun 2017 19:02:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XdZbPG7yOS4e; Tue, 13 Jun 2017 19:02:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 19FDE207AF;
	Tue, 13 Jun 2017 19:02:34 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BA26C1624F5;
	Tue, 13 Jun 2017 15:02:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue, 13 Jun 2017 15:02:32 -0400
Message-Id: <1497380552-4701-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] ti-soc: add generic "ti-soc" SOC family for BSP overrides
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
X-List-Received-Date: Tue, 13 Jun 2017 19:02:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc | 4 ++--
 conf/machine/include/omap-a15.inc | 4 ++--
 conf/machine/include/omap3.inc    | 4 ++--
 conf/machine/include/omap4.inc    | 4 ++--
 conf/machine/include/omapl1.inc   | 4 ++--
 conf/machine/include/ti-soc.inc   | 4 ++++
 conf/machine/include/ti33x.inc    | 4 ++--
 conf/machine/include/ti43x.inc    | 4 ++--
 8 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 conf/machine/include/ti-soc.inc

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 51ef563..3e96e92 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -1,5 +1,5 @@
-SOC_FAMILY = "keystone"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":keystone"
 
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa15.inc
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 0c49753..11620a9 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -1,5 +1,5 @@
-SOC_FAMILY = "omap-a15"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":omap-a15"
 
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa15.inc
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 8c6423d..221c029 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,5 +1,5 @@
-SOC_FAMILY = "omap3"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":omap3"
 
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa8.inc
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index 5d0ce5e..789199d 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -1,5 +1,5 @@
-SOC_FAMILY = "omap4"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":omap4"
 
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa9.inc
diff --git a/conf/machine/include/omapl1.inc b/conf/machine/include/omapl1.inc
index fb10af0..9942c94 100644
--- a/conf/machine/include/omapl1.inc
+++ b/conf/machine/include/omapl1.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY = "omapl1"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":omapl1"
diff --git a/conf/machine/include/ti-soc.inc b/conf/machine/include/ti-soc.inc
new file mode 100644
index 0000000..227d897
--- /dev/null
+++ b/conf/machine/include/ti-soc.inc
@@ -0,0 +1,4 @@
+# This is a generic TI SOC family. It is a superset of all other SOCs
+# and platforms defined in meta-ti to allow BSP-level overrides.
+SOC_FAMILY = "ti-soc"
+require conf/machine/include/soc-family.inc
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index e1f5bbd..cadc7df 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -1,5 +1,5 @@
-SOC_FAMILY = "ti33x"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":ti33x"
 
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa8.inc
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 8830800..2d563ee 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -1,5 +1,5 @@
-SOC_FAMILY = "ti43x"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":ti43x"
 
 DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/tune-cortexa9.inc
-- 
2.7.4


