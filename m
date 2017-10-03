Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1E41E00D26; Tue,  3 Oct 2017 04:14:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE58AE00D03
	for <meta-ti@yoctoproject.org>; Tue,  3 Oct 2017 04:14:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93BEoJP025319
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 06:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507029291;
	bh=S7wQlxBRtezwXyP6VVo8jGNXSLbCrq49ajyoijt5BsA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Tm6CIb69CoiFpJ2GzPLxKTuY5ScRnV/4t8MJuDtJMuNW7EcaB8r0y5ZPLUfx7GO6w
	43aT4YNoJYLwJ4LeRefph86GcmO29gDuYWzuBu+gE1SZ7vytE0lan+vuc/hzRb8jzQ
	mJKBd+3n4Lth1d1XspMShB0Elhaj0lh8o4rkaZvE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93BEoGg025130
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 06:14:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 06:14:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 06:14:50 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93BElB0014743;
	Tue, 3 Oct 2017 06:14:50 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Oct 2017 07:14:43 -0400
Message-ID: <1507029285-5066-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507029285-5066-1-git-send-email-sam.nelson@ti.com>
References: <1507029285-5066-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 2/4] ti-sysbios: Add recipe for new version 6.52.00.12
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
X-List-Received-Date: Tue, 03 Oct 2017 11:14:53 -0000
Content-Type: text/plain

Linux installer binary file name has changed compared to previous
version
Break backward compatibilty for A15 gcc tools: requires gcc-arm-none-
eabi-6-2017-q1-update or later

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/bios/ti-sysbios_6.52.00.12.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-ti/bios/ti-sysbios_6.52.00.12.bb

diff --git a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
new file mode 100644
index 0000000..2bbe881
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
@@ -0,0 +1,16 @@
+require recipes-ti/bios/ti-sysbios.inc
+
+PV = "6_52_00_12"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=ca549c223d732e6f69efc449795c4eeb"
+
+SRC_URI[sysbiosbin.md5sum] = "3c16af0843b5b6c5ff10512d1b586665"
+SRC_URI[sysbiosbin.sha256sum] = "4a2b9b76f52a57f02725337db9361787eae4c917d7cf989a697ed41eb4a1e701"
+
+TI_BIN_UNPK_CMDS = ""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+
+BINFILE = "bios_${PV}.run"
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
+
-- 
1.9.1


