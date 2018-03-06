Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BC71E00823; Tue,  6 Mar 2018 08:08:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11521E00DE6
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2018 08:07:58 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26G7wtb030039
	for <meta-ti@yoctoproject.org>; Tue, 6 Mar 2018 10:07:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520352478;
	bh=ObMjH43yVgvzGZC1vC7aZt3yqdjIFnLQFXmLEMUzqjk=;
	h=From:To:Subject:Date;
	b=Zvs9CGPxxNimQWQqocyqUzOnN195qoomH+RtLMp3wdHrkYOEXaflpH7wmulW/K4oR
	Zmg5khnJ86obsfEjvEVXhVaZUUI+qSK3HHAZuXTQwxNUguVBDN5Kqgacn5CfXGAzIE
	60qhEh0R1bPvFoDXR1EtPKvkIFaxFrpOBg8inBAo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26G7wOh026358
	for <meta-ti@yoctoproject.org>; Tue, 6 Mar 2018 10:07:58 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 10:07:57 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 10:07:57 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26G7vDY014085
	for <meta-ti@yoctoproject.org>; Tue, 6 Mar 2018 10:07:57 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Mar 2018 11:07:53 -0500
Message-ID: <1520352473-7431-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] ti-gc320-libs: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Tue, 06 Mar 2018 16:08:00 -0000
Content-Type: text/plain

The new version include the 2D API include files

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 45c8d51..b879c85 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Userspace libraries for GC320 chipset on TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-libs"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://Manifest.html;md5=4d759c4e533af6aaeff2af7f405697c2"
+LIC_FILES_CHKSUM = "file://Manifest.html;md5=a9121e8936ace09820d23f7626daaca5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,7 +10,7 @@ CLEANBROKEN = "1"
 BRANCH = "ti-${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
-SRCREV = "ab0ca5bff345f6c13807fea3c4acabf5f2b9b10a"
+SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -26,7 +26,7 @@ python __anonymous() {
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


