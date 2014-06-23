Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE74DE00511; Mon, 23 Jun 2014 09:41:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD158E00509
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:41:21 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 432FC529F2; Mon, 23 Jun 2014 16:41:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623164121.432FC529F2@arago-project.org>
Date: Mon, 23 Jun 2014 16:41:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : u-boot-ti-staging:_2013.10: Update to pull in critical fixes
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
X-List-Received-Date: Mon, 23 Jun 2014 16:41:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 5f5ce539b9efe9bdbc096b71b60f5fadaa5f5ab4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5f5ce539b9efe9bdbc096b71b60f5fadaa5f5ab4

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Wed Jun 11 19:54:07 2014 +0000

u-boot-ti-staging:_2013.10: Update to pull in critical fixes

* Critical fixes have been added to the ti-u-boot-2013.10 branch for AM4x.
* Update commit id to point to this new commit.
* For all other platforms nothing should have changed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index b8f5ce6..d954db4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r7+gitr${SRCPV}"
+PR = "r8+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
-# Corresponds to tag ti2013.12.01
-SRCREV = "78d8ebd4a0214b72a125f5b98c5ed2f9a3e5e783"
+# Corresponds to tag ti2013.12.01_amsdk-07.01
+SRCREV = "259ff9a577cc66cb40e3cdff3e41628e466f0fef"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


