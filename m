Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25691E00738
	for <meta-ti@yoctoproject.org>; Thu, 22 Dec 2011 05:00:54 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-yw0-f48.google.com with SMTP id p56so6670174yhp.35
	for <meta-ti@yoctoproject.org>; Thu, 22 Dec 2011 05:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wVjhCr8eZdPC1gLI+cl76uiQC96gaGHP0jGKsC4VVN4=;
	b=lvzKpyLf6bot6aW63W6mvOwHm8LwkPMkzgc3UeEFMcoG3vO75Eh2qgwzwsY0TfX0Jh
	tEQz9+Ez0ziltmpyQtI42QzAI6tIud1P5icYkrPd1cu6fz2A+71t4TJ22d55cr170aAF
	FBGA0PuxNXLdpUbF2pK3dY9fYpapE7jMwzdJc=
Received: by 10.236.73.230 with SMTP id v66mr14878047yhd.61.1324558853986;
	Thu, 22 Dec 2011 05:00:53 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i22sm14543132yhm.10.2011.12.22.05.00.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:00:53 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Thu, 22 Dec 2011 13:00:35 +0000
Message-Id: <9e58454b8203539c4a163cf3ce6bb384e2a0af10.1324558731.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324558731.git.otavio@ossystems.com.br>
References: <cover.1324558731.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324558731.git.otavio@ossystems.com.br>
References: <cover.1324558731.git.otavio@ossystems.com.br>
Subject: [PATCH v3 3/3] cloud9-image: adapt to newer sdcard_image class
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
X-List-Received-Date: Thu, 22 Dec 2011 13:00:54 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-misc/images/cloud9-image.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 826dc93..7214d91 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -4,8 +4,6 @@ require ti-hw-bringup-image.bb
 
 FATPAYLOAD = "${datadir}/beaglebone-getting-started/*"
 
-ROOTFSTYPE_beaglebone = "ext4"
-
 IMAGE_INSTALL += " \
 	cloud9 \
 	task-sdk-target \
@@ -27,5 +25,7 @@ IMAGE_INSTALL += " \
 	nodejs-dev \
 "
 
-export IMAGE_BASENAME = "Cloud9-IDE"
+ROOTFS_beaglebone = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4"
+IMAGE_FSTYPES_beaglebone= "ext4"
 
+export IMAGE_BASENAME = "Cloud9-IDE"
-- 
1.7.2.5


