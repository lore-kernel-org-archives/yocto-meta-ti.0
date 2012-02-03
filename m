Return-Path: <tom.rini@gmail.com>
Received: from mail-pz0-f53.google.com (mail-pz0-f53.google.com
	[209.85.210.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 047B0E002CA
	for <meta-ti@lists.yoctoproject.org>;
	Fri,  3 Feb 2012 14:59:39 -0800 (PST)
Received: by dady25 with SMTP id y25so3758145dad.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 03 Feb 2012 14:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4XsGWAPyZhCkNphuunxfaUHWsvQiMacyZhsy7KNXPUk=;
	b=Nfg56uROGNBAx/qV/+HDUise7ILYz8UWUGr72Mw+vVD/QGbmTdUe3J+oiVpj+D91fD
	5DdZISfNbxKOpe+YD1kkhyi3XiuYlXBEtvqYqIcMrYa6hB8p8/Zgu1fNSKMIf+GsfQPM
	SfLICrfT+7Lz3Osh8Ki8ChAw4u6AqDXHFP6EM=
Received: by 10.68.216.133 with SMTP id oq5mr21182554pbc.110.1328309979672;
	Fri, 03 Feb 2012 14:59:39 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74]) by mx.google.com with ESMTPS id
	kx17sm16190494pbb.19.2012.02.03.14.59.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 14:59:38 -0800 (PST)
From: Tom Rini <tom.rini@gmail.com>
To: meta-ti@lists.yoctoproject.org
Date: Fri,  3 Feb 2012 15:59:34 -0700
Message-Id: <1328309974-12634-1-git-send-email-tom.rini@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Tom Rini <trini@ti.com>
Subject: [PATCH] beagleboard: Add fw_env.config
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
X-List-Received-Date: Fri, 03 Feb 2012 22:59:40 -0000

From: Tom Rini <trini@ti.com>

This adds a fw_env.config file that is valid for BeagleBoard's
with NAND for U-Boot environment.

Signed-off-by: Tom Rini <trini@ti.com>
---
 .../u-boot/u-boot/beagleboard/fw_env.config        |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config

diff --git a/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config b/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config
new file mode 100644
index 0000000..ba8147a
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config
@@ -0,0 +1 @@
+/dev/mtd5 0x0 0x20000 0x20000
-- 
1.7.0.4


