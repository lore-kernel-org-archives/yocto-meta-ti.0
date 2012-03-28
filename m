Return-Path: <tom.rini@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3177E00747
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:58 -0700 (PDT)
Received: by mail-gy0-f176.google.com with SMTP id z10so1247338ghb.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ANpIw97X5QJ+ASuEtzKQXzISDt50lMx+JVciHZCKoiQ=;
	b=ONzsgJxmTXYj4RON7VS1ZCYyNF0ZfPM4QmKfKiY7FqjUbvV3dYchiNjbYwajheheuw
	eKhozsUDHX5q1HYCK8/ru8LddS3vq0TE50PtAonNwTfE8b8NMqdLq+1z6SVxmK7dAz2Q
	nYyWKoGuHJvx2rz24r+p6AWeGX2VBNFzb3/yg3RytLxORnxGGhaQCaCiIxWWZta/IiU6
	pUvcO0KtfQpMPK3j6G0V/Qd+d0JAFrP7oUxFWvnk/L5REw0Vyn+v7DUMMW3P7AW/+53M
	f1kHGhvATRalTeIgBmBM1DfNByFXvKCM+SvjBOrVx2yBmQyx0DTeG/Rq/9uW52rh1mrO
	9avA==
Received: by 10.60.24.170 with SMTP id v10mr40555629oef.60.1332958498629;
	Wed, 28 Mar 2012 11:14:58 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:57 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:42 -0700
Message-Id: <1332958485-967-7-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 07/10] ti816x.inC: Use '=+' not '+=' in IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 28 Mar 2012 18:14:59 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/include/ti816x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
index 2fe4006..01b560c 100644
--- a/conf/machine/include/ti816x.inc
+++ b/conf/machine/include/ti816x.inc
@@ -20,7 +20,7 @@ UBOOT_LOADADDRESS = "0x80008000"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # Ship all kernel modules
-IMAGE_FSTYPES += "jffs2 tar.bz2"
+IMAGE_FSTYPES =+ "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
 SERIAL_CONSOLE = "115200 ttyO2"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4


