Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3151DE01363
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 06:09:15 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so2937742wib.11
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 06:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=tiWZEWRlu3dfrdzItpvpt6yi09YybN6gVauIDGFog1o=;
	b=QiB6WD1ZFij16uJWaL82q7KoshfyQ/YvUFzwyBXkrY4pBRiHTMF5hNy+oBmJQukk/0
	qRGSudgVEOL+ejAw5CNuWnw+6BoX784o68xgB6NLCpLz3IOSGZU+7XuIeMWRStxHhhl7
	MyXmZmnH8B9JzTR9PVG1XjJyE26jf3XqXy+sTDnl/rfym8ex0MIzdbytIlu4p+y9LfF1
	Cxr8qW8ddDlRKSwf8AX1MUEdSaD8iQ8vZd8m+Ri56UaDwVrD7bKDMKVKBMlSfY6TRb9s
	/p98WRilkO0m5o6CFnI+0eYhZKAYrQ11/iyh/LkBwfQDpzNKOqAH1/k0EGS62TVPI6HU
	jfKw==
Received: by 10.180.95.37 with SMTP id dh5mr6911600wib.8.1334063353932;
	Tue, 10 Apr 2012 06:09:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id h8sm60993426wix.4.2012.04.10.06.09.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 06:09:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 10 Apr 2012 15:09:00 +0200
Message-Id: <1334063340-21063-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQluV1ZK/Zsr1Dc0zK7vLs0zLfnVgUe9bswJrBP++XtQCBX+D1S+8weV+eBcAstWn/RMTgiy
Cc: denys@ti.com
Subject: [PATCH] am33x-cm3: add firmware for am33x suspend/resume
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
X-List-Received-Date: Tue, 10 Apr 2012 13:09:15 -0000

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


