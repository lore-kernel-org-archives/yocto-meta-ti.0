Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19849E0072F
	for <meta-ti@yoctoproject.org>; Tue,  8 Jan 2013 21:28:35 -0800 (PST)
Received: by mail-pa0-f43.google.com with SMTP id fb10so796385pad.2
	for <meta-ti@yoctoproject.org>; Tue, 08 Jan 2013 21:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=AZgJ7hTPpzCXTunnk0k4/O2ZWJDvaQkJ2WutWs0eBjg=;
	b=HyumTjhKGhEs/xekM1HCuMf3sKcHpeO26udntHtfSwYXDT6gQjYb3+8anoai8R8GKv
	2t+UkIFDcOYMz45iZDsR4cxExQxjTQjeYMb19V7L8llXw/HcpsXZemaklCLj3aSPJSJK
	uIbk0ROSL4Uo4/2vZM7rTB8E0HgmSczahliwNxm7xo47yDq5eIbfOfQQY4+uOVcz742q
	ZcwAyadaDGb1jQqPNq5BpelGyzCJapgEZ4yLWFDs2eNoz+1ICJnSLepPoGJUiKYtomDG
	sPq6NRG4eWFBHy95nnRnqlQvphldp2UrrW1p6kj2/AU9qR9hvAhWF5VWs50sJCQ5pEqI
	rSmg==
X-Received: by 10.68.137.167 with SMTP id qj7mr203726607pbb.148.1357709314941; 
	Tue, 08 Jan 2013 21:28:34 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id qt3sm40947317pbb.32.2013.01.08.21.28.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 21:28:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  8 Jan 2013 21:28:17 -0800
Message-Id: <1357709297-11918-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] mesa-dri: Move bbappend from 8.0.4 -> 8.0.5 to match OE-Core
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
X-List-Received-Date: Wed, 09 Jan 2013 05:28:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-graphics/mesa/mesa-dri_8.0.4.bbappend |    1 -
 recipes-graphics/mesa/mesa-dri_8.0.5.bbappend |    1 +
 2 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 100644 recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
 create mode 100644 recipes-graphics/mesa/mesa-dri_8.0.5.bbappend

diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend b/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
deleted file mode 100644
index 164ec1b..0000000
--- a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend b/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
-- 
1.7.9.5


