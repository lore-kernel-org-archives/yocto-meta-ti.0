Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2A9CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:33:21 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7979.1781044398628398862
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 15:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ceW+RIOI;
 spf=pass (domain: list.ti.com, ip: 40.93.196.35, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkDC3XyMCPwHR9B9z+jCQIOfHRdcFIMx5dDYtn4ZoGvuCR5vd202HQMt3Ai0IbE5O1bcbdPf9d35v35xMjPcOLC4lSlk/yJLzZUUMyQ1kVUPTX7gwHvYiJvacKIC+fbRnGowqoF0yed2VhNo6M2JBWm6pFaO1aC7jT4Nrjyeq9rOjnN1qos2g5O43JN8/BPq5y/w+txyD4cyIxSx+m+dRtKQQ6ecfdPtX2iD9yFacHfttpTuy3xXfMAJT7hRywmnkVPubEPw/PwpJCIiSFGen1Y9ncaeTPhd0DgjmerRKnJ9pOD6P9QzeiJDQIkgQi+VXBpfS3Mo/mQn+pxQX8sCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYiIHzvfni2A4Pu0omIBmUmhzuQbLYK4LbOkjNAH9bg=;
 b=U0pTZg3yvubhHe+vdf2+IdX8ixdVw3GejAyAcnnjqw42/+0vKejHNX33JYlz02xMS47tuq6kaylq501HRh8QC/y3s+nkVfaf9PRpj4ht1ivFNd6RgxfeEL2KChaPJGlJKPuIiycbs4SLYNm7b5RIIpoEOutZyvJblM1yK2hXxnsK36rLgA7SXB74O6DgRWZmzT0J+MHjj2SYmqJMdqJjdGGO5fBphpX2NPeRAMxwZdhCVi5lchzKLoPTswCDRicFXw/hb2Kn1A72VnPZSqdtJq7MEJyQKs9zvEPmyNQSzbt6qeAxuxiirxs3BmrHdjBOWQMMBEZu+Zg2V286DrwK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYiIHzvfni2A4Pu0omIBmUmhzuQbLYK4LbOkjNAH9bg=;
 b=ceW+RIOIzwsFeAlkX95rZXH11ip+whtUTQI/PgFQ6rijTuaxlNxtouzikTt86WTbMVZxkfPWC/Eh7BQh9vPUEeRVHOnVYOf6YRs4AU1Xvc9pwa3FKRxrRonfGq3AOw8N91zYYLqgB21KqPdGqz1lGMDj8gVneq3DOxO4u+3Ow8aE6OAzcNnf5EGaaWVURIvhpJlEGHz0Y3agi/mnfkg3Dg97A7LUbUebXmDxlZmsFlukUU3S1gfiT85KDA+igvMfQZCVv1gt3FcvXi7boy0oFCJuZegrrDfjaM4L0Z28YzPqAn4IEf2v4a+wjbsQIBwSlFIs/E3NA39HeOi8/N9MmA==
Received: from MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::7) by
 EAYPR10MB997901.namprd10.prod.outlook.com (2603:10b6:303:2d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 22:33:16 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::a0) by MW4P221CA0002.outlook.office365.com
 (2603:10b6:303:8b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 22:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 22:33:14 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 17:33:12 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 17:33:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 17:33:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659MXCY11993267;
	Tue, 9 Jun 2026 17:33:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8C6AD9ACF4; Tue,  9 Jun 2026 17:33:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>, Andrew Davis
	<afd@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v2] conf: am62dxx-evm: Fixup packaged overlay list
Date: Tue, 9 Jun 2026 17:33:12 -0500
Message-ID: <20260609223312.3027958-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609221136.18510-1-jm@ti.com>
References: <20260609221136.18510-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|EAYPR10MB997901:EE_
X-MS-Office365-Filtering-Correlation-Id: 294cd2ad-c50e-4f6b-f669-08dec67718a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399002|36860700016|376014|82310400026|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	CLG56Va6Bz4S2XVSOm6kT8k1/mh3WNoiNJhBvqXjD+bfYfXt182QE5HIjkmpOzghSlLHTjFDd5MzA/x2zhD3+aI9S30OK0vTxa5zYZBWeOyJ30PpSWyTWRWPJIzGuQDT4M04zlfocIP+7TYrCWFfZ8qEMrercn6AAWQQ0rV77tKoTii+spMY3TKQUhi094M9gVor0LR6+LckBCbd7Qf7j5jMPO13CMPY/WBNQo+QkbEXNCYLK1cfugTltiXCrD/xN2uZWNTBx1zIsndAGUkGGxf3E3tGl7VA81tNHgnUiEKv6+yuCAp8dQMQGro08TY6TQeOsG8jN88xQlRBisxGw5aLcdvszw22osyBWsJKs6osiBDn4p2xHnygvVIE9eKcuV/z4AiVq3zND/tEJyynJKAgcrC/8MqzSPYo60KaGkUQzOArEGNxFwgQdknStcFJBtMXZ4pl2JLXEP9O7Eo+TQC0xBateOptJ1Uxf1A+xgrgYdhrAJyqBZ6W7OSoF6aedY7SicybIu19wseTmZcNXz5bb4lRw2Zg0KDpNHpOUTGlk2iQCJW/2DMWbm5fGS/jBlkQpivv2wc4iqEgNGoLeAxHhygxpmxp/XYm4IB4JqQxCv3v53my5u6GRHSrwoS2xBts+1Vkq6wRXCm72mxhoI2zOGsFkbmyhePRX48lk3djihKArSWDRri6+Ymx7dzzkY9DiUJWzUhdI4Ol7YwcpsbbP9T6uvXI18QSjZKZQd4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399002)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5tRAEaUHpOmHDVryIM3b/R+j8uPMnrkE9beOfkGs0NTtF8VLIZPVtKzNJouE5iKa2/c9r16VUrtyYaMlb11nC9YFbvaMZfhgWqUvcfoRv7gYomtLS1zr77mlmEe3fpqGkuHhXjJfozlZuxOPyfBYcYj/htg3qQChLeMMqf1bSKGCZyNiycmgRT+srGNjm+fsBZFMys/tGq30fSEdIe3oH9RwNflXmkmy8tHn5ITp7HK793XSTzFUiaP347ZAPYk1VXWdSdbVhJ0G07BlmblPvDn5Pz8xVjkTQPWXTfubflIyEQpXLb60+IWXVz3JPyxpSghcWSF9DKr+ovRI/ua8mMdq2bqmMigaLFU4TOUUXFDe+WDH0H0D4D+BP/aUlBofm/Yv1j8Ut6dV84fvZEBqDYs5Mazx0OuT6fDjHEpARJKxe253k2zOiDn9+0HAE68y
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 22:33:14.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 294cd2ad-c50e-4f6b-f669-08dec67718a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997901
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 22:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20002

meta-ti / na / 20260609221136.18510-1-jm

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
WARN - [meta-ti][master/wrynose][PATCH v2] conf: am62dxx-evm: Fixup package=
d overlay list
    WARN: Commit message should not include directory path to recipe: conf:=
 am62dxx-evm: Fixup packaged overlay list.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
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
- Patch Series: [meta-ti][master/wrynose][PATCH v2] conf: am62dxx-evm: Fixu=
p packaged overlay list
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Tue, 9 Jun 2026 17:11:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 06dc19bf8d9aa9edee36b2e80d9ae413c=
710eaae

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: README: update and clean up
- Commit SHA: d942c6acc0cc38d9c0abff27dabe40e68d41f584

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] conf: am62dxx-evm: Fixu=
p packaged overlay list
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Tue, 9 Jun 2026 17:11:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 06dc19bf8d9aa9edee36b2e80d9ae413c=
710eaae

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: README: update and clean up
- Commit SHA: b72044c3a4b75360ad7b44c7da9847650efd65be

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




