Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6395EE0072B
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:41:47 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-yx0-f176.google.com with SMTP id l9so8234957yen.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=r1Ry4cEc3hTyjG//vSpjdB0wUJtjLrB3fVcsPBO6EtY=;
	b=FrL3deIu7UIFli+5tR+W7vasx3p9Or4koFbZYDgy6P7jJrVXBagNVNva1E9lOjLcXV
	ZboAoD9ov0k8lLcaaJSrD88f0/As0X9f3q04OViCFtZu0bbhAG25H5aRUT0FBjmoLSs1
	M8m/M1j3nDD7rbkJHJcQhfJ+TBPaGBEE2GoRE=
Received: by 10.101.62.4 with SMTP id p4mr10952382ank.63.1322570506476;
	Tue, 29 Nov 2011 04:41:46 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 33sm2938343ano.1.2011.11.29.04.41.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:41:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Tue, 29 Nov 2011 12:41:30 +0000
Message-Id: <548e14f7f14ece36e4b9f88a0e7f545cae864da1.1322570446.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1322570446.git.otavio@ossystems.com.br>
References: <cover.1322570446.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1322570446.git.otavio@ossystems.com.br>
References: <cover.1322570446.git.otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] ti-hw-bringup-image: adapt to newer sdcard_image class
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
X-List-Received-Date: Tue, 29 Nov 2011 12:41:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-misc/images/ti-hw-bringup-image.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 4e708bb..4c16301 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -38,4 +38,7 @@ IMAGE_LOGIN_MANAGER = "tinylogin shadow"
 
 export IMAGE_BASENAME = "TI-hw-bringup"
 
+ROOTFS = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
+IMAGE_FSTYPES = "ext3"
+
 inherit sdcard_image
-- 
1.7.2.5


