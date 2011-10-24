Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3082E006D1
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 21:15:26 -0700 (PDT)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9O4FPor027259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9O4FPTG024109
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9O4FP6W002913
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sun, 23 Oct 2011 23:15:25 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9O4FLiu023860;	Sun, 23 Oct 2011 23:15:25 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 23 Oct 2011 22:59:21 -0500
Message-ID: <1319428763-9677-2-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
References: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: [PATCH meta-ti 1/3] sdcard_image: Copy uEnv.txt once again as the new bonetester also checks for GPIO grounding
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
X-List-Received-Date: Mon, 24 Oct 2011 04:15:27 -0000
Content-Type: text/plain

Reverted commit: 6743f427e7fccf9c5f5a262d982da339f69582cf

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 classes/sdcard_image.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 0c9f457..1570d37 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -93,8 +93,7 @@ IMAGE_CMD_sdimg () {
 		suffix=bin
 	fi
 
-	#cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true
-	cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true
+	cp -v ${IMAGE_ROOTFS}/boot/{user.txt,uEnv.txt} ${WORKDIR}/tmp-mnt-boot || true
 
 	if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
 		cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${WORKDIR}/tmp-mnt-boot || true
-- 
1.7.0.4


