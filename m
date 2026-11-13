Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.756.1794586275181541201
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 08:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mQDkCaUn;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ajhPl4mf;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRlDn2031418;
	Fri, 13 Nov 2026 10:11:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=PPYpTohOHX6lT
	+DzxG0kgrVgUvBLUySN/698k02A40k=; b=mQDkCaUnFsqjrfGDCR5+DN0aJhAMT
	bssIYEQlgXGlmsIn3+egEHGnK8DyxnsHVI1LOF+qX9HhIKknWVBuWBFUdWQ49/lK
	3AcZ2dor6lpunScpZ7PlsmV6F6rGDJT1la85jj9wJOAtY4hLfSWTqQdiDsgAcrVd
	a47eAazytttG2DwbS2RPhw63VmUqXTt7bQujRoo5yxiXFqZy3pkYzvyrUkg4XWfN
	FYIc/xmnWQpJcZzfoaN85nxixGsRFSe8wBH6Fc1mvjxW3WQ5zxbgENh5rORsI/h6
	O98lB9LljbrS0yoD883ulNoUlARGMsDE4B1+wtFYmQVWSVuFW5V0210Cw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hwytcjeeh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:11:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSw4YeJ4L1XWJYun4mZ3CdDzdYJ4X10fifM3BdHYkQmWl72jmEEJhiNRnwFI5ixlJ/FczTYnr5VNnFsGBX93wr2jsGe9K0gtjOmI+SuC1ToFfL4Rageii1ldVLVdjQpk/u1Gs6mstLAVPnxrBjphc4bhO8x7Qq9oGctdZhTP0651LUN4XhZGNAx+gyN7VJEC0GfOUk5xxdS6B4x8DEGMjBiiumfwqnSzfuZIgQ7LOLIqDsQg/CH0gYLgDyZJi2lZJwQBh06m7abdsejoY6Ky7H+MV9jzsSOOMPHSzxYLqoGT4+yAZu+PmUMHc1WGsmNfJrHnXuPHjGpwGk1jO7Ezow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPYpTohOHX6lT+DzxG0kgrVgUvBLUySN/698k02A40k=;
 b=Zn662ZmrLGbmDP4sSqTCoW6vcLkXHCX3bKD49APdyLGO4+AVLp5MLXUhR/HfM1LmXqBYhrvLxoqVhvX1k/23Ei2ZgiaoVZtkuKDebTeI1aqGST7XeabYwZTUYug+bSB7/pXJMVhX78DFh72M8rgCI0eQ8OfL+CuU0wN5M7mvDN6dqFjWawnw0NCTctorMQiJ+lEP57Hoq0u+DzqeGmWplF0H5RvS7ahrPdvVvPhF8iC6G+eoGRGpu5r0h4vbY6n01tiWRSuySY2Utuv+qYlWjsXUIAsLB46kKSvPHm5OKfRVw3SxTCVRR5tF2hA4ioIxgiTKer9iDHM54KWmnf2QGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPYpTohOHX6lT+DzxG0kgrVgUvBLUySN/698k02A40k=;
 b=ajhPl4mfZF4lN7pGCf8/hdkbKOig0DoKn0jAHT+gFc7XOUBz0hiAdbY7mWjvPJ7tFeBJe4shT2Zs49jiDMN9kz4yvV5/aczadHwkV5Pt9tYYcoG3TaayUF+Kep6bMiLPy6YCw4KrsEWgFtsm11fRoJYW/rMqbX45csFmzviHd/yawpHAIv2NSqDhq5y1O/BTcEpdR/i5k3YZyC2R31wJjO0CVEQHTVmyvskUYZKovYh0oHcBIyesit7LSqNCdchGf3UVervRBASolMaBA+Uk4pDWjto33qDviAMswoJz2+aVq/QKzHodTZWaAxn/YwNH03Pk4K7vqOvzueGsLN1b1Q==
Received: from BN9PR03CA0961.namprd03.prod.outlook.com (2603:10b6:408:109::6)
 by IA3PR10MB7996.namprd10.prod.outlook.com (2603:10b6:208:506::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 16:10:45 +0000
Received: from BN3PEPF00022BD4.namprd03.prod.outlook.com
 (2603:10b6:408:109:cafe::56) by BN9PR03CA0961.outlook.office365.com
 (2603:10b6:408:109::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 16:10:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BD4.mail.protection.outlook.com (10.167.248.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:10:42 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 10:10:01 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 10:10:01 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 10:10:01 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADGA1152081506;
	Fri, 13 Nov 2026 10:10:01 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0A52F2A67; Fri, 13 Nov 2026 10:10:01 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202611130704
Date: Fri, 13 Nov 2026 10:10:01 -0600
Message-ID: <20261113161001.2221621-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD4:EE_|IA3PR10MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: afc19390-f659-474d-5510-08df41a0aaa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|260925022911599003|260925021911599003|260925021311599003|18002099003|6133799003|261021123027099003|10067099003|261009223027099003|261021121427099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: 30q0pzkV3Pp51pO5beXk4mcuBozS/1dKvvwQyjgz2TMhKaLlzEIuiCutzJ0eTBipaHMyfJUafAdltMNNgHRE0VH5FYFGDYpDyC1dEiU6nA0mwBSR7Y1on51ob+iAHAEykJ3B4xvmvZcy6GMMVqyrqaE+MuPbLOr9USXNvAyH5+qfYOiXUo7sbTuk+S8/sjV6QsqR/afAs+dS5h+moOwupvBSrmR32yODgg6RdjpZARiFHg6lwbI3iLkDh4rj1F4Zho/U7K6S103XpbsBniiqJyvK/1FYZccH3dBv9SqxNQgH/Hzz2e4Mw8VNCWUJM5nsx6t0VkPE3qmXYHYpWKeMIw2yjubSO1dXXGzC/cr999uPA6PvaAg9JIkTEEoWiQ8cTGlj/kb60oshBji7MavOBmWXkq6D1NSf2Qq3m3tr0EDBBE/6kRUy0b6VvPuPgJsrIz8OpimCu7SKNcYoBd+NwLFWFDM3+aT/gf4SrLBzEQjK+Vmpst2XZIMyoeGewnw3TVenzSjrRfeYhjnY7GcAiLZqg9d8w8HtAI66PNiJEo3+u3R//fucm9t3vgx65T2OGwjpEs53ojo3U0OuKFfcyFJuqqQIkDi2vMxyfK768xwg9YnL6RU9VmT/YisznNw4FJ0BNbgbsZrAIHBvzw0MLCxU48S4ZA8Znb8ZIvE4bFJn18amOkXFAWovXdnFMpwqxpnu40d+b7+BO6w+REkSUQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(6133799003)(261021123027099003)(10067099003)(261009223027099003)(261021121427099003)(261022075727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J+xr6OdKA7RBWjrdfdAUnjxCT1VoorUj94pDRib2oq/CZW0aYH4XSY4EP4F3A4hlxi5rWeBkex/IjLd1jRL7igj187wmQXPT8p8z/lo12QFaXOzOkrHyV7qBai6+lolc3aX/Ufz74RlXGmC+sIohPG20s0AY6lA1yK/tP0fTWT82t68yYOOqI0ixQljJ5rp5zFnmVP2heF+fI2DAdxwbLSmrg9SiPNPFAG/MEU01atd9772nfZF2x82gpqnAKBJSo/86FomSzenYO6sQdLD0jsspBhYdd8SnRamC9eM+0dnW4iBZdSAgfWZml2xZakTWzAL8RrfZ5eSJuXflJBSj40Xh73h30IffMoH77QKoCslEi9AB0Gq2NKoIk+Zdl694fTBd5NdFiSuzszunpSJYKS5fhmBzVESl/58QJKjl8oRIAkm8ZSO9X7Fpc62VtDLC
X-Exchange-RoutingPolicyChecked: U7mloYifoJoqP0AmwSbgoVm6W/UkUlkjxGPkYQVSdS7mFFVcaaedbbkc7Am4C+GM20zGlBW8Mp5T5NmukCkizW31qWiFjVjkwKceBevdgUZKtFwSuFUJosnQ/QC7oHRKJPdJUkjXDSUXyMnhA8yMEoi33Rvmq0jvrRK7LZlORufTckngTpUDTGmIy5O8RQX4oZuFA/Q5GGd+2r4c0e2jr5M6BH/8cgyJwur9TGOuSbxKpYsLuFlkKZ9RbkGBKDaFnktbIZWVW99/N/Fo4+TsOVaJUUHmCz0oYwMT93sTEBmsigcCJLfFY6uabUYUQX2mSYffmS4SaIpwJtaiRDb2AA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:10:42.2421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc19390-f659-474d-5510-08df41a0aaa8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7996
X-Proofpoint-ORIG-GUID: AcNckbGb2p_Psi8lAN0T8hx9lMaKIwNM
X-Authority-Analysis: v=2.4 cv=fYI4WEQF c=1 sm=1 tr=0 ts=6af736a0 cx=c_pps
 a=4lv8HNOczMnyBuWqIb70LQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=ItaTCEgMOSDjq6VRSxoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfX32NO8qTR7Dw2
 kPgaywElPQ3ribzps8YmJK6k3ORzU9/bmL47MxADb3kx0eCPwRoXLw7ov9GWsO6b4I9BMySKYMQ
 IwTYgp9VOrm2H2kdOnPfUE7Eq6OatZ8=
X-Proofpoint-GUID: AcNckbGb2p_Psi8lAN0T8hx9lMaKIwNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfX4qwoIZkaDXiw
 EyAr6cE9BH0GRKvL1zRcmMYRjyYKptWYAh34G2RAqCz8QfaV3t5iQs1WgfCZn1j2pGrdd8agCP1
 UYiwnLsslgSkeBcHS88ayDHtX3Ea/WVKXzrKDZ/FehG2aKqccTOAJvpMHLWCbFMgRzKqRtzkNcV
 4grnFAY6gdhGm2wnAUvBVI3Bq3J+CGeBJpiihEZio3/gjRbU2Dk2YSkez7YFPPzhdXceMQCEH/o
 wOmE1ew7hbZ1mVf6xGfCodZAheXbktZESMHF3Et+YYRsLYs0Bac2+wmf8pzQbF2qd3ktvedUV4H
 D0Nj1T8gFPxR4+KvlWv5J9EU1K0Sr6WyoE7atbqf6mXyWe19nOisAV2k1vrQ6jh8+GS6tOZe03C
 b5bjoHqw9y+eJUEov9sneKkfmspqQC2l2mgINMd08Z8EQ6chT6SxcLjuLUVV7nq63NWww0oJKWd
 Q4yGCyZ9sGGCIwkyYbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130064
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 16:11:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20540
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=639e8ed77b8c51071537ec9353fdc6200371235e..13a099d0ac12c053b9160c440a3a358aa1be2193
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=29eb9539475463231b91007066aecd333f170a7c..14023e509923ad141453ba75bbe081aa9a7b8915

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index c32240fc..dce19c73 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "639e8ed77b8c51071537ec9353fdc6200371235e"
+TI_LINUX_FW_SRCREV ?= "13a099d0ac12c053b9160c440a3a358aa1be2193"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware-6.12.y"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 27775b82..5ad498b2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "29eb9539475463231b91007066aecd333f170a7c"
+SRCREV ?= "14023e509923ad141453ba75bbe081aa9a7b8915"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5

