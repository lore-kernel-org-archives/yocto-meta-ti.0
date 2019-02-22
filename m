Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06E20E00B5C; Fri, 22 Feb 2019 12:33:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E810E00546
	for <meta-ti@yoctoproject.org>; Fri, 22 Feb 2019 12:33:04 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1MKX4CE013637
	for <meta-ti@yoctoproject.org>; Fri, 22 Feb 2019 14:33:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550867584;
	bh=LTW9Gva4PomMXBZZNCpKRRF4bym1Ai1ZGRTAkpc81hk=;
	h=From:To:CC:Subject:Date;
	b=cZGumTWHEfELnLnEhVzP209BOUit21npAeHmmgoknK2bVQL9Cllk3+1jtcSSs1WRM
	Zvrh5USET2rW/NSu10Bvbh6TwK7nOyb4obLNszoBScCmTAe2P3uqIhiIIkArNPqCGv
	OiqwoJsaG9mHFIaWRmkec6elCfRgT06O+m9ZKN+Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1MKX4T9019559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 22 Feb 2019 14:33:04 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 22 Feb 2019 14:33:03 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 22 Feb 2019 14:33:03 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1MKX3BL005678;
	Fri, 22 Feb 2019 14:33:03 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 22 Feb 2019 15:20:49 -0500
Message-ID: <1550866849-31173-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] gcc-arm-none-eabi: extend to nativesdk class
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
X-List-Received-Date: Fri, 22 Feb 2019 20:33:05 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Use COMPATIBLE_HOST instead of anonymous python to limit to x86_64-linux

 ..._6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} (83%)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
similarity index 83%
rename from recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
rename to recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
index 1140f27..ae3d1d7 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
@@ -3,7 +3,6 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
 LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
 
-inherit native
 require recipes-ti/includes/ti-paths.inc
 
 SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
@@ -13,6 +12,9 @@ SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6
 
 S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
 
+# only x86_64 is supported
+COMPATIBLE_HOST = "x86_64.*-linux"
+
 do_install() {
     install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
     cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
@@ -20,4 +22,6 @@ do_install() {
 
 FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
 
-INSANE_SKIP_${PN} = "already-stripped"
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


