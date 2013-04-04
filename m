Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C9F4E01510
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 17:26:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1A1A652A35; Thu,  4 Apr 2013 00:26:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130404002606.1A1A652A35@arago-project.org>
Date: Thu,  4 Apr 2013 00:26:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update SRCREV for more omap5 changes , bump PR
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
X-List-Received-Date: Thu, 04 Apr 2013 00:26:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 362c3cf9bb6740853c67d3aef551dc5facaf3089
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=362c3cf9bb6740853c67d3aef551dc5facaf3089

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Apr  3 18:40:07 2013 -0400

u-boot-ti-staging: update SRCREV for more omap5 changes, bump PR

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index f6cbeee..cf01bd0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -2,12 +2,12 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.01.01"
 
-SRCREV = "24043d3b0b6d54b4f73263903499fd3e63980830"
+SRCREV = "9aab8612f643ab90df837e743f5435bba2ae68cf"
 
 SPL_BINARY = "MLO"


