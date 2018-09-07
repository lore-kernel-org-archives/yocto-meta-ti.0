Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1FBCE00953; Fri,  7 Sep 2018 06:49:37 -0700 (PDT)
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
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0762DE0090C
	for <meta-ti@yoctoproject.org>; Fri,  7 Sep 2018 06:49:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87DnaYi025569
	for <meta-ti@yoctoproject.org>; Fri, 7 Sep 2018 08:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536328176;
	bh=Rd5cgFT/AnFEwLQAfssCIMS1JpARTg8omwA1sn5aexw=;
	h=From:To:CC:Subject:Date;
	b=HqtflC3keYj3SJsqyxOcTvXG3iM8nf+KsEAmzsTjs6sliCpwjML/kTduI9yiINjOa
	mR5XLFkGGAV0n095nQ71NUv0w4VzsxI7ZDy/3yiGGzE24StP/79HfzTSD9patGuDpl
	DIainoaP4/uIK80OU65lWYBMEac5sVSkpKEgnbVM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87Dnaeq028243
	for <meta-ti@yoctoproject.org>; Fri, 7 Sep 2018 08:49:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 08:49:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 08:49:36 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87DnZZq031016;
	Fri, 7 Sep 2018 08:49:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Sep 2018 09:37:11 -0400
Message-ID: <1536327431-6167-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] sa-lld: utilize oe_runmake
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
X-List-Received-Date: Fri, 07 Sep 2018 13:49:38 -0000
Content-Type: text/plain

* This fixes a configure issue when the sources may get cleaned.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-test_git.bb | 9 ++++++---
 recipes-bsp/sa-lld/sa-lld_git.bb      | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index 07d6467..f3fa4f3 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -14,14 +14,17 @@ DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "no yes"
 
+PARALLEL_MAKE = ""
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} SA_SRC_DIR=${S}"
+
 do_compile () {
 #   Now build the lld in the updated directory
 	for device in ${DEVICELIST}
 	do
-		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S}
+		oe_runmake clean DEVICE="$device"
 		for choice in ${CHOICELIST}
 		do
-			make -f makefile_armv7 examples utils PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+			oe_runmake examples utils DEVICE="$device" USEDYNAMIC_LIB="$choice"
 		done
 	done
 }
@@ -34,7 +37,7 @@ do_install () {
 
 	for device in ${DEVICELIST}
 	do
-		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+		oe_runmake installbin DEVICE="$device" INSTALL_BIN_BASE_DIR=${D}${bindir}
 	done
 }
 
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
index d92ad1c..df41c65 100644
--- a/recipes-bsp/sa-lld/sa-lld_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld_git.bb
@@ -4,15 +4,18 @@ DEPENDS = "common-csl-ip"
 
 include sa-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+PARALLEL_MAKE = ""
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
 #   Now build the lld in the updated directory
-	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+	oe_runmake clean lib
 }
 
 do_install () {
-	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+	oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
 	chown -R root:root ${D}
 
 #   Set the generic device library symbolic link
-- 
2.7.4


