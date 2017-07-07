Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A212E00BDC; Fri,  7 Jul 2017 12:30:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7750E00BC1
	for <meta-ti@yoctoproject.org>; Fri,  7 Jul 2017 12:30:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v67JUFZM020560
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499455815;
	bh=u4Kie4IvwYBD6WtKX1m79IQ7upoMZNVAQ8H8NTGsfso=;
	h=From:To:CC:Subject:Date;
	b=NOj2JO8wH8cxuSB8UzznkhjAeNK/jawfH1OKIoQYOcWIml2DO0wOOg4LDwmw/47pc
	2JVOv7beg5pTwogB/MpgunKhRa8QL6Fo1SWcDMBtjUZROs+X6OLKF7PJKwGDplzJqG
	yFmGxQWFLOuY9df9DF4+PfLEHXmjNqHVrNzkrpQQ=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67JUFR1009121
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:30:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 14:30:15 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v67JUFGU025624;	Fri, 7 Jul 2017 14:30:15 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Jul 2017 15:30:11 -0400
Message-ID: <1499455811-47644-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] serdes-diag-rtos: Add rtos recipe for serdes-diag
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
X-List-Received-Date: Fri, 07 Jul 2017 19:30:27 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb

diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
new file mode 100644
index 0000000..890aafc
--- /dev/null
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
@@ -0,0 +1,29 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://serdes_diag.h;beginline=1;endline=42;;md5=68e7ce6fdc0e9328fa7d0ec41c54420c"
+
+COMPATIBLE_MACHINE = "keystone|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SERDES_DIAG_GIT_URI = "git://git.ti.com/keystone-rtos/serdes_diag.git"
+SERDES_DIAG_GIT_PROTOCOL = "git"
+SERDES_DIAG_GIT_BRANCH = "master"
+SERDES_DIAG_GIT_DESTSUFFIX = "git/ti/diag/serdes_diag"
+
+# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.07"
+SERDES_DIAG_SRCREV = "65a0c2f6afc84dce03c706432667382700a08654"
+
+BRANCH = "${SERDES_DIAG_GIT_BRANCH}"
+SRC_URI = "${SERDES_DIAG_GIT_URI};destsuffix=${SERDES_DIAG_GIT_DESTSUFFIX};protocol=${SERDES_DIAG_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${SERDES_DIAG_SRCREV}"
+PV = "01.00.00.07"
+PR = "r0"
+
+S = "${WORKDIR}/${SERDES_DIAG_GIT_DESTSUFFIX}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "SERDES Diagnostics"
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


