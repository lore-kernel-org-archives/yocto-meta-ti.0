Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9291DE013D4
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:05:20 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-yx0-f176.google.com with SMTP id m10so1818138yen.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=r1Ry4cEc3hTyjG//vSpjdB0wUJtjLrB3fVcsPBO6EtY=;
	b=sl10P7h5D0MSpByWu5bSs/nT+B8pqARHgSZheaAHoyLdOAL1RZi2sgym20MFAiZq1H
	L5z2OaHv+kf9C+9zeEe1s2hlJBN2t9dYdi4aGkh7xzJOz1QiYcVFIdkTqFeJjH/QgNA9
	9IW7aqQ6p9n4HNVAaDDN9MEDM4ng3yETIMNnE=
Received: by 10.236.77.232 with SMTP id d68mr5266921yhe.98.1323961520386;
	Thu, 15 Dec 2011 07:05:20 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i4sm9326685yhk.21.2011.12.15.07.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 07:05:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Thu, 15 Dec 2011 15:05:03 +0000
Message-Id: <4709e3898afa7b8dd0f6aee58f178cdbec862d69.1323961434.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323961434.git.otavio@ossystems.com.br>
References: <cover.1323961434.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323961434.git.otavio@ossystems.com.br>
References: <cover.1323961434.git.otavio@ossystems.com.br>
Subject: [PATCH v3 2/3] ti-hw-bringup-image: adapt to newer sdcard_image class
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
X-List-Received-Date: Thu, 15 Dec 2011 15:05:20 -0000

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


