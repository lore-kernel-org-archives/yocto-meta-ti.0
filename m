Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80B63E00D03; Tue, 31 Oct 2017 09:37:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E7F5E009B4
	for <meta-ti@yoctoproject.org>; Tue, 31 Oct 2017 09:37:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9VGaxrk021168
	for <meta-ti@yoctoproject.org>; Tue, 31 Oct 2017 11:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509467819;
	bh=GL4sq0sMmc/5A4aY3DNoRBBFyQkWMqarIGP1vJALaPs=;
	h=From:To:CC:Subject:Date;
	b=SDGYIYxKHgGt+rdohVpGb29/WTxP61L0MCIqdMHX19Jg0ftDK5Q02cmukNY7CgWpl
	A5Z/JCyRdX6HSA/tFZyH7nDB8RQXLUZRwJ8DqOjuv2mmHDEtDX83w69ef7zh5rA22j
	0Ntl+RQHV7MeU2SOtIQJRX/BsTQh/s48VxThomB0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VGax2s005650
	for <meta-ti@yoctoproject.org>; Tue, 31 Oct 2017 11:36:59 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 31 Oct 2017 11:36:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 31 Oct 2017 11:36:59 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VGav8U004325;
	Tue, 31 Oct 2017 11:36:58 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 31 Oct 2017 22:06:52 +0530
Message-ID: <1509467815-179618-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth 1/4] ti-sysbios: Add recipe for new version 6.52.00.12
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
X-List-Received-Date: Tue, 31 Oct 2017 16:37:05 -0000
Content-Type: text/plain

From: Sam Nelson <sam.nelson@ti.com>

Linux installer binary file name has changed compared to previous
version
Break backward compatibilty for A15 gcc tools: requires gcc-arm-none-
eabi-6-2017-q1-update or later

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

(from meta-ti/morty 2ee491283bfae006d6c6280ef7a680e69aae5cc7)

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-ti/bios/ti-sysbios_6.52.00.12.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-ti/bios/ti-sysbios_6.52.00.12.bb

diff --git a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
new file mode 100644
index 0000000..ebdb135
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
@@ -0,0 +1,15 @@
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
-- 
1.9.1


