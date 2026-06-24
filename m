Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB02CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 18:33:12 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14380.1782325983235681953
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 11:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aGWURADC;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=bm0ycuVk;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OF2c98703726;
	Wed, 24 Jun 2026 13:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gZxD1ox8fja3WCl0Q62eXob3qaYcop8RsACn0bgv8
	sk=; b=aGWURADC0bygEmtgu5/Z8WRvdf61WoS9V1IMRhbfVFIjfFlId76iMtoC6
	5su5juBcPiYpY6opBIAVOiFDxl4QSPDcfGg4AfziU6+bfWLO9l+2X7LeD3hUDbMw
	6hItqlCf9ScCXLPfrsJ28h0dmOgLYEh9nm5eG0dNUStIGjZJnZ/8p05gBkcoQpzj
	mp3Adb7IyQGK4SyKLs78BKVHs9gEMBA+pbyIFK2yrKlQdD6jjFIMq3InPb+366ph
	nJobBwXwLI3CpcP2UyT565pd9SWD8SQNhWGXh82Vmkw+RmWJ/WGFA/4aUezzrxdC
	ohBoRrnIprz02dOAEp1X/B7yUvh6g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0e5m2tgu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 13:33:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q95s2ZSZdqch1QoCms2FAMgFrw1mfdhdmshygdEdre6gaGkzOWvc48HRrGJbc8GbUg4IKfeU8eEGmlAgpLhhm5Q1D+5GBnRZIXhvkhDzckQMv2Y8ibibZKcNlT8PXaHIoi3o/moVHFMQZY5deksev0In0glgYZeqFMh3Eurs1XXW5m5O7ftnzBw99AST+9SgwGiE2lwYmRqmEbbjmCh7sBvLWq2/fQjUM0rcHXS7pJhj/RI8PR8kvha+72pQruhc5xZw5Dbc1kj8euq7vlN8ze+C98/mt6ZDMmlPgcB9665YggWpA7AyQLi3WfAOef//80yU+wqX8XLxWv/G/thDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZxD1ox8fja3WCl0Q62eXob3qaYcop8RsACn0bgv8sk=;
 b=qlrPckTv+VV45IonYxc1vtNxonJkQLNzyvxiQ4/05xn9VDH10sjk9O8d3ZOlBX9m+G7gq9IQBuTWcebr2mdwtyhK85QsTPhXAwAUDOZ/cmqmd+tw8xUPtmlwF8OhYDPLsS4Dc0i4H4X7dzMnAKDxVqiua5sG+z3OBS3n9Mj2DJMu9X4knG6w3ubi8dmdMI3PPTg7DSAlGi5A1LomZfwE9uFybArjxYbX/qDF/c77nyEwH2jrac+yeJwpbpLfx124kbWUBBeTBR60vRjPX3HACIxmfy79Rp9I4FX7b+GM+VUk5MPZyTzotubv14V+0ptGaiSxVl83vfb7s7Zr3W090w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZxD1ox8fja3WCl0Q62eXob3qaYcop8RsACn0bgv8sk=;
 b=bm0ycuVkcZTnhpYgFAWPbFtqB+KfGJCcdtKmaAt2wp1AoKEXk1uT3SQOr6p8x0USPWh5ygBtuv7jwtL62NVB9s9PfaSQFpBReDWa/+JlfkFkEivQXWhDiGPM+ZP/i7JUrBUJic3XO8U/4DiugYw7H+xuC71/AjA1Ay5VvfP6bF8=
Received: from SN7PR04CA0090.namprd04.prod.outlook.com (2603:10b6:806:121::35)
 by PH5PR10MB997734.namprd10.prod.outlook.com (2603:10b6:510:34c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 18:32:56 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::83) by SN7PR04CA0090.outlook.office365.com
 (2603:10b6:806:121::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 18:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:32:56 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:32:56 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:32:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 13:32:55 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OIWt5m1600079;
	Wed, 24 Jun 2026 13:32:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH 2/3] ti-rpmsg-char: Move this recipe to its own directory
Date: Wed, 24 Jun 2026 13:32:52 -0500
Message-ID: <20260624183253.1130737-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260624183253.1130737-1-afd@ti.com>
References: <20260624183253.1130737-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|PH5PR10MB997734:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a28083-4087-43fb-2147-08ded21f02c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	3jE5NUjovgmZOt+1MGeq19AW7Z2wsWLmuNAgGonxKnBZRaWGIcELX+jalwyeiuEM3FuFw1DtEPb9CI1h1GeuO1TBX+muekP8EJNZtEzleKQXhdWlCI8JteTbLTqT/vudybffjqnX6ILsuA3eLxZvRRHtvqyYVxXg4DUCoz9WBgmxZ6o6AJoIABq+QTmTQC+Eub+Xu8d5uhHY4z/wLVJ7h3X8rtB/RbkRr9ScgDoyk4Ui5KyLjIwVlYiXwm+Td57YoA9jPDViuHMgv0HzK0AVl49YuciWR5LUGZdiXFVV49UE+qyu5TVLVmHXZWyLI3g7Sgv+OTKrP5R+2iac3AcKhcJ91VkVLpizN4JW84wExzjB0dkbnOKsY5lDG1N5rQ3oXRiTpdklPDKKpfVx8S8ZzwPLZKntHB1g1b1OQiPvdF+hnxNL/TbOe9ViCygrAlD7kTEpxf7ppyUlEZlDQEAWPnFm0faz1hpYdRn6ATRRPsgq0roFQUlqYaYdAJ0YjY7CywxdlKGKvsQd0pjrLVEgbHKEB2pF1w4AiPZ5a+YanZ/tzRoQIelMAX7TsvusBosfCRRCzcxe1cw/Mvbnppms5Y9hCUjmWJgqZrULT7H1kg0SovNHEQ3nKDs3JjP7JssG9/u7V8a4wzquC0Bptk173qtjCPm7EZNmmZrvuk4j9NI/9sVZ1mBX7UqRLwa70L7cGS2irorJATVaEq/p3S54dA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MIvCOf2/YVntp7lXyYCaBTapqJ7N0VFN0DIh87v/9+OQzkA25POjgXzEm9lOXviEDCy+DJsO0dF6mjQYZLlVY8qw4qpM9m+pKGVE/q4g0o5RwHZ5xKxtYVHQEvUiSec2hnU+J5crzV2ByqiUm7Cy7H4ZYzmt8dVULFs4xMuM5uLm9stZC17NyZbrTojqYmEtviGsqL1KIkrZ9yEhZ98KWorxWf9NeqSMWTO8cffpYNigyc76WXvay2dFfCHZUihCArg8vy/fh9E0UMgewfwpmVJbOA+K21v3UFQjur0MgQ3Cthe/eCpqZwsPRzjLM9Q64ila57B/xJ8thuG6TRjDfInYp2UtvTtECASm9hnA/WkbhOc9Y/8M8y8t4uThWwzRWeHrso2fpo5tI7pfA8SAXH+IXYjxkWXXH1Zop4aGzRgRuX1UKLgi24PRqeVc1RFh
X-Exchange-RoutingPolicyChecked: 
	r3LnyJz1ygw1aPVeM08sGxuHXo1aCQXt8qwHK/PzBjBGgtZomFJMrY3lykeUQM7e0vv2zNZSLRlN4m7Nw9We9bynRoSYd9UvqbJ5+7aWCffbzQmtpaE8LLzFZO9vSy5vsgxBoWRTzttTMSuU6YxCkzEVD51OiAqJZID0PefaPNR/jeUFGw81QpXVyJfp3tsK8sVeRnW8qnk1pglTsgqDuDdOlQ435FDgfTS0IM7Kd2GMSd7+ji38vgJJZ+Kq9/uZ2LMCHDfT+0aniz0nyrt8Sld7yWZvw4/CWSOL29dwf3B4/LW2/fW2j7G+5WIYMFCfE/qzfjF3hFlCSD5STgNH6A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:32:56.4410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a28083-4087-43fb-2147-08ded21f02c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997734
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a3c22dc cx=c_pps
 a=3N2sgJzBBlSYHYMa9BBQhQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=aeV6b9Sf8OrDf8_slvMA:9
X-Proofpoint-GUID: BYKDs34SQQcL0Pddw1kJJFkNfmZIkirj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE1NCBTYWx0ZWRfXw0xtBq32hYo0
 Ha6VwQQt8hCIR4fdba1Q7eKf7U5a/Vrsokmwp1iHWQNw7BE7xn1zJAOTODhGUXzgWDYRTL+j8ZR
 N1vysVycfswRpDDzfAjrktsEc/9z8L4E8SLTHsuRu3qtVjsE/Oz6N6SROy1Pe+vUyZAZbldM2bZ
 RdIaZSbZDUOQNlc3xAvHVWL+WW4RGY4xwTxHUhoNHBHkk8+gERq/bzXuCjqNcTXe0G0YkpnM6Gj
 GrHZpIx3dcsqvLKNW/RQrpQD8TQzjpJB6xxL6ZOmRmJRz6LmvXPxibcTtfLsRvChkZnxHTj/VQl
 98wbfa1PpHPSKfAEJYwrC6o6qGq6RKILiRBikZoJU/u0dBmUbK9dakRYWUwtFzY1By/peUQzFrB
 72WqgDjT3MnAN4IL7k6v5umBEu4khQ==
X-Proofpoint-ORIG-GUID: BYKDs34SQQcL0Pddw1kJJFkNfmZIkirj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE1NCBTYWx0ZWRfXyU8ukgvB/zG6
 z031NyikdHSWVlCf0SRcV6CDajCQle9/qz4p5mp7qCuFlbUfXZoUTU2aAtjdZUpEf/5CrWH+NuP
 vFJkYGFWgUTndNMKWq6Q7YlU5JtflX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240154
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 18:33:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20067

Keeping all IPC related recipes in one "ipc" directory is not very well
organized. Like most other recipes give this one its own directory.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../0001-examples-Remove-use-of-includedir-and-libdir.patch       | 0
 .../{ipc => ti-rpmsg-char}/ti-rpmsg-char-examples_git.bb          | 0
 meta-ti-bsp/recipes-ti/{ipc => ti-rpmsg-char}/ti-rpmsg-char.inc   | 0
 .../recipes-ti/{ipc => ti-rpmsg-char}/ti-rpmsg-char_git.bb        | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-ti/{ipc => ti-rpmsg-char}/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch (100%)
 rename meta-ti-bsp/recipes-ti/{ipc => ti-rpmsg-char}/ti-rpmsg-char-examples_git.bb (100%)
 rename meta-ti-bsp/recipes-ti/{ipc => ti-rpmsg-char}/ti-rpmsg-char.inc (100%)
 rename meta-ti-bsp/recipes-ti/{ipc => ti-rpmsg-char}/ti-rpmsg-char_git.bb (100%)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
rename to meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
rename to meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
rename to meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
rename to meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
-- 
2.39.2


