Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC435E0140C
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6F74852A46; Fri, 11 May 2012 01:54:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015459.6F74852A46@arago-project.org>
Date: Fri, 11 May 2012 01:54:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : sdcard_image bbclass: make ext4 the default
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
X-List-Received-Date: Fri, 11 May 2012 01:55:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7b8b1fe4b8c56593faeb19413adf44d2acbd730d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7b8b1fe4b8c56593faeb19413adf44d2acbd730d

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri May  4 08:40:01 2012 +0200

sdcard_image bbclass: make ext4 the default

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 classes/sdcard_image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 519bd9a..f9b8d46 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -19,7 +19,7 @@ LOOPDEV_FS ?= "/dev/loop3"
 SDIMG_SIZE ?= "444" 
 
 # FS type for rootfs
-ROOTFSTYPE ?= "ext3"
+ROOTFSTYPE ?= "ext4"
 
 BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
 BOOTPARTNAME ?= "${MACHINE}"


