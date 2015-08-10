Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60A51E00A86; Mon, 10 Aug 2015 10:17:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47EBDE00AC0
	for <meta-ti@yoctoproject.org>; Mon, 10 Aug 2015 10:17:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0F8D852A98; Mon, 10 Aug 2015 17:17:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150810171719.0F8D852A98@arago-project.org>
Date: Mon, 10 Aug 2015 17:17:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with more KS2 and other changes
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
X-List-Received-Date: Mon, 10 Aug 2015 17:17:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 5a5d7ebdf6651b110e021f158f9408e95751af3f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5a5d7ebdf6651b110e021f158f9408e95751af3f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 10 22:57:28 2015 +0000

u-boot-ti-staging: update with more KS2 and other changes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
index d8d72b4..f0bb731 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
-PR = "r2"
+PR = "r3"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2015.07"
 
-SRCREV = "42971a80dc9c7c3161d50f125cd59d8741810a8b"
+SRCREV = "a3d5de9966cc417c221077eaa61ce03b6cb7c8f3"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


