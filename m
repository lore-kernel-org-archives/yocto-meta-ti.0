Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91DE2E00C05; Wed,  5 Jul 2017 15:16:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD0E5E00B28
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 15:16:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v65MGbOg025021
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499292997;
	bh=MvKDirmqxY4ckiDxYe0DNXoix396hKMFqh7hTanqC4I=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CSEPnkh4DHuNKkPYg606urk8gvCu7hNpHCL+eF+jMja+nsxDNC46EndGSpwXRbUiD
	G6+k2iyWrcU7lQf5aIr/H9+E+zZ3r3fbNRWK+SsGLfc3tiFEHfVeOHAvqnnX95qViA
	YewzrdrPfPjks3bBphRo0aZPYvuVEuMN6VYvmeZ8=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65MGWXJ005066
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 17:16:32 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v65MGWMb007541	for <meta-ti@yoctoproject.org>;
	Wed, 5 Jul 2017 17:16:32 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Jul 2017 17:16:31 -0500
Message-ID: <1499292992-15234-5-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1499292992-15234-1-git-send-email-i-pang@ti.com>
References: <1499292992-15234-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] ti-proc-sdk-eclipse.bb: added TI Processor SDK eclipse plugin recipe
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
X-List-Received-Date: Wed, 05 Jul 2017 22:16:54 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 .../ti-proc-sdk-eclipse/ti-proc-sdk-eclipse.bb     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-ti/ti-proc-sdk-eclipse/ti-proc-sdk-eclipse.bb

diff --git a/recipes-ti/ti-proc-sdk-eclipse/ti-proc-sdk-eclipse.bb b/recipes-ti/ti-proc-sdk-eclipse/ti-proc-sdk-eclipse.bb
new file mode 100644
index 0000000..a0e909c
--- /dev/null
+++ b/recipes-ti/ti-proc-sdk-eclipse/ti-proc-sdk-eclipse.bb
@@ -0,0 +1,27 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+inherit eclipse-plugin
+require ../includes/ti-paths.inc
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROC_SDK_DEVICE="${@'${MACHINE}'.replace('-evm','')}"
+
+ECLIPSE_PLUGIN_DIR     = "${PROC_SDK_INSTALL_DIR_RECIPE}/eclipse"
+ECLIPSE_PLUGIN_MACHINE = "${PROC_SDK_DEVICE}"
+ECLIPSE_PLUGIN_NAME    = "${ECLIPSE_PLUGIN_MACHINE} Processor SDK RTOS"
+ECLIPSE_PLUGIN_RTSC    = "com.ti.proc.sdk.rtos.${ECLIPSE_PLUGIN_MACHINE}"
+ECLIPSE_PLUGIN_VERSION = "${TISDK_VERSION}"
+ECLIPSE_PLUGIN_DESC    = "RTOS Processor Software Development Kit"
+
+ECLIPSE_PLUGIN_PROVIDER  = "Texas Instruments Inc."
+ECLIPSE_PLUGIN_DESC_URL  = "http://www.ti.com"
+ECLIPSE_PLUGIN_COPYRIGHT = "Copyright Texas Instruments 2017"
+
+ECLIPSE_PLUGIN_ROOT_MACRO = "TI_PROC_SDK_INSTALL_DIR"
+ECLIPSE_PLUGIN_ROOT       = "../../.."
+ECLIPSE_PLUGIN_REPO       = "${ECLIPSE_PLUGIN_ROOT}"
+ECLIPSE_PLUGIN_DOCS       = "${ECLIPSE_PLUGIN_ROOT}/docs"
+ECLIPSE_FOLDER_PREFIX     = "processor_sdk_rtos_${PROC_SDK_DEVICE}"
+ECLIPSE_ROOT_MACRO        = "TI_PROC_SDK_INSTALL_DIR"
-- 
1.9.1


