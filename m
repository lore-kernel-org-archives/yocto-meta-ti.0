Return-Path: <cbrake@hq.bec-systems.com>
Received: from happy.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net
	[69.34.21.229])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83E2DE013FF
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 14:48:46 -0700 (PDT)
Received: from cbrake by happy.bec-systems.com with local (Exim 4.72)
	(envelope-from <cbrake@hq.bec-systems.com>)
	id 1SSbE4-0007md-RO; Thu, 10 May 2012 17:48:44 -0400
From: Cliff Brake <cliff.brake@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 17:48:19 -0400
Message-Id: <1336686499-29891-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] u-boot 2011.12: add directory prefix to patch URIs
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 21:48:46 -0000

From: Cliff Brake <cbrake@bec-systems.com>


Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 recipes-bsp/u-boot/u-boot_2011.12.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 39f77bd..45c64a6 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -30,9 +30,9 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            ${CACHEFIX} \
            file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
            file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
-           file://0011-ext2load-increase-read-speed.patch \
-           file://0012-ext4fs-ls-load-support.patch \
-           file://0013-beagleboard-switch-mmcroots-to-ext4.patch \
+           file://2011.12/0011-ext2load-increase-read-speed.patch \
+           file://2011.12/0012-ext4fs-ls-load-support.patch \
+           file://2011.12/0013-beagleboard-switch-mmcroots-to-ext4.patch \
            ${FWENV} \
           "
 
-- 
1.7.1


