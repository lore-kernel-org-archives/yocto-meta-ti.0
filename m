Return-Path: <ebutera@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95ABBE00717
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:40:57 -0700 (PDT)
Received: by mail-we0-f176.google.com with SMTP id z53so759373wey.35
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=kVAkvS2kCJUP37qyfJsOlFfXSFrX3RAUTPzCbyETI9k=;
	b=iSTTUvoiIWRw8Lv0/VolvK2aRItC8Jh3oyfC3PjLMnXNInPliYOULE8SsK4MgryhId
	heq+jY17kRerddAhAF+68+MDTCkGQz1gvKYc6TJFKnwLYXGp41GDKrV4muAFadmkGZrB
	79rkBBkUqEX0XwBPoSn7ULgK2FrsbAShY/0AN/9CXsyZmMH/ESgUq/5X2TQHw6oCA75R
	gKetMLdqc3zKmnXvxTA/hxJ3D7PVt8ER8j+WGlziDYhN65s5hEX+pJTIK5YxY+NtUxAO
	8XPXyf6yTkXXQP/JxHIRR4sl7K59bF4gXa439IaN6sBu4RXSHJ25oG8HMBEQho9Vji/J
	bFGg==
Received: by 10.180.95.130 with SMTP id dk2mr16351779wib.18.1349912456761;
	Wed, 10 Oct 2012 16:40:56 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id v3sm5459401wiy.5.2012.10.10.16.40.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 16:40:55 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Thu, 11 Oct 2012 01:40:29 +0200
Message-Id: <1349912433-21880-2-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH 2/6] libdrm: enable omap experimental api support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 23:40:58 -0000

This is needed to build gst-plugin-ducati.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
new file mode 100644
index 0000000..5842556
--- /dev/null
+++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
@@ -0,0 +1,3 @@
+COMPATIBLE_MACHINE = "pandaboard"
+
+EXTRA_OECONF += "--enable-omap-experimental-api"
-- 
1.7.9.5


