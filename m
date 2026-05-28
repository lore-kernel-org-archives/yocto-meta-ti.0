Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD00ACD6E45
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 05:30:47 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4551.1779946242311888910
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 May 2026 22:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qLvliQFP;
 spf=pass (domain: list.ti.com, ip: 40.93.201.0, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJP7EgQH4hA0vWUSoGFbOQvvBXnrKjmdec93vY0f/qmF6i0yletqMX7k11YRl/ODzdEPMMndMwQUj52VaF1JPJNReJcwHxs5J2ceIqqOgQC9SDCjdj4pskKoHxC1kDL372t1UsFGQMQZTdzk8wLJAty4F3WR39L+VlpiIXqP2OX8juWPlPFMpPPwTds1nyqV5WdHAqULPJ7XRaVvJpowakBLC0HJq6QRyQNoGTXg6O7OL3YTqZEtPUmKaBBy3dDSJws9lFhZArwzTYLojNM7t9UXKh0vvpNFaUhV2AJ7h0nCfcvmXcFUdE+/liwClJ+1dVPgZwcqVSaOjgeckx5GWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzquajVia9Zlx8hi4s7P/vfU3YA1kPlcewaja+pcilc=;
 b=wC+n0UmnjGyonXMsSDBQhsda2uYTlOktI5kyRGwQUgpLQu47kE9XuQR7wpiBFdEoystjRoTThbK6waZrRGlcYPEbDaN24/SQU2U4oxtJDfQGqTNl3ljgTXoNNpsoGhdX7q9+G+mCjnivaqFTYVGL+v+bWESI8iFryFe2Ud/H7euIDctSdki+Hvw5/yRUHYedh93mfpEgCdr6Zys1EbqvBTZtk24O7VZ2LiXuseCHMS3QnuhFa06+kMijdItzpfO6BuwFxU7OZiDrM+KAeZYDa4aFZ/gz65YkVm1eTGLKXL/7gEiWM9fbVmxWoLMgJzS6lU0gA0Ana2LKsEKxdsY4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzquajVia9Zlx8hi4s7P/vfU3YA1kPlcewaja+pcilc=;
 b=qLvliQFPuRjUc0pYaTaPj043yTqG1czkGQtIuwL9sjBfLaX1F0R3DiYzSFgTSK901/6Ep7sBZM/0d8bsVQWFxOKfZ1Sdr3EU/V7LRnYPujID8yc5Z6MwLkdXmGH9zQDPz8kw7hjTBPG86beMTJCSTcBeKkb5Q0HMEqs+prSia2fxZL9Ku5wwZKcSyQOtIkAPHjXeMZbBodSwpx2IPTrQLhSDEGfz0C3AbMyI5BPgZuzwmHmYPxmDDIW6Fts6CEyQY+vTqF52DOgIHTaBHi2XJYaPc7vzmLRjSGE5pK2VqPqmS0uCMndllD6WWnCWJpNhLtYEE51ryt2+ebjhuexZsQ==
Received: from BY3PR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:254::28)
 by IA3PR10MB8249.namprd10.prod.outlook.com (2603:10b6:208:571::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 05:30:40 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::4d) by BY3PR05CA0023.outlook.office365.com
 (2603:10b6:a03:254::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Thu, 28
 May 2026 05:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 05:30:38 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 00:30:38 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 00:30:38 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 00:30:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64S5UcvR3760394;
	Thu, 28 May 2026 00:30:38 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 25ED79ACF4; Thu, 28 May 2026 00:30:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202605272200
Date: Thu, 28 May 2026 00:30:38 -0500
Message-ID: <20260528053038.2881490-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260528050604.1451589-1-lcpdbld@list.ti.com>
References: <20260528050604.1451589-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|IA3PR10MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c4e2be-d791-4357-de31-08debc7a40bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	U4erosIKnB1nhMNYTbKLtmVL46fHQtvsAfZyJJFvUBrgas1ZKvXtcECiISj4Ra0a9y7W+qtUTylZdFR0PCqsfYxJx4ZASqscyWSf1ipwhiCAAEK7SSaynliZBA216eCa9ucj7brZnxSmwTy32mOEkQo9OM8ShX/rrUcDSwcfTHX0Y0mMzfdC9VaoUaNfrdeGUsO5DM9sC29Sai3qsMtNGsi9pUtYf/5uAvqTOcNLD7Pib9R9DWAygflPJ1gkfiPh1UBAJR/aaObdHWs+XGX1F98nh5eMS9Yp+3cseoRkKZW8tcbmEluwQhkbZEVI+SnS0U02yUYGLIdDCbqYMnY0CsAJh0qgIPFBe8np80+nWKWgs6dYSRUjPfkbrY8HWe9YFIqUI5UKlgzQXsVXmxregaTlzvcnFlXBpvv4D7PWyyCkAv2dMAubIsUeM1UDleR1Qu37+uaceDsUKriwNxudhGJ1B8i0d++ll4vW9ewFZ6QssHC+nTheLSIPgqpM+v1iv24fxorC84mhpPd32k+xDoGOSrnQdQOmlOqy2Ar2J7S+M60SJgLfKbDRJN8KDy3Zm3V/WlwbZXEaZ3lkarPXq68SyxOHgy9AlLrnh58AieDxZq7t0Omo/xsZQ4Emh+ehyC+JStpbmWQNNawnqbmutHyQ4Ii9Ve8J9swb0CguLsA7gljnsD9RarEIdj7GDOJAQHfQ080dpxJVWwN6o8LuakdRwL3B8UUFN/e0PRTdwtU=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B83oazufA2fbLwJrRMyfLOkVtRUZTZn3AxXKpL3ThWGCfPKt1MXw2xEHD9ud8EvHcuHVpp9XQaLhaXjAARk5e0/CaTkkR0euUcqWPgvjI9nif9v4UVdUJJW3l2f+8s2fPA41fUVuUdVwuXkZrB0NoqO0DJ136Y3x5jg2/HtwuOWxiBbQNEQSA5zsAIOgr2iaSo3OCRcIZRci1NFZe6hFzfBafDOwWFVFeptod8VcbR+BenXC6zlcRanXDFE71ScSruNtskl4C00lth+0osTt12m1omRdeQVB1bjQcf8dyRGejWbKEUqv0QTuVkjmzbD+Zst1cact6grPNo3HTc/KKXezV3felE8S/JPzz0Ouit3s1Ber+OYSPWhF9R0ybQQLu5JCY7erTj8LWs61UI8SNgMCrfdkrkBerdTIP5lStVu1q3en8KvTpgqnKgO0O1MH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 05:30:38.9942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c4e2be-d791-4357-de31-08debc7a40bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8249
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 May 2026 05:30:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19942

meta-ti / na / 20260528050604.1451589-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
605272200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 28 May 2026 00:06:04 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e8927c5c87f3f59115eece9eb358c7c16=
c9d6924

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: bdc0a2cee531b4320110a6a39467f1b7cf1a9969

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




