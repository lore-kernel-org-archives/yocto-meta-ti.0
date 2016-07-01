Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72FB6E00948; Fri,  1 Jul 2016 10:22:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Fri, 01 Jul 2016 10:21:57 PDT
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2571E006D2
	for <meta-ti@yoctoproject.org>; Fri,  1 Jul 2016 10:21:57 -0700 (PDT)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9N00GPZ9G9OD70@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 01 Jul 2016 11:21:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=BqyuWq1cRvuZ3E6wp3YA:9
Received: by 100.15.86.14 with SMTP id 022d06ca; Fri, 01 Jul 2016 16:21:45 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id EEB9B1620A0;	Fri,  1 Jul 2016 12:21:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 01 Jul 2016 12:21:25 -0400
Message-id: <1467390085-4725-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] uio-module-drv-test: replace machine override with SOC override
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
X-List-Received-Date: Fri, 01 Jul 2016 17:22:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

This package is now used for multiple omap-a15 SOCs, having only single machine
covered in overrides breaks other machines.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 197b36f..8303efe 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
 
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "keystone|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEVICE_NAME_am57xx-evm = "am57xx"
+DEVICE_NAME_omap-a15 = "am57xx"
 DEVICE_NAME_keystone = "keystone"
 RDEPENDS_${PN} = "uio-module-drv"
 
@@ -25,6 +25,6 @@ do_install_append_keystone () {
 	install -c -m 755 ${S}/test/uio_cic2_int_multithread_test ${D}${bindir}/.
 }
 
-do_install_append_am57xx-evm () {
+do_install_append_omap-a15 () {
 	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
 }
-- 
2.7.4


