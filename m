Return-Path: <tom.rini@gmail.com>
Received: from mail-pz0-f43.google.com (mail-pz0-f43.google.com
	[209.85.210.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 431A7E0138D
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:40:29 -0800 (PST)
Received: by mail-pz0-f43.google.com with SMTP id c16so5353230dam.2
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UzMLvkaALuGUzmJe0rU1ZTVdBwQn+wXgd/qe8/xeFR4=;
	b=ukZdomo9J26DTtOHZeVJxYz427wUDPMKvVS71BLacG8vHU/RI8VyeDDcrRwO1I9Cas
	dL4LGioCYxz9/qSNxgjYdCjetwSE4CGEsvu7vSanNKfH5LwyNoPOcQxynzyN9n22aRN8
	D63embGzP0lOqVYoXm9UCOzqQtAvmR5a/1LEc=
Received: by 10.68.74.167 with SMTP id u7mr49724159pbv.103.1329158429195;
	Mon, 13 Feb 2012 10:40:29 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74]) by mx.google.com with ESMTPS id
	li19sm41467821pbb.17.2012.02.13.10.40.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:40:28 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 11:40:28 -0700
Message-Id: <1329158428-8747-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1329158428-8747-1-git-send-email-trini@ti.com>
References: <1329158428-8747-1-git-send-email-trini@ti.com>
Subject: [PATCH v2 3/3] u-boot git: Update omap3-touchbook for u-boot-fw-utils change
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
X-List-Received-Date: Mon, 13 Feb 2012 18:40:29 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 recipes-bsp/u-boot/u-boot_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_git.bb b/recipes-bsp/u-boot/u-boot_git.bb
index 5abb6f5..e7f1777 100644
--- a/recipes-bsp/u-boot/u-boot_git.bb
+++ b/recipes-bsp/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r67"
+PR ="r68"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_ti814x = "-1"
@@ -57,3 +57,5 @@ PV_hawkboard               = "2009.08+gitr${SRCREV}"
 
 
 S = "${WORKDIR}/git"
+
+RRECOMMENDS_omap3-touchbook = "u-boot-fw-utils"
-- 
1.7.0.4


