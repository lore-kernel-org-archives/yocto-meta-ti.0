Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D9CCE0086B; Fri, 10 Aug 2018 07:56:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A8B4E006F1
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 07:56:40 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7AEue7o013498
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 09:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533913000;
	bh=BwxmEwYtH05r8FgDVRN8vd+sieGx3qX68t+PTTNeiJM=;
	h=From:To:CC:Subject:Date;
	b=GmlLf++9PXXr7dq/ACP5uxSmPArxlhnJxboEP2Dp9xf2vtSf7ssQjZjYn9bKC4Iz4
	6ZzQERAS04Hhy8P7Lyd/i7vLVK0sQyhQWNvvmxOtf13eQuNWftIAFf1Pt604TGwuEd
	K2YadGrxlgBy5Jr2bS5XRGrjhjQVuRhr5z/JtkUs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7AEueEe001046
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 09:56:40 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 10 Aug 2018 09:56:40 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 10 Aug 2018 09:56:40 -0500
Received: from hao-Ubuntu16.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7AEudFv018979;
	Fri, 10 Aug 2018 09:56:39 -0500
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 10 Aug 2018 05:54:27 -0400
Message-ID: <1533894867-29738-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] recipes-ti: devtools: add TI XDC tools 3.50.07.20
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
X-List-Received-Date: Fri, 10 Aug 2018 14:56:42 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 recipes-ti/devtools/ti-xdctools_3.50.07.20.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.50.07.20.bb

diff --git a/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb b/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
new file mode 100644
index 0000000..d45f373
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
@@ -0,0 +1,9 @@
+require recipes-ti/devtools/ti-xdctools-core.inc
+
+PV = "3_50_07_20"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
+
+SRC_URI[xdczip.md5sum] = "52e4b5ddf2e004c6acff52104840724e"
+SRC_URI[xdczip.sha256sum] = "bef631c110ca9243790de06cd51839170d7979b92e01396e4265009776ff7a07"
-- 
2.7.4


