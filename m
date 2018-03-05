Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9A1CE00D6E; Mon,  5 Mar 2018 05:06:32 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15D15E006B4
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2018 05:06:31 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w25D6VeV002756
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 07:06:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520255191;
	bh=05bxY9KB7Qubh0F+QkLp5FHXcdDoYyIc5jayi+w/EOU=;
	h=From:To:CC:Subject:Date;
	b=VwIY4Kst4gmIYh2DbQ+mfLZx5yPnP94DcTuTPfoCJA1KJbPftloMM/wvEmThPdCcu
	NdAklM3Wt+E+YClUGbK6U6R9NG9JA86OX//GBNlfIFmWQhpBujQu49afStfA/GbAIl
	D6k6v771GIDVf+MufBGBO+DHAYlcZyZkVWNjI1lE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25D6VZZ002915
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 07:06:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 07:06:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 07:06:30 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25D6UCN009052;
	Mon, 5 Mar 2018 07:06:30 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Mar 2018 08:06:28 -0500
Message-ID: <1520255188-51764-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-ipc: Fix to avoid parallel build issue
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
X-List-Received-Date: Mon, 05 Mar 2018 13:06:32 -0000
Content-Type: text/plain

Fixes parallel build issue with k2hk

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 6bc644e..3f876d3 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,8 +24,8 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.47.01.00A
-SRCREV_ipc-examples = "7f23e9b0ae395461b0854881dcc174392355d854"
+# Corresponds to tag: 3.47.01.00B
+SRCREV_ipc-examples = "03ff856444b5bb9e60a907125a1f042b29b25d7b"
 
 # Corresponds to tag: 3.47.01.00A
 SRCREV_ipc-metadata = "72578cce9c9f9a932eb22b3397b46131efb12d69"
@@ -36,7 +36,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.r4"
+PR = "${INC_PR}.r5"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
-- 
1.9.1


