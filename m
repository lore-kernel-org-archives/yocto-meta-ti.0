Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E301E00736
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 12:57:18 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by ywp31 with SMTP id 31so7023542ywp.35
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 12:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=wVjhCr8eZdPC1gLI+cl76uiQC96gaGHP0jGKsC4VVN4=;
	b=l8n7cRxU2pTX9LsIZEJ1+ZQj5om8uKVSDlJi4+36ncWuB24dm7R9lPVOE9pff2wpKT
	WLP6kqjkmIXmkFhfKDtcHIZPHupJhoIKeAdZL9kOyTjSDOdYNIMhBMfOARXb1tLnK/dg
	eAcsKrfmoBbicS7E67nGb+quIzmKEfhl+czSA=
Received: by 10.236.79.38 with SMTP id h26mr65328761yhe.39.1322513837400;
	Mon, 28 Nov 2011 12:57:17 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i67sm52634396yhm.16.2011.11.28.12.57.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 12:57:16 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Mon, 28 Nov 2011 20:57:00 +0000
Message-Id: <1322513820-28317-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
References: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
X-Mailman-Approved-At: Mon, 28 Nov 2011 12:59:21 -0800
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] cloud9-image: adapt to newer sdcard_image class
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
X-List-Received-Date: Mon, 28 Nov 2011 20:57:18 -0000

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


