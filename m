Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E83EDE00D44; Fri, 23 Sep 2016 15:47:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 953C1E00951
	for <meta-ti@yoctoproject.org>; Fri, 23 Sep 2016 15:47:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 68EF2529E6; Fri, 23 Sep 2016 22:47:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160923224712.68EF2529E6@arago-project.org>
Date: Fri, 23 Sep 2016 22:47:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: don' t replace MLO with HS_ISSW for am335x HS platform
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
X-List-Received-Date: Fri, 23 Sep 2016 22:47:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 69fd10ee8cc9f423e5092d35b47dfa3e52872545
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=69fd10ee8cc9f423e5092d35b47dfa3e52872545

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 24 01:10:14 2016 +0000

u-boot-ti-staging: don't replace MLO with HS_ISSW for am335x HS platform

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

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


