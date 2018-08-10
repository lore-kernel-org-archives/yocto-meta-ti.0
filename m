Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FCD8E00C7D; Fri, 10 Aug 2018 07:57:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before
	Received: date
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5F7BE00D2F
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 07:57:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7AEv4p3090374
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 09:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533913024;
	bh=5oLvdh2R0BNQQA1tVV8a2cXbXMvCpK5jCpoYJTU70SE=;
	h=From:To:CC:Subject:Date;
	b=qcpHA+EpKQu48a27lg5mAk7YOTg2P+n5E5PB2RDC994Xa5j8sKeI3mVJY7ei0xuTF
	Q696s4FU4zz3gcOiA2mzgT5dwd2J7nYmhMVz4kYFgN/kTgfYnxqVfteJ/C2KDhRiEG
	+l62nUD2I9D8T//sbARlrCk78becMItaNqCC6dn8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7AEv3o9022885
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 09:57:03 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 10 Aug 2018 09:57:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 10 Aug 2018 09:57:02 -0500
Received: from hao-Ubuntu16.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7AEv2nj030377;
	Fri, 10 Aug 2018 09:57:02 -0500
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 10 Aug 2018 05:54:49 -0400
Message-ID: <1533894889-29809-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] recipes-ti: bios: add TI SYSBIOS 6.73.00.12
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
X-List-Received-Date: Fri, 10 Aug 2018 14:57:16 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 recipes-ti/bios/ti-sysbios_6.73.00.12.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-ti/bios/ti-sysbios_6.73.00.12.bb

diff --git a/recipes-ti/bios/ti-sysbios_6.73.00.12.bb b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
new file mode 100644
index 0000000..b727673
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
@@ -0,0 +1,15 @@
+require recipes-ti/bios/ti-sysbios.inc
+
+PV = "6_73_00_12"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=99771475f3621a6bf690df10327eaaa9"
+
+SRC_URI[sysbiosbin.md5sum] = "f8ff74bf0cfebdd5689fba843272ac61"
+SRC_URI[sysbiosbin.sha256sum] = "4fdf76696fb43984a9cae739fd2ee091ca9d031ad0277d2bb94dbb26eae63f43"
+
+TI_BIN_UNPK_CMDS = ""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+
+BINFILE = "bios_${PV}.run"
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
-- 
2.7.4


