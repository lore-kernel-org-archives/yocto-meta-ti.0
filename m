Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E73F5E013A6
	for <meta-ti@yoctoproject.org>; Thu, 19 Apr 2012 08:33:41 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so1641678wib.11
	for <meta-ti@yoctoproject.org>; Thu, 19 Apr 2012 08:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=TwTIcZUyRhWqtQjFu5yTaqCqD0YsdTm2QSUw598AC7M=;
	b=Ql9q9MG7lOgmoRQg5xnVgv3PbzaEQc8gjlX3FrjlRfya9vJ+VUOhB4Gfyv2HA34WI2
	UCCyQeCZaZR8abm81UIolOFXsgYImDiW+Ru3sCYd27yMOAJT2vw3FdfA2xWuyGA3S982
	fuJiPdO1OJmHCzXweTfSp3jizRo+zrRn/0+2e6BY3KbByh47lFXzq4R6H1TUdJ+VA7fA
	3ld2aHPtVKr+GSwQo6B3n5oDnIU7IE4EICbUjjhMiRYi5Ll6qAH83D62O9e9h5E7ENud
	uA0RV4fxKqgEzh7oLILMQaAOk2SldS2ALnYRKvPJdj+URLCEkZAjFBEkfsABkE5fZp4+
	mPlA==
Received: by 10.180.91.10 with SMTP id ca10mr26916961wib.17.1334849620609;
	Thu, 19 Apr 2012 08:33:40 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id k6sm42949501wie.9.2012.04.19.08.33.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Apr 2012 08:33:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 19 Apr 2012 17:33:33 +0200
Message-Id: <1334849614-12816-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQm5UFhNXRgKfcoj4hB76rDQQmO8lymhux0YZbWe+W3Ookpgreb+23BdlrM/qjCn1rZRWTMZ
Cc: denys@ti.com
Subject: [PATCH 1/2] cloud9-gnome-image: same as cloud9-image, but with GNOME added to it
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
X-List-Received-Date: Thu, 19 Apr 2012 15:33:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/cloud9-gnome-image.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes-misc/images/cloud9-gnome-image.bb

diff --git a/recipes-misc/images/cloud9-gnome-image.bb b/recipes-misc/images/cloud9-gnome-image.bb
new file mode 100644
index 0000000..13638d7
--- /dev/null
+++ b/recipes-misc/images/cloud9-gnome-image.bb
@@ -0,0 +1,19 @@
+# Image with cloud9 ide, gfx and hw tools installed
+
+require cloud9-image.bb
+
+# SoC specific packages, mostly 3D or multimedia related
+SOCSUPPORT = ""
+SOCSUPPORT_omap3 = "xbmc libgles-omap3-x11demos gstreamer-ti omapfbplay"
+SOCSUPPORT_ti33x = "xbmc libgles-omap3-x11demos gst-ffmpeg mplayer2 beaglebone-capes"
+
+IMAGE_INSTALL += " \
+                  angstrom-task-gnome gimp abiword gedit midori epiphany firefox matchbox-terminal \
+                  ${SOCSUPPORT} \
+                  ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
+                  xinput-calibrator \
+                  xterm \
+                 "
+
+export IMAGE_BASENAME = "Cloud9-IDE-GNOME"
+
-- 
1.7.2.5


