Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BA40E00A55
	for <meta-ti@yoctoproject.org>; Thu,  6 Mar 2014 11:04:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0504A52A0A; Thu,  6 Mar 2014 19:04:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140306190430.0504A52A0A@arago-project.org>
Date: Thu,  6 Mar 2014 19:04:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with QSPI fixes
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
X-List-Received-Date: Thu, 06 Mar 2014 19:04:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: d343e3021c8c85b0defd635ae68b71ba60648e1d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d343e3021c8c85b0defd635ae68b71ba60648e1d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar  6 13:00:58 2014 -0500

u-boot-ti-staging: update with QSPI fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index 9a95cc3..b8f5ce6 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,13 +5,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r6+gitr${SRCPV}"
+PR = "r7+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
-SRCREV = "f2dcae2f9e9434392673fea7584641afa98f4232"
+# Corresponds to tag ti2013.12.01
+SRCREV = "78d8ebd4a0214b72a125f5b98c5ed2f9a3e5e783"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


