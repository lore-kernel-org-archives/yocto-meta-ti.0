Return-Path: <tom.rini@gmail.com>
Received: from mail-pw0-f53.google.com (mail-pw0-f53.google.com
	[209.85.160.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F54BE0136A
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 08:51:29 -0800 (PST)
Received: by mail-pw0-f53.google.com with SMTP id rq13so4446581pbb.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 08:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=V9PX4AV9n4vCiRTGg56s71TedJVGGEwVLD5oBfhwMfc=;
	b=XqFzKfM/IDOGsK45RinIiQY3pcaqFOiDTzfTfWI6Dj6UUYV7T/B/TZKV5ZKrTnPyyX
	muNRmXFMwOs35bSmlSmSGsMZVDIL22Ur7umHw4T6N6EZO0OLnEX9Pbxt7WhSb34fxSFS
	k8LAk2bPlI8TCP2kyDLteFQGHDYSr8mDDCtJE=
Received: by 10.68.224.9 with SMTP id qy9mr49289540pbc.102.1329151889215;
	Mon, 13 Feb 2012 08:51:29 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id p2sm40953852pbb.14.2012.02.13.08.51.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 08:51:28 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 09:51:28 -0700
Message-Id: <1329151888-7525-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1329151888-7525-1-git-send-email-trini@ti.com>
References: <1329151888-7525-1-git-send-email-trini@ti.com>
Subject: [PATCH 3/3] u-boot git: Update omap3-touchbook for u-boot-fw-utils change
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
X-List-Received-Date: Mon, 13 Feb 2012 16:51:29 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 recipes-bsp/u-boot/u-boot_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_git.bb b/recipes-bsp/u-boot/u-boot_git.bb
index 5abb6f5..90527f6 100644
--- a/recipes-bsp/u-boot/u-boot_git.bb
+++ b/recipes-bsp/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r67"
+PR ="r68"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_ti814x = "-1"
@@ -42,6 +42,7 @@ SRC_URI_omap3-touchbook = "git://gitorious.org/u-boot-omap3/mainline.git;branch=
 "
 SRCREV_pn-${PN}_omap3-touchbook = "d363f9cb0918a1b6b92e2e20d01543d0c4f53274"
 PV_omap3-touchbook = "2009.05+${PR}+gitr${SRCREV}"
+RRECOMMENDS_omap3-touchbook = "u-boot-fw-utils"
 
 # OMAPL1 omapl137/omapl138 - PSP 3.20.0.11
 
-- 
1.7.0.4


