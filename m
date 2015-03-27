Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C791EE0097E; Fri, 27 Mar 2015 09:49:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6125E0091F
	for <meta-ti@yoctoproject.org>; Fri, 27 Mar 2015 09:49:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 98A6A52A78; Fri, 27 Mar 2015 16:49:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150327164913.98A6A52A78@arago-project.org>
Date: Fri, 27 Mar 2015 16:49:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with x15 fixes
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
X-List-Received-Date: Fri, 27 Mar 2015 16:49:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 131ec72713ee5065107ce73cb5002861ba701b4b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=131ec72713ee5065107ce73cb5002861ba701b4b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Mar 27 12:46:40 2015 -0400

u-boot-ti-staging: update with x15 fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
index 65b092a..25201d7 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
@@ -8,13 +8,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2014.07"
-PR = "r8+gitr${SRCPV}"
+PR = "r9+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2014.07"
 
-SRCREV = "b376eda1caae974c38f9138ba3e79868d34e3634"
+SRCREV = "67b4cea8897cef6797549c8fa1f89ee7e36b6cdd"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


