Return-Path: <jdk@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63371E006B4
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 18:36:04 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9R1a3M8007373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 20:36:03 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9R1a3L7017721
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 20:36:03 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9R1a3jo007882
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 20:36:03 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 26 Oct 2011 20:36:03 -0500
Received: from D620.itg.ti.com (h1-206.vpn.ti.com [172.24.1.206])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9R1a2k9024815;
	Wed, 26 Oct 2011 20:36:02 -0500
From: Jason Kridner <jdk@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 26 Oct 2011 21:36:01 -0400
Message-ID: <1319679361-13741-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] sdcard_image: align partitions with flash pages
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
X-List-Received-Date: Thu, 27 Oct 2011 01:36:04 -0000
Content-Type: text/plain

See
http://sakoman.com/OMAP/a-script-for-partitioningformatting-a-bootable-sdmicrosd-card.html

Signed-off-by: Jason Kridner <jdk@ti.com>
---
 classes/sdcard_image.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 4ebc998..9e4a959 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -46,9 +46,9 @@ IMAGE_CMD_sdimg () {
 	SIZE=$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '{print $5}')
 	CYLINDERS=$(echo $SIZE/255/63/512 | bc)
 	{
-	echo ,9,0x0C,*
-	echo ,,,-
-	} | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
+	echo 128,130944,0x0C,*
+	echo 131072,,,-
+	} | /sbin/sfdisk -D -uS -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
 
 	# Prepare loop devices for boot and filesystem partitions
 	BOOT_OFFSET=32256
-- 
1.7.4.1


