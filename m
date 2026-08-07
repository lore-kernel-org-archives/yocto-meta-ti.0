Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F58C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:22:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37095.1786083729410864424
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZDjQ8/go;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FBvzMfid;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67764Jha1663890;
	Fri, 7 Aug 2026 01:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lkcsqFOU+pinIu9RGHZNRmavTo6FSBSYhh2YfiUsr
	tM=; b=ZDjQ8/go/bbABWmKgLS8BfhrVxwSzmKj01H464CxE0jqaBxCN9IGK19yB
	8k/8vs8E8yZyFhE9L63Hfq1zcy9kxJd+qEK6q27RDPXOlWpeLylhg3OU+W4Yw0GN
	Zw4aZQuuv0YDom826vv2mXUiQPIVlr8pGFY7ReyvW8BHxKYdecp7Ep0wEFAa79Wb
	o7AzG1bZGuZlo+Hfpxb5pl1Pj9FNwelL9fATziy3icW4SILFKwwbGpFkTkuKQuaW
	43htsX4WRhy8huAVoSvpnINUDFjMwKs3zSVCpggz9mmDOn9AiE/pY8UkQUmeALwa
	0YotJaFolvG5Bzhh5rfambPfFYjhg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf7bry-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:22:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLoPc2i94/bnwXPOXYkdRyXz7m2eZiW0ZS9GRzoHT3uTpp+TSW6NUVYOX0n0a724isSdO33b3ISbUJxsq90psuBshAOwUW7W32JFx5C/uT1wGy7o2m7dMQdwt4jDPsMIIdzYE/nTmtCRDzyFbKTTfn5PfW3hQex2PJTv2fWDkhE8shk/pa71WvBgYSuWVAtWwHum8lTfuYpaRRkoayz5YRxQGAotAc9OkbvDDdcerguPvCWFCXNLm3f0g70x8pSPk40NE3sau4HHJHTmjtZ80+tfE524tgqoVkP5udrPJQsbqPv2e75KoKkp8aNFUy3YGBXZOUKePAMScrNoLJtw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkcsqFOU+pinIu9RGHZNRmavTo6FSBSYhh2YfiUsrtM=;
 b=ILsvswZb9VNAWlfQE+TAPBd/He0DuY6eyDPEkLfpkXYZWsyE90lEeDoXotalertm19ezVT7BD0k7P8OBNr4WCh9s5rcJtJlX0F0uCs09KmNF2dsMi0AwKS8Mb0Xm9Jqaaefi8Ut+ShKdp6Q1FvQnZRoFOOc6GW5KAO0uefA++/dNhC+nrm4EtItjNB13BTMNQJd5fVo7z8tXBXnh8eFfig81JEAYTft4383A/dqgi9paQs/5FGlS33TqSVtLMQ6JHTyYbglybEpV/IK7uRshVs1HTV+//SfJFiQ1ICJFp5gpuQN+GDzYrozEL9J99TDb3oTb/tWVXP2KwmOsxH63KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkcsqFOU+pinIu9RGHZNRmavTo6FSBSYhh2YfiUsrtM=;
 b=FBvzMfidG/if2/ZBME0y2E4l5eE8a8HXhCVZ97rQ9uiWPsJs1HZI5AKVfRl+iOql3ON6t+eZLQU1DDL6Q6AQPkGahpUJxJanYsLFsB4DG+cz3+bG55nM+f9FPRObzI7Lb5/0r33lrbx6g0W9oFewtQPPHsp7ViAxIBnxRymkNdk=
Received: from BLAPR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:32b::8)
 by MN6PR10MB7542.namprd10.prod.outlook.com (2603:10b6:208:46d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 06:22:04 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::1a) by BLAPR03CA0003.outlook.office365.com
 (2603:10b6:208:32b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Fri, 7
 Aug 2026 06:22:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:22:04 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:03 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:22:03 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6776Ltrq537827;
	Fri, 7 Aug 2026 01:22:01 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v2 2/4] k3: fix weak IMAGE_BOOT_FILES assignment
Date: Fri, 7 Aug 2026 11:51:52 +0530
Message-ID: <20260807062154.1387339-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807062154.1387339-1-m-shah@ti.com>
References: <20260807062154.1387339-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|MN6PR10MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d18bf22-8e45-4cfc-95e7-08def44c3318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	osRHFJbsKAkA9YwfTT6fffyl9X3rtrgGhbRj1125W/2d99ye6sgnB+v1dH2oPY5GKq3LYarzp2N17LA99E+Si1QXIpq8+sqshburNJ6oVbwByXPQarPzbl9Z5GAR85vw1MXoBncT1mbmKYnP1Bi/JHew6zgVQirEKBWB/ruNR/twDdFOhMVcOBVs0WhmEAYzTM+LIc47rUGsCO1EalfYvv/xyaJRnwjYlAXV0iuMyvLU3O5s3rqZSTIJHecCAYZ2yNse2Rf2SKSAr8jLo+GGGhLS8CD76ESWPCcg4C6gwX2l9TpQy/jupqEtCLfMB/7OVeQp+6unr25anLkDotQSs3YGjdZXRZzi1Ffc4iFMzWqgk83PrThifjAuFqBpSv3SZyB4ZOi8kpsyksi8uj4GNA/UDYIbSUbiaY/YaUBON9Nn2G5V6KsInxkGD/TwtaoDiS+5V/ZFEE3koGhNL9Sw94PgSZA87vk05AOPQ+ikaF5/VQKAwYX7YiBa+xzefzBLkisb0hncdZex12BJ+Od4GLdICSLp0I58cumudFmT4P7NEOsO6FOULLNREpD96glA1R2VlzQyhVrgGEGK2kvSBrYqTOZTA/d6JNPBLA6Vf3kHKg0rMU6lG54MqyhfDwEC3VlA3g6hqz1iYq+tDSSNgTwnolQASVe7mG1PaDkEjDNoWHsenhLhILSqK4yBd8cGvIjE3Ws++g/2mjfjSxbfsA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GHqz8h+pKlmMwGgjy57xJET0jb5R403gmAmX1gb2sD1auTEeBs5U125x3fVjhLbavtSzBEoIUVmEnUFrctqek6uN6Q30pPOldXYyDzMgQVQD4KKYyVBtF66rGv70Cy5mupyWpVYZi31dmvzLOnQ3kvOCp2q0G/Rnz0hGqnxVODJxevsBVJDuqD3zPHcSNGQ6wKBYCMw3YsWJaljIIruqaCx+d0NBRvz09b1Hl9nzD7pJVm94cuFAWiT70MkvUJ30BYIT0UKD7pq6DcfJu4rKgwLFTVHNFyBFyg1WAG0FieSCqqs/Fab5uEIhYXCD28e9AAnE+8OKGEK1aB8RCVkKD40fisV9kHL9a3rcy4XHUDVrTeaPbX1USPrO/wHcSm4PG3yXxyta/iKYAmcTK+uVOkpk1XOUqRX4s+wMWHWQD1PMrGaGOniQF8N+GeUBgyd5
X-Exchange-RoutingPolicyChecked: 
	IT656MLf5pCSvYT8wf2UnOSTeu1P3i9FkG7zmEJDTuVBdTeTIlkZyAMfjRB9p7jGzH4eqlGeiUViEVYjui20RSBEbXySRNfAZtn79xqKsK8gmXReZHoV3fD76P7WKsB2uwcfSyWVbQN875/ZLd4Qzio3kf67ONJooExumZ+1lCjc++mb/LojUA42dKE+QpHoBzbI5xK0ROS7eTx/2K/OlF0OIpvf+vhzB5M6KuXFHlZ1JbbQGl7A5XVZBhH9oqWS1lmFyrPN5luA2CBOzJ+0n3nGpH0LaToPXljFuNKAfGgXnI/YzTq6wdwrmZOXUrMQCZtqHFdnKJw0yKHYE1v2QQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:22:04.3998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d18bf22-8e45-4cfc-95e7-08def44c3318
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7542
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfXzHQjQtxCUR+F
 PcVFopcCes8e/1NckFgRONiTFWzF2EHLiHMkkHAwMTgmbBwBcVBx5vVO6M4AJJpVXsSvm5C+BNt
 TLib9p3UoSCg+RwTN6zjWr2T7VqwXR83SQWUEhonoJ+xg+WljrtBnUuSwx9LaIt03hpybEsUfQT
 IvEIc85Qgx4ADKH3xvOOVNsjj5oeYZnw5jly6DguWLhUsM2Z6WeUqKW1DS8q1DTMNC/55+iQz2a
 X4aGiGIFmrF6F5vfj+lt19aP1Q+0clm3axTF7XK4xmdojBuSg2YhzHaq4bZ6KQU7DEF6DHMVw1z
 WCJY1E3BS3vhCmjk2llgFoZqniD3JgZgxqSHidmKK79iPUH0daHa+CmIq7F2X1Fmw+REGjHc16r
 0bKes8egJ5bP00qIUfNDNiZxjGTufWZ22s99cRdIPaDgth0MVd8r1SlzdzaC4CACS3dapBauvYB
 NVlJsjFVVUkC55PpMiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfX4ygzgnfMyroN
 rZSjzLdpUqrk8IdxqwIvE66mIakU0MsJCFisG++vbOmAB5kc0/8UBYzy3Je5Y1kfUE4pMHQhy3r
 9k8deFFZhyKK3wVfMX07dfwLSb0Poq8=
X-Proofpoint-GUID: ZQZMp_z6Nc3VQgE5UwcEkoMy0wndkC15
X-Proofpoint-ORIG-GUID: ZQZMp_z6Nc3VQgE5UwcEkoMy0wndkC15
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a75798f cx=c_pps
 a=64b+Fh2X7ngyiwpNPLbe6w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=2TSoTu2kLeWY2qruTVAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070045
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:22:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20230

From: Ryan Eatmon <reatmon@ti.com>

ti-core-initramfs.inc appends the initramfs image file to
IMAGE_BOOT_FILES. A weak default (?=) elsewhere in the same variable's
assignment chain can silently drop that append depending on include
order, so switch k3.inc's own default to a normal append (+=) to
guarantee the required boot files are never clobbered.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index d17ae71b..21738316 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -44,7 +44,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
+IMAGE_BOOT_FILES += "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
 IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
 EFI_PROVIDER ?= "grub-efi"
-- 
2.34.1


