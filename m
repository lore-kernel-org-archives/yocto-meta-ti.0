Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD127E0135B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:47 -0800 (PST)
Received: by werm12 with SMTP id m12so1800889wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:46 -0800 (PST)
Received: by 10.216.132.141 with SMTP id o13mr7036454wei.58.1324311346681;
	Mon, 19 Dec 2011 08:15:46 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	ej17sm26231164wbb.14.2011.12.19.08.15.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 08:15:46 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 19 Dec 2011 17:15:37 +0100
Message-Id: <1324311340-16981-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 2/5] ti-xdctools: update to 3.23.00.32
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2011 16:15:48 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/devtools/ti-xdctools.inc           |    6 +-----
 recipes-ti/devtools/ti-xdctools_3.20.06.81.bb |   14 --------------
 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb |   11 +++++++++++
 3 files changed, 12 insertions(+), 19 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb

diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools.inc
index 120ebaa..c76ad80 100644
--- a/recipes-ti/devtools/ti-xdctools.inc
+++ b/recipes-ti/devtools/ti-xdctools.inc
@@ -1,11 +1,7 @@
 DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
 SECTION = "devel"
-LICENSE = "BSD, GPLv2"
-
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=eace8fa313a140ef178ecfa0f53cc655"
-
-PR = "r2"
+LICENSE = "BSD & GPLv2"
 
 require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
diff --git a/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb b/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
deleted file mode 100644
index 45bedaa..0000000
--- a/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ti-xdctools.inc
-
-PV = "3_20_06_81"
-
-# This fixes c6accel, but breaks codec-engine and lpm
-#SRC_URI += "file://arm-linker-hack.diff"
-
-SRC_URI += "file://fix-hardcoded-paths.diff"
-
-SRC_URI[xdcbin.md5sum] = "65151268d6be6ad6eb940ef7ed03af16"
-SRC_URI[xdcbin.sha256sum] = "8ea6b851521ce41fe0b4a349b2d922af7e70f48c50ad9fd21f62627446a834f8"
-
-
-
diff --git a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
new file mode 100644
index 0000000..b2db76c
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
@@ -0,0 +1,11 @@
+require ti-xdctools.inc
+
+PV = "3_23_00_32"
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=49b2dfbf48860a0da844709c3ce63a9c"
+
+SRC_URI += "file://fix-hardcoded-paths.diff"
+
+SRC_URI[xdcbin.md5sum] = "263aa11795670265551d36a8c77ad27d"
+SRC_URI[xdcbin.sha256sum] = "880b4e263850f2a3c0ea7352c5b6e0a86692361e26634c3b70dddc42c71231a5"
+
+S = "${WORKDIR}/ti/xdctools_${PV}"
-- 
1.7.2.5


