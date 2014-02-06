Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B03CCE00303
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 18:53:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 549EA52AA9; Thu,  6 Feb 2014 02:53:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140206025300.549EA52AA9@arago-project.org>
Date: Thu,  6 Feb 2014 02:53:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with many fixes for the upcoming release
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
X-List-Received-Date: Thu, 06 Feb 2014 02:53:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6e850e49afe3b83a8f34e3d3234d6e6c90e981da
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6e850e49afe3b83a8f34e3d3234d6e6c90e981da

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Feb  5 18:29:49 2014 -0500

u-boot-ti-staging: update with many fixes for the upcoming release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index af17f96..efaa2a2 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,14 +5,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r3+gitr${SRCPV}"
+PR = "r4+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
-# Corresponds to ti2013.12.00 release
-SRCREV = "562aa886438ea60cda487565b548b71407eaca26"
+SRCREV = "ab011b4e3316c716106d2efc1e451af17f49ca75"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


