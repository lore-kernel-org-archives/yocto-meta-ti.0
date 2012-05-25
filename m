Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A23BE01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 00:31:55 -0700 (PDT)
Received: by eaab16 with SMTP id b16so144659eaa.35
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 00:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7j7dGX6R1k8A2xKqafMpB/ykiS/ZHpeLomGX777OMv4=;
	b=WsOEJWBaj8QQOBeH11HSVbOX2bWzyYCQ6yFOC4IHDBclg/09Hj69DTS4TQp+ou1sVU
	8ZE5GBvIZFsO1Wnu0MU8ilnTmsEwVoEv2recFxlQQal+nAkD3SSsH3eoPDrPrwWUgDSF
	LglhC50ZZHk1ALblIf1Fy4il4AAMh7QROar56Z9mnWHvW9tuXRichTUjzDJVZ91IRTab
	kZJgEvW4tWEWDBwCDHA+zinK0aDgpgaFt1iy8UMomAKXfDtFkahoXm5nbhb4traD4/gM
	rJcWq+TNUfVh8suLiHiofIUGJ+xiQx1/Alm5lY0SKgjUy5y76tz+KpKBvTFtrmXCGix3
	8upQ==
Received: by 10.14.40.84 with SMTP id e60mr451763eeb.75.1337931114753;
	Fri, 25 May 2012 00:31:54 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id g51sm3959645eea.14.2012.05.25.00.31.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 00:31:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Fri, 25 May 2012 09:31:47 +0200
Message-Id: <1337931107-21227-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnenLRfnS5Jl4jtEbOxpMsDvyjKOeafShpXFaDRqpadonVfK6yLQJk7MvpBYoJgP2rdc+xU
Cc: denys@ti.com
Subject: [PATCH] ti-hw-bringup-image: disable sdcard image class
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
X-List-Received-Date: Fri, 25 May 2012 07:31:56 -0000

The class breaks with the current genext2fs in oe-core.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/ti-hw-bringup-image.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 2be8baf..9490098 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -29,4 +29,5 @@ IMAGE_INSTALL += " \
 
 export IMAGE_BASENAME = "TI-hw-bringup"
 
-inherit sdcard_image
+# This doesn't work with the current genext2fs in oe-core
+# inherit sdcard_image
-- 
1.7.10


