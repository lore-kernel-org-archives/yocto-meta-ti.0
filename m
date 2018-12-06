Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98BFCE00C31; Thu,  6 Dec 2018 11:31:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E799BE00C09
	for <meta-ti@yoctoproject.org>; Thu,  6 Dec 2018 11:31:26 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1223D409A0;
	Thu,  6 Dec 2018 19:31:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Zxt8LtNsbUc8; Thu,  6 Dec 2018 19:31:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8975408B3;
	Thu,  6 Dec 2018 19:31:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 861291671CE;
	Thu,  6 Dec 2018 14:31:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu,  6 Dec 2018 14:31:20 -0500
Message-Id: <1544124680-54512-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-softhsmv2: depend on openssl10, cleanup
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
X-List-Received-Date: Thu, 06 Dec 2018 19:31:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index d2430f0..d281a51 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -7,10 +7,10 @@ mntdir = "/mnt"
 
 inherit autotools pkgconfig
 
-DEPENDS = "openssl libdaemon zlib"
+DEPENDS = "openssl10 libdaemon zlib"
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH="ti-softhsm-rebase"
+BRANCH = "ti-softhsm-rebase"
 SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
 #Following commit corresponds to tag DEV.SOFTHSM-02.00.00.00
 SRCREV = "b0eef602c03583e59c289ba113b64eaa4f5cac13"
@@ -19,13 +19,13 @@ PR = "r0"
 
 S = "${WORKDIR}/git"
 
-CFLAGS += " -mno-unaligned-access"
-CPPFLAGS += " -mno-unaligned-access"
+CFLAGS += "-mno-unaligned-access"
+CPPFLAGS += "-mno-unaligned-access"
 
 EXTRA_OECONF += " \
     --with-zlib=${STAGING_EXECPREFIXDIR} \
     --with-openssl=${STAGING_EXECPREFIXDIR} \
-    "
+"
 
 INITSCRIPT_NAME = "softhsm-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
@@ -34,7 +34,7 @@ inherit update-rc.d
 
 FILES_${PN} += "${libdir}/softhsm/lib*.so.* ${mntdir}/*"
 FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
-FILES_${PN}-staticdev += "${libdir}/softhsm/*.a "
+FILES_${PN}-staticdev += "${libdir}/softhsm/*.a"
 FILES_${PN}-dev += "${libdir}/softhsm/*.la ${libdir}/softhsm/lib*.so"
 
 INSANE_SKIP_${PN}-dev = "dev-elf"
-- 
2.7.4


