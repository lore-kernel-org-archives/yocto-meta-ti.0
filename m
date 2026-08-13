Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDB7C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 06:38:10 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13408.1786603082334754061
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Aug 2026 23:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iRl+7Y3Z;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=aVqeGZds;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67D5gLvo2148651;
	Thu, 13 Aug 2026 01:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=/dY+6cIpBUzsm
	IsqavKbN57K9JM4mW9uXTdp+ScG1XM=; b=iRl+7Y3ZEHRNS4NFDpQhz7du1qUfu
	ZHydW38nDTD2Y815pJ26DZ/3NN4iHf8ICFon9Qu1TcKUtPxOsUGZABvlqIe/OwkK
	tdDpZCOgK+irdwxi1/BEy8B6JZTbwzHV7Uqgz9JiRMNlcvoH27J+g+/NgGFB875l
	fC5coGbKFrrKCwDDFPOpQt3G9dsJaoY0anNRlwESUrvg9X8lpU74xnxFUoMahTcv
	AorezMz18wD9Agc7i5QaJNMUpfO7YAEpixvv5OOGga+IoPBRLEiktm5b2ltAHs41
	PZDvWA8PMb4PV4Ql4rN+H1sZ7cQfy92JF6UG73ISmj1Lbb6yFNuT8EBUA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g17mtrcey-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 01:38:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LU9fGCnp7mVmJVDX/jRMfiihcpCXGjC2rG4iE155t3/mWjWgC2S2uTdWfve4kwYBkdO4UEtHq1qXgpzYMOxdTPT+S8kxP3c0cBSDpSIf4pSvhiOqq9Q5ADcwIC2+hxy4LgTteXGIyOtXSeuMkBd3BMh5DTRFL7MD1iW2rX3cdmBMLo8sBgt3iga5YDKgcPvquSrVw5cU3Qh8ROT6NBXLCtao6F70RTONgGI9/TEevkgLKpf5xh6+EEOxuMOLZjFux6GFa5hTaKAKkqlsmHwLGbOmDANZsv6YHg7VGMWTasVuwfiE0lOqaghdRqIIGAVe8621PzUbFGG126VqUL5sRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dY+6cIpBUzsmIsqavKbN57K9JM4mW9uXTdp+ScG1XM=;
 b=teaOhOg4WhdY28rtAHmEtcPrTgr9wUJuai5WG8iS0x4Rkx0waNXysr8gCs60djYAAIMnEWB2V6T1r2vuhzMXUX8TjJYE+nNV4ZCa3XMswRRznrfBMoAQecfjzJyn4erigCwPdtZ73R1WF1sJzZl78+TbjhTi17Spem7T/5375JujadFnmIWhY6m8vjj2fnvQNQLLmIffIQiRnaxZQFqstkkh/Fp7teAcIlVkZgLXImOXFhq5fTMiYt70ZWB0idTcHOWwaLLfMiMEBm7cv/56osar1Fi7sha8Qshbq1+K47J6hH+fCmS9u28iuBZa5VAVYyHgubb8Qu6GWRUMQzr5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dY+6cIpBUzsmIsqavKbN57K9JM4mW9uXTdp+ScG1XM=;
 b=aVqeGZdsnkw2fDXzGSkLWliUwQTNxqcIjD2xilvhQ/8gSgy0gD3V+so4ENTd3E/CyWYu8E5le5WTxhBTfJT22E/uRlLw156bSW2yy/Y/8FjgPhk9Jvo1jx+/oo33KQk+o9lnwoPFHmw0gl5g33NAu0W8MHMCPIYbANYhtvIEpSbgsHWymkD9Z3m5Zx8kkmYGbNwN1HrflqlnaeJ4Y1L6ui768Vdh+ugBio86vs86RJFfWxb5R+fiFKrfxQaDNUcABpiN2ZVFXxyPGxyDPh9XgV8thDbYycfugC2IxHCvX0XFqYxkpdst97b+yexfA/cZOtsPVXWEiR1RQqvCI2S5Sw==
Received: from BN9PR03CA0492.namprd03.prod.outlook.com (2603:10b6:408:130::17)
 by DS7PR10MB7300.namprd10.prod.outlook.com (2603:10b6:8:e3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.15; Thu, 13 Aug 2026 06:37:56 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::a2) by BN9PR03CA0492.outlook.office365.com
 (2603:10b6:408:130::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Thu,
 13 Aug 2026 06:37:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 06:37:55 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 01:37:55 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 13 Aug
 2026 01:37:55 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 13 Aug 2026 01:37:55 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67D6btTq631158;
	Thu, 13 Aug 2026 01:37:55 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 13E5D2A65; Thu, 13 Aug 2026 01:37:55 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202608122200
Date: Thu, 13 Aug 2026 01:37:55 -0500
Message-ID: <20260813063755.824401-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DS7PR10MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f03aa32-671c-4b4c-e714-08def90568a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|13003099007|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	mJc9quboza+AoxiZVsAcnB/InnjSMyu4z7sUIOzK9mKnlhCztMuVAEZHBrKLNOcDJ7mJnojHUcua/HoodXZ0WluPeNsGZY744af59VkuwyflqkdjfZXL0mheDS3D+/djHO4iIHtWZp19oK7pclNwthyQGFA2awS32DD2RwUZZ5XTtU63cAyM7VdC3cBIHyKcBHcqFxhTSQyue0Nw0VgxBi1Yq4GPjp8PxerooVxA5cAesfoUaft6jOf/zE8CKhsHgCWauO/J8bT/MuCsBr5zyPhO2eopHdNKzt2IEZ7S93gGYyiUB6FpSIUxUl5mvBsJhwSgeQhPaqaGptxKxWzrlxS7gaiWrCQsr9PnUjOMhqtvWk1P6btPOEPA5oJdrHsvwptF+GvZNCYRHH5pK216Mn/0+4JXIRF15Bw6JbR2a+7QPT7FUrPdgzTUDyinVXnhuCxva1zzXLv5pgqcVD9ZazfK1Zv/+fAF9p2bjUvmdFSQe3jsCHYsecRXHyBMTU1csZHvALFj8Ix5Tsgl12SE44FAM5klHnEOwDgO0P/ddsBgp9HmWlpWBr7j2E+vT8qMMDIw2068thB5z9yBAYFKDBrtiHQgxluBt4yzN4sYCI4KBztWLTFn921/y84t4b96pzxcuFWlRsTXIOr48nlCopdfOZyIjtxrzbL9Vc2E6w+Lf038irFdO+oM67Dxix3J/wO02Pog5n/R4NvpfEsV6g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6yJyk3Crxe87tR7+dzKKYSAv5/6wVswallMrC6CkPLfSaHDs8rL657l9Xvg5w/ml6Pt2zI1leHIngc7SLblgcK284q00ROYyl22VKFHFEuChIsA4opoje0Jul8UFPDKR6Pnt47cc4rhIUGnYivXXs86GmFFDLJqtAmNgZqqGUfaJE2jtGg3umBimp28ZLM13KXbTTvoDHA2VCol/kcWN6kMpJDNlvuPNI7Xk3a4S5mfY1RC8DtwHDLPbF+jguKnyvcJ8sorVjMD2oKFLBEVZK4dkUIzUtXGdIX4Y55ySnkycEJAwCfz1pAjT8C721dPOcBjCJzvhFd7lDyP5Dmi2osDBkP0fpDt5x7LgT+snCiitTxcNsQF+qan0EbmW7nYEJvChJWnxNN5FNN3WfBQePUrJxzwUPkqkPqxWw9tpOdXm//fClBZgmj8WvVu/Y2vj
X-Exchange-RoutingPolicyChecked: 
	bvtyNgg+HDlyQZo2C2s/HoU9C0wilSYPqPQ3EtPxebzJvExYzS5jNPdiMweTfmno+NVeGAiRJdCNepuau4pR03f1a30iMzxX3/5cAWAF/LmXfXPJh5xvZYf7w07wcvZPF6YfKWrkjb3JJZjm/GJeq5JO/mcULz2FZDlc6evw9q334FeAM0+sNCfLoD4fQ5rEELdKjJquX9n/zsIvGQ2dqQW6iMcyxP880K51KzIgglXZKMBY0uotuYdqMho3nWcVKuZm56/yNHsnVOE2kZBODCSz6pMPWS7YBE645l/3wX6+KF/yLXimI41878eT65tQOscGFCk7yo7cXszxeVZ3Yg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:37:55.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f03aa32-671c-4b4c-e714-08def90568a6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7300
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA0NCBTYWx0ZWRfX+J0jZEbAA/8Y
 5GCWcdJ6w+lmJwNX7r6BKznlhUuDO7GoufF4lpypnd3WRLRo51w6MgsmSziJiJv/WQpyUVn7aYa
 TwU8jtp0KsySvG6xEGcGr5brJiIKaenHdJJsyyh39NYIBsmGs8rPddzrZ8vqNuT1Ks2EOCClTd+
 aygrLwZYyAVaJJ6FCJhbX+9aHBj3WBIVC6DExkQF6bzIcD7WbrWuDnTEqJEslKtZwMEOcvwBcgV
 kFgVryHkruC+lZEc9UOUOvTrv1DDfogo1dHgjl9jyMA84JwTiqSNl5gmWQUTfUdJVu8PL7xWE/U
 F4687TuuVggD25y1ADC63E6aNUZ8UHIcebo3DaJa34L5zASTBLbKXMg5jpIS96XCKsH7UPViHd8
 /Xe+HOiMzsEkB/BBRZhCW/Od1Gy97yVEGJFrnJa05gSQaKup6eAyFCK4TAmlfbjxM2uxlhNoKSX
 64eCKTI5ghZpgnSerHw==
X-Proofpoint-GUID: efxv3b_F99K_Pw9M1BtwoMjYnmb6Mejm
X-Proofpoint-ORIG-GUID: efxv3b_F99K_Pw9M1BtwoMjYnmb6Mejm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA0NCBTYWx0ZWRfX8eiolHrg0xGZ
 F4CkzJy4kecirLh7oaONcy58+UVq8ovEdimke6pHBMpTelWJDHQGAEEde0PEamwtQLjuIHAhZry
 COgwcRHOyMRTZzrL4khu4JPE6ye5C/U=
X-Authority-Analysis: v=2.4 cv=boZ8wkai c=1 sm=1 tr=0 ts=6a7d6648 cx=c_pps
 a=DPCWJwWgIuHEo730oqIOaQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=NdMnjpG6G9tW9_JZIX0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130044
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Aug 2026 06:38:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20261

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=1612e4d1deb11d49304c715576854b28cc10e34d..13f4e50ff203b9581dec599a620b57bb9ff1ed9d
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3..43493bcb9d02b98e4e52e0fa6639c25d97eaab78
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=5ae038766eda6647bee6dc52c88308a0a280878d..7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1510cd916429bb025e2d0fdbad7ceae652820d82..9098671a2d2ce1876543f6d6fd576285a184f5a4
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=26fc7b1db82d7852bdb804a21cda9e1c997702e5..7b143203fef1c7b774a49b459c092eaf0b2718e9

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index bb841fc3..005f06e3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "1612e4d1deb11d49304c715576854b28cc10e34d"
+SRCREV_uboot = "13f4e50ff203b9581dec599a620b57bb9ff1ed9d"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 64a5e0d1..eff4c1f5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3"
+SRCREV_ARM32 = "43493bcb9d02b98e4e52e0fa6639c25d97eaab78"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 5e7e8cd2..a6524670 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "5ae038766eda6647bee6dc52c88308a0a280878d"
+SRCREV ?= "7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index f2f27e83..aedc2cc8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,7 +25,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "1510cd916429bb025e2d0fdbad7ceae652820d82"
+SRCREV ?= "9098671a2d2ce1876543f6d6fd576285a184f5a4"
 PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index e455267b..cdfc185e 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "26fc7b1db82d7852bdb804a21cda9e1c997702e5"
+SRCREV = "7b143203fef1c7b774a49b459c092eaf0b2718e9"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


