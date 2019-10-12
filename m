Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78F70E00C46; Fri, 11 Oct 2019 17:40:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3084AE00A5C
	for <meta-ti@yoctoproject.org>; Fri, 11 Oct 2019 17:40:47 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9C0el7T061053
	for <meta-ti@yoctoproject.org>; Fri, 11 Oct 2019 19:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570840847;
	bh=2mQTFsQqZqk9OwlOUJajLVPrtPmCu8rVyPOsTCCfYCU=;
	h=From:To:CC:Subject:Date;
	b=m0h+7eZBDlhWeumyjGP+Hjy0fnFFzb3OY+hYGUHWXV7BH+SbHzvEhvKZ5y8+fPxe9
	fXjMFpH0O/QrCcHX+4CJ/RzHmPDad1C0IasRU7ult15HvqLxLorUbq3O/BM8XRDwIa
	PpGcLGk7KuhgXpc6qPLWMK+AEt7F5efIcW3WKI0o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9C0elZB126240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 11 Oct 2019 19:40:47 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 11 Oct 2019 19:40:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 11 Oct 2019 19:40:42 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9C0ekQG008082;
	Fri, 11 Oct 2019 19:40:47 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 11 Oct 2019 20:40:44 -0400
Message-ID: <1570840844-23037-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/ti2019.03/master][PATCH] ti-ipc: Update examples to latest version
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
X-List-Received-Date: Sat, 12 Oct 2019 00:40:49 -0000
Content-Type: text/plain

Fixes issues with AM65X examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index fe2cc99..25942db 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -26,8 +26,8 @@ name=${TI_IPC_METADATA_NAME}"
 
 # Corresponds to tag: 3.50.04.07
 TI_IPC_METADATA_SRCREV = "37e85ff1966f7d093fe2bde2dd9d4546f29d0d80"
-# Corresponds to tag: 3.50.04.07A
-TI_IPC_EXAMPLES_SRCREV = "0ebf5e642a8ca567bcaa7653875d15f6e7178405"
+# Corresponds to tag: 3.50.04.07B
+TI_IPC_EXAMPLES_SRCREV = "ad3d694e30367a5c04525aef7c6ee9a33896fd59"
 
 SRCREV_FORMAT = "default"
 SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
@@ -39,7 +39,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.r0"
+PR = "${INC_PR}.r1"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
-- 
1.9.1


