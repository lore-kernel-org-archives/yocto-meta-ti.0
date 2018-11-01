Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42F5EE00C09; Thu,  1 Nov 2018 14:02:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB294E00C09
	for <meta-ti@yoctoproject.org>; Thu,  1 Nov 2018 14:02:27 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA1L2RvC029922
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1541106147;
	bh=OkkrG+PuxKDt+nfjFH0P/F0ZbeJR7EY6SKHhPNNFhqo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xCe4s0KHT9XFBnCNjyxg4I6Xtjw9uwYBpEhH6e7rPCIZxkTamk7kIKqzdOoGoVQFn
	2nFnDSOdQjZi3blztvpVEF9drQe97mRnaqPKgAWIAEOhYSVcXUbstFs7ZEibhG3B21
	LZROzb0N0gKb2Ghh+Dz5NkLVOEA3BdTG/KnofUuY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA1L2RqZ112611
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:02:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 1 Nov 2018 16:02:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 1 Nov 2018 16:02:27 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA1L2O5F023056
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:02:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Nov 2018 17:02:23 -0400
Message-ID: <1541106143-25639-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1541106143-25639-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1541106143-25639-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-sysbios: Updating to 6.73.01.01
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
X-List-Received-Date: Thu, 01 Nov 2018 21:02:28 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../bios/{ti-sysbios_6.73.00.12.bb => ti-sysbios_6.73.01.01.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.73.00.12.bb => ti-sysbios_6.73.01.01.bb} (68%)

diff --git a/recipes-ti/bios/ti-sysbios_6.73.00.12.bb b/recipes-ti/bios/ti-sysbios_6.73.01.01.bb
similarity index 68%
rename from recipes-ti/bios/ti-sysbios_6.73.00.12.bb
rename to recipes-ti/bios/ti-sysbios_6.73.01.01.bb
index b727673..ef2ef25 100644
--- a/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
+++ b/recipes-ti/bios/ti-sysbios_6.73.01.01.bb
@@ -1,12 +1,12 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_73_00_12"
+PV = "6_73_01_01"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=99771475f3621a6bf690df10327eaaa9"
 
-SRC_URI[sysbiosbin.md5sum] = "f8ff74bf0cfebdd5689fba843272ac61"
-SRC_URI[sysbiosbin.sha256sum] = "4fdf76696fb43984a9cae739fd2ee091ca9d031ad0277d2bb94dbb26eae63f43"
+SRC_URI[sysbiosbin.md5sum] = "899ddf89d259e2848b93d6d53902a2d5"
+SRC_URI[sysbiosbin.sha256sum] = "005b63d59308e0fe6e8fc4ff9d760c829880fb3e0daf43eb8181680ddf11ac85"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.9.1


