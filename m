Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A0DBE00A16; Fri, 10 Mar 2017 13:09:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B691E00A0C
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 13:08:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 54C6020BBD;
	Fri, 10 Mar 2017 21:08:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ohHnFVZlhZ8z; Fri, 10 Mar 2017 21:08:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 220C620BBE;
	Fri, 10 Mar 2017 21:08:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9F2D31623BA;
	Fri, 10 Mar 2017 16:08:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Mar 2017 16:08:42 -0500
Message-Id: <1489180123-138253-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180123-138253-1-git-send-email-denis@denix.org>
References: <1489180123-138253-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/5] wl18xx-target-scripts: add version 8.7.1 (R8.7_SP1)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Mar 2017 21:09:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous versions were provided by meta-arago-extras, moving to meta-ti now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wl18xx-target-scripts_8.7.1.bb                 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb

diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
new file mode 100644
index 0000000..07a164b
--- /dev/null
+++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
+
+# Tag: R8.7_SP1 (8.7.1)
+SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
+BRANCH = "sitara-scripts"
+SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}/wl18xx/"
+
+do_install() {
+	install -d ${D}${datadir}/wl18xx/
+
+	scripts=`find ./ -type f -name "*.*"`
+	for s in $scripts
+	do
+		install -m 0755 $s ${D}${datadir}/wl18xx/
+	done
+}
-- 
2.7.4


