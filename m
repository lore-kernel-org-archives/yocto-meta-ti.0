Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9416C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 08:06:38 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8458.1786694796785408406
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 01:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DegJzFx3;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hGiS6gv7;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: b-padhi@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7eFL91112222;
	Fri, 14 Aug 2026 03:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=b3popuVXn7nS4
	S7D07CDv3Kr76N7EFONLPulpGhLJrg=; b=DegJzFx36gbNEJs94wMgiYVzAZArN
	pHFhr5DZLhtpeQ3NjaNaZ021h8h243VswW0s8jwupZnxGcSnELMsLTsCiBsTDYnP
	NXkLF85JSjOvsC7c5VMBYQnT6qXGUhbFs/y+KARlNTdEhIK4xs6+6hzIgMMtiGYy
	64SSQvRrGT0E2Mc9w4am24jwlnL8y2eZHKPNzBTzkt6lTfu0EnOfuD1f0IehqaZW
	Kaj2kzBtA/O9Lj61RRdFg/6lMPsLz9IeCzdm94u604VB+0/HxrrgmBd3+24Z31QW
	HzwdVIu61hwyb+lbs7anP7oMiZXkjfazUi8hRtfT+2Oi+CbTZjRwQEgAA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g1bb4f698-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 03:06:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tC6X8NcYyPhmS2+Mzkf1HAtCk6uGPujBMTOnli+oZHyWDHLYjtDVkbVWebNkKWy0icynO6lmN+Y3RVZ4DDaNHVdlNGRF7EZIy3PvfFkqYiusanV++PHxcLAJEGqaVoE55qDCtSLmBRndzAiKfAg7QgXpbs9byejjbQ77fCVUnZmzFTOuF/2ZAWTGI086OO/5BYdcsmhsKyk7Fkd8gVMpPW+h5gwahEyOAsoGhq1iVUx/UXqfyVU5hXl3EV7BELrzU7RSFAnT61ceSdq6hVd5PEY5eEfv0nW2Q/SppD3L1KKfAAtUpgfWAykl4ky3btL8qOXg76X9ttjeypAW8ujAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3popuVXn7nS4S7D07CDv3Kr76N7EFONLPulpGhLJrg=;
 b=e4Ra0Wsvm1DWRa/bqI8KMPTA+50BxWIG+4DK0F7N2KypNycSis1w4Yqyc2HhbzxfzE+Vgr3YBmJ0jk58T8SuVFSAoSp4LfKEwt4BtW7e/htRL7PEROBnaR4ngAJsTQGxMeibvCe9SsDhFc7tZ8giE1Q4zwNEuwRU3FAFZyGhnc10PxbPYyvlxzzk8JvxQGpo8O4fUHFCti1hO2jHYFVxuvwwuMIFrZeGJGZPTbZeD34QUIoGEWpFAGjje8VP/lnhkbJ3zbH0hVJSEtv64cUA832AsFpC8x+Tz8jobUYOfvu1ORGCLLWDEitZHtJAxJNLEB1CN2elw2WbJ+sI+aejZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3popuVXn7nS4S7D07CDv3Kr76N7EFONLPulpGhLJrg=;
 b=hGiS6gv7QnmiA4eAOzD9aYYKoR8YupuPLZmJcmcg7cvZtbeDFaMWYJ/P3CUIz8aDBz1PwBZkoOLAsZ0VH7jYiFbSbJzdXu+miikqQCcNt5lUTYp5XRSFR5yfsvWg5rdUrdRyz1xRFfjhNsJNH3aXey7fj2WZvQpg9vDb+K40S0U=
Received: from DS1P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::16) by
 IA1PR10MB6172.namprd10.prod.outlook.com (2603:10b6:208:3a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 08:06:32 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:44c:cafe::69) by DS1P220CA0023.outlook.office365.com
 (2603:10b6:8:44c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 08:06:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 08:06:30 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 03:06:17 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 03:06:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 03:06:16 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67E86Dkf1363269;
	Fri, 14 Aug 2026 03:06:13 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <afd@ti.com>
Subject: [master/wrynose][PATCH] ti-rpmsg-char: Bump up SRCREV to tip
Date: Fri, 14 Aug 2026 13:36:12 +0530
Message-ID: <20260814080612.982165-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|IA1PR10MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d12925-6b77-4eff-5272-08def9daf2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	za6pUATWhGHgAwtbp2m0IoCWgFRDeeeB4HHLL7NDXcoi6P4qObjwE2AJz4g/HttV5Q6TbI4Zwm7mNm20JTof2emQaR7fZT2WXWa8rClHQfak5+BKL+mvsHNCy6lP/dSwjX4g0UtyWVlahx+wTlY+JGbJ+iPEjmS8FFoycb90fKBHdMBbNy1WWPltD/DHle6/ZyWiiCSopNOl0I9yl7kcEtEZajycfA5ooyxsP0/qukxJ3rwGKDKcauinzJ12SHfKg/kkmVKsy3xtiuGmIEWELDgHwhJPLBjUk6ONLJ1W/ULbf7YuXDiBRh3zBMZlMVVBlrKUraoXFZnAr+itYjDVRP6RQpyjvbPWjjlr+ganuuujrkUNr3kL9TcBg7e0DcYKITcdQ1glhaysUMwCi96QqymA0jffVl+aD7dWidXZPIXMmQehDHaydjLaShs9Ljm6p2iD7V6k5BsEw1bxQf50mzDhnC8Frc9HpuplPhAbF4N7ElLy/wbL6ImIb+U5XoWsPYVch17mb4B0Gv9Nk88nCNuqbCJrzEfyOO6rpQ2gXP5R+Nmp02ot+tUW8/4hUt6+fSo9iJQYQAcgTJBtjTteH2EPWk5QoLnANaXN+szTS0vsR0/+hlsYQA0I59MFS6pNJnhPXml5BFJkeLJUVbVZtVyNjmxhw29Hy6bCjv/ZfnDCPkeQPqlFvF+h6ZWw3htTJMg9H2vnztTv7B8rz2Fm+Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EKd5v+VR/dukv1Bvh0ElkwX42UKDwVLHCkLC14VMuR+vFCjxIJu7UwMV9vNQ0KYR6HkHjzyOpcFjyZaBMFWbmri60JiWB3AdYoWxO1DjqQ4dLZrY70cRjbmHXXwczxNclm0lLS/GHp6kYXm5BOACrdJhpd2Rk79U1Kg6hyNKieIJlezW2Q6J0AsLYPykV8IZoDKuhSGDcjU66Rh7yvbymUCPXPXVk2MrKzUpeWoQRHfB/3QIT0PO7zLHlW1YvEIyM7DPfOJ5gZmZTfuDi0tEQGB8UlYZlOBReQPCsh1hIGp27veB4IEi2PiERL68I4xpmMRVlmbrA0WdAOaVZLHFgddKpMU6/doIcj1R6/KQWIHu6FqN+BdjCwCWsJFCXwA85rJ2yHvJtSWbRvzXuwTrs2N20nKWQtPoy+QNO2yngstxlUCfCOsMQ2f5cjf6Tazq
X-Exchange-RoutingPolicyChecked: 
	gnHF+kiyvwzK69H5u3CpznHtvhJ7sVe9NHElIFrMCd/4Sf80DSAzAZCldfEkT0uaMCNyePZlq8xI6aOoYkiZrJqdf4+ynJKI/Vp9lSHch3nlzg/pdqzMRZMOlZR+a3aKil30aGQALfBbt3zSIx/vsbGYF9zngVb7pr8YYiSbImjiK+W1C8Dss79Mq0Y8iQUXHI8swUSnK2Na8+YZVHeqs/Ez61INnc/QzL7vvp8imQYvsNUsrsasDtHrHi4o+s/StKrRXAdlpklcWfMnEqtrJKpoLp51jPTATLgchpahFd6zcJC4NfKRrqfHNGpjOOjOIt7XYsWO4vzrlYLob0TFSQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 08:06:30.5310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d12925-6b77-4eff-5272-08def9daf2e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6172
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfX/GDuiEa4HVsu
 HoMdWiBRTIr+qzNGpyj1QU1cWkBoGsYsU/wf6XlXGnkuR8aDkK2UKSciFXguz6K68IFxZyGrMxU
 v8Lyv+tMhlsTPX7d1YNe0+pNGWV6DDU=
X-Authority-Analysis: v=2.4 cv=W5sIkxWk c=1 sm=1 tr=0 ts=6a7ecc8a cx=c_pps
 a=AIGQXw1SJcVyoLDzoYNqyg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=NcpAJ2yZjp3cju5ECfcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfX74HeVtsEvOaS
 58RDm1CSLZezPlBHqWC3+G/bSoen2ElRANCgSwoxHHIRIJaI+VguWten0G7YWCZX61n7TNVz/7N
 Gz6cJmhb/+bOyvz3U8uMaEni1VeW6ZzUFZNtuO/9SA4PZaSjrIIlJrFwlOb8hymcuG7ZCDj+6s7
 t+8AsN3Ji8r+OFt5ofrpbfd+SzWv8Dje3f2RNPVObSHq050adN3iqL2ynrJvKHBB4NF5MnXK3xI
 GDZ8NA1VCmZtRkzaB5alFvn0BNLRpXTAMT0SQi+iHCA9mYq92Od9Zh1Dy/5grj3lP1DdgxPlozz
 w6a/pySmkBiHj4UnfF8qXNVu8yjeu34+AL0ilkvhFVHc/MTxOCt9HrQBmU/5GvTjn/uO0deuTwe
 cRBK5nUexIRcPtKeW+9SYtilXkr9ju3UVT+oJvGRQiCrtejA2JF+XtgF+7hjKLlJHjVJf7/dl1n
 WWVzoYsJsUO+bxhYQkw==
X-Proofpoint-GUID: CYqNu_npKU9Owj38bDkodG1WI6QRWbi7
X-Proofpoint-ORIG-GUID: CYqNu_npKU9Owj38bDkodG1WI6QRWbi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140061
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Aug 2026 08:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20266

Bump up SRCREV of ti-rpmsg-char project to the tip. This allows existing
applications to work seamlessly which require to know the allocated
local endpoint address from Kernel.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
index a0043caf..15fe8062 100644
--- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
@@ -8,7 +8,7 @@ BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
 # 0.6.11 release
-SRCREV = "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
+SRCREV = "b1e4d172f39081db81305fa50ccaafd3ef8ae3a6"
 
 PV = "0.6.11+git"
 PR = "r0"
-- 
2.34.1


