Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F50CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 04:55:24 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.20])
 by mx.groups.io with SMTP id smtpd.web01.1031.1761713714547296293
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 21:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CDHd956U;
 spf=pass (domain: list.ti.com, ip: 52.101.201.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWBMQ1dSBytx5PERMYpHd8DIINcRwxJ/PBaiWjMaiRMnWqp0NDW8HY8wGHKls4h6CNAQM1dyohYGy/Uh7mxbBDVgThmkcu80p3kCIAchYYUQv++1238WxEGfDs9Czsj5ipupl5u3ygUN0/iLFrioIeww9/QNlhvZyvoxrXhX7iWS9+z6AUfL9LD7c+kBWO/8qDjS8v3OvCsGLEuKk90Z/oipDzb4o8gzPeCoR841eZYHST0eHolnVXLyHnfDTNg1P5GCKmr1X5cjYSwfOkDA75tLHhkDFIeMacDesZS9XtMiAUjN3axQHOAP7CVwnHue7oq1OTpclE9+Pj3lmk397A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTWL9lJa4LWXEzyYXwwpW1fQFIgkZJTXUJ0cUJxsXsI=;
 b=AgOhpWs41DubqkhZ4sojGVvSrnT+njpEYOHgfclNUucmGV9Qez6FXakVfw9D7feP3Ti3UDkdVUcAv7zUi8LdK6FF88oIuT0ldK1eHYZ5nqYkOpw1JTXcHlC+55UJ4Z+GmzUA97tpzmS/V9bIledj7BQrJjInG7TkGJyeixLHLvS1Yex0gjvmK3TzlloqUZy4nRs/vj//wd1dsoOZAy+gZwq3eccL9+7AHV4G3QMjZGfftaWBJDPXy83GxhY+kdV9G6dqr5nsZgblvHVtIryTHgFZCb3yp4TMDW9QtPHKZ1WOz4xdIBBRU+H9DNLsEVnsFTxluap77DmtFfJMpURJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTWL9lJa4LWXEzyYXwwpW1fQFIgkZJTXUJ0cUJxsXsI=;
 b=CDHd956UGyYtrUaxuxlLpyIiQkFGAFPOgXtcE9n6rOj1dhcavSMO2qNlBMygryEHRv3kQ75v/7o8sCD7z+Z6g/TQeCCJJieQ0VHn47RU/MYnWwbTetF58m62hzz+IAb4DOG83rgZB9UC7io79THtbHe81qH4affM9bQRELDDTyBggk//LzH92j82N/86GQ4OWMVvI6kgNUUVcts+pR28VEthyc4EEZjQKrV7fkMRGnLeApF18vALn9sCnbVOyQxQd9+VcjiiRkVEv3kCEAd42JWFc9nqqD3LJKujaeCdhXyc0SCXwhELBxwMUS3B7bWIF+3M26iw0t0amz+nbl6HXw==
Received: from BN1PR13CA0014.namprd13.prod.outlook.com (2603:10b6:408:e2::19)
 by CH2PR10MB4342.namprd10.prod.outlook.com (2603:10b6:610:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 04:55:12 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::d9) by BN1PR13CA0014.outlook.office365.com
 (2603:10b6:408:e2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 04:55:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 04:55:11 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 23:55:09 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 23:55:09 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 23:55:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T4t96M1264853;
	Tue, 28 Oct 2025 23:55:09 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 45F3313F536; Tue, 28 Oct 2025 23:55:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [meta-ti][master][PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Tue, 28 Oct 2025 23:55:09 -0500
Message-ID: <20251029045509.1928588-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029044940.1008516-1-v-singh1@ti.com>
References: <20251029044940.1008516-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH2PR10MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 0780f894-b47e-448b-01eb-08de16a757c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RagvDWFXBmyNxXbbJfAzDsTyGgAqC3vZGgv9gMvOcn8GEk6vp6+V8g6fPomz?=
 =?us-ascii?Q?5AHcMjR1dpetuc6e0fsM02MA3RbhU62QHqyvSD6lY7Ti9QRZ86rbYA8UvqJQ?=
 =?us-ascii?Q?1M7HHTJrHFYxzcL5DvJYPt5jxjhQMfKlyeElQAr33WzO6Wf4+BqML1PN+b2f?=
 =?us-ascii?Q?GIGRSdZfwDE9M6371l9zN2gTsMKwc+QJQ//SO2Q28Wt4SRbletPunmuwD6fh?=
 =?us-ascii?Q?kLosqEGbIXRORus3EWxnuoN5v+wISIl2SywTJzgWCMQAZMpmb8MTzyESh8kt?=
 =?us-ascii?Q?HnRBlDLEmMsGfmZiC/tb3t/H221PmC8Fc0pVC8dJKG2Pj7U+Sm/0YzD4kKDf?=
 =?us-ascii?Q?CTmb+TFGcaxVTZ+GpJBuqWjwmXkY4txSku+0oEsihciKPqlCkLeGyiOnlmIT?=
 =?us-ascii?Q?8kn8eJigKuKzDVwuhNBCx2ZOZqeve6AvXpg2rM54rMWDZRchQlT8Nk9Yz20x?=
 =?us-ascii?Q?rre8a1CvIcXJDGC2ZRLRsEuAEPn1ab2V0RpL+5UJYX85sTyvIKR6ZODsfbJD?=
 =?us-ascii?Q?S6NhGj2T1JP/nfH/FSjzwqAJhqXo9daWwo6LVJ3M7YuLbUQJDFyJW+t3Zn8n?=
 =?us-ascii?Q?7VCJQEtElTBHgh162QhtVjHzZaPw+DN3tXiMulJI6vysQ5ZHSYGpcdlFE9vB?=
 =?us-ascii?Q?i0Jm8UUU/HCvSpsLnSgwHfnOebRTQIiniVEM4K1/KXSxnMcBg1sMu4dd7u+r?=
 =?us-ascii?Q?W+jNh1GLyyfGUnTztgJprYp4rNeqHYApkpOUiBpJskEQx4n0+aod94F4sYJu?=
 =?us-ascii?Q?Nyw0n1j0xE2GhC377WIjwuqiyvVHtTILvha6lIvr3yO1TwwgERYgT1M7frH+?=
 =?us-ascii?Q?m/J6fZAKmLLAapAz7hbHVZoc2DLJSng7W7xIq0naBCDgIt6BxPXx2FtmJnV/?=
 =?us-ascii?Q?q8qqLzhJy8+UmFnrHvwl+mUXoGQ2qonem7e+a8wAIn3/WzFgSp339zC5WhEp?=
 =?us-ascii?Q?eti2EuBDF0PrErWlgsKS9sY2AL6kq3yLqbdQsu6+/bgd1/9P3GXehQS70bff?=
 =?us-ascii?Q?EbP2tpWg7zXLpqf1+SjnOcpRe3F145+XZiDmWNJ9m9h08VJWbfKsudzam/Z8?=
 =?us-ascii?Q?BoHMuvn0rrHcdNN7jDOWDTw/7fnXwkDGMle85vb7L7WxxbzgS1nhxR5GeJyO?=
 =?us-ascii?Q?ufyor7yneMtRj2Mz1j/+QjRQFIVK8hS4Y4KSyzeodaPeM0SdWLiArxnH3ef1?=
 =?us-ascii?Q?O8kb/VcO2PEhZdinC3HzeJZZuBYjI9jqpTzW9i0epXVLWehY7kCOcsR7FiyR?=
 =?us-ascii?Q?WiC5bPNuufJ6gD06rzTZRywQ8eEE6mN85aK1D3JUqz7bYozXLwbg+07p+Ztm?=
 =?us-ascii?Q?P6KBtkeGYyWq4NdxS9VYmBUD5rCV6PbnJ1bqDfV/YPhmPM1sc/s9+S4tQfGO?=
 =?us-ascii?Q?igZg70Kc1cdHPJcbG35V/IG0twvhKTIM0wbpEu+rN0FW4bG+bCIox4Vw9xBu?=
 =?us-ascii?Q?zZ0wzCjrGsN5Cc6E6L8ha9gIG3xry1qA66aNH1bQpeDBvDgkjBwzEHHLOxzQ?=
 =?us-ascii?Q?ZtcpvimsICcV+6NgBk6NQeHVF3WzWOXjncu/eIgMhyk85j9CqZWRHW6RGWtg?=
 =?us-ascii?Q?YA8I+9l0ptGTv/2fffQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 04:55:11.9913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0780f894-b47e-448b-01eb-08de16a757c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4342
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 04:55:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19192

meta-ti / na / 20251029044940.1008516-1-v-singh1

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRC=
REV & LICENSE
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch




