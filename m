Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94C38E01206
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:48:00 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so414551wib.11
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=tiWZEWRlu3dfrdzItpvpt6yi09YybN6gVauIDGFog1o=;
	b=XSMFqvXYbSeW5M8in5EkKmSiturVF64w01VCRgaNyMv26JK9pdyF0tqbXd61cR8LWW
	1agE70m0SqJpKDlqiWAiInqZ37XFiK+XedhY1Yew1i0oHc5VnqO/xg999ff7I0Phwsax
	lInzVKdBlqmn0qZcRK5+QE/9gkqz/fnfJrTQANzTTZwGKstJQcRQXLwN7uuTxukREHPr
	kVA3Idfz7mw3+Q6Y5WlD6ajyB5/6e5p9fqt8TSyhiQ9pP0RIMuI1F2HhMe6alyD+p0sN
	ERc8fv8tBsX9t0MvMToe6ei5VBGrD2hXk5PJcqCbKOjX0cDZK7dNuILJWTSaUWvHu5+e
	yynw==
Received: by 10.180.98.8 with SMTP id ee8mr12178086wib.14.1334666879698;
	Tue, 17 Apr 2012 05:47:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm43046177wib.9.2012.04.17.05.47.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:47:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Apr 2012 14:47:43 +0200
Message-Id: <1334666866-24955-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlG8vpnJQQD1olct0SPJ2sG0WYzptheDLmr5Mh61Pv6HWaeTCPxifWB6ZdX9/oOCKbJH2F8
Cc: denys@ti.com
Subject: [PATCH v2 4/7] am33x-cm3: add firmware for am33x suspend/resume
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
X-List-Received-Date: Tue, 17 Apr 2012 12:48:01 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/ti/am33x-cm3_git.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/ti/am33x-cm3_git.bb

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
new file mode 100644
index 0000000..247ba4d
--- /dev/null
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
+
+LICENSE = "TI-BSD"
+LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
+
+PV = "04.06.00.07"
+SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
+
+SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	make CC="${TARGET_CC}" CROSS_COMPILE="${TARGET_PREFIX}"
+}
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+
-- 
1.7.2.5


