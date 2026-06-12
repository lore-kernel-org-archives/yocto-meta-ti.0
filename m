Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FC9CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 05:27:41 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64087.1781242052854143305
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 22:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=mYNJvuvO;
 spf=pass (domain: list.ti.com, ip: 52.101.56.10, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3go3nGEWNE1cS9u1VN8U0ey7oE6RsbKcAcDb8nq2T5+6bdt+YK32i7rmVBjp3Qgg/NH9vs8vUJnytw8Y7OWH8v2ZxKcLwsh7BlISPOih+k1eMK1xzf72IAyDC3hOLSkt2qcbEAgIa8dlyM2LoFRrTtRjNNEb0PMWb1bW0+zw8M6KEWDG8TVKKoFGxCrzgjwE1MlkbEuvPvsc8JRC3tzXenx6IRTdro9OEiqo/h94vE6SMf/P0hfrSupkPyyoExQQKCPFWEfoH4nwVftN27wqtoiqA0KoJ6zwBY/BYUEqnSKiWyQDaLZ4K/CsKm9ZQ78prnFqr7hB6m7qjVmUzodlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6mCjF0Di/6ZXVLhgKxjpmvQOPMKBxaVHQlSewO+l/8=;
 b=O+g7Q1J1YiMLaRrHkPTTDpf7UY+T80YO6mCn10wdl36ueriKjlHYimxm7cuWa6DvdGXbWE0xxBK76Td/QUQnlcio38q1WuzEgIYU62adYST31BLSms8YH1W5UqzXQMSFTmUN+BU48ka+pDHiLpDjFNdHKUulKuaFHZzSDOUQpT79hEPeMiwjOCfRPVD3o+R8m2/PuX7lyltpDeOqhhUjvoJla0rR+wJEF5AH+9gypkmnx6riMaB2UwnyuAaxI7ez0RkpmvRlK67VLOvrQ3fN7hysfLrAGyOXdRDJfcht0Mv85RRDbyMkdGKxeVZwvahwCAs9HFikHuSbhwkDwpDVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6mCjF0Di/6ZXVLhgKxjpmvQOPMKBxaVHQlSewO+l/8=;
 b=mYNJvuvOI621qZA5YBKBXTbAR87BZD5CkgVn/51mTF6QNxDpLy3risBSrXVfwTczYoogiqG0WpYYgBZe64cZ9Sz0NzL2mQIevHOdM9lvVmWE31n9WYEpKapHBcxq7b7C8+0ZVDHkdXePSjne8uHdTDvmuOGRdpA3pYKOttJW0D0OMeT1tNBw9yL1GvtUFnG/AgjHMlD00Mk7DxYwdHzecCm2y3Zleypmzxpv8023t2W+3MEIDll3sl2Fww/tGyd3Cc2+yYAtJ9s6JeLWH6+mQvIwZSHvXJoD7w4KnnVjmSPYO9dv8lGMO5JbUVxlejnp4pcqOCS9u/6c92iXbTbY/A==
Received: from MN0P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::35)
 by PH8PR10MB997954.namprd10.prod.outlook.com (2603:10b6:510:3d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 05:27:30 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::94) by MN0P222CA0027.outlook.office365.com
 (2603:10b6:208:531::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 05:27:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 05:27:29 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 12 Jun
 2026 00:27:29 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 12 Jun
 2026 00:27:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 12 Jun 2026 00:27:28 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65C5RS123380503;
	Fri, 12 Jun 2026 00:27:28 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CDAA013F52B; Fri, 12 Jun 2026 00:27:28 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202606112200
Date: Fri, 12 Jun 2026 00:27:28 -0500
Message-ID: <20260612052728.2526160-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260612051312.844607-1-lcpdbld@list.ti.com>
References: <20260612051312.844607-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|PH8PR10MB997954:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f65b8f-ed6a-4639-c769-08dec8434c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	p/AL+jG38fMWwhZXuK8KBowR/X4OBraHyulZoI6md1MNXsUMJk7wRcrDOdA21tr5We9EqUkj5fb8bGOGVCns4cfx8J/Qu49JoT76zC3F1+lqMbGPkS9V/XNbASguEuk5yMB79kQZEOaXh1DgTBHRHOMyikl/oIKJxbf4QONPWI6aNmltiIS3pGG6rpVQ/yU2uzH3wExbTbNVUuHHZ5/wJMA26Ja2hMvYW6M7N8NbcqCVvpkss6ZXwtukFzAF1v/NLxz9VHO60fR8qkKP0OVqzSSa3nD8TT6F79vMO2TcmpyISwHBBuKsZa7ulN5yP/dAKLMsoQYDDkvZtL3s6i9l1f3rSuu1okXoSNe1e+9duL8MYILkxZnLQzhebk1KYfQqRn3rfHcnfdPWhxSWLUjGBnQbcE77srxPreHDCZquRR20n8AaGP1GzYtm9ltpltm7ZgG9R/CZfTzn7ykOmUnH9Jgih3l3xm+ljloYVJvZOKWw6SnG3KC2gwMZsfN2MA+xf1WXJ1brOPg+Sk/809gZ6/A8vYDTe+9dbzSfpeLI1zIZXl5nTQE+h3MyD765cQq1P66upWnPIEMNjDrUhdoK5d+9s/ReAU+2un0Cgohy95uKfDrHY0q+QfeCRBNNEYXVDBfYFdlMZE7NW0mpNhzUYnszTrCUCmp6AXfnmMeMZeXpSFRJ+WXE+54cI4UZj/vfdrqemzRTwvj2JC50yGKc0Yt+Jkpymiu41vK0oDK1RBA=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QwK2PKcqo/agXeJT3cvixFz3IdINrjYNs1FGXOVhgyK2vR/WYvgYlEKibgz3ksygCqSXXdDDaxuUnOltqylmdtOpdDuDj81aTK/cjaOn4EygqncdWPPpJ2iETACSpWzbTAe5YXBymHkhnIZIQF49KN4FRxZlqiBvXYD95MxOWMx2X5JBYtB18S9dccbCTtp3wvd6ZmkSH8TG85i5E4SLdESmaeAe6eUWo7qTYfGN7wMyUEOsOwd9Oyf2I+Czg6CbimaGGYpx6mFN10Zdr66L2eXqXtayrz7UkEOhYoBbf3Cn5zNk1gJzM734a9W3sA4k48aIQZ9NZqmQC/OBHMLS6C3Z/JNV5f/WZOiBYuinkv4SR/Uzlzoqnga1JA0DIxLi66mkcAB+AXVByykkoh9Y3RUhU0rbUl4bmLa2FnGaCf/ugCGIh2FsVHa5FASCch3Z
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 05:27:29.5702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f65b8f-ed6a-4639-c769-08dec8434c03
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997954
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Jun 2026 05:27:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20035

meta-ti / na / 20260612051312.844607-1-lcpdbld

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
606112200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 12 Jun 2026 00:13:12 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 90ad498c410b07ee199be087a99c8601e=
ccfa4f6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: d678d85961ddee81d4b25ffdacb5ac46b3d066a7

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: ExpansionError during parsing <build-dir>/sources/meta-openembedded/=
meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb




