Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E665BE013D6
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:05:22 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-yx0-f176.google.com with SMTP id m10so1818178yen.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wVjhCr8eZdPC1gLI+cl76uiQC96gaGHP0jGKsC4VVN4=;
	b=EwWke9GWTAASft+5SdUumr+LhuWhM8br1YF60UsUX5tQ6vo5vQd/x7fwCLVEXYJ+lF
	QowlYuUMhvTK5u6Io6wDb6LoImyvlzAzjr94l5Yk5Pk1Fg+ZFyYXguTkWpd2cLBhxYle
	+57mCnh4YGN0QnIKTWZ71bTrsHytu+KMKyRnM=
Received: by 10.236.149.243 with SMTP id x79mr5475309yhj.92.1323961522764;
	Thu, 15 Dec 2011 07:05:22 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i4sm9326685yhk.21.2011.12.15.07.05.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 07:05:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Thu, 15 Dec 2011 15:05:04 +0000
Message-Id: <70b1d6b86e2f91d5eddaf867de70cd31980a95e3.1323961434.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323961434.git.otavio@ossystems.com.br>
References: <cover.1323961434.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323961434.git.otavio@ossystems.com.br>
References: <cover.1323961434.git.otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 15 Dec 2011 15:05:23 -0000

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


