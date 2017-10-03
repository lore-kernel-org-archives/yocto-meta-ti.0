Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13777E00D75; Tue,  3 Oct 2017 04:15:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0483E00D3E
	for <meta-ti@yoctoproject.org>; Tue,  3 Oct 2017 04:15:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93BErpq003184
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 06:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507029293;
	bh=9BX53JHBNyzke8NA8bLTQMvMbhpTSPU5ivEQQvqZGC4=;
	h=From:To:CC:Subject:Date;
	b=xDwsKDBqtlEfofkpoH6qr1iemFp2WMyf32+psMJIBs10/2oZh6qTARbSBtLm7B9BZ
	zpIrDsaERPYpAiqqysmMqFdJYZJX/YkdtcsMvkEVhnXbSOjL7BaXIKa3ZTDnZwS3bd
	rx2PeSeP6IUlbhmZKZz6SyPAaQ2gJgowoUGdHUmc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93BEmLS025097
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 06:14:48 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 06:14:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 06:14:47 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93BElAx014743;
	Tue, 3 Oct 2017 06:14:47 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Oct 2017 07:14:42 -0400
Message-ID: <1507029285-5066-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 1/4] gcc-arm-none-eabi-native: Add recipe for new version 6-2017-q1-update
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
X-List-Received-Date: Tue, 03 Oct 2017 11:15:10 -0000
Content-Type: text/plain

The source location changed to developer.arm.com compared to previous
version

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 ....2015q3.bb => gcc-arm-none-eabi-native_6-2017-q1-update.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 copy recipes-ti/devtools/{gcc-arm-none-eabi-native_4.9.2015q3.bb => gcc-arm-none-eabi-native_6-2017-q1-update.bb} (51%)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
similarity index 51%
copy from recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
copy to recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
index 1fe5c52..1140f27 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
@@ -1,17 +1,17 @@
 DESCRIPTION = "Baremetal GCC for ARM"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=cba77c7fde3ed13e866b04a2f3d93918"
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
 
 inherit native
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2;name=gcc-arm-none"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
 
-SRC_URI[gcc-arm-none.md5sum] = "8a4a74872830f80c788c944877d3ad8c"
-SRC_URI[gcc-arm-none.sha256sum] = "c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab"
+SRC_URI[gcc-arm-none.md5sum] = "30004c24f4632bc594952462bb0cd1c9"
+SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6abd868da849d416c2eb"
 
-S = "${WORKDIR}/gcc-arm-none-eabi-4_9-2015q3"
+S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
 
 do_install() {
     install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
-- 
1.9.1


