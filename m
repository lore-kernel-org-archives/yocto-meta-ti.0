Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8421DE00EC0; Wed, 28 Feb 2018 16:09:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CAF5E00E8F
	for <meta-ti@yoctoproject.org>; Wed, 28 Feb 2018 16:09:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D16120B6F;
	Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yKBec1iDdurz; Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0A90020B72;
	Thu,  1 Mar 2018 00:09:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4F8311632DE;
	Wed, 28 Feb 2018 19:09:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Feb 2018 19:09:48 -0500
Message-Id: <1519862990-49259-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519862990-49259-1-git-send-email-denis@denix.org>
References: <1519862990-49259-1-git-send-email-denis@denix.org>
Subject: [rocko/master][PATCH 4/5] machines: remove references to xf86-input-tslib from meta-oe
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
X-List-Received-Date: Thu, 01 Mar 2018 00:09:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

It is still mentioned in the commend, in case someone needs it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf | 2 --
 conf/machine/am3517-evm.conf | 2 --
 conf/machine/am37x-evm.conf  | 2 --
 conf/machine/am437x-evm.conf | 2 --
 conf/machine/omap3evm.conf   | 2 --
 5 files changed, 10 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 1833d71..25d7b73 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/ti33x.inc
 
-# Use built-in LCD by default
-XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 23a1832..e14ec1e 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/omap3.inc
 
-# Use built-in LCD by default
-XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 0e5ba69..f96be3c 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/omap3.inc
 
-# Use built-in LCD by default
-XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index fa2e514..06ce4f8 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/ti43x.inc
 
-# Use built-in LCD by default
-XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 7051d88..a38bd7a 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/omap3.inc
 
-# Use built-in LCD by default
-XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
-- 
2.7.4


