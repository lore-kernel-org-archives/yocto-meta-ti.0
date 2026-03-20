Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E91108B912
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:14:20 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11143.1774008851474943138
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 05:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OsBks6wG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.7, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXfTRtTCuE7HGbBJ66o2W1S+ub1UuYolaCzvTu3HZ51nNZkejdGgCJa/9T45vAUPoNZ745o7pPEnNjMpRb7qTTAqzkSypiGakYvf3agYiJ2cp7UMuzlAfSOreeZJ8ckaoBsIlD25Hpqpv+30kZk+x+LNf7CO6hznUIucc6xQMj3q/ccsYxq9fqwjjCJdky9lOrKaagwL5lRVIBn1pbLWfmCZFzEsspzIKKSWD3pi2a/7nphtK3/9oB/E1SHPgf6dIvzF0tWB5/ZRgSRUhopEnWaEHTR1QuzPZYD4jdx2Gv+QPgQH/OKUjznyQ9qQ5TrzCO5c5VjXoqei8YyWB0HPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhQ21o2cwKmQYVA0TNdRTRiJtmW9fCarOWH3v2BOTqs=;
 b=q2qmoDcdwqUnIB7zhoIMmZGn90sYxl5zJRxsB6OdQJpgG7hrYpWELrNSJxJJ+MA0Pd+B/G9yaZJ4cHyjBUlwQ61vLY5KcDCq2DLJLRF8efXm8+1HcIJvgWUoczF2vIaMG47kZuMgJ59kAMuefxKIbeB3MhhLdwN+iHJJrFnGDiqT+Yj1X/3lCp4CkWj6izeC0dYmGFNZhXd4y63FzPmZdmgACsjSNIfWx7CR9ngDVz4OhzfrXQhSQgj/tpqd15XCHwGEI0o+GI6zeFum2mehK6lu2+ggutE5AIJIUvzFP4yQ4gKR78tuwUyVq69VdquyM18hJu1mL1BjjQIARUAeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhQ21o2cwKmQYVA0TNdRTRiJtmW9fCarOWH3v2BOTqs=;
 b=OsBks6wGJMxBc8JDMonH0aMlwWWAPVK5phLYV7VoKyc4t64c9jprGu2+NMCNOqtx6pkTlx/GIXe5qIQPo5iWTuML0tBWSZ87h1iT0quG1iYeRSSLgaFJxCdYbAVd7PG9nSQN0lgTdGqNnDBSiKqOOwZjP4sXRy7jeeLT5gxLnpE=
Received: from BN0PR02CA0044.namprd02.prod.outlook.com (2603:10b6:408:e5::19)
 by SJ2PR10MB7039.namprd10.prod.outlook.com (2603:10b6:a03:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 12:14:07 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::17) by BN0PR02CA0044.outlook.office365.com
 (2603:10b6:408:e5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 12:14:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 12:14:07 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 07:14:06 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 07:14:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 07:14:06 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KCE4CH3786503;
	Fri, 20 Mar 2026 07:14:04 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-ti][master][PATCH 0/1] Fix UBIFS build failure for am62lxx-evm platform
Date: Fri, 20 Mar 2026 17:44:01 +0530
Message-ID: <20260320121402.269297-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SJ2PR10MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4465b8-3ffa-4fbd-4ceb-08de867a2f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	a1QxyJupZ/WX32MUTS7jMo3G8b8uKm99BcxKkZk0crXvdHcmzBHZLtlNbok4kk0QBLX9ohQNdyCjrzgIc49uO/RlTxTd6KVqWlpsceIPywLEYAVh6Q8QxCmBcc0vd1T4kDEkfSw2pOqCgEBhblB0gY7H3pjDiHyL+Mkc5i8Q62jpYceHpk2FSZzUk51zBjrNehbZxsfh8+hchYPxTUU6VIhKTsToN3I/CYVUeWd2H/F7CDHjbrjQmmbCiWO1XAVz7rXzdHFxpgegooBEzX2BEIP4wO2d40ZXdRfptHDDK6bbsktVuCoCmK5wFRT011wSUAQ1KxK+N0Xg0aOvxZZR2WLFfihqcC0gwFTpPdN5GOQB8mJPGFVAvA/b2TTB0diFDRCiA++kT2s9uDx087PL9tqqcNiAuN0VfQ4jTi7xPfq7EXYFpvZ4H68DidayGL+ZK2XiH1GXEWbPOUJ3Bnv945D3At3sjt4gTLKhy92ajWNEe/J5UGJgXKwoQCX30pW/4dMHGv2VPeczLnRMNKKwDKoMpBGPmOej6QfVusLq1fqMIsdZxlrSPTNpjuZ0rj0IHFrgjtDJa1dPefduD6uHDby0B7oFhJw3fQ1jsJJ04BwVI0fUi/EaXROMbOJd88SA2kN5jKsM4LWOMmG9mQ9Bx/x/3n8WB0ydCv5GvnwZ2u5StvqcIhkMsctQcr6BfzNfnUvtrc/LFF+WfTjFf04OSCZN1cT8zLzQ+lYwBqyxqQSWxK90FPpHhvKR4dgMr+R3LeSPBPJdD64Z3FqyLCPZIg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dsR57iW2optzUaghUwNPXV9b6lv9R5LHolme1Ym/gGXale7L6DVUmSt1YdHJj1rC9j4VmRla5pieKPj5mdwoclM9tZFTYPeigI6ESgca+LTzG4rRzKYeDL5jdY/8P3ldCsY3WnqwCWxhXTbB29xiuwPmy0pVJI6tdAChE011trlcjZAjmOoihXtt5jsq2XaEH4SCfyRsMptbHfTAY+8aq38QZr5r6LRASyN+O7lyzg+6TtVE/aVUk52pK9e4NwhqHJJABA57AIIYk82qDCSKgTCOXVAH2xlrAepRbILiNajdaePIIbUQRsXpdI94ukrq4wPMYXR9dGRPMhFO/7PCcC5H3ORprGdzQBAmTPLlfzLA17+y7fVj1TwY8krkGsECRshpYIo543qdozh6cl9zAK4DdL/E2Ja+2jn5aW9fayx5mY13tgKYdxFObtKwht2Y
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:14:07.4613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4465b8-3ffa-4fbd-4ceb-08de867a2f96
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7039
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Mar 2026 12:14:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19795

This patch series fixes a build failure encountered when creating UBIFS
images for the am62lxx-evm-rt platform. The mkfs.ubifs tool was failing
with "max_leb_cnt too low (10077 needed)" error because the filesystem
size had grown with the latest changes in meta-tisdk.

The fix increases the -c parameter in MKUBIFS_ARGS from 8500 to 12000
to accommodate the larger filesystem size requirement for the
tisdk-default-image build.

Pratham Deshmukh (1):
  conf: machine: am62lxx-evm: Increase max LEB count

 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.34.1


