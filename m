Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E99C44512
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 02:25:54 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5459.1784255146345553404
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 19:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Yi0e3EcF;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=kzLQVON9;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66GNGbe4915504;
	Thu, 16 Jul 2026 21:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=DYfKWh48I1Egy
	2pMCPMtcpGDzmGqPBRenMpSNq3hnMA=; b=Yi0e3EcFl5Mvs3qkmHZeu81Uqd/gK
	/ikMrcS3EodoTdqhM3WnGhtCMqMLA8qY0n4L7jft1oeFbrs0XQzIKbOUREjMvq+J
	sRj9EqF42fqcl7x4EXGj0vn/ZGaYcAFclkPESX6xmelYqguRbhYoLjc9PNu1a0Kp
	mxtcc/qeJ0jpmHjSZk3M712+3JwEu7iorN+Bw4STJpvMM/bi7i9T1rcaxIlHe+1v
	a6pPA5oqxpR7OZ2Xz6fRB+XEXqq3nM/KCuD2qDvCMm9+rT+6J0hvFD4O1/ARYj1o
	zkSfO0x4YidT89obohF/H3mrkPNeSizCbpd0ZoeNn3g0QRyV3tST5x9Lg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fex78cdu4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 21:25:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlqvRAcOadPo1S+iGRYGEioNoxixYVPCdoyTVO7LYGMPUxL3i8C9aqCF/1NdKoWrNq6bSRnfiBTrdpazNpaw986/lvUSBaOLz16oSVaZrORz660IzFmM5z8c7y2SN0tow1ZyuFXbCAA9VjAUUfD37hIVJygQgymvczBh/cAOWcYqLkZjZz6/N450J93Ypwrz71ZnE8UIWcopkq2d2ivVLq5s4p4YyXrfznuy0UNx2HazONUtCD+6ct18U+zwkv90YRr1It0r42MsvW9V5KQxxwsUQPyxcdQoCPv9vm5hUTvJ9ButxFolTMsJs9bFBUCo2nKPUESoXAaskjWB1eKiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYfKWh48I1Egy2pMCPMtcpGDzmGqPBRenMpSNq3hnMA=;
 b=M6HgrgQY5cJVOdwn31ESO//BLFmGLdxh6TWZhFTEN1Adn8OrRtOWDTPAF9y/yyAwU8HPOMGa222WXq9eiAi61rKOBMoXI11VVRppVH4B62TQM635UuAsR5nsNJdXzrhY/CQ4uWu10Pzz4Np/JdSUYDsa5MzvD79JsLxRIaRjUcnT8IRlxz4++Uc4KQ/desYakUrsc1mvj6VgoTOMpc3T3ltiOtQ36ywZnR5tO/gfUDX31PCR2O08tOcfaMgqZAoL8Ey4tbFUEcCFw98WnbyvewsTpHEmsk63cAhPAowY/3kwY8EaQZ9DanSiXnCMEpZMFuKywVguq2KXxLncPEc+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYfKWh48I1Egy2pMCPMtcpGDzmGqPBRenMpSNq3hnMA=;
 b=kzLQVON90n0pCEToBbt2lnyKP1DJbiZp++zHIM/qVGUbBdCdj5r0jsVK9RCdKC3Jj239MzExt7HB9KY33U9MvExw6mMjW+3zWcPGpi9x6W5WP06JEDGOLnC+euq8KTpZgohnJNlhYNX9CjiY6cozcUtwZi4XBp9l2f1WWKoPKPY=
Received: from PH7PR02CA0028.namprd02.prod.outlook.com (2603:10b6:510:33d::32)
 by SA2PR10MB4458.namprd10.prod.outlook.com (2603:10b6:806:f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 02:25:41 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::6a) by PH7PR02CA0028.outlook.office365.com
 (2603:10b6:510:33d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 02:25:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 02:25:40 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 21:25:40 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 21:25:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 21:25:40 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H2Pegx2146222;
	Thu, 16 Jul 2026 21:25:40 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wkYGi-00000000UV6-0h40;
	Thu, 16 Jul 2026 21:25:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
Date: Thu, 16 Jul 2026 21:25:40 -0500
Message-ID: <20260717022540.117237-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|SA2PR10MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1a361c-1f5b-43ef-f156-08dee3aab255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	1Hn9jhK8OGMlrOkM9Fzb5IsZKUr5NNF7nxZmdd12lcY26/oud6CAzhiCFpoapTp2KYv/TK71TPFIza+BAhyiLsHTI9N3QPFqJ3knmTOTZCcJpYtROrGG8LmpplTjT7RDFa+vwdUHzdMRLDtqGKgsKv45l5cCDVQbVoKADx4PkXUspX3PN5YcdEj8cFkLmZZDszXjxtMKx6+ylgtl2gMGP0k7zKM7DFM2EgO9ydtStz/ZAoHe1uys/955rHyyiVIXUUvka9ps9+uOx3pVWnte1naamjdvrh2ToIDGc9zAWWroDPrw9kxvzipW0Fw6sY2WIq7Rxb3ByXWyTf6+OUjEzZSNYuQ5vzNCp7eS33qGgQWhH1MFswM19JqTBR+ALcO7sCtk+bYZM9U9QhNp+WVGQ1/AuIPNeHMxdHA03QDXS0OUMVYpPtv3hArAUTqoyLBlwlbmLGKk3ipur6Rony8y5oonsmUbKRKzQLvDk03/yiRMDc7iL1/lRoDlW8AWXUUX0G0SbvhTURahllwAWYgZgadMmV+CFD7HxPBtx2m3d2WgYgA2rWB6HdIyGodMQ6jTm062uvHHTcxuYejaZo3lPHWLLwVLcdMfWdMQmIEyXncnFSF4WqGzpKh6RsCj3Q67wpTni7UeahyGg+b5sMtZ+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nr8IXW+Lz/b08yVkifwXcD6nWiCGO/mZN7LQf06QKm71U+NY7RtZeiQHFjA3THnDKZsRsAwvqSu2/feI6UaJGEGOnmpL8TMgCEse9VEv/tsfqoiuYGF3hQxxB3iOgl0Rj2NPmKmj1VW21epks20/UjIvy4U4tQIEJ7NDn0vzHHO6Iv0WZizdQB/2Dvf6QAIXsF5kuNuNcEzFLs9VyKIcqKykMtS8LyUs3uq6x5ZyVY0v4tRBSObjRqT0b9eAMKYDzwn2nQOzqMOA5MVJnFEVtQJoFEvnuJ7BqD1KFt27YLA5BVE2+chM081O9OGkEBalJGLRYTYOcq+m3iOsg9QY5l6gAQzw52CHgihnCwSdcvCO5dPkTPu1tH7u/TWax4opnR2JoRNeUqEn5EaxO9s7AGS66GUD1bYC7d08sioihMpE54M9hTuM1ktZ76xfCpbH
X-Exchange-RoutingPolicyChecked: 
	Ethm/JjcC/C5wFkzduEjo/vpouHB+OoTOvCDz8ksh+lCnRSZhGSCtABZ7y33/j8C9lrwxoHtH0XatlOYF+auzXJopajUPDK6eMSVSa4QlDnGw4auXEk7EKhtgkTCu/w3Fmdd29E+wmKxtaArZWxyd82J8FyVZVqr27soVqaCOuiRkRb2+h9gMpJl2u0Nv8+YR5VXGBffDPf/akOT0UzuZ7UX5+BqJiXMOrY45uqKFSpTwMoK5dwnT4r1dIKwihcr1t3E6xGpPlp/8WZxsPIwwwM1VceF2CPDJbIYLwK/ri/XwCm+Z65oYJIG8/MoMF5GWaASKoQq1NdIZf8mT1E37A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 02:25:40.8242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1a361c-1f5b-43ef-f156-08dee3aab255
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4458
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyMSBTYWx0ZWRfX8KD7d9/WbgNu
 3NHDvFRdQDZZJPevEAxsk4gGinLY8Wt/TFfGjFv9vJVQL5/3CIfEr+P4C+mwZhwyzNyOmPF5s1H
 y2ogem7zvrpHj/zS5cBc5/vox2YPo7HCszvW1ga7D0ubVB+3M+ayq+uJ6alNHmDaQYSveinZGEQ
 /Itx1CRy1CSv8CHEXRgjmKAL3Bv9eHbzN9JLiCipYKl+OLhmRaN4u242Le7iLYaU9zy+Hmfvrxd
 DKuC1A5put3kyeHuek+1QOITYCJ+iRJLs05IKkQcOiIjhY2qGXvk94IvcMtY1GhIwimdaSeOu02
 zRenIKnUtYfh9k1IAR1J0mDmmzLdD7tVmkL+nobJ3B0VR3Bd+FEklMTwKtv1y67FUlvJ/jWYvpG
 uyZXz45t7dPz5PcgY9/dqIyCrGalXmyfE6K2RsIq5SOrxqcBSEnH9OINQErI7YuDck6CKJUz2Ao
 n2PdPfigD82ZbmqwySg==
X-Proofpoint-GUID: ePdT8MFngTUYn1rPxYInIhNdOAn5rbIx
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a5992a8 cx=c_pps
 a=Vharl4M+XVTaKge5CdhMZQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=J6A91KbLSr3HuT8D_0QA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: ePdT8MFngTUYn1rPxYInIhNdOAn5rbIx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyMSBTYWx0ZWRfX8SQOSaOIMWB5
 MPpTrrIAF+SIMEHYOcd/ldbS2Ap/8CW0zcuZ/cX8Yhnf/cU90Q0zs/CbbTT4OfYNUS090oRvNRE
 n7dGIhp9iW5OiSP5EP2WILRIY2u33Vk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170021
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 02:25:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20153

Two oe-core changes [1] and [2], have introduced a change in how the
kernel-fit-image class generates the entries as related to
KERNEL_DTBVENDORED.

[1] Corrected the support for KERNEL_DTBVENDORED when generating the
entries.  But this broke our TI settings and caused build falures
because we suddenly had double ti_ti_ entries for the default.

[2] Adds support for KERNEL_DTBVENDORED when figuring out the value
for FIT_CONF_DEFAULT_DTB when building the fit-image.itd file.

With both of these we can drop our custom setting of FIT_CONF_PREFIX and
update the values for FIT_CONF_DEFAULT_DTB to match the same strings
that go into KERNEL_DEVICETREE.

[1] https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/kernel-fit-image.bbclass?id=4297b94c3728cd2e320d75b68c508e12ab127719

[2] https://git.openembedded.org/openembedded-core/commit/?id=3bceb2dabeee13c0a80ddd74ea7ae991606d6772

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62dxx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62lxx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62pxx-evm.conf              | 2 +-
 meta-ti-bsp/conf/machine/am62xx-evm.conf               | 2 +-
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf            | 2 +-
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf            | 6 +++---
 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 1 -
 8 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 01955470..db409e5b 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -30,6 +30,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am62a7-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62a7-sk.dtb"
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
index b723d457..08dffd98 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -18,7 +18,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = ""
 
-FIT_CONF_DEFAULT_DTB = "k3-am62d2-evm.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
 
 UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
 
diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 5104549a..7a422617 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -17,7 +17,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 KERNEL_DEVICETREE = ""
 
 UBOOT_MACHINE = "am62lx_evm_defconfig"
-FIT_CONF_DEFAULT_DTB = "k3-am62l3-evm.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62l3-evm.dtb"
 UBOOT_LOADADDRESS = "0x82400000"
 UBOOT_ENTRYPOINT = "0x82400000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index bc056e6b..cbae21c4 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -21,7 +21,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am62p5-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62p5-sk.dtb"
 
 UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
 UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index dd91ae66..5f75943c 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -30,6 +30,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index d1f6660c..44fc82ff 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -24,6 +24,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am62-lp-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62-lp-sk.dtb"
 
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 252a0380..8c5e59de 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -22,9 +22,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
-FIT_CONF_DEFAULT_DTB = "k3-am6254xxl-sk.dtb"
-FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "k3-am625-sk.dtb"
-FIT_CONF_DEFAULT_DTB:bsp-ti-6_18 = "k3-am6254atl-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am6254xxl-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "ti/k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_18 = "ti/k3-am6254atl-sk.dtb"
 
 UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_a53_defconfig"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
index cc90d390..d241954c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Generate and sign the fitImage file for TI Machines"
 
 FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PKGV}/${MACHINE}"
-FIT_CONF_PREFIX ?= "conf-ti_"
 
 require recipes-kernel/linux/linux-yocto-fitimage.bb
 
-- 
2.43.0


