Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7000CF506F9
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:18:28 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63259.1773699501721524353
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 15:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nW+sYH7g;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.3, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aG7rnugBf8eM+m7wI5QHJf8G38KKZw8qE39wXFM6jBDKraFVZpMO5aWQojULiGf13meZlAOoKjywBOMavdi+tjm8innfV0lF6cXeKRR5zGz2nTXmo6aukR8PME9Pp08jGfYXXPqUitc6yYHQ+htt3Oa89pvwtwpCLQL+UcOoV9jBUZLmLIYQ9f8QxqsFaOrofh4MqozyFcphjkpAiE4P9w7oZFr/rTPmlhIhduXem/FDGFzD9qhUHA85docGUG7VH3JDHwqNVWJuePUHTLH5uhNufBipJoumla6028O0ben05W5qLyhc641n1Vc2HqUOzRUsCBogBdlosIAbUFj5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrF7QD6H0l81Hyq/Pyu14iqZFCRTm9eHBLcVg311hxY=;
 b=gHvfOgy8M9e4QndfywCk7PWBHsGqJbJemoSdOpQ4v+rIhcgT2/eUyj5MipUab6C0K5JdbHGBUiNUByt83m9JZZ+mRI3ecO2NtNYWRQtw67rE3kavbb0zAz8hhrgATPjpqkJD9TG3pLPw5nXHkGiBfFAopHKUuQFbOR44Ubx71XYNHtjNsHJ0qzMKe5wGfJEXR0gnWtsmfwQRG0wK7l/0PxfwJJdyNmFL6wKe7zt3z6zd94at5pyCJTKOFB9cf8BfEAjauu1DoC80cMkv84W4DpI0Avmf62sIyV8Ituitoz5iM2HFBWxVi3WMKvg8YIa8AU73JpYXRVyD0y3XtkfvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrF7QD6H0l81Hyq/Pyu14iqZFCRTm9eHBLcVg311hxY=;
 b=nW+sYH7gPbNTasJIkbZht7LJTJiB5z1U3zpH7CIC113K8nR2SF1aSgqI6YiorQktyhUvJkNoH2RsQnw9GiGkocc3gpPdH+y9l51r2g8L7uvFS3fbBs0VZO1B/PShd+hTnjiXMHsfry/jebjHfJKDzwE24He8Tm1dl4PAg8bBCFU=
Received: from MN2PR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:23a::9)
 by SJ5PPF8337777B9.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 22:18:19 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::31) by MN2PR03CA0004.outlook.office365.com
 (2603:10b6:208:23a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 22:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 22:18:16 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:18:15 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:18:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 17:18:15 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GMIFHE1547765;
	Mon, 16 Mar 2026 17:18:15 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
Subject: [meta-arago][master][PATCH 0/2] Some overlay updates
Date: Mon, 16 Mar 2026 17:18:13 -0500
Message-ID: <20260316221815.2502448-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SJ5PPF8337777B9:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f13af2d-8d4f-46e1-70d4-08de83a9ec49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	9uIRbZly6gMgyDUnxGUQUJ15eWV83Y0PSnsWfRjECkM51vgXywvSe9yPtUViunTIYf3Aozw5W3NWBPfocJhqXK+V4w5jewXerxCcaHjdv60nFL/v4wkXYPzM3QOV8C/UFCR2+lEZC/jUXwVmH9uDncESWJzp9x65kYWlyGE1MP7Yip8HQ0djI5oOkTCEZo4G1Bm88gzN9L+9M7A0eBS3e49hJ1CMDWfnGPrU1KAwDjVIpuS1jjcSynSW/MrpnCrDewQ0FT5jxhFch5wGEdO93SqUyMmz7LsD8PEJ8OdP1Q3hec9wNpw8x19+22aWWHnu8jHM33zEKsN5D7YYNizGOhJ7nlWaFV6pq4K6duN15c4itQ+09qjqMP+TMjlk4fNxGQHKoQYgJH71z3en/rkkRkzt2gjaGTiux4p5Ow+nFZweJ+vz4gFFBueUsoYgSIX783nt3fHyNUd2EwWrbkg+8oTblmQGI/LinKiA2txD3JNRAybo68YxutEV1TuIwcXJRlfxmDkLAw6+ptaDmzUjUiomOCt3ewo0HKIRzNtFns5TBb2NXPXjIw3zK7bWXzNNj+c1yzFqK2j9OVbIWbI5FouJ3H/WqijM3P4fVfX1m2MtP4g89NMkbfGoEvIOA71+jvd/NrhlxcgfPetRtyxZiynwYfuoLefMM1dODz4pwV7vpFlyGaaLVv75ZM2hI1NbNmt8Mdmf3fgOg6L3uc9+Jq4NNW94/vBhcbe2Xy366lJpXiVNQJx+T3Krq7h3lfgk5rs62PMe1maRgdsHrmZTAQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Wmeq62SKJcvJEDMLqq22KAiwqArPY56VjafgTPQWRZD/RqiRyYhs/0KA86wBc6nuFSVMkhgPSS6VkpJJkz02NFxzki8yH8RnxDUd9+uSICuv5dR8IH8jfNSpqbMOXbhYQvHdTlqDR2qaAiORa1pLFPznue+y1mCdbpuBl/AsN3K1z3upmCqJ/vDOOjggVcrKFkP9EKjJnk+wSolYGi3/Xv2bYTYuVlU1giyS3Rpynok917Xgv6hokR4NTQ8S3gbEOGD3038DGPHl5Sokzlq7pbcWSNNLa4dzXZnCN2DbR5GzUebZLlkwBrErYWUzrj7cbNqUaCYIoSal+B7ydeuC2yeXl9V25dA/yA3emwIhL0mxzCckK7IthRV2OA69PsrdLngX4v+ZrxWJlLgM99wfi6qY8/mmkQ2iYuzxL17En6C0aq5e/7Tg2fbIgPXgzN8B
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:18:16.8880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f13af2d-8d4f-46e1-70d4-08de83a9ec49
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8337777B9
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 22:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19723

There have been overlay changes in TI Linux 6.18 branch,
this patch series updates KERNEL_DEVICETREE_PREFIX for AM62A and
AM62 LP SK boards appropriately.

Judith Mendez (2):
  conf: machine: am62a: Fix overlays in KERNEL_DEVICETREE_PREFIX
  conf: machine: am62-lp: Package ECAP Capture overlay

 meta-ti-bsp/conf/machine/am62axx-evm.conf   | 8 +++++++-
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

--=20
2.34.1


