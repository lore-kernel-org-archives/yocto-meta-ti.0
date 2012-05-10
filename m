Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB899E0140E
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:20 -0700 (PDT)
Received: by mail-wg0-f42.google.com with SMTP id ds11so201893wgb.5
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Z8+TTDaKZjrELVi7ijAE14nZ7npV8Sh6m0jCaZcdKvA=;
	b=Lp9TTSnRvxhsXGnMYdYDSFHpbqonaD/tsuXHg26i4eqfzNhmi4wSWU2By5avnbs0Fy
	HOot7xZUKU90vFNvVjjCF3Qn1gfFuc9g9i2ZNBwusWTJjS/Djoa8Xjh70eWd7Gxl1jVH
	Onge4kOeXvvQQrDCSLuK5hKztIVDC/MFJ87Z0JdZ8DpgHiiVOGQsZINXxCGpA950A7uQ
	Zp1yiMli4YGHXBdt/bXlqVH6s5QzwILBG425JDxBEsC9kI4TmmcpyXvqivk4qtveqj51
	BmUA7p1xCM6KrRkz+tOlma46iVa06ACmZzNdexdaSF+E8oIJQkNfhXvgt+aCukkLpvSu
	brTg==
Received: by 10.180.90.233 with SMTP id bz9mr3219718wib.21.1336640420531;
	Thu, 10 May 2012 02:00:20 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j4sm3206184wix.5.2012.05.10.02.00.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 02:00:19 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:35 +0200
Message-Id: <1336640375-20418-13-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlm2LEZhT9IHP5vFS+r2Sr3D5Gwux+nj18Vp2ygPTXSO1H9XtOVTAVvYci5WXOTAL4zGw9l
Cc: denys@ti.com
Subject: [PATCH v3 13/13] uim: userspace app to manage wl12xx firmware loading
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
X-List-Received-Date: Thu, 10 May 2012 09:00:21 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-connectivity/uim/uim_git.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-connectivity/uim/uim_git.bb

diff --git a/recipes-connectivity/uim/uim_git.bb b/recipes-connectivity/uim/uim_git.bb
new file mode 100644
index 0000000..c8265e9
--- /dev/null
+++ b/recipes-connectivity/uim/uim_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "User Mode Initialization Manager for wl12xx devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://uim.c;startline=4;endline=12;md5=16a9d6e829218481f8a61797fe2be2e2"
+
+# Doesn't have a version, so we'll make one up
+PV = "0.0"
+
+SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
+SRC_URI = "git://gitorious.org/uim/uim.git"
+
+S= "${WORKDIR}/git"
+
+do_install() {
+	oe_runmake install DESTDIR=${D}
+}
+
+# connman has a plugin to handle all this
+RCONFLICTS_${PN} += "connman-plugin-tist"
+RRECOMMENDS_${PN} = "linux-firmware-wl12xx"
-- 
1.7.10


