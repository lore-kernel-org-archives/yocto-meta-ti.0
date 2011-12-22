Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 094B7E01247
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 07:33:52 -0800 (PST)
Received: by wibhq2 with SMTP id hq2so3268717wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 07:33:52 -0800 (PST)
Received: by 10.180.19.106 with SMTP id d10mr24634851wie.2.1324568031711;
	Thu, 22 Dec 2011 07:33:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	et20sm10121827wbb.15.2011.12.22.07.33.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 07:33:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu, 22 Dec 2011 16:33:45 +0100
Message-Id: <1324568025-24923-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324568025-24923-1-git-send-email-koen@dominion.thruhere.net>
References: <1324568025-24923-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 2/2] ti-cgt6x: add 7.2.7
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
X-List-Received-Date: Thu, 22 Dec 2011 15:33:53 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/devtools/ti-cgt6x_7.2.7.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/devtools/ti-cgt6x_7.2.7.bb

diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
new file mode 100644
index 0000000..aab1b96
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
@@ -0,0 +1,11 @@
+require ti-cgt6x.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
+
+PE = "1"
+PV = "7_2_7"
+PVwithdots = "7.2.7"
+
+SRC_URI[cgt6xbin.md5sum] = "71a0768a541fdebd9c35d44301019d1d"
+SRC_URI[cgt6xbin.sha256sum] = "211477f0142d603975544abe3c45cc3b77a3b38038158676c60812806378738b"
+
-- 
1.7.2.5


