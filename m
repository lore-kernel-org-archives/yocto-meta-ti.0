Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775C7CD5BC2
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 10:45:27 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20829.1763030726614603290
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 02:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=wjIQOoum;
 spf=pass (domain: list.ti.com, ip: 40.93.201.50, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSspECNErDCgl04ils3UOhjt+mF0yQ2NW44Lzi5SMpJepukWV7At01ACBxE4Z61j162NDvbviIMI8N0jutss9hDyso66RlEF6K7J7eW+Ul5lXl8tPz6X8ON7ChccgCUsdkBj2SNsxvzJ2AZ+kj9EneHgEQxXDAjdcGPC42Oh5HswbkuhEN0z6/3EhCkIy2jcdyI4Poiq9SvQpok3TJhPkQ8lPH6XwpxyxC2QLzose9kanDpRYL7Goq3lMhsHxDend2ekcI6oKxOdZHo2UC8S96O5wZ0VfPdww6Ufn11tLCvERtNmf6gUZ+ZrefzI5yyZlq2Hov2xRwzYeFpkV8ODvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrIl5slXffkRCtD5lYrR9czLIHRLndRNjUOQhqh+PpQ=;
 b=rh46njVak4YOBwhtXzY1Mbku261GRhPcXa1cXVxiJPKcGZfe9rh3f7ODvwDecLX2LPkBtBicelNZtaIhDUHCxs52ZKn5kxCWbqM9UQ7g0h8e/CKpgMI9rzHgaHrqUa10l103bz4xA7o523UD6dirFChBMMk0Wo8ihD+2HOQ5oMBWR0eDQc+0nDkHplRdnYzni13OOQAfsPjwK5gJOO3V3fTtBzBvTaAbwDWIccRERS6CcLK10M7B89ubLW1HSB3QEULid396dYouqcKewtW/eFGwLiFkEiCWa52HeNY7QkvD+qtE7qUZVP868THxmptv1Cus2KUUDxrXWYssXJXKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrIl5slXffkRCtD5lYrR9czLIHRLndRNjUOQhqh+PpQ=;
 b=wjIQOoumMb34ttCUQuaWu18EXdceQ6P3WmHhczxwOyxIOxNxLKIe5WJ3gku9TLu9jXq4JXY64H7tVvKO2zu+odRZWg/1ByoeBbUaKk1nUaMGOMyCUbvL1WFFDtWHP/IUZXfXfSlFJTfd95xFP1Zy58ZVFJSgw804aXsQYfArNkjM7txyeddRZ6psKksvnoHvl3USgF4NmEmQsMQr2Yq99K4QBPMVmYvfFKankSYsg3LGcrUr+BJ52EtNUuEJBlb5Gp0kCQkMzt2tsTEFB3PpUVAJfVsl9a0LMrYFOg9FqAwHnK0wHfr3q0p06sBzDw4IlvWSldjjZ/utOkklqkIBBw==
Received: from DM6PR01CA0028.prod.exchangelabs.com (2603:10b6:5:296::33) by
 CY8PR10MB7172.namprd10.prod.outlook.com (2603:10b6:930:71::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 10:45:24 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::8a) by DM6PR01CA0028.outlook.office365.com
 (2603:10b6:5:296::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 10:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 10:45:24 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 04:45:22 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 04:45:22 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 04:45:22 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADAjMbJ3825399;
	Thu, 13 Nov 2025 04:45:22 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 16E80142E2D; Thu, 13 Nov 2025 04:45:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v3] meta-ti-bsp: optee: Enable PKCS#11 with REE_FS
Date: Thu, 13 Nov 2025 04:45:22 -0600
Message-ID: <20251113104522.2443817-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251113104156.1436579-1-s-joshi@ti.com>
References: <20251113104156.1436579-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|CY8PR10MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4e1f8b-c5af-47eb-5dac-08de22a1c042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a8ufloJ9NHA0oflIz8AuxaUBeuUNmZgcUQrZ5CjCwWwLP98iigIncsArfYhk?=
 =?us-ascii?Q?THuza1m8nKxmyAclUWAsZB75xekCecoNzw0UzgnMJeMo4Z4x0evhWj0y8DBE?=
 =?us-ascii?Q?bLDapjVbGHzcczyYuzaptA5RdwOgyviHwpqAwvJQykCGwOEu1qLQSFgpRhj/?=
 =?us-ascii?Q?txXqm/pqYY4PoV8qTYUkvXOA81AnrgEDrKQOC6OIt1LBaKJbDJJqBIH5ecVp?=
 =?us-ascii?Q?nzL2gGdZSA0HKN+O4HbXy+SHK4FiMZERhdiXfLWc6kcsV6T4+SaFGaX+AKjG?=
 =?us-ascii?Q?477gi36euI4jPpwZQqMbF047bpU98db/a46G9/NPZAcgWpczIjQ5hAHokFqh?=
 =?us-ascii?Q?j6pbl9f+l25zJh4FKEdEczOsl6wMgejetbgcp7zYzcSyKwClzvZW4zfX7/Yp?=
 =?us-ascii?Q?DjPENUExKD4F8jXSkPu4ccfUcrR4TpsiMjxhXq1+BlSUAPFzyRf3XVLQDbZK?=
 =?us-ascii?Q?tlYUfyPE5uh27xL1qGKUwfh9q/XWRjAVam1kktU1MdF4E0PY5U+POH/oG7AO?=
 =?us-ascii?Q?AnLLefE4s0567jYaPLpzk8WeLXRO/86xQ7Axu1oIUdvWm4RWp/vjPeJjRA/e?=
 =?us-ascii?Q?yMarnRwMNhHtb1a6c0uK/dBdRoiGVkYVruJoXZSxj8x1M761QZVHB+m6tSZF?=
 =?us-ascii?Q?HyoMQjffkCbRPSTB1VeeJKvk6b3mcl8wx6xJSSXQyA1+q1l+lffIYEmbaMyo?=
 =?us-ascii?Q?UBTnTETnflCVkX4sEYBlJ+yCuETgOyB6vOhMJiV8bSZDpc+dKf0QoVYIdnOd?=
 =?us-ascii?Q?hjV5zgzwmHfRJXc0hu3SO6vM78YcS5LJucraJsyeIbuqr3lYtfQcWZrYys/0?=
 =?us-ascii?Q?jFPvh0BDJGHUIeAp09AgUXE/WHQX+/HxomdyUzTDLJ6uz1zEZn8ZV72nEZ0X?=
 =?us-ascii?Q?ZZ7eoazKGsRXzUIyZX6Uh0/bmPENJLuJKP2kHW36HvACwptflcXZ14G4PeU1?=
 =?us-ascii?Q?I0A6C143sMT1y2lF8TdkxgDv9xFkOhXCl7Pj/EqrNBg45iAsO0qPRCBJ2xvq?=
 =?us-ascii?Q?rAcE8T7qWqgvEvCfJmbLFeaP1dduQX5VMH0ymtdt8s0m0T28c9qCO2OkqSXx?=
 =?us-ascii?Q?lGAE4No54NyquJWFGYZN18eKnjtlpKuCh9Q1NL5bJLWATYxov6O+ysOYQg89?=
 =?us-ascii?Q?PQG0U6CLK6iInpWOGV4bLEcJFTDzzQzvUsSSw4QN1+WRnPnwWwp0gwerE3ZG?=
 =?us-ascii?Q?tkobw5ntnp8A8mQn092yUWb9SMNkVx9yikQJvebz7N5VQFUjFCZS8cHJIE5N?=
 =?us-ascii?Q?6aBBl/u83VSjDpNwKB3CZ0tqX23ZpXThTotingZNxurhboHNf3RhKbRaLbGh?=
 =?us-ascii?Q?jakGk0x/rlixBR7zQbw7NXgbKl+JQhXB/jWmFt/eR+aDmWZLUirjkfR3APd6?=
 =?us-ascii?Q?9YjRcL9QhuAqRTtIZ5GbH6dnPPT6cbWdGPL3g8TQIQNa08uDnwdqLA/RBowj?=
 =?us-ascii?Q?uQtJQLNwB9MkDoTfKyorOCw3R5JgcXKmmeUsdsPRCx60viGKbp9p5Q80CBWS?=
 =?us-ascii?Q?S+UHYUoFgB86tN1X1MCdwPmsoA42m/SPF8OKoo6J8cRpsZOAN2h378OlbECV?=
 =?us-ascii?Q?eCtId9J/ERtJtYzoJ20=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 10:45:24.3108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4e1f8b-c5af-47eb-5dac-08de22a1c042
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7172
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 10:45:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19267

meta-ti / na / 20251113104156.1436579-1-s-joshi

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
WARN - [meta-ti][scarthgap][PATCH v3] meta-ti-bsp: optee: Enable PKCS#11 wi=
th REE_FS
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: op=
tee: Enable PKCS#11 with REE_FS. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: optee: Enable PKCS#11 with REE_FS.
              meta-ti-bsp: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [meta-ti][scarthgap][PATCH v3] meta-ti-bsp: optee: Enable P=
KCS#11 with REE_FS
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Thu, 13 Nov 2025 16:11:56 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1ed21cd09cd27b494e4fdd3bb3c8e1d0e=
157186b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
- Commit SHA: 52b9de1bcbebdc835641c33655e26e9e54441866

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




