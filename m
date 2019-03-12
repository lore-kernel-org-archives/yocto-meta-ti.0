Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E26EE00CE8; Mon, 11 Mar 2019 18:44:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB2EEE00BB7
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 18:44:06 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2C1i6Wa041669
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552355046;
	bh=l0cvq/bAutnwdl2eYR+GbDGyqKmnMEmepM+l3/AwKEE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tLgbjjGAFibuPXnL5mO/+x23knhxeXvXXP/Ymj6E3wbpYXhs53Q539G3Ce+4ts6En
	ruQPDuecMBb5nLwho9iQJzWxvl4bBOat09jRnsJU9F3AXxRNY5+vCiN2YvzQdFITkh
	+Xg5zIF+brUbCsaItFxBkLU0m9NBB+s+h6Ocm1ig=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2C1i6kS085846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 20:44:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Mon, 11 Mar 2019 20:44:05 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2C1hssT014989
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:05 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2019 21:43:48 -0400
Message-ID: <1552355028-25739-8-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552355028-25739-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1552355028-25739-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 7/7] ti-sysbios: Update to version 6.75.02.00
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
X-List-Received-Date: Tue, 12 Mar 2019 01:44:08 -0000
Content-Type: text/plain

The checksum has been changeded due to the version string and copyright
year. Licenses themselves have not changed.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../bios/{ti-sysbios_6.73.01.01.bb => ti-sysbios_6.75.02.00.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.73.01.01.bb => ti-sysbios_6.75.02.00.bb} (52%)

diff --git a/recipes-ti/bios/ti-sysbios_6.73.01.01.bb b/recipes-ti/bios/ti-sysbios_6.75.02.00.bb
similarity index 52%
rename from recipes-ti/bios/ti-sysbios_6.73.01.01.bb
rename to recipes-ti/bios/ti-sysbios_6.75.02.00.bb
index ef2ef25..553d43e 100644
--- a/recipes-ti/bios/ti-sysbios_6.73.01.01.bb
+++ b/recipes-ti/bios/ti-sysbios_6.75.02.00.bb
@@ -1,12 +1,12 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_73_01_01"
+PV = "6_75_02_00"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=99771475f3621a6bf690df10327eaaa9"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
 
-SRC_URI[sysbiosbin.md5sum] = "899ddf89d259e2848b93d6d53902a2d5"
-SRC_URI[sysbiosbin.sha256sum] = "005b63d59308e0fe6e8fc4ff9d760c829880fb3e0daf43eb8181680ddf11ac85"
+SRC_URI[sysbiosbin.md5sum] = "8bca751d3054e74b9edb510a0d099095"
+SRC_URI[sysbiosbin.sha256sum] = "c92cb72f86656b1e37454e238e9838f301eeeb4d711a0f4a84089ef80ccb6013"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.9.1


