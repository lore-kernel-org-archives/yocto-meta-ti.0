Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0981EB3624
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 17:15:56 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.165810.1772471755483231035
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 09:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=QrobLwmI;
 spf=pass (domain: list.ti.com, ip: 40.93.195.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOsQ+RTq5sh92HUFHb1DNbz5z7X8lfZlhFyD9+A7RY/tP3+uznPzUf84G/j6qakqVNSXOJba5xFjt9Iki0W9O2qSbGsZzHULP+cN8a8SD5whWFyzCkKOCCvh5m3H1ckIlfcUPS8+dsRe/UMmFpWS8wfybkG8lzKdXKPfMGdcqZWgyQe94bl5c+24SDsNU2P/x/wdVr000wtxCLfcmNVdYA5eo4zzlYmuwFjAy4ySooAaStCLdjCWl81dypDM6//dAfNHtgj8Ah4DjsrcB8xru6WDtnEU9OdCxfemaHrpA1PoRBREeN0W1Q99GWSFcXTqHloq5KvoXBUCiANGCMhuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rKR7dftl4qgE5DSZecXNy+uCpvfLxD2hyPkIYp/i2w=;
 b=HOGWlPP2NMZ0auVSeNjKdmwTZOZjUzusv/IkJHV+DP8HOZ2ufA5cK74CJHVV8n0coMNqPoWE9i0Sp+FJ3+tIZhWVtqTFxUX8para6UAE4+WQRHAkLB7IcCH+XK6fJBoz/OYtanystkIT+LQg5TJIy1qo2q2UUa7NM1Wwk8GKtHoMjdpf7rKvAFmHNlbz2vQu7Iz/tw0oXOmdjmAcUA+Pfkl/cmocA7ZS6zb52n8974xWZAnGyRayP3QG3DDVlQIabf6uttHbrOskbHCX8UtpzPDs2T+9AdyBhGdnYx7dAdxAt5krln1SHPL/+QPXNOSWcRrlakb5RJfzRjxC2qA6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rKR7dftl4qgE5DSZecXNy+uCpvfLxD2hyPkIYp/i2w=;
 b=QrobLwmI7x/l2PPwBidC6iieyWRSH0Kh/vguHR0iGR6YkJAvRpStbfvkXmSsnQSXBGaAHD4w/RPWEa/Y12u117bQLieUrbpCdI/MqCzrPktZZHTt9P15wQ+Opm2wHTP5uSwloaOLfYF8FX7Rk/GTkDcm4lctosggZxswprb8D4V5TkVHX1ov/LNga3UtGqGMt/wUj70Pcfc/Z5lsnJI2VXA7Q+qGvutfeBe0LW+IePL52pwABvIB+gYKFF9Ap3uYNJVUhQuNGaS0s6gBTHnHXpujv3CW3ivjXSQvgpXUWq5Jiss7NHI2lqdYwbrzOygfDQgGYmEgfVGJUM87U3dfQw==
Received: from BN9PR03CA0461.namprd03.prod.outlook.com (2603:10b6:408:139::16)
 by IA0PR10MB7383.namprd10.prod.outlook.com (2603:10b6:208:43e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 17:15:52 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::f0) by BN9PR03CA0461.outlook.office365.com
 (2603:10b6:408:139::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Mon,
 2 Mar 2026 17:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 17:15:51 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 11:15:45 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 11:15:44 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 11:15:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622HFiZm2557889;
	Mon, 2 Mar 2026 11:15:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DB46813F51E; Mon,  2 Mar 2026 11:15:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>
Subject: Re: [meta-ti][master][PATCH 0/3] Add LUKS encryption with fTPM support
Date: Mon, 2 Mar 2026 11:15:44 -0600
Message-ID: <20260302171544.2969023-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260302144647.1705408-1-s-tripathi1@ti.com>
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|IA0PR10MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d160b95-04c7-44f8-e51e-08de787f5ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Q4umQjDpx+Yw9HlHYgtjYcolO1uOmsRXrUc8gU8bcuTsfS9PqN7j7DQdt3ITkTzmX3n9mtfA5x9iL1SkNMtK12g0TlGVK2gYnb5UjgbLrcB0KcZferQjNVhaM4yOHgFwsyrSIC98hmqCwoE2GJ9BZAmf11NIN6k9oqPi1UZ1Km++lPslk8L0Kb6fUPk9F0kRt2PndR6dTXe6RkjcqrhGhjleuEz3rh4hdn0mcZ0qr4RCn8Q+HolBPxYzDrH2jw/BoJmJg4TVfXQG53B+Ngp/5BmC8plgSJFskso9ebyWFO6PcmNGWw55gWS62WHL/CsJ791Q+hsE0FCtBnhxws1+BI3/PRg9VbStHCxFpPQ6zW9lfBYzrBvNO6QV7x6dcIl8UaN7Fk67DoSdqH4VgsJvVVkM6pBaZXhFajQbGG4PBEJ5L6YSN2IPCOsBhYF1lGQv3SQLzyNjBgMz/vgO5nxxv8amZNlfoNZTIPXkR3dDXpS8MyPCFIYfoOs9fFkBWbc6hUDRWys5G1t4Ty6mLIQfi8k9I8WJ9seXgUvEHYIn+O2EVSnhkKYxtxRruqCZViXmm2KJayGFoFlxMrydPr8AeZXZb7p/bDREtus+QGDFyMm1sWM/6VIZhZFbqyqaq6mSmL2eK4qtvK9RmJdRyeCLN4ikV3uXgruqRNmqvIsh8LlpQMYvydVSpgVdRbkN4E0gm4BRmF6BaCZA7u+oir1UWKo0Hv4PIHdtzSV4+mTsRn+O+f1zy2WdofENhbwpVBVSihhfy8imhG4wGMpaKqvwSddGCDGT7DfIp6163znEWTQVG3xbII+XEd1wCz/ZhWvqb04aQFzx0uTYqHyv5BFgjg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SR71gnGcRGyOHV36r1TAX2HDdtwg/2mjJ5loAbWbiz7tDURj+7PWhbKvW/cCF4LBzur9NYrW4fHcIYC+d5q/oFtLaypkzwmeYVNHyQ/qzWSwhTtyARxCyXv3qZ8CIoWCVi5zdCgSEYVBl7+Y3aspQd2PR9K3tCsafzGehYI60E+vH828hYutkL2D9thurc1yzAKetRe7l82TBnFMnQuRICnIlvTnZRYLMaPsr9g6fiqFrnKr39d0KriAHaobDYZ2AfLu3rMjEfVzhvcuD0G9ObLzwTJQbug91SIOsCjAmOMYpd98YvUOosFiw07EI/17GlqBHx29kwSgrIx7ncaJn/QBHiDcDjyG0QKKdWnkMmY/CBTi402n37ees9s3tOxd/krBaAD7E9ID0YkRjpwfX4cYZTXLof0lZ7heIB+UyPfoDk5sPW63f3X5Sl4hYU7O
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:15:51.0876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d160b95-04c7-44f8-e51e-08de787f5ac2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7383
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 17:15:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19630

meta-ti / na / 20260302144647.1705408-1-s-tripathi1

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH 3/3] conf: Add encrypted boot machine config=
 and WIC file
    WARN: Commit message does not include file/recipe name: conf: Add encry=
pted boot machine config and WIC file. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 Add encrypted boot machine config and WIC file.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH 0/3] Add LUKS encryption with fTPM =
support
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Mon, 2 Mar 2026 20:16:44 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 4475e4a802dc8bc2467c55cbe25e8611f=
6fdb65e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: beagle-bsp: unset TI_CORE_INITRAMFS_KERNEL_MODULES
- Commit SHA: df144cc0cc142a207378242da10340ada2174c44

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: Are you missing a PV =3D "...". (PV-1)
        meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




