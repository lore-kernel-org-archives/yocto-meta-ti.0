Return-Path: <ebutera@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B4C7E01489
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:27 -0700 (PDT)
Received: by mail-wi0-f176.google.com with SMTP id hn14so127076wib.11
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nG5WvRaIAL0vDwc9VYNebGZ3QaX+obYOY6OsgFVC/+Y=;
	b=t7nQoCF70m7NQHNNsKpCVEKYwopwMbEuOyyCliJMVG6jll+wAGputfQv2JlsbKlHvM
	gSaCrFRwVh1TG33WIOTRbE8BVnePb5z80V9+wdi2VjkYClKdiXTyhOd4YzTcg8b+STCG
	zAPoaGNMNwSF1B43+zbgJcJU+a4Tf4M9pcQ9KwIErdsstHKt2D51GIWWoiWo2iUDkynq
	YyqhuxaoUhLjM2WZuZJAhwyxbtXvJKeTB8iASQMp1vcSYDUFVKANs2EQ4GHeBgg9LW+T
	WjE6ldGIGXnXA4yU3Q6IorxqaTQX5IueYEc+jxh6FxdrQVezxdOwHvJnKsxbLJdonNxR
	DeBA==
Received: by 10.216.194.205 with SMTP id m55mr3091134wen.79.1350069983596;
	Fri, 12 Oct 2012 12:26:23 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id dm3sm5296065wib.3.2012.10.12.12.26.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 12:26:23 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2012 21:26:08 +0200
Message-Id: <1350069972-21318-2-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH v2 2/6] libdrm: enable omap experimental api support
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
X-List-Received-Date: Fri, 12 Oct 2012 19:26:27 -0000

This is needed to build gst-plugin-ducati.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend

diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
new file mode 100644
index 0000000..d0c1a77
--- /dev/null
+++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
@@ -0,0 +1,3 @@
+COMPATIBLE_MACHINE = "omap4|omap5"
+
+EXTRA_OECONF += "--enable-omap-experimental-api"
-- 
1.7.9.5


