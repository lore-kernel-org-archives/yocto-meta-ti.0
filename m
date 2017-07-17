Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51C9FE00C46; Mon, 17 Jul 2017 07:18:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72F20E00C40
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 07:18:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6HEIPrq006070
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 09:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500301105;
	bh=rB0zn3Pg5W0ZfoP0MRyw9VeygohVL6s7mpUZ5EOyFMk=;
	h=From:To:CC:Subject:Date;
	b=aSIjZx/o1Za2GRvUvQ3TXpf0K624pzk0d96CXdQQrnRyJkz2AOv6flDjnM87oLl3d
	W9PEPeQbIylYStj42BZPcd0IEbUlxXNfi4Ols141kkdRz1T5hDM3TwsskjQDPg5C0M
	MilZm3PNJX55R1sz2DBUh7bdz4NcDmNBxC4cbj9A=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6HEIPdg032749
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 09:18:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 09:18:24 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6HEIO5n028527;	Mon, 17 Jul 2017 09:18:24 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 17 Jul 2017 10:12:16 -0400
Message-ID: <1500300736-10058-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-cgt6x: revert version to 8.1.3
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
X-List-Received-Date: Mon, 17 Jul 2017 14:18:34 -0000
Content-Type: text/plain

* In version 8.2.0, the default compression algorithm used by cinit
  was changed from RLE24 to LZSS.
* This change exposed cache coherency issue related to global objects
  in multicore applications.
* Revert to 8.1.3 to allow time to resolve the exposed issues.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/{ti-cgt6x_8.2.0.bb => ti-cgt6x_8.1.3.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x_8.2.0.bb => ti-cgt6x_8.1.3.bb} (86%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.2.0.bb b/recipes-ti/devtools/ti-cgt6x_8.1.3.bb
similarity index 86%
rename from recipes-ti/devtools/ti-cgt6x_8.2.0.bb
rename to recipes-ti/devtools/ti-cgt6x_8.1.3.bb
index 54af409..87d03cb 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.2.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.1.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "TI DSP Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.0.x_CodeGenerationTools_Manifest.htm;md5=0d1c662c65c3526fc0f4784a4e114ef4"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.0.x_CodeGenerationTools_Manifest.htm;md5=0d1c662c65c3526fc0f4784a4e114ef4"
+LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
 
 PE = "1"
 
@@ -37,11 +37,11 @@ BINFILE_NAME_class-target = "cgt6x_arm_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt6x_x86_installer.md5sum] = "8f6d1cdb8c120e408fa6b4e1bb7b00d7"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "36a05c453daa3261ada9e7681d008bf2bd844e84699c7a8445af80c629b5497b"
+SRC_URI[cgt6x_x86_installer.md5sum] = "dca41cd1868709760589bed9d03a2053"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "df3a07350e8bcf942edf579a5ec778fca85a8071957b403db4ba52691d805029"
 
-SRC_URI[cgt6x_arm_installer.md5sum] = "6780b000adc4fd168f45a1776bb4dcf4"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "13b84434e88a91316809c0377552ae2396499344ed1c5eb77f42cce1d6e2b0a8"
+SRC_URI[cgt6x_arm_installer.md5sum] = "2e872aabb214a228020febc102d64cef"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "577b9dc43b9b1fb893a1d5cc6b6da149e89bd40e4c7df3dd5f4b6453b4203940"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.7.4


