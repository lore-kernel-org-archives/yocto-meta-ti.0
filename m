Return-Path: <jdk@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B9DDE00305
	for <meta-ti@yoctoproject.org>; Thu,  3 Nov 2011 14:34:47 -0700 (PDT)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA3LYkT2010237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Thu, 3 Nov 2011 16:34:46 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA3LYkSA013596
	for <meta-ti@yoctoproject.org>; Thu, 3 Nov 2011 16:34:46 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA3LYkoK024847
	for <meta-ti@yoctoproject.org>; Thu, 3 Nov 2011 16:34:46 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 3 Nov 2011 16:34:46 -0500
Received: from D620.itg.ti.com (h114-113.vpn.ti.com [172.24.114.113])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA3LYjH0012361;
	Thu, 3 Nov 2011 16:34:45 -0500
From: Jason Kridner <jdk@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 3 Nov 2011 17:34:44 -0400
Message-ID: <1320356084-4206-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] sdimage_class: eliminate 2GB exception for BeagleBone
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
X-List-Received-Date: Thu, 03 Nov 2011 21:34:47 -0000
Content-Type: text/plain

Gerald has said his supply of 2GB SD cards for BeagleBone has
gone away, so we are back to 4GB cards.  No more need for this
exeption:

Signed-off-by: Jason Kridner <jdk@ti.com>
---
 classes/sdcard_image.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 45dc54d..e3edf61 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -12,9 +12,8 @@ LOOPDEV ?= "/dev/loop1"
 LOOPDEV_BOOT ?= "/dev/loop2"
 LOOPDEV_FS ?= "/dev/loop3"
 
-# Default to 4GiB images, but use 2GiB images for beaglebone
+# Default to 4GiB images
 SDIMG_SIZE ?= "444" 
-SDIMG_SIZE_beaglebone = "222"
 
 BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
 BOOTPARTNAME ?= "${MACHINE}"
-- 
1.7.4.1


