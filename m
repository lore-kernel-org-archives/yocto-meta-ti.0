Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EF5FE0078E; Fri, 10 Oct 2014 14:28:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECB1CE007DC
	for <meta-ti@yoctoproject.org>; Fri, 10 Oct 2014 14:27:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9E5D752A88; Fri, 10 Oct 2014 21:27:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141010212756.9E5D752A88@arago-project.org>
Date: Fri, 10 Oct 2014 21:27:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with latest fixes
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
X-List-Received-Date: Fri, 10 Oct 2014 21:28:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 80924d3bba59d6920217216c73af43fdd40d0152
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=80924d3bba59d6920217216c73af43fdd40d0152

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Oct 11 02:53:13 2014 +0000

u-boot-ti-staging: update with latest fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
index a020299..d6343b5 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
@@ -8,13 +8,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2014.07"
-PR = "r2+gitr${SRCPV}"
+PR = "r3+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2014.07"
 
-SRCREV = "00ddc45a9cbecb0f70fecdecf7f31bc1d5602dc0"
+SRCREV = "8f725ef650595fa23b1cf6fccd20389ec029e2dd"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


