Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD981E00C22; Fri, 23 Sep 2016 13:11:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3618 seconds by postgrey-1.32 at yocto-www;
	Fri, 23 Sep 2016 13:11:27 PDT
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1D7CE00944
	for <meta-ti@yoctoproject.org>; Fri, 23 Sep 2016 13:11:27 -0700 (PDT)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173025.ctn.ui.verizon.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014))
	with ESMTPA id <0ODZ008UH194ZPD0@vms173025.ctn.ui.verizon.net> for
	meta-ti@yoctoproject.org; Fri, 23 Sep 2016 14:10:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=pYKKlMWVO-xHlzx-UPcA:9
Received: by 100.15.110.130 with SMTP id 08a5c647;
	Fri, 23 Sep 2016 19:10:31 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 12F0A16212C;	Fri, 23 Sep 2016 15:10:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Sep 2016 15:10:14 -0400
Message-id: <1474657814-14066-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot-ti-staging: don't replace MLO with HS_ISSW for am335x HS platform
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
X-List-Received-Date: Fri, 23 Sep 2016 20:11:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 73f9643..9cf8a83 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r17"
+PR = "r18"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
@@ -53,13 +53,6 @@ do_compile_append_am437x-hs-evm () {
 	fi
 }
 
-do_compile_append_am335x-hs-evm () {
-	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
-		rm -rf ${S}/MLO
-		cp ${S}/u-boot-spl_HS_ISSW ${S}/MLO
-	fi
-}
-
 do_install_append () {
 	if [ -f ${S}/${UBOOT_HS_XLD_BINARY} ]; then
 		install ${S}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
-- 
2.7.4


