Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92E90E00AB7; Mon, 17 Aug 2015 10:36:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 115E7E006CD
	for <meta-ti@yoctoproject.org>; Mon, 17 Aug 2015 10:35:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B3E0752A8F; Mon, 17 Aug 2015 17:35:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150817173558.B3E0752A8F@arago-project.org>
Date: Mon, 17 Aug 2015 17:35:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with recent fixes
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
X-List-Received-Date: Mon, 17 Aug 2015 17:36:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 4c87928b1ae91fb8e9c9494a140d4e9b152affcd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4c87928b1ae91fb8e9c9494a140d4e9b152affcd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 17 22:58:24 2015 +0000

u-boot-ti-staging: update with recent fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
index f0bb731..a928ef0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
-PR = "r3"
+PR = "r4"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2015.07"
 
-SRCREV = "a3d5de9966cc417c221077eaa61ce03b6cb7c8f3"
+SRCREV = "e22bd9012ff5785bb1a595721c39a63c2ae78896"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


