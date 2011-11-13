Return-Path: <pabigot@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDAAEE006EF
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:25:31 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by gyh3 with SMTP id 3so6413370gyh.35
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=t8oJOQ3i9BAHez2HyawB3V4rt8hjpVU8J6dexYTc1FU=;
	b=GUEUaXAKdLaVYPiTokjTXcAm2JzxzvqUYh/5xaxABq+Oz6nKUu51/COdPaYUXNGM73
	VqbODuwkzrnaZ0tBTMRtMqNW1QzYlgmF23Q0KZ4qJJ96TPmxHoFgn/TR0bjIUZp6BA4T
	mSr9P2OLgT0qvnQrqsnDZH9NpSBh5CzBXCtoU=
Received: by 10.236.145.72 with SMTP id o48mr9576652yhj.86.1321208730962;
	Sun, 13 Nov 2011 10:25:30 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id o64sm27059912yhk.3.2011.11.13.10.25.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Nov 2011 10:25:30 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Sun, 13 Nov 2011 12:25:16 -0600
Message-Id: <1321208716-9749-2-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321208716-9749-1-git-send-email-bigotp@acm.org>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 2/2] ti-hw-bringup-image: add sdimg to fstypes
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
X-List-Received-Date: Sun, 13 Nov 2011 18:25:32 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 recipes-misc/images/ti-hw-bringup-image.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 4e708bb..6c7c415 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -38,4 +38,6 @@ IMAGE_LOGIN_MANAGER = "tinylogin shadow"
 
 export IMAGE_BASENAME = "TI-hw-bringup"
 
+IMAGE_FSTYPES += "sdimg"
+
 inherit sdcard_image
-- 
1.7.6.4


