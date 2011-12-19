Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EDE7E0136E
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:53 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id dr1so9641581wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:53 -0800 (PST)
Received: by 10.227.206.4 with SMTP id fs4mr12478707wbb.21.1324311353158;
	Mon, 19 Dec 2011 08:15:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id cy8sm1150655wib.2.2011.12.19.08.15.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 08:15:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 19 Dec 2011 17:15:40 +0100
Message-Id: <1324311340-16981-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 5/5] ti-sysbios: add 6.33.00.19
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
 recipes-ti/bios/ti-sysbios_6.31.04.27.bb |    8 --------
 recipes-ti/bios/ti-sysbios_6.33.00.19.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-sysbios_6.31.04.27.bb
 create mode 100644 recipes-ti/bios/ti-sysbios_6.33.00.19.bb

diff --git a/recipes-ti/bios/ti-sysbios_6.31.04.27.bb b/recipes-ti/bios/ti-sysbios_6.31.04.27.bb
deleted file mode 100644
index 107affd..0000000
--- a/recipes-ti/bios/ti-sysbios_6.31.04.27.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ti-sysbios.inc
-
-PV = "6_31_04_27"
-LIC_FILES_CHKSUM = "file://sysbios_6_31_04_27_manifest.html;md5=36efea2939274c46b73f5e170abaffcb"
-
-SRC_URI[sysbiosbin.md5sum] = "c82e1d3afc9e2d3e88b0e4137f152ed6"
-SRC_URI[sysbiosbin.sha256sum] = "92337cf3197d2b7ffe2316f311cd163be7b470acbb032273894d7d39182f4227"
-
diff --git a/recipes-ti/bios/ti-sysbios_6.33.00.19.bb b/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
new file mode 100644
index 0000000..4e2b445
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
@@ -0,0 +1,9 @@
+require ti-sysbios.inc
+
+PV = "6_33_00_19"
+LIC_FILES_CHKSUM = "file://sysbios_${PV}_manifest.html;md5=94136ca9815f76603b7202a41f1d6f5e"
+
+SRC_URI[sysbiosbin.md5sum] = "e1a2f28a8b3087896bbd986696e1a908"
+SRC_URI[sysbiosbin.sha256sum] = "b7e096662f5d928eb818bbb14474deb1e3e038fea34b516b248de637835121ec"
+
+S = "${WORKDIR}/ti/bios_${PV}"
-- 
1.7.2.5


