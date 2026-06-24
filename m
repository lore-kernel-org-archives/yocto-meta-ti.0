Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AEBCDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 19:39:23 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15764.1782329961061725242
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 12:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JLiuHBvD;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=A5fM9uaz;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OF2W7R3072945;
	Wed, 24 Jun 2026 14:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=kjmgdzqMsYQXp
	fD+lmlj8dQZzsa3mvsMLC6FjctOjbU=; b=JLiuHBvD9YRAhEgGSwuD7SviaB2Tn
	/Gp3Zo/wNqjubvPnxrj9AlKzLWyqdOXUHOUoyGMosxeJTAJxZdz4TcyswnaUZS3V
	iH5I03CiHN/TJ3r6hLIaf8uLAI/dxrUn123E4QKL3naopUrbJ0hxkprPbPdxQEuF
	3NawG+058fNxI8KSGQ1ulUbPa/II3LCVpl/swOJxfCICB6stj7daxpBogJFv/Jg7
	0FJueKdVKikyGmtVBlLF33KYlHbozTn99aHfExLNg15Q9qfM0c80SAf36Xj+xJzO
	MwVYE+t8WcO1ovklOe94DVzG5xblxcvBv+Wudynll/5i8zxxkQK12L9cw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012071.outbound.protection.outlook.com [52.101.43.71])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f0ecru4x9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 14:39:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFL6CHtUC+NlAqzQJnIytPCrWTmPX+InEt76TeESSwh1u8b2tBuXSZIl9qhjQ0NDzRPe5PWDmOQIqpQyQiqltKhY4LCI7nBYWBuk7hDQTeUwccCYVH+y/0lXlLVgb04gmQGCfE2VKk5BQ5h81VBebMdA4Md0ock+dkQwqs9CW7ujcYi2N87ldo7vPE9QRO2xejEpWhP2dnsUfW4PA1Gtd541M0fHLq1E8GTvLiMFh6twE+DKZ9Ql7oJ1g2tz2LZj6KMiE8tt3bU6IpFmKyW/5KFqrtLrQAnXW8Zt0BQS5VrkoLH+xTq+cPUmEg6p+JIXP/pQmR+TaVUoEnNBCUDDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjmgdzqMsYQXpfD+lmlj8dQZzsa3mvsMLC6FjctOjbU=;
 b=dUvDmmfVqw5LgOjdd+lVG81716nzOojpHSG8AWXqOedilWlUU97hhHLOe4lP0GJCFwfT9erfYiMRz9kb4o8Qdbl3dtkcVrFMRgOCjPCxJILrnbMZFVAhJy4AeVvzxnblcgZ+AqlX1Mo3/nhaHEu8zb8KXwXfMm817J56t/mYVBPUtV0NA1drRLSEI08oGEFnxplAjzwkPjt+o84qv6rVD7RnidEJaVAdrhAU72Sn5UQMhfp1bprQ9CSgizADxIv4baeSNGzKxO/dgI/FojU4En2SMA8BwmlAN4z0mN7hfoOON0TNmcNcqnMpmCwRQiGlichVHbeA8QrQzXIi68zCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjmgdzqMsYQXpfD+lmlj8dQZzsa3mvsMLC6FjctOjbU=;
 b=A5fM9uaz+tL2N7IjLiXEG+8krcFpn48yWC8puYt6TNTrO86eSWyHNJyuD1OaHppqiNkCLtQFlrLY1/4Vlog6GmupJgWPu7iLNS4IQXZBsVjJJKvMBxcFjtORbZSl4WpRp/JoMl7wdx1tKGREkVgJedO+WQAHDxxNsmyaCUwgyJw=
Received: from SA9PR03CA0010.namprd03.prod.outlook.com (2603:10b6:806:20::15)
 by DS7PR10MB5149.namprd10.prod.outlook.com (2603:10b6:5:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 19:39:14 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:20:cafe::6a) by SA9PR03CA0010.outlook.office365.com
 (2603:10b6:806:20::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 19:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 19:39:13 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:39:13 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:39:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 14:39:12 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OJdCRF1113471;
	Wed, 24 Jun 2026 14:39:12 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] am62lxx: Use upstream TF-A board name
Date: Wed, 24 Jun 2026 14:39:10 -0500
Message-ID: <20260624193910.1149173-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|DS7PR10MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 959cc5a7-d070-4d9c-c8f0-08ded2284559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pjYQeXHKlZtOoiymY3i4zvANZga03+RMT9oi56bK722XIrpW0qz2IhR0uLt5dz1GEl6QwZ++Q3wyCJR5WUKXUBcT1lhfYkJLU5yMo2o9YWXxLFS05Hfzs0T4dNjUk0oOpzS0oHaPQC1JTjEMzs+HlBapSdmCYy6phXSMMS5cnbeNlCqtAictYmaUth/oNJ8X0DHGh0HagSMSfd2de5mdESL7+GCMD12JYeY0F8PFWrFOUrIt0H0PCt7NMZKfAKA4NjuV4EbRC4sAO1q6B0HbkcPmkwDkw0soneKr9MGNSSUmu/jTmsbE+mLb0/P/RgIAE8I404EGT0ktE8KpEqs+TYPm7Y/czUN6rGjodDiGlSyQUdlfgZD7hGfPcHZSZGjWX4YYvYTPmP4Tpx0IBkVk71snBgjpkfccUf1SUIh5t4i2vt/3jGXBlrz0K/bMqs6SxqjIIY7sRhB1QI5zay0S+Of37KrZztg2kjCWDu4kcc+24HFNDZdgKqq18nc5RYojIHQ/Th03lIgZEFNPDg3zL8zWq79Xr1b/LLOy0gzmI2C1mtCIJw5R5HMzXLzs46JnMOJ1SiLwQxhAQAakP0DlENo0A9mddVJXWWoD3KV8fVRtXfXksOWeUPGI52T87t8BlLk2A4uKwg0qA/gPP+qQ43fd0zQdA4f1VvR84vTkbwiwiU6c6Es1q5NVeZK37HzyPFqEhbMw5wdAGNayTjPjeg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OqJd6IrobvvzlPobG61z5+p6/CrX2bwt9c/3bCbMlDDybc4WI5m5Y7zCl4Pz++s9gZSPufinUGk2Yb1PWy+JZSSf3fjpX5n13CSlV+7fwt5Xmfekof0eArahcqfRRBzzx68Qw3/ekh3TZO83XS0FJyBWv4kPsI5FxYI/RzZdHZFb5hDUF9MzrSuz+5zDAoVVdx3Xg0FUnSfV5F/MJlFWsUGT2E0DPnEkHD/TR+eN7D5vUPFpMJLrGkDSLwBqKP3LmzpS3eoB58dQPk6rqNqaTlgTFai1kA7KvejVGvls5NhpNvwmNX0D98rIk355rg+IOtU3Pl4/0THY4wUL5ZHxdhLTiZzWhKBylUh/C8wBxfEyRU0Vv5zaNNM2Uk3oNUuAq4/d607AUF0a1mM8sFt3EGx2t0B7ZjZ5If3X5R3xbW9PO9IkbjxzydDpfCOCjrSP
X-Exchange-RoutingPolicyChecked: 
	Xalr7BAk5qAnrFXBdJL4uxzPCS7gX5Rd4MyE2+tS8PojaEEEJt16VQY4ysXVJ4m4o2r0GG4I32NRDEPiWJhIwQDq8NuY6gmY/1PuJI+0osdGF69ax9uGskmZPq/xROjmW0+OgTK4gg2H7lC4PBGVQiQerrQ5dK6X0rfZDPFZk1obH9QBwg+hSxRTbz20MyimEgCogLLGA5IcKgYVkwU1EkQQArmxNnxzNSxLadmB+771AHhcIiPsXBdYfPQ/g7/xiD9EUCiPm4W4Adrfu/TJ1EBget5jzT9q3eH3mYVbGS407KKp9T9nchoycUeL2Gty9z5VoFrvxv9rlI0ZlABzbw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:39:13.6600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 959cc5a7-d070-4d9c-c8f0-08ded2284559
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5149
X-Proofpoint-GUID: Eb1N_crljYox0U-YRWZ_PQpc20b1xk88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfXysG9cMjGpIjB
 VRC+LT+q4jMjsx0Zw6IZuE+lBT1jT6PQb+kxH8jdoboqbB3V6WVjeJpV0fP3aZdzBNuTWPkU5/e
 VDplZlCzCyQBrCbuMiL9s4rCX3H/Dm7/SDz/7CpHz624nxVT/KJOaSFgl0OquWeTM+tSpgXi03W
 5PIV32EwqXfvDwlG794xb4ZvucZEa4VOedloLRoPu9lYsXF3K1c6AcSKHQnIVunEfRZn1Cfbsoi
 XP7zbmpYtntNv49NMt3rPedSCQh8t3tiwnBfZm1BP19Hryo+RDOo3XD1nECAhVuY4vFlxYJp27O
 Y9uAnsPswrLWwoi22Xfkfa96W56foupNNXmHQ2SyhJBj3Nu/ZrQAoXt4y8y3f5/tZtBlMltHfJJ
 MRnv68bd0OZNxwjq3A5Y/kAPE8+IaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfXxVrhB4/RZ1w7
 hbMRo0BGmJfvF/51+4hr4R3pXoZlOl3GXZ1fPLT5vCkjHcmyivWLrDV/0LUENTkWMV+oJSPyYe9
 dPYe2kuwTGbLTtP7iPaM0wCJquDiH+c=
X-Proofpoint-ORIG-GUID: Eb1N_crljYox0U-YRWZ_PQpc20b1xk88
X-Authority-Analysis: v=2.4 cv=eekNubEH c=1 sm=1 tr=0 ts=6a3c3266 cx=c_pps
 a=Upp9xsdEppYJlq5B+Xcl6Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=dGh3sqg7XN33ABzaSxEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 19:39:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20071

Upstream the BOARD name for the EVM is "am62lx-evm". Our downstream
used just "am62lx" but was updated to optionally also work with the
same name as upstream. This allows for easier migration. Switch to
using the upstream-safe name here for the EVM. This will need to
be done anyway when we switch to upstream-only for TF-A, doing it
now just makes it easier to switch between the two.

The other AM62L based boards already override the default with their
correct BOARD names, and now that the EVM does too, drop the default.
All boards will need their own BOARD name as TF-A does DRAM config
which is board specific, so dropping the default prevents mistakenly
not updating this name and causing hard to debug DRAM/boot issues.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf    | 2 ++
 meta-ti-bsp/conf/machine/include/am62lxx.inc | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 677d6955..5104549a 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -24,3 +24,5 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 UBOOT_DTB_LOADADDRESS = "0x84f00000"
 UBOOT_DTBO_LOADADDRESS = "0x84f80000"
+
+TFA_BOARD = "am62lx-evm"
diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/conf/machine/include/am62lxx.inc
index b626119a..99f968f3 100644
--- a/meta-ti-bsp/conf/machine/include/am62lxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
@@ -5,7 +5,6 @@ MACHINE_FEATURES += "screen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-TFA_BOARD = "am62lx"
 TFA_PLATFORM = "k3low"
 
 OPTEEMACHINE = "k3-am62lx"
-- 
2.39.2


