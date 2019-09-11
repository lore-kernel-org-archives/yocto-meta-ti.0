Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67BADE00DE6; Wed, 11 Sep 2019 12:24:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2676E00DE6
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 12:24:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 07E0740BF5;
	Wed, 11 Sep 2019 19:24:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aB0fa06nQsUc; Wed, 11 Sep 2019 19:24:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E684F40BF6;
	Wed, 11 Sep 2019 19:24:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A2A3D173BBA;
	Wed, 11 Sep 2019 15:24:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Sep 2019 15:23:55 -0400
Message-Id: <1568229835-30920-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568229835-30920-1-git-send-email-denys@ti.com>
References: <1568229835-30920-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 4/4] ti-gc320-libs: only compatible with DRA7xx platform
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
X-List-Received-Date: Wed, 11 Sep 2019 19:24:03 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index df1a99e..e8c2f01 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-libs"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://Manifest.html;md5=a9121e8936ace09820d23f7626daaca5"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "dra7xx"
 
 CLEANBROKEN = "1"
 
@@ -24,9 +24,9 @@ python __anonymous() {
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
 }
 
-TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT = "jacinto6evm"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/git"
 
@@ -38,6 +38,3 @@ do_install() {
 }
 
 INSANE_SKIP_${PN} += "ldflags"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST_ti-soc = "(.*)"
-- 
2.7.4


