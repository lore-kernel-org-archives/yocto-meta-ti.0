Return-Path: <tom.rini@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2545AE00596
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:36:59 -0700 (PDT)
Received: by yenq4 with SMTP id q4so3808308yen.35
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=SYAV11TItQsn2FuiqRbNCviIa+5ag7unmx4iQzE/TyA=;
	b=cXLGx0lkX+31mp1spE1KX2IUJMEKYfF+5xwQ8Im5vezftxLVdqtJ9rO11uKGqokE8r
	kU2J9ZpWHI4wF40UWM1lRncnPI8ZbLY6yN8G8qbItHGdWandg8dPvCkuZLGuOuakiov7
	SeLIL2idDcKpGokhrkXL9VBXAmF33b48nnUjgGJ3twQe6NxaW+mEKuDGOLcMLIIZ/7AK
	ZStN825TqAOYDsbE3CUdLkjyOnJxky8aF82C4l8KwC+4m9EJwoJ4Orx8ana0thwDebf3
	7EdoLHqUM3F0/WNRt0cgoSfNV8Zpsq8+SDp5mhWnNWtKWERKm6oRBu5ti6I5A9+uMEqG
	I69w==
Received: by 10.60.9.102 with SMTP id y6mr16086149oea.46.1332524218552;
	Fri, 23 Mar 2012 10:36:58 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id d9sm8324697obq.0.2012.03.23.10.36.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:36:57 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Mar 2012 10:36:55 -0700
Message-Id: <1332524217-27534-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH v2 2/4] ti814x.inc: Use '=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 17:36:59 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
a machine conf file should use '=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/include/ti814x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
index c53557f..070ca75 100644
--- a/conf/machine/include/ti814x.inc
+++ b/conf/machine/include/ti814x.inc
@@ -20,7 +20,7 @@ UBOOT_LOADADDRESS = "0x80008000"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # Ship all kernel modules
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES = "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
 SERIAL_CONSOLE = "115200 ttyO0"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4


