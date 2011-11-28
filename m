Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5339BE0072C
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 12:57:15 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-gy0-f176.google.com with SMTP id g2so7651979ghb.35
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 12:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=r1Ry4cEc3hTyjG//vSpjdB0wUJtjLrB3fVcsPBO6EtY=;
	b=GCGpAyiz3AmZBSNuWtH9fIKJ0ohV2vykFf2giJ77EciEwHWCTNQbFNTHNyjcGgXRUT
	V+0MbkxkLGc5Kkbu30ySlddYbF5w+J+tKdprgCaLfTzDX/nA4mtxb+vng7quZVLXsfD+
	KrnFj2+yAws//TyhYrFUGqebrhFD9qIqh6sVU=
Received: by 10.236.161.103 with SMTP id v67mr64950010yhk.87.1322513835098;
	Mon, 28 Nov 2011 12:57:15 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i67sm52634396yhm.16.2011.11.28.12.57.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 12:57:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Mon, 28 Nov 2011 20:56:59 +0000
Message-Id: <1322513820-28317-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
References: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
X-Mailman-Approved-At: Mon, 28 Nov 2011 12:59:21 -0800
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] ti-hw-bringup-image: adapt to newer sdcard_image class
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
X-List-Received-Date: Mon, 28 Nov 2011 20:57:15 -0000

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


