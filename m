Return-Path: <joelagnel@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB412E0030F
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 07:31:25 -0800 (PST)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAFFVOX3015862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 09:31:24 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAFFVO7h008098
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 09:31:24 -0600 (CST)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAFFVOUg022653
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 09:31:24 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 15 Nov 2011 09:31:23 -0600
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pAFFVMEc000464;	Tue, 15 Nov 2011 09:31:23 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 15 Nov 2011 09:32:50 -0600
Message-ID: <1321371170-7277-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] sdcard_image: Add image version info to root fs
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
X-List-Received-Date: Tue, 15 Nov 2011 15:31:25 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 classes/sdcard_image.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 531b419..14c2cb6 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -121,6 +121,8 @@ IMAGE_CMD_sdimg () {
 		done
 	fi
 
+	echo "${IMAGE_NAME}-${IMAGEDATESTAMP}" > ${IMAGE_ROOTFS}/etc/image-version-info
+
 	# Cleanup VFAT mount
 	echo "Cleaning up VFAT mount"
 	umount ${WORKDIR}/tmp-mnt-boot
-- 
1.7.0.4


