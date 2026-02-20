Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DD2C54FD3
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 07:55:51 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33703.1771574139682594843
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 23:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XGlRx6T3;
 spf=pass (domain: list.ti.com, ip: 52.101.53.58, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVuXzJzH74ewAxHmZPqsg3SANy1T92Wj+3PBMBu3htxu4Xabo8NV5r7UXPVnqoumXa1gledF6Uwy+mCSa5L6UWUNP6iZ/hIryk2vbc8fnTBL0twgXntVNSq7zxIY+B5y9jBcQxIm+FLdRUCnLLw4NZu84mTQmau7BpLIV3/Yl3DKcOF3sOtqqoCw0rsZxikAx2fiAgamEzlZomh8hgAFe0CfZMtTrUhZKhXKWRTViICEbjgGy6SsvdPOlSM0d0U/vlh9ti0v21i+pRz4j+02AFyp6UASWaTDLd8mJc4EW+NmjXAzf/gGWQNW2UrUGV1zTZZ7jSU+Ncnh7k0p0KfE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BT6HKyA2buaBky5g+Zdzq2pYGKmRnGJeBPUv9r2VTk8=;
 b=e0N3hIdTamN8KHRKcuu28VNcrvJ6jIWpNixc3vFuGZ1dFLBmZV3CrBQWSeBqfY+tYcTV1LVBjS7jLWcGbkbBJ84DOfcvqTqtjaZbjD/S5KCU2Q9e2dZJ3+dsHHLv1KydGtS38dkYaWmmKGq3i2IWzMb3AyRSm+J2jskubtyHl6XswXY6sFYpW5TJ8doyMweWgrSxR+lRVhVYhAAzhD+ehx+X4hFT7EJkOpqPVOGjU4AQmbQyLbjuTck84ziLGMpWa/tHUTlLJDpoKReaFzHwCRVObp+PwEn8thx8TP6udc4RnS+CTDlFVWnncaK1r5t/ZkYw3Xi7xdGdjF+DClNZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT6HKyA2buaBky5g+Zdzq2pYGKmRnGJeBPUv9r2VTk8=;
 b=XGlRx6T30RDpos9vnA0DiNp0sFEEOG7QmWJmosRFFEEP1lRvNcY2SnbLD26hPvZvrGa/BF8Cf5rHZQPgTAh7/hppTnf30QRraiv6yPE14YDgkW3CTjwiVeR7dk5tilmCDzwhGvDlfe3Emh/Vc9OJ5BLvHSkelSBIB0I7IAPHtjCwox89xBABnVyYtiAaJjVAYASBuTy2xyftuo1bEDQR3lp9K6tyxatwJpJ1/b7byLznaF0mqBnB+yR4LUy6rrEVkPJvP229rNYHVraesv/N0krcd3aEeRv+muQ6mt2hUaCiNMmu/iWkzP2Kp38wB6zxzsOH50Zqgt01lwqawWG05A==
Received: from CH2PR10CA0029.namprd10.prod.outlook.com (2603:10b6:610:4c::39)
 by SA1PR10MB5885.namprd10.prod.outlook.com (2603:10b6:806:234::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 07:55:37 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::8f) by CH2PR10CA0029.outlook.office365.com
 (2603:10b6:610:4c::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 07:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Fri, 20 Feb 2026 07:55:36 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 01:55:35 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 01:55:35 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 01:55:35 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K7tZ5d3739895;
	Fri, 20 Feb 2026 01:55:35 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 560E32A51; Fri, 20 Feb 2026 01:55:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>, <vishalm@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti: optee: Update to 4.9.0 tag
Date: Fri, 20 Feb 2026 01:55:35 -0600
Message-ID: <20260220075535.1131389-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260220074842.2206111-1-s-joshi@ti.com>
References: <20260220074842.2206111-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SA1PR10MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c4addb-90c0-4c9f-2bd8-08de70556ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fj2SppUp65YfDEn3UW6hw33jV574oBK8WhkLjMbnUj8403TLT6z+Kg/7K6sj?=
 =?us-ascii?Q?ZyG4jIfUXyKdSND/ehHEuyUODtQObnDEXrxok7ERBZWOvMED6wyCQ8npuE7s?=
 =?us-ascii?Q?njyzKr3FPfXmb+gXJCWHyPvTSgxZKwbIOnFLlQsT89bkBPax3/KxnM1EKpA/?=
 =?us-ascii?Q?X3H0eiARi1flDoxxUdE4XmDx08e8qeyAAB2/PuAvR99J2PxoZIaqFws8Jmpd?=
 =?us-ascii?Q?CmJrVSYJShJ5kCzVjOyftKlLI4gq/V3RWMzcroW+PWqeb5mE0E41WEZXnB1W?=
 =?us-ascii?Q?t96WJQsMMnIqlz2js66yjm8I6EKFU1K9zcJ1bUao2+dneSNEG2FNGi5iep+h?=
 =?us-ascii?Q?eBaqRTIgx0kBY6d50SAUfTT99+ZesmY8SPThEIegisDFukMtMQmSpq2t3tUh?=
 =?us-ascii?Q?v1kN+s3wBAYAZCKTgBNKZNbtdhBW1xvWaCCEXBtg1pSmIEAfZcbCl03HuXPE?=
 =?us-ascii?Q?nHOwon0avgxU4aT3+1lZwO6/cL336TFkGOwkg4TSr3C1t1p6q7sszeSKlMHe?=
 =?us-ascii?Q?u8Kz39m0zajeduBkzhYEWuhaZMHDMsoKzNF++lW+wchxivpA/XzL2PlvB+zS?=
 =?us-ascii?Q?/RcoQek49WYGPmtUQNU9leuenw1nXxV3YzGQGXzBtDklokv5cIMWrKCCAWT2?=
 =?us-ascii?Q?si+FkUk+MEDQjQerjXp3avZLGse8ED1Ll+38kxozTDzaenB9NErb2MwS8VE2?=
 =?us-ascii?Q?7lbjzhzBbCtxODWKctAM7HTbzNwseSByPlOe87cK2HnRrgs0Ru8Mpy0YKbsu?=
 =?us-ascii?Q?R/oIcZCrfdvHgWjCganDIDkrTRbGnnpZoNyuWgK9nqVdmP+ard5bfnBtozh4?=
 =?us-ascii?Q?wLJvh84pJGe2dpD1iSgHfbBmdz+ZPcmmbjh7aL5mYGIUBE34C4A2gYWpD5O5?=
 =?us-ascii?Q?Rxtn4JLjmbtZyszlAg9PE2XhzZX33afgJgf8rLyJOCkhBetMCLGH12IEJJg/?=
 =?us-ascii?Q?fNkUe/ca6MwH3zWRr8EpTbx3wGpPxxYrVj7xxnnLPUYjN8dQJSESZ2ePUkKL?=
 =?us-ascii?Q?FXE8YN+5I7FdYn0gAOJahgi648X+07yqiSgwe8aKbJKHMv6+ol2Tk46M1vb9?=
 =?us-ascii?Q?g5upFPBg1oGDmOX2x4cW2aZuHLv68I2ZXohvKdlp9Elc/EzjCSHtiT0AG9n0?=
 =?us-ascii?Q?bFxRdwqhHYNA7J0jl+iEOl1FdH8IC+i4M/WdJNYJBLNL8nhj6KefYszrW+n3?=
 =?us-ascii?Q?+AlhadnE4k5UkDI5GopSjsmZDc5G3XtVsnNp8WwZ3uvA233jSM26DXj2shCj?=
 =?us-ascii?Q?DbKS1hpfxXYvwgmVZwOj6TVwhRoK3rmSpxi7/+J/YAXqQzWnlRSm1X+gmhxa?=
 =?us-ascii?Q?i1g0XcSw12nBtivurR3y5eiGGEwQ3QADDqZYOql4UQjjdcVn0BT5hGhQ7LUi?=
 =?us-ascii?Q?mc450amRxA50sTjNqUSDcy4xczTnFb8F1cRFVyJz/n91X6LNn25AoNusYBB9?=
 =?us-ascii?Q?j7MK34Hpq+i/h1ZM7H0DU69lwLdQzgVvl1cgMBvPMY7zHsmKbbAuhEyQusP0?=
 =?us-ascii?Q?2sj2FopENHiSEvPXdUhu1toVap1DzWk49uRfuN9pcLYihrHudEdAV92aFAEt?=
 =?us-ascii?Q?7KuN4lGVknxj8G1gwAIxQWB/MfweaPZoLBejxN3dMyC5fA1EsAeHDDXg7ve9?=
 =?us-ascii?Q?DMx2wR9a3DO0mGPF4cy1z7ZGZk6yRqm42+dMQ5jzKiGS?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jGvKwBD6MRrBzACGLa/lDynOHIOOM/MPh9FdopWeFW/2T5GtPlPo2gYnlVy1JxY4trxQQQJWN2+FoK/5Bz4GwKNMNKUMMeAx6Zx9Az7/JCtb/iwspOkP8uC7YAM0mkXKRYDODYpqphJsGznwBq4a5ZVF5wmp5PBG+paypBpo53zADvlNSrZWoYJCM+U2gKXZCZ6ZXQjBMcfWGA5T3k3nZb/O2q3G62w5TnjaH3TP1GH1SukYCbNVrYBe2GB+uQCqpIuYHM8DacGbz9CwtPne3Q4fyw+Pc28waspbvTYqFtXu+SROXCBm7PzOoNiJWr1B2KNj9AJVI91ZcYS5XRQH9D+netUZt4AydPt076qF7CfChLimIGWoHZjObZCSJTO+XzLojqBlVo2ubfEwgHmk4Val6+u4GduD6lgKs6T9jbKW8ohTndJdWmgm8eORGzoa
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 07:55:36.7291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c4addb-90c0-4c9f-2bd8-08de70556ee5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5885
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Feb 2026 07:55:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19559

meta-ti / na / 20260220074842.2206111-1-s-joshi

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] meta-ti: optee: Update to 4.9.0=
 tag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Fri, 20 Feb 2026 13:18:42 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9a607d206d463ac51c9ad7864814ee623=
9fe0581

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202602180400
- Commit SHA: 35cf89e9896696b22da03a42c37b5bbe00a2029d

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




