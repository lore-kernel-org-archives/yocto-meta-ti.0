Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2BB9E01435
	for <meta-ti@yoctoproject.org>; Thu,  7 Jun 2012 08:40:55 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so313432eek.35
	for <meta-ti@yoctoproject.org>; Thu, 07 Jun 2012 08:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=OLle7evWDW0hExcK9f6xzWX6HHNRD1Qc0nZsc6InD40=;
	b=kRPa08akNYKVTMVgOlrGle9wrudObONLpQZUU11CaE9ps0cp1+axVD6XxXk8e/tsz9
	ab8D/YJJfn9GNw+tyRfeCrmyyObPVrL8sSDD7FNO5w6LXXEOfD/BZqnDGq1KoBSx+Mdv
	MQHt5CLae3IeY3IxZWcPLNIoo/Hv8fLWrzrTPj/0T5FhvF4Br5N1x0LlY5WG4wEXAhA8
	6ypNUsvRZyRiSMlZDbnhNBhFVtC43v6eS1HzThJUUIfsoTnVAJduhWAaqlHR1cXREY3e
	2OfdZbGShSWVK3yW3oJXr5z8U5nKTf6/VAvIPN/TJXlp06P5l9O/KTum8FOJwd8nIfed
	UZsg==
Received: by 10.14.97.77 with SMTP id s53mr1295355eef.104.1339083655224;
	Thu, 07 Jun 2012 08:40:55 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id c13sm12183333eeb.7.2012.06.07.08.40.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 08:40:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu,  7 Jun 2012 17:40:40 +0200
Message-Id: <1339083645-18356-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
References: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmFSHxdWbNVFrwNh2QikReUU7gQYWyrzD6wg6bXgqgMHxetiq8jwUdbpbEcphQPQrZ79qZ3
Cc: denys@ti.com
Subject: [PATCHv2 2/7] linux-ti33x-psp: enable TSL2550 driver for beaglebone weatherstation cape
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
X-List-Received-Date: Thu, 07 Jun 2012 15:40:56 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index c9316db..f88be14 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1012,7 +1012,7 @@ CONFIG_MISC_DEVICES=y
 # CONFIG_APDS9802ALS is not set
 # CONFIG_ISL29003 is not set
 # CONFIG_ISL29020 is not set
-# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_SENSORS_TSL2550=m
 # CONFIG_SENSORS_BH1780 is not set
 # CONFIG_SENSORS_BH1770 is not set
 # CONFIG_SENSORS_APDS990X is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 46a6277..e3a427b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.10


