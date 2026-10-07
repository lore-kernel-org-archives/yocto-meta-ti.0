Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FA0CA6002
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 16:12:42 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1124.1791389555754806442
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Oct 2026 09:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nJnM/+uu;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vLRL6nhc;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EwjFi1587905;
	Wed, 7 Oct 2026 11:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6g5qVdnzCAQX/
	HlNnw9b9EacaqwPqUZqAFeVm17xNpI=; b=nJnM/+uud7qcXsOAvjLN1jtzA450c
	uvuJT34RE0yfXCG4DTFvgsvHaEmHHKolP9LdgsTm5WYWByEunKys7dnsritbG5Fl
	Jkphg0uwu7nUQhebyY4nE+Q3VxPHoxqGGTuH7k7QclVNvzsamOm5/OyjvdrNA7XE
	WEd2Df+ShoRWfXbAA41wl2WL252LkGQxGY+QcgODdPNkSedM27ZFn9kwRRurHk0g
	ucXa3rNP1JzlznXPnWBZ++cS6l0Jr2TY6wQIqkX97161hL4Z5/ir1froMSZ4PD+s
	Ot8lCKz7oRGz4lzLrutkLRY6H1nRQfwZLOF6FvgLoALXxMu0meNgoMA9Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw7amdt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 11:12:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZLXuub861UxNVjspobpHstGPSybRpKC2jEXIy6ECyPRj7Z2G1Q5/2/41BMnPIHSv5xPxXGFzu9RvGqTmR85To+9Wt5ri2LD1V9znbpZv1gZhD/VcAo0lK3qcClcd3WXv+4qz5BD3AwuJrQvYLAyXWfruGAUD2wPiuzzpH8Dqe0/LtOpSCirUS/aTE4yIPLJPGltAazQpCSZGmJejrWwggWnFU+4AD1+2Nd1Dt8NBsM38FxnBngDBHhJZ9ykpvKQqxKgKfsMSbzCbV2N0dyhZQglOC19/0+LCiyf3yBNyIuwsoLDEx85LMd+mLQyH4i1h3PP6zzFMXzm5LRt6C3nVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g5qVdnzCAQX/HlNnw9b9EacaqwPqUZqAFeVm17xNpI=;
 b=imHF4iGARfPRLDH5a0kwiJ7lRnZGqxlVnsisoHraHZXP351l3qfvzSPRPddaIxpll7IVIOyubYwHD5rwkVUZTdIpH1nXoO7BCGmHSnWd+6UuYdiM4+9MlQ9WpfhXVWx/4BgvLt9sk3cvtpWpQFH1SXq26M7tvbDo7C9JjsDKqPxg5bqHpnYeY1wtiXHBTLrzPVsqSDKv3Q2WWvnC5kPg3T+OcVW5pvhKXtEZexSrQ25uQJNSltz6vPgvfNzCWV3J4JgMHjVqbhVXMlihcPeK5//d6aDxNdWNjLsxlkk6hOSSg24gTMnQcSyJ4xD+niDrV4pKPuj0WkXL6Lio7Su7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g5qVdnzCAQX/HlNnw9b9EacaqwPqUZqAFeVm17xNpI=;
 b=vLRL6nhc0wxEEIdP9kW80/bMr/CtWd22B6wyY5uNsUz3T2V8ckyooezYzf0/C1vSVN3TV2f1fRn0nXpEe400KLi5MKUA923l9Vu1tlPXksf5agCVpFdYlEvuxZ0h0X88xTJtg7/nn1c6yeQrzR7b2Qmg3KNuJt6IGdLQB4C66ZYBJ6uRk+qAmUPcKwQ4C1HZt7vourfcQztGywwk/mQdkNhncHZcZKHX/o8QNfSsV4/d50qonZAqrvwvuDAMdoAYaLUp+W0DOMjZkxGPP0Hx7bXqswbAZfzeGj/Y9urvxdy73BZZ4NTOTzE3YryfNRsRPBW7gAPZffjj6fD1a0AIIA==
Received: from CH0PR03CA0218.namprd03.prod.outlook.com (2603:10b6:610:e7::13)
 by PH7PR10MB5815.namprd10.prod.outlook.com (2603:10b6:510:126::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 16:12:30 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::8e) by CH0PR03CA0218.outlook.office365.com
 (2603:10b6:610:e7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 16:12:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 16:12:29 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:12:06 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:12:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 11:12:06 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697GC6Pa1481760;
	Wed, 7 Oct 2026 11:12:06 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id C4C8D12B25D; Wed,  7 Oct 2026 11:12:05 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.10
Date: Wed, 7 Oct 2026 11:12:05 -0500
Message-ID: <20261007161205.1402227-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|PH7PR10MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 98931fd3-2a7a-49c4-9a4b-08df248dc994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|260925022911599003|260925021911599003|260925021311599003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Y4/YU55MLT5P7QMNz6otbxv1+D3BU+yzvbj5YbWvXlIe9L0Bl7s7wO8b/XorMpYyxl+DCaEdHu2eJs6YLxNHbS9os4oTbIbdDvXzNNORHYmCoWOQYPTv5DvZtHG6XsaE3NBfqlglr65jA+S+4TlZu1n1y8K+U7DUJySF3ZNF+yTG0/Gq4b1LtrK0tmXpadLGvaGaNe8MtR5iQ34Dwtisl396L8W+zAcNq877gqpCgiFaT2lKO2Q142XsgfjnCRDKx8z57IroEBZ0bbbac7lfs4+zK9KuNiDE90NHL7E52sFECKHhhH4CNNnV5TuX2ANS15Vvo+lxR0i3+RL2NcMmJh1HwLgiJCXUTskrhjksXEAYIbO50K8bWE9mo/MYX2sMgOekDlBQx636y+1bTjFgT5rypSMYzrJONrDwua/V1QXpuLtbmqGzjx4ZO5hfkMwwSKuh2QysGtqJhISWqJ9s9NqCSgRgS1aDFghRRQRqMRDK6I0tI8+cOLfNTs69c8o5MgDwWtHRmT+0Ni6uxt2GwsTf3/ptl+OBXzLTdlR9BE6iWoAxtCBPNxbfgw7ZOAdw8cAF2aIgWHPNh8JLZIODHCS8oGH28BvLAcjlqc61PnhNkP52LtJ9a9UiP86QkR38/NbxoILSGThjePtiGtVgOox7/qxqlTVIKBwD+vnGN5yw5gj+Apv0kRpSk/n15zkeuDS+R9Y7Tp7rjHxRmkVI3w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LyAc25YeR33FaHBxcKPPEB5ZkKHS0DwcECmHWbK+JCh1veT4hqFKzGIDQ4OHGS+oBF1XDaUxQo8KLoSRXeHyRyU7mjUjxp5bK6WF1Q4dpdtimKApbEB+QjUqQ6SphQXLRoHCBUpnW7YcyZ1HLeUAcHxxl6Ni85ZSbMm9V/BusLpfpttSrLPiWjUia7RKcIyka7reBs0pfIdkDBdU5+bTq4j7aI4zwaUsYHUTpF3y0yrym3/Iv8a9jva8JH3LlCh0w8gyRw4f/fKzrurQMQyvFD+GWygoZ1xOfeKTY+J54WS5jI54Zxo8pC0vmHkGKsIAxTDvB5LEB2x3OJkj4Nzbo/JVIenWVWOvpCuJLyX3Our2vNunQlNVP7PgV+wx8ufqbT8QDkuJzSVWmnssNys/usJHz7RGSV63I3HL0Kfx6FWgi/PcT1GkhSqmA84Zq/jQ
X-Exchange-RoutingPolicyChecked: 
	acwlVxyrY707dPMkNKN+uXGSyqiizTvWkCHsPBfZT1vNYLqQGgXZRPJU8PEXJs/Yfo0dNy1KbTW1ydHyFGdwvIgmhZ1W90p9zaf8x60CThDIzEFaxZNLu8/XA08phK//ky7eO1FKQqx4YmjEQDwm7k2EEcH9f8IWRAyM13OC1esFQLJwm8U4fIQQYSuQ3OyFYQwn+WwcFSbOTuzGarC/hsV/5puw/VR6nSX8CG+wkLb/YjhAUafGBcH8W1loaVDUAghsGisuQKXJxx52UzvOFyRFErcpjZsnUI9mIPuKkL43qa1ocnRwlhS9bDmDlmzPjZHRBKEWxirfbtilsiJD4g==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:12:29.9887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98931fd3-2a7a-49c4-9a4b-08df248dc994
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5815
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac66f71 cx=c_pps
 a=d2CTHFLGvf7JoJ8RUfZBgg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=1VxDqnHFAAAA:8 a=U0T6FScvYC5zaxGiDpMA:9 a=aZ5uHUMKh6B-zo3GvD48:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NCBTYWx0ZWRfX+6NUetI5es9K
 JTBKniEpkpylt/GxIPp5ObFeInOpjie1NrvvSawsB+ggsi0Ct+mIqqebhJDL5VcPAbC+YJ6NTS0
 YB/XeqXjpj3PaLIkenD51yHBSqGY9Bo=
X-Proofpoint-ORIG-GUID: BzgkGCh8D9I8C-znvbIZffb8_xKAOJ28
X-Proofpoint-GUID: BzgkGCh8D9I8C-znvbIZffb8_xKAOJ28
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NCBTYWx0ZWRfX4HbMNEj9WhJM
 pqXqFDUByke+E6Na6yVQ5VOUiQnhPQwRXU/su4y1XXSxqfpjDqSbBNLy9YAp1aMCevv905KPS2n
 c2D+Wy2AWhcZRKHMvu0V/5e9PGsx7+6BoLAPXrnHDKq3/qKSG9/n650XDhEZNZczzIiIfox5CPM
 Q9/daVEIicL9wzPPlqA0tmQ1RT325C16xdJ0Tr0xci7rr7FYU4ivWiLbtly88Iqo0Igc0dFesVd
 aQpznsWPCz78i9JiUYw7Pga7lMlH38fXFnedBI/hgQ1iX5ZQ4349EQ81H3I2AuxuK8wj93oXgjP
 WE6nhSawCi6rCamQtMUrHJAeZUcgV+L3B+vllMlqioErvvv0+AQiw3C+QkeDIedZ5GhbdXsvQUS
 +vagF0AvYaRwVZGxC3Npi7QHzBFR+QltF0waj0ZCxG+F2m2JL1PUqZ/h5Yyt8/RudlMbi0zHG3Q
 R9C9/7xvqnwG9glNFRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070064
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Oct 2026 16:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20440

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV_uboot

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 9bec7c90..46908108 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2026.07"
+PV = "2026.10"
 
 UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
 
-SRCREV_uboot = "ece349ade2973e220f524ce59e59711cc919263f"
+SRCREV_uboot = "5508406582f6f7120dce0c4b3059819a41788db2"
-- 
2.43.5


