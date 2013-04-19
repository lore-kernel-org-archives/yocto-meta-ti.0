Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC68BE0146C
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 17:16:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D76F952981; Fri, 19 Apr 2013 00:16:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130419001636.D76F952981@arago-project.org>
Date: Fri, 19 Apr 2013 00:16:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update to the latest
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
X-List-Received-Date: Fri, 19 Apr 2013 00:16:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 25e974f3be5a3259b4a057aaa6a25e6c83f6d7d6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=25e974f3be5a3259b4a057aaa6a25e6c83f6d7d6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 18 16:06:49 2013 -0400

u-boot-ti-staging: update to the latest

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index 4659fe9..685dcd0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -2,12 +2,12 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-PR = "r3+gitr${SRCPV}"
+PR = "r4+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.01.01"
 
-SRCREV = "9aab8612f643ab90df837e743f5435bba2ae68cf"
+SRCREV = "7552b4c906b0a50fbc5225dc43ed0192618e9d5d"
 
 SPL_BINARY = "MLO"


