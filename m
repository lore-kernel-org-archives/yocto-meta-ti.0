Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90B27E00D24; Mon,  4 Mar 2019 18:03:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEEA0E00D11
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 18:03:50 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2523oQB101457
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 20:03:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551751430;
	bh=WT2Y8kr44pmAUlngY0+pweSAl9+yr4GfPywWI/WV+eM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=u9cbft5BkDnNaJp8nrLr6QHVdDqvZ+y3Mzq8LlLyLaRsfd3R2+UH+PW1SxywP19RC
	utPcxJnC/dRPTe/resGNwONbn86j2zovMBjhaKqK/EbiquI7M5v9A+Fd+VahxCkThE
	W7MPx5VRzI6Vzh8UBolX2aCcIJKKHwDpqChZTUw8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2523ohP042549
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 20:03:50 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 20:03:49 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 20:03:49 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2523mOt019033
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 20:03:49 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 4 Mar 2019 21:03:46 -0500
Message-ID: <1551751426-10598-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551751426-10598-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1551751426-10598-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] gcc-arm-none-eabi-native: Update to 7.0-2018-q2-update
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
X-List-Received-Date: Tue, 05 Mar 2019 02:03:51 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 ....bb => gcc-arm-none-eabi-native_7-2018-q2-update.bb} | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi-native_7-2018-q2-update.bb} (47%)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
similarity index 47%
rename from recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
rename to recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
index 1140f27..c5f76aa 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
@@ -1,17 +1,20 @@
 DESCRIPTION = "Baremetal GCC for ARM"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"
 
 inherit native
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2;name=gcc-arm-none"
 
-SRC_URI[gcc-arm-none.md5sum] = "30004c24f4632bc594952462bb0cd1c9"
-SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6abd868da849d416c2eb"
+SRC_URI[gcc-arm-none.md5sum] = "299ebd3f1c2c90930d28ab82e5d8d6c0"
+SRC_URI[gcc-arm-none.sha256sum] = "bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69"
 
-S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
+S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
+
+# only x86_64 is supported
+COMPATIBLE_HOST = "x86_64.*-linux"
 
 do_install() {
     install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
@@ -20,4 +23,6 @@ do_install() {
 
 FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
 
-INSANE_SKIP_${PN} = "already-stripped"
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


