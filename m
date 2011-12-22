Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3447BE006DE
	for <meta-ti@yoctoproject.org>; Thu, 22 Dec 2011 05:00:52 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yhpp56 with SMTP id p56so6670174yhp.35
	for <meta-ti@yoctoproject.org>; Thu, 22 Dec 2011 05:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=r1Ry4cEc3hTyjG//vSpjdB0wUJtjLrB3fVcsPBO6EtY=;
	b=bQpP5sif8xGMOK//CCsyCIk7zQ5SyEjQOd5d+/SKLVW5dbMtcPNQzILrv4JClWO08T
	d/TFUcU9trcyx8FgIpc6vOpBVr4db6U19dopFd/eWl4Ogb5HVXe6fTMauTrhJgsjH9E5
	HJGsO6xxCh2aIHLFDO5Tf4XakZ1Ed6lc8HKTE=
Received: by 10.236.197.105 with SMTP id s69mr14807588yhn.110.1324558851620;
	Thu, 22 Dec 2011 05:00:51 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i22sm14543132yhm.10.2011.12.22.05.00.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:00:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Thu, 22 Dec 2011 13:00:34 +0000
Message-Id: <fcafb8579537d37f861665bb9d8d5afe6a30f527.1324558731.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324558731.git.otavio@ossystems.com.br>
References: <cover.1324558731.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324558731.git.otavio@ossystems.com.br>
References: <cover.1324558731.git.otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 22 Dec 2011 13:00:52 -0000

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


