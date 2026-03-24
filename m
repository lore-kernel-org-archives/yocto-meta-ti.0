Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3946F54AD9
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 16:36:02 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1801.1774370156981119796
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 09:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jDSmqQeH;
 spf=pass (domain: list.ti.com, ip: 52.101.193.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyiIChgJ7Vq//DDu3YJTu9xfLNLqKRtGgUscF1aoPE3X3yk4h11PJ+eyTst2dg0V/TvOuBDstSwZgZJ+OAA928AO3k0Jw/n7WYKUxebStOXEP2leA/Ifwip9kRF3fL4NFXZ0fQE9KrpTUSFw0avfWBF3BlveRvcA2MAliOufDM92zwRK2F9OI9x5+BfGBKLKrdiOty3rPIihXCKURolLl4/m1965RT+npMJOx5GYL0YBsWfNaxZ5iVTi0Aw9vEkZ5zmz8fKc2jUwj4wBXcEKHkosHdW4IPk/1egk3ZLw64omVYrIZL2rXiDj0mxxA4Oxbs0MPavfY4eBEPRc/SCRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgM9f4mdaQu7BALfqgOjnYu9136o04f4T3XPDnQwZQY=;
 b=QePu4mVzNsr25ejCjM/SNGlR7gvKormm3LFZDmH+wZYBNTZ4TSEd5oSbXU/pVpPNdlR8r5e/WfDxgeunFI1e/D4v2+fxBQPKPk0xkqc2ZUrSGaBM7f003LPPsyVVWr1NLqg3teGEQ+LJzAv25+V1wGcJsN2ydldWXkiiSJUzk0FhVVOKNmMcHgxUHZzLrbpscnqRXKAuYV99RKLokqzoPRHhMIatdkFhSULrDmYwdq8EvXzm0Fa0aZ5LPDbzWpi21VQvainfs3VZW763MpWTshAAonX7ppES5bZyuMa9I0kBQlKNG89Uu9g5e2iWLF2EMQbk6tbJltIYRQpqbDDEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgM9f4mdaQu7BALfqgOjnYu9136o04f4T3XPDnQwZQY=;
 b=jDSmqQeHwXiofoCrdYfSX3HJu5HAL7Mue5v1ontgzXiirgklAtLIYZSHHBu5k4En9HQI5CnzycZSHhjMHtIj0JIvyQgBQtDTEINV+uPt4ezfZsNxfu/nSIrWy0AvCnvx02/mTWGrbuHoM/N5YDGoV5zGDKfW/aKBW8sLAZYG8+gJ0adi8icc7ysllsgF8wEffh8Z6BekFT9a0vykRcDRdeYrR0yVV1BiebhKZIVPswaKuUBvV9xGL0cjfOsgN373VUTlriIOd+N8lS1+Ceqw1qxX6Tchg7l+nVYIo6nxocDhcxRYBZ5WdhVAo6p0xfkjXo/pzcNKr+TxkCq5BnqDUA==
Received: from BY3PR10CA0013.namprd10.prod.outlook.com (2603:10b6:a03:255::18)
 by CY8PR10MB7266.namprd10.prod.outlook.com (2603:10b6:930:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 16:35:54 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::30) by BY3PR10CA0013.outlook.office365.com
 (2603:10b6:a03:255::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 16:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 16:35:52 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 11:35:51 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 11:35:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 11:35:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OGZpnP2485392;
	Tue, 24 Mar 2026 11:35:51 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2F4659ACF4; Tue, 24 Mar 2026 11:35:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] weston: Update to 15.0.0
Date: Tue, 24 Mar 2026 11:35:51 -0500
Message-ID: <20260324163551.2487070-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260324162004.3215160-1-reatmon@ti.com>
References: <20260324162004.3215160-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CY8PR10MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 295f6acf-2683-4057-be12-08de89c36a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Qxp2DJk0RNw+IhHntiXImSSyVMbFxSSGdVX7VBIg/UemtQZ6Zqgx3FQ5wDWOOBH+4RKcPkU9zZs7Hry0/NQDf5UCt+UPQEswr1CpPUmMkNYFztYvSKjJJNmEmS7OzVdTlGXUvQHW433R7F12ynxKwl8AEFGRzN3g2ug3+I5Bjfdvk21KB/c398pUK0t3tXMNDBinl94H2o1BKZtz2oavm8apvK5O05KbxkgE9RAsA95A3sruC6MRnGiGR//RS3BijGKxFyhPvUaUHoiQTNBL2FdJwEu2hbp97yZTtZvDYdPlkhYum8DmuRexit3/SdBt+LrbaLXFcW+uZ/CWQsf82Sx+ZTDtTkQTLi3rvEvtwo96yeqyRFmkhijQWPFt1S6Qw5r/fP0BvXaoRIWVdvxJa8bqsSbw0ngWmvD2ffibeDLSiNYVAHxMRWu8igSEPDwws7ybZquxxc4x6xacu+9f622Z7zQgCFtpU5vt0crSJCx1rngShy0EeE12LYNF0aVjcr27VUsiBbStVRju/sZTZxEpFuA+oEeOnSF459AwHGvIqYA2hDh3YgvLKAeypA/CCI4RwE0lqEZZVEDQmNWymhQB0Nb8Z0VFkPnGQQzE7i+nT3DHO46KpMwlanlXJAJPRR4dMkLy7kDxFD8vx1vdjR9bth/h5n0i6BMygPp9H4oTWE19hOe6lXuNmd6eEl++5i7L+H5FzyMxx7PkBfFyfGMpaV/umwZbRDeXwefxYCAF4LqwBjaCrLUBW+mRJ2FkhDt7FXn6f5PBaWFWhk+FdQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mItaG34uLkYNmjw16S6eXgMuaiH+xHol0ifS+Unzjw6k8dSYNntxZWQdgIgz05bBtHkRakoG/cryHmTxHfB6fL0lXbRLTmFMQYXoNuQXn6r5iNSMxdJT63KgiXP/hujhCen1ok6Ew/XFtGseU7Mk7Y1wkm1MVi1SD73xwrDdBiXaFiRPSpwETTCvQU/BW9BYd8W4Tkw1PG4/7n2Zxc+9H9fUse+YlKx8IrUOyRe55bsr9IoaE8nGGhLhsPDWCvTy57rEU693NmomsEVO+yR7tQHxHm+lKsRZtHjuc7EjrOME4JoNBhSl0xMmfGGByxVxQZgc0OFmslYx/o93frtcNtkzaMrNjHcSI06g+X+mGqOr8Ihqdq4QAh0xkwHD4kIXcZSMSZI6sPbNynYI7Msurf7+VwR9WxY7pa2Xlz43RBSjB5ZzxT+CpnM2+X9/LtDu
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 16:35:52.5839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 295f6acf-2683-4057-be12-08de89c36a3c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7266
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2026 16:36:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19805

meta-ti / na / 20260324162004.3215160-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] weston: Update to 15.0.0
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Denys Dmytriyenko <denys@konsulko.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 24 Mar 2026 11:20:04 -0500
-Date: Thu, 6 Jul 2023 01:48:41 +0000
+Date: Tue, 24 Mar 2026 10:52:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e5685196a6ed6b6fd5001069a13fc708f=
28a813c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603240400
- Commit SHA: eebc625a4404f1fa628174d558d296abe1cf382a

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




