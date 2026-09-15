Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB6FC88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:28:14 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5205.1789500492841757561
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 12:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=A5ECPZja;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OrHXAao2;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FIuJXl703861;
	Tue, 15 Sep 2026 14:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m7Spfy6OImZMl4L1nuMwn2SjTOSS9AT++DnFm0qNq
	Ig=; b=A5ECPZjaxtdqOfhyst/4lKkJO7JAlwpJlOihJJueo5mAtiyvzPhkTZBkw
	/P5+AZRpWbImwPGpcap+z+WqgofWgcjptZsDWTXsxQ9/IznbYSN+2bXG87BVKzOi
	PUcajQfSMtZj5Rb7BHpwjxmA0JRto/wDvVGdGUMYBstvC18daIQubW4kKIQCvbW/
	COehQqBSrBXFOZd7lXYBcIuyrMGjEmmNLHmUc25j624pergrpUQU9BEueVCR894a
	AYqe8FzECD9hLwW4S/3U63exgN50jU9+yCcW65ByZWa6DjtQ3pllkHnW5vEF+5J8
	QRIiBn7+xHeCXuwYIkfuTjoP66pmQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gq362v768-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:28:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPwu1K1Azqrcy8cud64JuMnW6jAzlrtN7D0fJ1z9Gu+a4QDUhssgZxRMq3fhlMckYJbPXRNM3MaurX+AzYDEioEo2odxASnu/ULr1zjX0xmQYU3fV6ztUK1PLFhuJTaPw57yDrj//nL/KsCnf4NPHeU63Mm5gswCWA4wd+nIyvXILRC5vnd8ljMHHFBG2p2JY2cgFQQE80kljtEu2X3nGRuMugAFDDPkTAmJBw18C5foZcEyiSbSPvXq9th/D0DdONafwjHFSaA3okmROUNP6c4HM0Aa4aCYKAMnBQtwsGmiJIqjjopZq1cGVu+x6hTpqIfLF3ehlp6JGfnmbfKJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7Spfy6OImZMl4L1nuMwn2SjTOSS9AT++DnFm0qNqIg=;
 b=mBy1t52xDjme4pWtKJNtuP1igwFOeoGe9afurj/ULYgmBox+2IOE+0Oe1WgD5mX1Erxi0A00Zk23iC6Jm33q1L5TpalA2vmlm1+5nCd0S5WgJImGoXG5aCC0mJ0DqA+2hS52PBBbuQKRf2Sx4UK4ahP/3JD6LNFvnxTJ5uEK5KfJDXsj7Rtc7DOkvQpphYg2drZecmUDptfGU9ynMh+ZuoKEjqEZADJnvUEwuiEccufW+zkMNPorREvVCUpriAuqlJTj7D34D2V1taiGHnkIPhekO0G0od7hCJYIlRWXwWedbKJ8uXxF26XtyGhHUpvqErjvlWWmTHS0EFXw/qatDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7Spfy6OImZMl4L1nuMwn2SjTOSS9AT++DnFm0qNqIg=;
 b=OrHXAao2SifbYKoxsdiw/ZHr4iCC3KK57Y/6RgWdUc9YJAo3BRHGrqlxMc9OzJa9exNzDx51n/3TANl6REX/e9SBnYIjYL1nv2/N5O8nFTcy/6KMlIZQUWknGNfo+G0wJiQD0mU8XXn8aJGRHeJtcPeGLlVHyhc6QTSwk1BTH9Q=
Received: from BL1P221CA0040.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::15)
 by SA2PR10MB4523.namprd10.prod.outlook.com (2603:10b6:806:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:28:07 +0000
Received: from BN2PEPF0000A7FE.namprd02.prod.outlook.com
 (2603:10b6:208:5b5:cafe::37) by BL1P221CA0040.outlook.office365.com
 (2603:10b6:208:5b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 19:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000A7FE.mail.protection.outlook.com (10.167.245.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 19:28:06 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:27:39 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:27:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 14:27:39 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FJRdeT575810;
	Tue, 15 Sep 2026 14:27:39 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x6Yod-00000009wLP-0dUd;
	Tue, 15 Sep 2026 14:27:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/3] Revert "u-boot-bb.org: Fixes for OpenSSL 4.0"
Date: Tue, 15 Sep 2026 14:27:38 -0500
Message-ID: <20260915192739.2369213-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915192739.2369213-1-reatmon@ti.com>
References: <20260915192739.2369213-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FE:EE_|SA2PR10MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 0436a174-7a91-4ffc-df58-08df135f77c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	6rwzo68LVBzhh4amLXUs3IFLc7K1EeJI1nohoz9h+vxTZatVoVAreOv/rb9U/U9cWF9oIm8PK4koNLFYZMOOaHxWGHqWt9aiveSa9taYb7rcTDGLROVtYg8oFTS07Vt8T7F/Lu/8+Ho/wuXmjLqAgOAJsvCT1q+k4zkOlO5j+9b3tnE8w9d9KsKfK5W3VOpgk9E6UuyAvmLNx1mml+qgDtbgOCmDvZp6hB8OWh+q+gRKdyfikX+yqgIaKR/DSLHWMG6aWrlQq0zIHd9HS341JGKTr5aOmxrWbht22ZVQlJQQfCHBZegULn4OynbvA8ThALjDRFNSZ+pVjDZaX/EHFktp0c09rf3I1Mp1wIaGzXNSJBkqyjEni5C3tAon6UHxDICHQx866B4ENmbN9HrETzoKPS1EZDGOEHhl986W9MkbIW7s8xO/FW17sCW9zOhjX2xMDqPVAsmAv+tuiK4Bttj4Zv6kAVe2MxPkPsKh/2Mv3gQrkMVXV08PR1ThmYU2Lh/PRmXtE6yuompyQwidLJqTMizTr+c//ba3b5NHnKAeTQpRnQnAT4dICa9cwJU+sRsLUj7r3Ypv9bIaT+s2if61tQj5crjAQZk7IMia2zCvyvx9yEzGgo3kqsRu8LvzPTxzuFERfq3A+6wXqPSM8VSoTHVQt7pBULUMyeW5i4IfaJu94A0YfPVk8ZMTk9U88T8Pm85TcW/EDayN0wC1oA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NjjCsAvD83A4MylVZY6ah9ayJLfTOlA9/l25IO7hNTBW5NYD0D3UYlr8bLhcRX99Ozmf+KoqXw53nRcwcsaCtMi6ZC0vnwRRjEn9T5aSmeBcviM1v18ND4ry2e0BkSHWm7ydaa0RmuXZ/95MLSkYZ6j9w4OFwjtsU04zeRcSioeK3IVcnkDnQ3JKEydjWwAGSe11sIYFHWQvraLLMoy1ODVswtenSDqk/w+GAB3GA3w+0qk2QJJm1fbh7yqqXNfFSb8xG2nWseyGPihE80wjQcyR6r+mXT2Q7Wl/qtJ5wxptWQJTUzVDSpEFA59y6t+fQCvBHosn7A4A2CqfGa4S3xwHlMl5vnsWpB+3SvFKBTikGzPTHe0oAJFPtWZq1OX5uGtkxpHjaBXUzXP8K25GrJqoFJD4F05VbMEwNaOiPN1zHdbt698XUsCFVLWQUQAp
X-Exchange-RoutingPolicyChecked: 
	4bV4+v/MfsoyKsiEN9QSVP5JBShV+EZGLt/o6BGFaupgBdu/eLww4yMajM/8qeaYTZH2+1bNx0bgjngZgGWMi2dROU8PwRY/3NFb5QlqhrbZvg0gCiLk3EWOnqWTffTPJnkYJoGCpEurd6jA9D9gocnf3KbFOc2Em1VBXBPtBMSpfHv4PgaW9f1xH940co/I7UVmq5TMylJPct6N6N9lxx3Y1ZYVZYLGwV7ZBBMHypEhM5BFSQByPSgeab1fdaaxP/E+8YjYqGGrRckfIZsDJxlt7/ToSE1XbrWmXoSVhUrnYanAZDMDoI2OYVLSWiCsac80hYgyoO7a8IdUlKJA9A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:28:06.0598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0436a174-7a91-4ffc-df58-08df135f77c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A7FE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4523
X-Authority-Analysis: v=2.4 cv=P9yvFSAu c=1 sm=1 tr=0 ts=6aa99c4a cx=c_pps
 a=AKd2An130fSphkJyqL6rzg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17 a=DYtVRx_rAAAA:8
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=NEAV23lmAAAA:8 a=Sf5eaNDXQkhf0gwcruEA:9 a=K1xa12UCscBrvhdHlanD:22
X-Proofpoint-GUID: 3ktZIUfF1urNy0kuVB55KtdMfeqra6w_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4NCBTYWx0ZWRfXxsVQ7at4zPIW
 uT+oyrGHOWjhWa67GLEGZ/QrzvM0aVm0t+gB46TlMIkWPaFTakCCGvNzIpZqUH1v8xLnZEaBBD8
 Jj1SLYJQ8oUjOa4LuDVO04Q7v2/fUso56/w4GailaQrGkwci7sd1RRg6ksXUpZLytqVgv/JWrcE
 g9x+yVqKGTJPCDRLMUOc5Tb/iJdmu8qWGP0ikOrq38EBjY838Ltw18/EG+EHibN8KY4JKEefjRM
 O//pZSelVIt13X5CHPrRqXLcaXzM3ajxjUmgQbolMTxRXo7dGp2J6PtqkS2+tf/lPQML97IYtis
 IAC5WJpV4LN37szZKd8wbBfd/CtMxR6GchbrjD+iEpGc4BE0BMv7LNAxSTdB7CFwL8s8s7lnxo9
 zssL0+mIBzQ1TNDX9N2cwReYZdspyuNHkltEDy53s1mcn1Hxuigvf/dirH4CS0FzNhfk4LWUvB3
 BwM2Q600pzDstvCkbpw==
X-Proofpoint-ORIG-GUID: 3ktZIUfF1urNy0kuVB55KtdMfeqra6w_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4NCBTYWx0ZWRfX+7dpusyOdz1g
 WNVjZ1nCH/rOr+J6878sgqOTpfx3Cz3YOgv1WGxufS+YpJrVEkkbAMReD2ypPIww7+W8oRanFWC
 LbOvOGJPdvTIWm8hoWLyCSZc7xuZ2uM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150284
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 19:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20377

This reverts commit 7c0c6e2117fe312d575ca682b2935076859d20be.
---
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb | 1 -
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
index 868baffa..23a5a3af 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
@@ -8,7 +8,6 @@ PV = "2024.10"
 
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
-SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
 
 UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
index a329f7df..a6284193 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
@@ -20,4 +20,3 @@ SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
 SRC_URI:append:beaglebone = " file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"
 
 SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
-SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
-- 
2.43.0


