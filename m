Return-Path: <pabigot@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08A62E0030B
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 11:47:33 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yenq10 with SMTP id q10so2287833yen.35
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 11:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=oVDw+vEMMktuwAZrgq0blXgFQbCKYgwDoOJfEYH6rrk=;
	b=qhFULSeijWWTUO2+ta8/4ycb5hRZUc9DnWLriTLyqhVQljlJq3NqPIUnlQ743Dygnn
	uZ+t9xNKCDNjiT6L7o/YP24jSwPE2fxH4oHWCG2FCisVeTthriMhC77RWQklvi7O07Mw
	1QTY8YOB1jqpOnvK4LkcLc5H1BXriklJP6ulQ=
Received: by 10.50.213.40 with SMTP id np8mr14169140igc.10.1321040852634;
	Fri, 11 Nov 2011 11:47:32 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id fu10sm9472033igc.6.2011.11.11.11.47.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 11:47:31 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Fri, 11 Nov 2011 13:47:16 -0600
Message-Id: <1321040836-29819-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH] sdcard_image bbclass: correct MLO path in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Fri, 11 Nov 2011 19:47:34 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

The symlink created by x-load.inc for MLO in ${DEPLOY_DIR_IMAGE} includes
${MACHINE}.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 classes/sdcard_image.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 531b419..6c933f9 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -29,6 +29,9 @@ IMAGEDATESTAMP = "${@time.strftime('%Y.%m.%d',time.gmtime())}"
 # Files and/or directories to be copied into the vfat partition
 FATPAYLOAD ?= ""
 
+# Match meta-ti x-load.inc link names
+MLO_SYMLINK ?= "MLO-${MACHINE}"
+
 IMAGE_CMD_sdimg () {
 	SDIMG=${WORKDIR}/sd.img
 
@@ -93,7 +96,7 @@ IMAGE_CMD_sdimg () {
 	if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
 		cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot 
 	else
-		cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
+		cp -v ${DEPLOY_DIR_IMAGE}/${MLO_SYMLINK} ${WORKDIR}/tmp-mnt-boot/MLO
 	fi
 
 	# Check for u-boot SPL
-- 
1.7.6.4


