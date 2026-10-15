Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D584CC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 13:06:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39234.1792069612060510096
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 06:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BJANU0Gh;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=o2dltWfr;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: j-sahu@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69FBHpBK1914751
	for <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=CdTxyTTjnVWk+
	E1w7o98noMjs/xudkAISGCizstqjeU=; b=BJANU0GhiSZQ5bCmQCrjYP8CcizAA
	DiIztDi+xpX//EuHS/IZQQ9dcRnnrMFz7fZlY890V77Q3pmc5oLnNMI1PLtXXRmy
	YrsvfSgkwPKiS3ENcNvKP7IkCQSNgWRY5syW4jYB7/ZCF6SojmiZU3BJtPms85YO
	H9T8wI3G0hRhVrnGnDP/zs/OdQqx7FEc2T8lL+684loGMTF4YptOn7qRiohoD2of
	XPIHGAGN4ScQpA9YNiOMpEisPqYtCCNuSQn+bA+NbnxtbmBDcFJ2Aw0tv5jNTQ7p
	PMro13ezYJPSDr3QKuAWsEqt6jafMcxD7f9SVT/8utL8HfV9O12AUbsqw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010041.outbound.protection.outlook.com [52.101.46.41])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hawu70gwy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:06:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmdufujJhWoQwTSSbu++j2NcAvS7Mefj5qC4ftlncUo+fueb1WwIiZ6Wvt3W4rzWQZ5SxMeKGAYxdNqcOF0IPdqD8SPuNUJKpgSfL0l9Pdcsu21L4aBZzdReu0De/PS+UjirxODUxUHnIDx35fVpdLRa6FpGLQi2ZmAeaCWuy05ZWU+HLfvRo9jtO5TqG4k+4r2vYWyJ8hJHpTiVXzbAZp0WkLTsHU+q78ZoDUyZOyg7y6muzpnHllMZPp7yGA0xIDr3/BpQDfN8tDeK3mLF1rifvSkVB82s1+CsWaHwHPm8bKwaMBYZER0EWRAnbXVWssxsjboZzKAFnIpkBvA/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdTxyTTjnVWk+E1w7o98noMjs/xudkAISGCizstqjeU=;
 b=C5kKUBRuk0zAblUm1fn+9Z/5rf/VsBfuMMBCZYm2WSbI/ale+HExb2C/z+6yQM6zWo2c11kFIK1uEIbO5J8MWxQt1swEvWLpnr1VNNZtKguEjFP61Md9akvIsZAlMVVK/MlT6f5yWzccGMxcIPznFkl+Jsnu3FuH2j/KwwQf9rgPywtQ2va+lZCrz3zc0X7laQbmZsVh1061/EwttlDDycik2altRthBX2Xjj8gzzAbZW6AZCR+yOrVARnIWjJWkz2I5EZ94d4h3Rs3HHgP+WwpNiwzOP0AWRsvPIAsrvdj4yc/e+UouqonccU9rH1VZzkzGhmrHaCf9c7m/KU3zyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdTxyTTjnVWk+E1w7o98noMjs/xudkAISGCizstqjeU=;
 b=o2dltWfrWAQXVuSZ14Ydc7326Ws6vHEcWlBhmyUf76KyGdfImoyok5cyKkmSz6RG/XoMB1TYsxYg3sR/cwx3DBSD06z8u9SM1QkPVDOhDkkyJ7SvRpHy6A030q/8pSMPYqqipvEytvKsImwqJalBExbcj9IKNTJ4l/1XZCfJOrg=
Received: from SJ0PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:33f::7)
 by DS7PR10MB7279.namprd10.prod.outlook.com (2603:10b6:8:e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.6; Thu, 15 Oct
 2026 13:06:47 +0000
Received: from SJ1PEPF000037A6.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::1d) by SJ0PR05CA0032.outlook.office365.com
 (2603:10b6:a03:33f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 13:06:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037A6.mail.protection.outlook.com (10.167.244.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 13:06:46 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 08:06:23 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 08:06:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 08:06:23 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.159] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69FD6LNE269952;
	Thu, 15 Oct 2026 08:06:21 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] ti-bsp: enable legacy SGX driver for ti-6_18 BSP
Date: Thu, 15 Oct 2026 18:36:18 +0530
Message-ID: <20261015130618.1811556-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A6:EE_|DS7PR10MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7c0e77-6ea7-4cd6-eb81-08df2abd2af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|10067099003|18002099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	05MdSr99Rg8mM1Ds4qdOJpfhdqFvvBaniQegSGtWp9g6/2AJP91eSs1Ibo+qhfdlt4chmi8pAevRJoytJ/rXmV+jvQdB8j5NZ/z4dE0+SREbh3JR6bSXlreY990+Tdw3OfrdJg94iflepRbcwY/UKwT10/VEaeek4CjPrc8wG+FIQHaBePVfVtBemZW6TsDM786RiO9h1Gm+wl/37pMB686UDQ/RYSLXIIGcARtZi7l+oeUwHwzMXtRgwpAmltPjzaZOjCYxpLxK0xaU3qOA2i5H/mumw0dGrxS/Ooo7bzJlyGD3nRojy/GgysgARgLjdUTRD/pOcetH7qEqfNl1T2+szbxQAAI1oKV3skW2J+egyzf9DFur3u8rAD00qlA8p1LQPWGsVfEeaNj/dohENRXbQDlbrFutN9yAwh/oXG0tOiWa6BFq0/0LfgnYbxqsm5W1L5v4cvvyoexHS71fqj34vwSr76MSr5V+jepPeRLQc46W/eysgmpcmnR6ZKodpuwVZTINfDZuCHj/Il7v5TU1V/6+ahUIKLCMLlwzBZYB0eA+lny0Al/LP2fsG4q68N/uxZne7KrcWOKFhgTzt1kIpd9Pm/WSi3C3wp23Mbw8Kz5s8xztoccrA3Cnpxf7WLltuI8K/nTySMV5kg8aCokoUMp64xAJKwdrkJd9sGeIdskzLs2svBQGGdNVFtKdIHUc/temlKUf8+ljQUZRFA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(10067099003)(18002099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VRRAgi+hBU+f/0AVCudds7Z5O533ofLow/Dc8pSN4cy5piBI87jYWJTmp0FDg17/p+pl0us3emerP7y6P5B5jdokZcGGVD4xoZCqh7I1poWfl1/bmkYKaHLD9tUdZZTorCgwnnILjvPm62Qw8Wc8OwKZ0f7SBDWTup9vN8NwkXL/Pt1gPK0lxbNAFGiNLr2B+h+OmYDgD76Jgg/KEnSzi2CQw6e9VOLF9TK2Ot6IEQVRSB4AJ1uZ18/oZ5YXdkZDMwS5onrjAien442yNbpo34zDF8rKxZ9BizmUFe2TT7B5zGpbV7kqObEU5U5sovgB1pL/yBBc3DD85Z9kehPHxf5Gfit6cC/4fmkfl9jMNdii+fiSjp6hQugcrlhGpbN9ovIzqbJbDGvFYR3KBUNnzLwflxWPyw/SFB7p3CCSuTclROe87jPnlN9v8/qyiuvU
X-Exchange-RoutingPolicyChecked: 
	zSEgHt7C+0Gw2P+JtA20+PAvB6YiTjCBgq0EF16YkQSatcRSsGOudDyEmQ2Gclmf4pAMff0aQZYfnOfuM3O0WiKP7Dhi3Kr3Uc0Px8vdHozzWzDTzio6kUfk2ypXU7Dnylfq5nm5onfcINCBhGSjB9UR5mWZg8E2c/yMaetWOA/40qZLZPotKicbpkqIhBruV7Kl+yT76qYF7G5QeziEDtmY328MbEA9OHyCs9/q7VB+GbA5CQkHF6VOpvLbFc8E263JJO3AID8npxAj6O4bUllTBM4W9oDa4bxJK3TG5b9P7rlXhIL/Re4jBsOOFvlcJV//3rjCLQ18vDnHpTpuqg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:06:46.6710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7c0e77-6ea7-4cd6-eb81-08df2abd2af8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7279
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX3VBncU7alu7z
 8G3UlfDkUX7C/Opuo5NaR2TCmPnnt2bEDlSlgbvFomui4RQgcmb9NwSNYT5B/31bU6seOXI2AOh
 gxfrRqDPDaBqhqYFYvqexzRQMI6NC/9OqwHfwgg3+uY4hM5z7BuJ9a+sNafZZbHq7ZmGC6onREf
 zb3vEQzOPYq7aKB1lSPfN/5AsQ32WgPiRNFz/YgJlaNyLT1OGGelSLDM0tidBIjKwSmnTujWAS5
 AR8kE45QPNEKCzo4UdyRhqscHTx3Ft0jPqtZDAiB/LU3FHhexVhZ8LCANz5naqer8Em5lh2HOD9
 5f20YdOdK4Srzyze/w2w+Klo1aRRCtLWSvH0VAz8kD+VmGyC2DUxldj0EdIfeApMcsuePItqbHa
 lNlYu518QZnZBBcCDUV+w0a7k5sbMfcGPGbvBMKD3j56pNGGPIs2jQaByyHC0xqAQD00y0e/evQ
 IyAssS4+OwLJtnvXqWg==
X-Authority-Analysis: v=2.4 cv=Su8Fe/O0 c=1 sm=1 tr=0 ts=6ad0cfeb cx=c_pps
 a=yJkyEzHMNmsTB3XYPV+H7A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=dHETb7GDf4WU1usyKScA:9
X-Proofpoint-ORIG-GUID: 0wmSr5uhGClgBdJf3XoKRMHSsRQeba-2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX+wVkissmLZWl
 4Hh2EWEi2FhtbWrgqem4r1JKyxd0KVpgNrSzovyECXyK9JaBFUSnEMhdMgu3yYdJwkJvarkQZL5
 JZHaTscEU0bJBfb4j8nCqRsOTW4FPJU=
X-Proofpoint-GUID: 0wmSr5uhGClgBdJf3XoKRMHSsRQeba-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 13:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20461

Add BSP_SGX_DRIVER_PROVIDER and BSP_SGX_DRIVER_VERSION for ti-6_18
to enable SGX530/544 GPU support on AM335x, AM437x, AM57xx, AM65xx.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index bf90d1da..d9f59159 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -42,6 +42,8 @@ BSP_KERNEL_VERSION:bsp-ti-6_18 = "6.18%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
 
+BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-ti-6_18 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "25%"
-- 
2.34.1


