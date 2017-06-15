Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7FDDE00B9E; Thu, 15 Jun 2017 10:38:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 722B0E00B99
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 10:38:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5FHc84L014936
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 12:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497548288;
	bh=YI1S/aQWL8EmgFD8cVBkgvu6ot9rlly/0BzaPq7pHwk=;
	h=From:To:CC:Subject:Date;
	b=Ht4vNEcFR2BGyWq9ESkbzHhrytzzEvmqqvMMyonU76MJPOPn5szqQI43GOXc84U7m
	BbOV9Kui7GjcOkyHv6v13uwTzEUltcDLft00GJpBipGF79C6u+5SfbltwcdXweRQ9T
	qq13239EtIF53RTP7dVQPk0Cxs1yF6kWCjOu6IRw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FHc8Pd019952
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 12:38:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 12:38:08 -0500
Received: from udc0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5FHc8bT026872;	Thu, 15 Jun 2017 12:38:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Jun 2017 13:38:04 -0400
Message-ID: <1497548285-24793-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] omapl138, omapl138-lcdk: add ti-pdk class configuration
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
X-List-Received-Date: Thu, 15 Jun 2017 17:38:13 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/machine/include/omapl138.inc | 3 +++
 conf/machine/omapl138-lcdk.conf   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl138.inc
index 931995f..999cbc3 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl138.inc
@@ -1,2 +1,5 @@
 require conf/machine/include/omapl1.inc
 SOC_FAMILY_append = ":omapl138"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "omapl138"
diff --git a/conf/machine/omapl138-lcdk.conf b/conf/machine/omapl138-lcdk.conf
index 84e71d0..c2ffb40 100644
--- a/conf/machine/omapl138-lcdk.conf
+++ b/conf/machine/omapl138-lcdk.conf
@@ -16,3 +16,6 @@ IMAGE_FSTYPES += "tar.xz"
 SERIAL_CONSOLE = "115200 ttyS2"
 
 KERNEL_DEVICETREE = "da850-evm.dtb da850-lcdk.dtb"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_BOARDS = "lcdkOMAPL138"
-- 
1.9.1


