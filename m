Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C7FEC1134
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:33:04 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4447.1771878778894162534
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=k92nH5rS;
 spf=pass (domain: list.ti.com, ip: 40.93.196.3, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuSFExoTNbGkGUmYsOQypyJ/vGOptDNp7b5B1d75P45N+fK1nIwAzvxAH/7219NlCHHEoEgWS5w3Bd9+3ClwHeEgsVDB5ppbI8nzlauswbhad6zFmin/kkiquyj59hzyCzX0yOQUEQqoRp9fQ+RoUl5t6kl1FohPwZJvvtq824X7A1JOR97aTceo0W5TQyJQoRNTOgrFUU1uL0GIODtQVXoxI0D2QrQMT0W4YGTeL1lxruJWFDZchqXRB/FjUKphzNKE2hTQ9UgLWAInBqWeG9zHi1nPwmxCRTlLYLfIsUTZQ4ZXjzDcfbhkMSgzAATaC7VIqPpbmt8U1P0n4CaALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgHrypA3QnuaB6ZAlMhoN8RJ6L0ZfTMsMAbubKdOXIM=;
 b=FoQSa22eIYjTtKqh2qKScuIc6YEEKbA0jvNzmcQoBqzarOCRRqVPU8r+InmVPqlyZp93X9bGxDJVpU8XgxPNd4PKjHKlKTVaekngc7hTmTmhK51qT0B5PBcYtjPRXAcZt0LnPKRRjwwjhoO+Kta38hRVUXlR4xM6ub56Syy6aiYJEfb0BlIc70O5xqUJO99XEnWUV8HU2tETF/bsSkhkDkaYbuuoo7PyZDIdwfI3SN4QjfG9pyfg8mYYbv2VTWFb0ZbM19ozwnIZO3nfjIygk6nBpswmjxoxV7pOQbri0xA5mg9KqIxpNxyqq12PE8tl/HhC7mB83Mn3A+ed+DnA1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgHrypA3QnuaB6ZAlMhoN8RJ6L0ZfTMsMAbubKdOXIM=;
 b=k92nH5rSW0aVtgQU6UqCnIh1q3Bd+SvcCXI4kouctegeMRtLC/8fzBpHvXJ3iPiOgrYDQOqvHoUfL0rAIZ6LtNLso+0h+kshgZ7MGXMRp9J/cbQTPpFdTI5AcQnIQN+9cYZZMZBxBpSnHvoiwT/wv/Ydzu+IdI8yROokHMn2KOMqPAmAePrV3Yhn5o9o3hcG36oZaAYGUd1XUUaCGCPTbSE6RmBLUCv2xUw26UKzl4lek1tvhl+uGWbxk0S8AXaX3Gsr5TbZE4V28CZ18ftIRTUTDOzzKTpb5sA3QfJeEZZh5hTbos+1yZdsZRwsYMYe0cCDO9ghiUCX7Yfvf2CvxA==
Received: from SJ0PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:33f::34)
 by SA1PR10MB5821.namprd10.prod.outlook.com (2603:10b6:806:232::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:32:55 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::56) by SJ0PR05CA0059.outlook.office365.com
 (2603:10b6:a03:33f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:32:53 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:32:51 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:32:50 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:32:50 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKWo553275255;
	Mon, 23 Feb 2026 14:32:50 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CE852138B5B; Mon, 23 Feb 2026 14:32:50 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti configuration
Date: Mon, 23 Feb 2026 14:32:50 -0600
Message-ID: <20260223203250.3334318-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260223202236.3642261-1-rs@ti.com>
References: <20260223202236.3642261-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|SA1PR10MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: c61cbc7b-49db-4d1c-0b6a-08de731ab87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VHPOgaFvKL6N8evad3jINb+38HoIwCdRQNlL5ReiXArNRtklZbbAXf674hqG?=
 =?us-ascii?Q?IsK9uh0B2/K31xQjspILNxv7ebG6WjIiXbT7vwk6JDlMHmkbfzCCTKWViB4T?=
 =?us-ascii?Q?h+nfQ7TAu3e0NfjHLxQbHQNpmDs1gmj4ZB90KeOmL6QRyDftjgOiVK0dvaJb?=
 =?us-ascii?Q?D3xUrrTwyYfQqkN0ySGdABAT2Rkhk0OFKm58wMIMGx84AwfWmd52HqiqaRuD?=
 =?us-ascii?Q?uPlD/ePahBV5GXGHwq8tiNRuf86GnIcrVEWIrHXMA8DEMHrSZSoQpHeROGgc?=
 =?us-ascii?Q?jdfHOUc1rlcM5c+3ETV8BWn4YTK0IusYQTczNpUUJJVQlHWo1G6202GliXRR?=
 =?us-ascii?Q?LqGiag6CAhtSMZ+m3UwXZLVoJFHPYaU45PsyrQEwkeNpN1jx4vtna3guzUpn?=
 =?us-ascii?Q?qwr/7rFQMsiFFPocODlNJAUYJXDAIIi0Z+/uWfddzAeKbYzguQJ0WaiFWVaX?=
 =?us-ascii?Q?T5GzlctyPXx+NsgUEE4NkYOFF3YpHRcCb+sMUGnvtSMGigZHQSFB9xTajfYY?=
 =?us-ascii?Q?k7ZArr4zclpHY1eQ86XclGlgtdHXn84Xuy0zDmLU954Ph0nd/gtEI3frBAQQ?=
 =?us-ascii?Q?/03UVqDQ/JKgZy7I9VALwNyGqsxB4z1R+BvE9/8BwZcpWSh9E2iFiRiqmV0Y?=
 =?us-ascii?Q?P/+YQfIjThqc8CiX962I0yfwg46TdBfVT6kX4QsKb/qu4DMKkKIBlOITXeLY?=
 =?us-ascii?Q?dYoLmuV5Xqe1sije2FXrUK+u6FekaL8A6u2ifeay4fekKA3WuiJ0g+C+5rDI?=
 =?us-ascii?Q?ZENTKoFFqkZgJX/+NqHunFf1ffCVK1Dah7qy+7Yi0yzFJ3TfsSDw5rQ+UfWs?=
 =?us-ascii?Q?R1xVCOUhxnKjZSMfGHHno/EFYOD6yQfNWOfDzLMnAKxy6YgHZ6vdMWv7xdiS?=
 =?us-ascii?Q?L0kl4gKrlhfFRigth5tcbGGIvR+GTvQATGKUQ1pX8O2BJSZOnpL+8/falxSx?=
 =?us-ascii?Q?3ZpPUqK++164HNv9CFR+tzR4hcZ0rio5WLbgGYYWxuR2vIqhOw5ezOTBRiBP?=
 =?us-ascii?Q?okAcpu22dfONOQ3PqMACQP4uKQHAoIk8f+/v84MYbOChG8yYeVSEL0eeTthO?=
 =?us-ascii?Q?tNvbNo2AAXggesH00Qr3JVUPEjyI2M5JaGw0D8r4Uq4lGjtrgZXKbNjfU2ku?=
 =?us-ascii?Q?H4KqXKY5OptQu+YLeKfm24HtqMD5uZOz3rIM5VXh6GlVXoQAKMXT5GW8B7oM?=
 =?us-ascii?Q?1yIMtJX62vr3+xTmx9kgMZYcOqO8+O3tmK8XdqWMbGYdIWSlYEJm/IvygAJD?=
 =?us-ascii?Q?jKVXxxnMlfEUMWoxuf+GR2rV1qmZ6x6NjdptNbN9bNn+poF/NZdnUrbKW14g?=
 =?us-ascii?Q?G97/U+vo6y5aPzQHvWuSuNE91jAm2FTfemWO6wNwPM/NFrmT8DkG8gC9SJsq?=
 =?us-ascii?Q?gtsT4xMjdi07lt1bTMqQNrl2Nub71kQAS7hFqptKIwzxxvHykPHo33/7fcIi?=
 =?us-ascii?Q?0auH283awEEBh/NO5Dj342D/ekC3bbP2lALslMrcrsr0YYj41wRLWPcFZiNf?=
 =?us-ascii?Q?vOM7LwVOJJ3xeXNNdG3nV+62pefEUUGuVQcu8SjBa+JXXKQpbLn+Q1fCCrGO?=
 =?us-ascii?Q?GKVuQjcbaGaid4337gwmsQuJpABvuNmQNzI1wVmQzMhgABHWxbjllx/P7CDe?=
 =?us-ascii?Q?V8znfWX4uPaq0O0E5Q4lKJZJeocUb3VtylYQRyJbZyceSBy05jx5+/w90hx7?=
 =?us-ascii?Q?cU6oIQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q4lFZyJpNfonYTxlFCrHVgJuGFEq8P0rAd4n7plz17EHP83sSyUs/+GnW+3KoRNUvM8AtB4QaKN2/h2WzmySNMc8x+lc4bHQrIkvdsdaOd+QzXjt27A0+ftm/loTIKhLUbXtZW7GseFoweDvsH+gqZHd+ROhU1jwFlRJKrVMAU5s7UyOzL9rWBjLhr3ypS007cLMG8apagRquEWpsofEiXXrfQomUL43DAaoy0m6Um4iskfxBcvoCo/W6bqPLT7/cfXKJ9NUgUvCQRA6S4TNEMyq4CLLIrUUwiFRFKdlVG0LI1t6zAhPp1qrdvRtqUeUoTCGM4LdK84YTzWwxq84n0+JiBmPa021QBbKqW4VNVlI3qHgTLfHBgIBzEWpx7KdmO34vHloYDHkvPSVj3aPk4q2ZPbdEdNKAfSMlao3p6M0QXXtjNlaVDlYh9UtAvCh
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:32:53.3367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c61cbc7b-49db-4d1c-0b6a-08de731ab87d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5821
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19564

meta-ti / na / 20260223202236.3642261-1-rs

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
WARN - [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti configu=
ration
    WARN: Commit message does not include file/recipe name: conf: beagley-a=
i: add beagley-ai-ti configuration. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 beagley-ai: add beagley-ai-ti configuration.
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
- Patch Series: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-t=
i configuration
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Mon, 23 Feb 2026 14:22:36 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5e49c9ea6de3d4ba49e571b2247d66879=
c820473

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: bbc4f137e10f7654cd3247cb811d42fb7f59fe7b

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




