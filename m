Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB31EE00DA7; Thu, 15 Dec 2016 08:04:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 657ABE00D9F
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 08:04:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBFFvYm9017731
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:34 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBFFvYT3017303
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:34 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Dec 2016 09:57:34 -0600
Received: from a0866445-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBFFvOJu018442;	Thu, 15 Dec 2016 09:57:34 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Dec 2016 10:54:33 -0500
Message-ID: <1481817282-7017-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481817282-7017-1-git-send-email-jsobota@ti.com>
References: <1481817282-7017-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 02/11] ti-sysbios: Upstream version 6.46.01.38
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
X-List-Received-Date: Thu, 15 Dec 2016 16:04:21 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 .../bios/{ti-sysbios_6.45.01.29.bb => ti-sysbios_6.46.01.38.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.45.01.29.bb => ti-sysbios_6.46.01.38.bb} (32%)

diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
similarity index 32%
rename from recipes-ti/bios/ti-sysbios_6.45.01.29.bb
rename to recipes-ti/bios/ti-sysbios_6.46.01.38.bb
index 6ab4e27..407b3b4 100644
--- a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
+++ b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
@@ -1,12 +1,12 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_45_01_29"
+PV = "6_46_01_38"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=da86dca468e5dd80484dc83473ea32e3"
 
-SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
-SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
+SRC_URI[sysbiosbin.md5sum] = "5aee070f73eb6f3d9aab2ff9c483f396"
+SRC_URI[sysbiosbin.sha256sum] = "3a04a584c3ee3221997b7d616ba45bbcc21ad241f4a4ab5c0f28c465d538af90"
 
 TI_BIN_UNPK_CMDS=""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
2.7.4


