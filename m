Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DB3BE01366
	for <meta-ti@yoctoproject.org>; Thu,  3 Nov 2011 01:46:35 -0700 (PDT)
Received: by mail-wy0-f176.google.com with SMTP id 34so1413197wyg.35
	for <meta-ti@yoctoproject.org>; Thu, 03 Nov 2011 01:46:34 -0700 (PDT)
Received: by 10.227.60.143 with SMTP id p15mr10500236wbh.28.1320309994627;
	Thu, 03 Nov 2011 01:46:34 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gd6sm8882773wbb.1.2011.11.03.01.46.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 01:46:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu,  3 Nov 2011 09:46:27 +0100
Message-Id: <1320309987-31529-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1320309987-31529-1-git-send-email-koen@dominion.thruhere.net>
References: <1320309987-31529-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 2/2] bonescript.bb
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
X-List-Received-Date: Thu, 03 Nov 2011 08:46:35 -0000

bonescript: initial add
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/bonescript.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes-misc/payload/bonescript.bb

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
new file mode 100644
index 0000000..931ca01
--- /dev/null
+++ b/recipes-misc/payload/bonescript.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
+
+# Ask Jason
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+SRC_URI = "git://github.com/jadonk/bonescript.git"
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${localstatedir}/lib/cloud9/
+	cp -a ${S}/* ${localstatedir}/lib/cloud9/
+	cp -a ${S}/.git ${localstatedir}/lib/cloud9/
+}
+
+FILES_${PN} += "${localstatedir}"
-- 
1.7.2.5


