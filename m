Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17950EF99ED
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 01:07:38 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3962.1771031248148742472
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 17:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jBP4m2xG;
 spf=pass (domain: list.ti.com, ip: 40.107.209.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOnBjzRM94Fu5WOFPNCJzHmSW6nX+SF1Um1ky4Qvolpg9Eui9Kz+EtBZcybvlmaaKdYzFIo6ZiI+LJWmx7FI3hwhVnsx7u+HPalEyQxgYUBwVkai0JC0gZG4iSf5lqy7SS/Vv+NJcICJgyAekDc1JA2wWw9cFsr3eGdQ2IaaSswk0E4HI8fPi0/k+kaj5PDqfcyG+T6ub1k8TFH6NP/PSaiVVoo2XTRfg5gwiWbdIVr1QCu/mFnvb/yNA1cWqyYG5XBN5N4srgae7IWCfwGE9lQRpXjyWD3LRjEbZ737w9MN8bMs7jZeRWYNMdGHpOVeo0pCG9HcqU+K8ekSNaGmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23LfDWnb8XH6HTpsquCvjh0nbnq8HBYXjj8RfIua8qs=;
 b=a/H5aNdeKkGYnSjADU9O+5Z0QGGPnpL0PzdAwvzW5EUPIyoP0l2Iopxt00fTkShSoiLP/01KuMxeFeJSNKf/vuklgl0GwweCVEEcVvErrhYMKCKZAO4pjNKCaE48PmsIbcAFvzzwHUJbqfOiSFJkXqYA0arluKPZ7zIv5XYWJJv8+0oX0bu5d5uzMmYm/P+VFD3yFE3Gtg3skiO6orFFW33lZSFwneZ2g8AL144h/HhYuiup2V32AH3BqvrsdznmePzpFOCXZI/DM9gFKKKSomylaRueZOZs9hC5ZsrnrDjPrPprU0KiQj5IrCEmu2GPYZmvD7Lkkfuymc2415h8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23LfDWnb8XH6HTpsquCvjh0nbnq8HBYXjj8RfIua8qs=;
 b=jBP4m2xG57WkzZ5QvPoDQhFyfzxzDEad9ulahm+5wob166s7oAirDzv/qHkkag+zGXUBWHAOlkqXLbxqx3LCJM57+290wezAZJTFNrFNsuSoaiJBhuPycUMqBA1QI1Mx7Onsfy4z3Hzi381eMUFAUX1rzqvU2wBUYyIXQPspUdPTv04EXb666q3+Jo/qpMBjRnQp7Dlt5x5EsviS4mRjLk+UuLtD2dJbY45PiwKNPZOKdQe57iwz6JyMHSAZC7yjTlwk+Ldcw/Hug/iceI6exXCQS9gHjGUqW5xxX0w0cY/+NfomGbGU04pFb5EoMXTpaYPGJjwpwSnTSPDDkLimuQ==
Received: from SN6PR16CA0061.namprd16.prod.outlook.com (2603:10b6:805:ca::38)
 by PH7PR10MB5832.namprd10.prod.outlook.com (2603:10b6:510:126::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Sat, 14 Feb
 2026 01:07:24 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::dd) by SN6PR16CA0061.outlook.office365.com
 (2603:10b6:805:ca::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Sat,
 14 Feb 2026 01:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Sat, 14 Feb 2026 01:07:22 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 19:07:22 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 19:07:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 19:07:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61E17M9B1682692;
	Fri, 13 Feb 2026 19:07:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 063E69ACF4; Fri, 13 Feb 2026 19:07:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vitor Soares <ivitro@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Vitor Soares <vitor.soares@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH] j784s4: move TI_CORE_INITRAMFS_KERNEL_MODULES to j784s4-evm.conf
Date: Fri, 13 Feb 2026 19:07:21 -0600
Message-ID: <20260214010722.122894-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260214005652.626783-1-ivitro@gmail.com>
References: <20260214005652.626783-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|PH7PR10MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: c96a93ea-f220-4438-ea00-08de6b6568c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0D3+BH+VIgmsBx0qKsYpsM+5GmZ4AHV1YFLzdEEbqlCAa8A1RIwQGVaU3OHq?=
 =?us-ascii?Q?vHkaXRMa8Kg38KLPV9NNWxa/gI4bPbOGlsm6aIC0E8CCNXb4aWrwk9yebJZe?=
 =?us-ascii?Q?mTuN3ojbfCLDrBnqxYit7kEdeDhpivkip6/CeuNPAEJS+8KWjcEPbBiqDSTT?=
 =?us-ascii?Q?3rqe6xnVXVk9Qf/MSl7ec86OOvgrqXYOyGD5uuQ/7uXmsgCGvT2fxESAPRkl?=
 =?us-ascii?Q?kviI35STVs6554eNUMD2rdVFlTEjRUNd6miNs07JhUzMVV2r8idU3T6fQOHs?=
 =?us-ascii?Q?R2O+BQwxCsQmeY1Th9WwXjyH2tbSgLKEyEzNwdWr1PYk1WWmuKMjhdkndE59?=
 =?us-ascii?Q?SfJqcVjIhmfQXoKRDSS9paBHQhRRX8Oibmbjs5YuX+mu34XpuxLBdhrJVrgC?=
 =?us-ascii?Q?34tqEFPyIiIx3aKZ4nJ/8CqpBOYAT2+sB6QPUhkU30G0/KM1d9AwNYDXsr+R?=
 =?us-ascii?Q?w7YNAdRByHoYXM/o8JvbFJfgOpOVZ8rSu22G+p2hkOinzG3G0lzK1BUch4/x?=
 =?us-ascii?Q?P9X1FCh0w0/0DdlbS/E+LADN8DBCJhaxapbsz58SawbIjvPvr/N824oj3E6J?=
 =?us-ascii?Q?GCwWmC9UqzPz6OOrjBjc609pwHkkORTeMZC77DYwMjEudhVq1iVKDz4K7fHt?=
 =?us-ascii?Q?RHs0+fgBD6ftW90eFw+SKyKOhmUNiFAbVjMw/xP8+aYy8JsIIA2LHp/zgLwW?=
 =?us-ascii?Q?67CQp1BabeEXtghufUGCo/e6/dMup058jlFcf+rcwAFBJLDs7iUAZHWZUMRL?=
 =?us-ascii?Q?km9y3ImJMTmVHJ1LbE/sd2RZU92PZffkiae+T3hm1rjKpP5JR5Vu8OAvZHm/?=
 =?us-ascii?Q?oYez5jJezhpXfIMdCgwPuDYIrUpomAs/OSl3Wd0WLhQ1voBPpOakaoLeJm4z?=
 =?us-ascii?Q?aYNpjfr2JlEpsne3nVFNFWnOnhYtLwyBCUyaX093SZpRsQ34W88cfmjm3050?=
 =?us-ascii?Q?YF/rfj9ruv8A2LJXExqLczljp4NNYT7k7qu95aJfeNqRMAuo9pf3LSxvELKH?=
 =?us-ascii?Q?KW4kGuDmSUJrwRb5iX4xU6KwPSW8xH9HprojwzsMVFprgaVyXakIOo2wgjsh?=
 =?us-ascii?Q?sU81smZt/D60YGZPpL/iwaHG/g1N+dS2hEsZt3VJ5c5ZRbMImsmiSJcm54J3?=
 =?us-ascii?Q?M2FU8NDc3nr9kdNKRLwb3CwY1Eoba4i8NsFWBc5qwJbLxp+FKTiS0DBf4Ubu?=
 =?us-ascii?Q?EKadwnQNhrXIvnyixKNFc6SJ53y6kUYwrvKmEEAn2c97PeWQVcNu/kw7lgNm?=
 =?us-ascii?Q?3VQp5RV7kXaPsXVeb0BY7e+hypn28y6FGV8TCIaAP9pKoeEheXoY+PYF9t5S?=
 =?us-ascii?Q?G+orYd/6YNFxLsssSErWbbKNk1OtRQRFH/dA0d2oSs2VGv+NH9CtgrJ3WItJ?=
 =?us-ascii?Q?nlvo6JSF1mMkxPEmAXZ941+0PFv2IuJMjOgAWBuHNcfxnOz3TsElUWQRvscx?=
 =?us-ascii?Q?p2KSIYOZLvbEnJTyhog4uBVat4KZsb+pyCLbBsnw0G4VXj/Kwb/8X5qxubAZ?=
 =?us-ascii?Q?TZTDVqUWn24nK8DdAF+3GNnzrEdDQUSgS0eQB+zTRetAunxYbAG/MijkIgga?=
 =?us-ascii?Q?dqXhd2/TF508HpGWReWb0J5iUauQY27dfnCrJou5egGN6A35tRsianODU0gu?=
 =?us-ascii?Q?d4OMtEm9cnQnb+UAh+ikwYvFgg6KPwEy7DwyBLdJC2hZL8WOCiy5Q+Ad2p7D?=
 =?us-ascii?Q?v/e/IQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	coX2/lI3HgOjYgq3AxE8o2doXApv5RIlflSY3mfd0RBo/K7HjCLpIy8jiLmpz9DX1z2IA9wtU4ZdOfo4gk5B4edj3q30bYgZBUT8J4ZFfvbvb1jxEPJzo04LavOilgRlCN/yd7guo7mmkrWL1/U7q90ZEK5Uz9oWEzSsWF2n0iDBfTCXxGzShpc8LJqY7sf03hdVSnEaV6/S3vf4O7OyIRLn8Cqmo2VypochXyw74Lx4EAyOWuAeg479onfZ/hzZWLKg9/YPiSn4H9NexSehwAAwzPl+vl8rdcnGAz/+uf6taA0zAuVs3Jvmq6W2/mI9fimsaeUTpfMz/UInwII/mrtuZodUDr61AEyxqAmPdMzm+uD5L6u3cXNevgzBDD+mkPP7Iz+RrvseqAkVPnQ0pSmrieCwKleKNtvYW3yC3c5T7bi+W7qJkK0yQuHgwMTi
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 01:07:22.6018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c96a93ea-f220-4438-ea00-08de6b6568c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5832
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Feb 2026 01:07:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19515

meta-ti / na / 20260214005652.626783-1-ivitro

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
WARN - [PATCH] j784s4: move TI_CORE_INITRAMFS_KERNEL_MODULES to j784s4-evm.=
conf
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:59
            Subject: [PATCH] j784s4: move TI_CORE_INITRAMFS_KERNEL_MODULES =
to j784s4-evm.conf
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
- Patch Series: [PATCH] j784s4: move TI_CORE_INITRAMFS_KERNEL_MODULES to j7=
84s4-evm.conf
- Submitter: From: Vitor Soares <ivitro@gmail.com>
From: Vitor Soares <vitor.soares@toradex.com>
- Date: Date: Sat, 14 Feb 2026 00:56:51 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 79df5364d74f07e29fa9aa83cd24e2b1d=
a11666e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: e9a0af0f3815c30ebcca6d098cfb935cffbe2311

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




