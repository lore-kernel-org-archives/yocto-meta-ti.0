Return-Path: <koen@dominion.thruhere.net>
Received: from mail-fx0-f53.google.com (mail-fx0-f53.google.com
	[209.85.161.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E32EE0136E
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:52 -0800 (PST)
Received: by faaa5 with SMTP id a5so3666620faa.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:51 -0800 (PST)
Received: by 10.180.90.40 with SMTP id bt8mr170492wib.4.1324311351204;
	Mon, 19 Dec 2011 08:15:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id k5sm26418610wiz.9.2011.12.19.08.15.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 08:15:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 19 Dec 2011 17:15:39 +0100
Message-Id: <1324311340-16981-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 4/5] ti-ipc: update to 1_24_00_16
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
X-List-Received-Date: Mon, 19 Dec 2011 16:15:53 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/ipc/ti-ipc_1.23.02.27.bb |    9 ---------
 recipes-ti/ipc/ti-ipc_1.24.00.16.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 recipes-ti/ipc/ti-ipc_1.23.02.27.bb
 create mode 100644 recipes-ti/ipc/ti-ipc_1.24.00.16.bb

diff --git a/recipes-ti/ipc/ti-ipc_1.23.02.27.bb b/recipes-ti/ipc/ti-ipc_1.23.02.27.bb
deleted file mode 100644
index 2176b13..0000000
--- a/recipes-ti/ipc/ti-ipc_1.23.02.27.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-ipc.inc
-
-LIC_FILES_CHKSUM = "file://ipc_1_23_02_27_manifest.html;md5=74cbdd9a526809df81e080f19b36eec7"
-
-PV = "1_23_02_27"
-
-SRC_URI[ipcbin.md5sum] = "8c45f6a81cef62f9717335911ee1c9cd"
-SRC_URI[ipcbin.sha256sum] = "b16f29ef016819fe0632468e2f756e05508143cbc732bcaabd269571163b568e"
-
diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
new file mode 100644
index 0000000..e7ae7ef
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
@@ -0,0 +1,8 @@
+require ti-ipc.inc
+
+PV = "1_24_00_16"
+
+LIC_FILES_CHKSUM = "file://ipc_${PV}_manifest.html;md5=573f5a5c0448d28bf8db35f438244d7f"
+
+SRC_URI[ipcbin.md5sum] = "d2f7cc82310d555ca039dcd353bd94c5"
+SRC_URI[ipcbin.sha256sum] = "96df7835e920c7dabcd63d30ec8bc2aea7cd0c6197c9fb9ca0f8a9b681aa5396"
-- 
1.7.2.5


