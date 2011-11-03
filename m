Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BE9EE01363
	for <meta-ti@yoctoproject.org>; Thu,  3 Nov 2011 01:46:33 -0700 (PDT)
Received: by wyg34 with SMTP id 34so1413197wyg.35
	for <meta-ti@yoctoproject.org>; Thu, 03 Nov 2011 01:46:32 -0700 (PDT)
Received: by 10.227.60.3 with SMTP id n3mr10570896wbh.25.1320309991933;
	Thu, 03 Nov 2011 01:46:31 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id b5sm8865157wbh.4.2011.11.03.01.46.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 01:46:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu,  3 Nov 2011 09:46:26 +0100
Message-Id: <1320309987-31529-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/2] beaglebone-getting-started: initial add
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
X-List-Received-Date: Thu, 03 Nov 2011 08:46:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes-misc/payload/beaglebone-getting-started.bb

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
new file mode 100644
index 0000000..d68de7e
--- /dev/null
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "BeagleBone Getting Started Guide"
+
+# Ask Jason
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${datadir}/${PN}
+	cp -a ${S}/* ${datadir}/${PN}
+}
+
+FILES_${PN} += "${datadir}/${PN}"
-- 
1.7.2.5


