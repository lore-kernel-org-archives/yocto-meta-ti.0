Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C57D9E00B43; Wed, 13 Mar 2019 20:27:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25F47E00B43
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 20:27:37 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2E3Rbj5101277
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 22:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552534057;
	bh=Z0T7bkbn0F5H2cdsyve/EHKgOltol1VLM4qn7r/usZM=;
	h=From:To:CC:Subject:Date;
	b=DJbYyTfFel6XfEM1T/4If0YQyTXK8+rfOxrutB9y9mF9IhF8xc7D0gs2HrwiacJhi
	smRR0DINpfnGDXUQC2lqAf80GR+JK01VTz5CVl7Joh/sXZkyxnBlSxqRBbOpsG574U
	VR/EUqcLd2AktOzffdBvRDYSeMPfSjEaSDKxI5Yc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2E3Rbmx007169
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 22:27:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 13 Mar 2019 22:27:37 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 13 Mar 2019 22:27:37 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2E3RaNv017670;
	Wed, 13 Mar 2019 22:27:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Mar 2019 03:18:05 +0000
Message-ID: <20190314031810.27721-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/thud/master][PATCH v2 1/6] gcc-arm-none-eabi: Update to 7.0-2018-q2-update
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
X-List-Received-Date: Thu, 14 Mar 2019 03:27:38 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

License has been changed to include a few new licenses such as
Synopsis,Joel Sherrill,Rich Felker,Otto Moerbeek,embedded brains Gmbh,
Regents of Univ of California, Digital Equipment Corporation, John
Baldwin,WIDE project, Jeffrey Roberson, ARM Ltd, NetBSD,Michael R Nelly,
and CYGWIN license

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...update.bb => gcc-arm-none-eabi_7-2018-q2-update.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-ti/devtools/{gcc-arm-none-eabi_6-2017-q1-update.bb => gcc-arm-none-eabi_7-2018-q2-update.bb} (64%)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
similarity index 64%
rename from recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
rename to recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
index d08dd2fc..b9e3639b 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Baremetal GCC for ARM"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"
 
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2;name=gcc-arm-none"
 
-SRC_URI[gcc-arm-none.md5sum] = "30004c24f4632bc594952462bb0cd1c9"
-SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6abd868da849d416c2eb"
+SRC_URI[gcc-arm-none.md5sum] = "299ebd3f1c2c90930d28ab82e5d8d6c0"
+SRC_URI[gcc-arm-none.sha256sum] = "bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69"
 
-S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
+S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
 
 # only x86_64 is supported
 COMPATIBLE_HOST = "x86_64.*-linux"
-- 
2.17.1


