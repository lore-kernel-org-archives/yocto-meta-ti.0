Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85828E0094C; Mon, 24 Apr 2017 10:51:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.19.16 listed in dnsbl.sorbs.net]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DBE4E00777
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 10:51:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OHpUNZ012739
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 12:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493056290;
	bh=acEYygheXhZBwlUe+nU5eOmFJoYP6R7yZSvecY1YIGk=;
	h=From:To:CC:Subject:Date;
	b=oG1BYOcrtO83tzam/gr2PGQmQzbFFvdkhXDwVFkz4NgLKBmeZUfb1XfnsIC3QCW4a
	s4gIYrmyumARu44xVaax/tpoU1++0+89bh6BpXw/7019WfqcIL2eTEPjyQfEyU29p/
	IJ3pfzdnKsYrcwWDF5fOAVhjM8urchlRa6awlSFA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OHpPWI020731
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 12:51:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 12:51:24 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3OHpOit003421;	Mon, 24 Apr 2017 12:51:24 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 24 Apr 2017 13:51:23 -0400
Message-ID: <1493056283-45773-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] mpm-transport: Update to new version 2.0.4.0
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
X-List-Received-Date: Mon, 24 Apr 2017 17:51:44 -0000
Content-Type: text/plain

- Add INSANE_SKIP ldflags to avoid warning
- Add no-preserve-ownership to avoid host contamination warning

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 0690807..bf02c0b 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -15,15 +15,16 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.03.00
-SRCREV = "ba53217c5db1a6f9d21a0c8f50e9e30a6efa8be8"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.04.00
+SRCREV = "e0e44fe55bef7ddf89f7ff3574f07fa906e72a37"
 
-PV = "2.0.3.0"
+PV = "2.0.4.0"
 PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
 EXTRA_OEMAKE_append_k2e += "HYPLNK_TRANSPORT=true"
+INSANE_SKIP_${PN} += "ldflags"
 
 S = "${WORKDIR}/git"
 
@@ -43,7 +44,7 @@ do_install() {
 	install -c -m 644 ${S}/include/* ${D}${includedir}/
 
 	install -d ${D}${libdir}/
-	cp  -a ${S}/lib/* ${D}${libdir}/
+	cp  -a --preserve=mode,timestamps --no-preserve=ownership ${S}/lib/* ${D}${libdir}/
 
 	install -d ${D}${sysconfdir}/mpm/
 	install -c -m 644 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
-- 
1.9.1


