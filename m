Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD3FD4660B
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 18:18:57 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1431.1768501127662808783
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 10:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ZShzQAww;
 spf=pass (domain: list.ti.com, ip: 40.93.194.27, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzTGl4LCBejiPxAM8PRcHd+CwT8bzJdoXO48VmD/zgDZdTp7ifWx1hvY8sIW2wbrWohlLtYv0hF0TL9W4bD+FJRMLoNxJfwLAFq2KdYb88NsITyOxdRL10XaOql3k9DYhXXI7lbs2hhGmHoe8FmbUx3vwxhd5+xu7JPW8KWxEpziA7/t3c0XzK9zgIi4ikSQ9kRk2l4l3xooK6CEVQIJ7py97mbJrMqm7lm+c2YCmkJLlQPYHDz8E1qkZocqL6SaYBiaa5U6LTtpbHNZxPGtBLqkMrbWPS3fxA44N36c5a/MQlY9paQTJW67BNIBHrLP7Wp6rj7vesKLkb5ADNWmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcbO48ycBiduh+fdoA72m2NO7Z8rfkfc29ZuhRUUwdc=;
 b=kTDH1Z/qibTxDubpHHmUHJaD43l2LeoYI8XJNuoyXjwLKq0N0VUuTxC5kM+xCFgmsz+qklzXp9XTDY0pttMwE5dtdBFZtluqzZaGb5qkSRXxL8B6E4mNcd+4Tpzqlcd+CjiHglnCVucSySogOnhNBqFbxu8XCm6vWzRBWmCVWJoujId5oZQm9DGztIUc8O5FsFoFjWMHhtzvzCNu6g1zGBjcy/ox/S+dp4XfmcoST8ueUevCL4Bb+U6Wz0zKv3GNiPBtO2JDzDS1Cb3pAHMNMTC12gdtam78THcQi8lsxmpKYY9b9oSzT/bqLBd+V964uCZOIKd8nJJSlXKOI5fs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcbO48ycBiduh+fdoA72m2NO7Z8rfkfc29ZuhRUUwdc=;
 b=ZShzQAwwG4mvMhrmOdw2CADqqNG8MauX+92yOkxdyvVsgVr8gq4pti2VIbpLgRxYcdpq9AnrXQH82RS0JNe49JQlAc8S62LRSk+vWoZFvNjv/8KJu1vH8HRpOAeRtVHwzYzLjs9XkxH13wiIIjdUOyBUn5caJIOcNarH9vQ+RjAh9/nlJCAizpAyuaIJyVc6ITqnX3VJgk39usNmf4PA2Fy872b5M0eUACg4SeVhJ01XPWuqo78iuXCZT/an18ZeLeiOLoacs9GkMVVxSna7XEBpC4XB9XNWiMua7xDCCF6Cbv6d4IuOh8GMttsPBV605Ffxak1TmiA8AqCGZB1Dbw==
Received: from MN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:52f::27)
 by CY5PR10MB6094.namprd10.prod.outlook.com (2603:10b6:930:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 18:18:41 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::f9) by MN0PR03CA0020.outlook.office365.com
 (2603:10b6:208:52f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 18:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 18:18:41 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 12:18:40 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 12:18:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 12:18:40 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FIIeTm1973301;
	Thu, 15 Jan 2026 12:18:40 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6D1689ACF4; Thu, 15 Jan 2026 12:18:40 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] linux-ti-staging-6.18: Add config fragment for j721e
Date: Thu, 15 Jan 2026 12:18:39 -0600
Message-ID: <20260115181839.4102569-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260115175532.3361474-1-reatmon@ti.com>
References: <20260115175532.3361474-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CY5PR10MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 323259ff-036a-4a0c-e024-08de54628309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4e9AcoY00TX4oCoBFTIl+w2UTGwjg4rMJt2Q1zBCjL7dLnOUI5u3265GWJ5/?=
 =?us-ascii?Q?p4YnT7phaZiyxNRDaRfIOP5ixCicW39O3lM8Nxu1JHCASgN7NnlvQqiiM0WA?=
 =?us-ascii?Q?QennbdiAOCwJa7KBXuIItIt3LiSYjng49IN60ZyX+QscjwEer6KpYjOXQbjC?=
 =?us-ascii?Q?mgdW6UgZH4oVRjDqz8F3azdgTQr4C+ueR7ekEXpPkr5R72wZC4V07LJIW+Ga?=
 =?us-ascii?Q?YP8idphbWvYr93y3wLFXlHQs2JeEwhQU111t3Soy42UgIXpckiOKnMCHZDzx?=
 =?us-ascii?Q?uNxtkF0njdNzQFZfo0IEeP9nhMcMM1iqhvt/Pb6XH+QgMJMjc8T96J7kj7oc?=
 =?us-ascii?Q?y1jA3SWm4WCk1g61UTVj3yOxzSSYvD0IjniNaKYJVT9NaN0XfBMEBPgXnxmn?=
 =?us-ascii?Q?qvN/4AmipvDuUxSrcJjAtCQhb4EwQO7xAKoYnk9566oOIGN8wOFB3A1CUQW/?=
 =?us-ascii?Q?9mRsaCq7lKXO/luJffWPq1AZ4K9YHSTbtaT0oRKAx125vQLSjQGGmgK+9/j3?=
 =?us-ascii?Q?mbNNQHYibxQzX8dup/jBFvJvYoBwVkajKgqS9dNHoY66UGu2HruFJ2GxDR5O?=
 =?us-ascii?Q?5WsWnEh44HQnJJaBaZorgT8pX3bLufKXHDIAzRIDLJijmmpLn2fONM0tkbKf?=
 =?us-ascii?Q?hdaS5VG/4xWDJcJNWHdQUguIJ2fTKLGgnTxRhuGpDMuoLqSOgqslCzeHsHvt?=
 =?us-ascii?Q?e5Vb3/2DWxAdrM5RjGLaeznXh8cP8d2QIp4LJRAdoHWWvS7Q6mARzVjeojnV?=
 =?us-ascii?Q?rGiVFgcjoSsvGRafebrTJQt1u8fJoJjjh+yHLLbEsc+7L2IeI9WcBj3CwS5p?=
 =?us-ascii?Q?/yOnSgZ7/8Pn3eOyu2oUnC3FdQ2ILi9zoncgip5hOZcqEuSlYWbGIBcrklMC?=
 =?us-ascii?Q?Gn3ztel0wOx+cpakS0Sp/DOVHqSNRXrMCewE01B21ekZpGkCgrM5SXMwX25t?=
 =?us-ascii?Q?Hl3hdKcfRnXJBzkjWVTF4eNbVZHt9+dupJ5z4jNZfFH/+kbFHoPebr81bc/i?=
 =?us-ascii?Q?T824fIUdrSPAHte/Rcw+k/V4vH8/xS8xKcxQytghs7Are/YQEg1Qct1WvtvP?=
 =?us-ascii?Q?MTy/5OA26jMyjzKOkb9pxeUhFPTjUNX7/eZTnBsGaoIuHSkegUBNz2UEB0Ix?=
 =?us-ascii?Q?/oCI8G4jjjgnxgd0g/BYdtTw+cgjb+uz33nY2Q3mJ5/EzMwzQqyM20zZ5UIg?=
 =?us-ascii?Q?wiToEHGM1eNmp33QwFjZDNFyOZqkFTd18ioHwXA3VzwBIB1ZgXKEZILRQIbD?=
 =?us-ascii?Q?OY3jH6YGIxgtYeK5HypJeIzVrrPis4UD8H1/Xpc4u1h3lntP00MzQFoEfEpY?=
 =?us-ascii?Q?TER+GbgVREQuL62cR4rBUdBV2/9pcX7/W71eecMAQr85iDP+tNxb4uMieJ8G?=
 =?us-ascii?Q?rYgEWFoDCYWPuEqGDX87eaN+EGmz87zE+sOgZfBlSdvpHEgYuE1qkVj/Wvw6?=
 =?us-ascii?Q?d4pufj5ZjdZeoyUQPhAdWBCLjIwGX4zie+YFLTXiZeVK3oYF1lw9bC0Pfvdy?=
 =?us-ascii?Q?cC1yWLQSfIDQ+roMamyjs7BRof6nwvW1Wjn/cDdoMd4u2inS/q/OT+1IH2vr?=
 =?us-ascii?Q?VhLh9eqTXn584LPb6d6CR6VoLjsH3H4KSv1VpAA1AigIYSQxhl+6T8Jnstsj?=
 =?us-ascii?Q?j8ZowV+3nG1+pkTfqIi5iovivxO2gReSqJV1pyK448NJasYrQLR4NVM+vI9W?=
 =?us-ascii?Q?PY9HMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 18:18:41.4051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 323259ff-036a-4a0c-e024-08de54628309
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6094
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jan 2026 18:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19423

meta-ti / na / 20260115175532.3361474-1-reatmon

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH v2] linux-ti-staging-6.18: Add conf=
ig fragment for j721e
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 15 Jan 2026 11:55:32 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c56aae7d1e9b869b0ca0f78759f3fb942=
8e96da7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202601090100
- Commit SHA: 3b7aad2f154511d2472eb5b646d15eb0d50d56c6

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




