Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8C61091905
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 18:09:53 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2739.1773943791427980245
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 11:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sCc+LaAZ;
 spf=pass (domain: list.ti.com, ip: 40.107.201.68, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv600nBNCLSqWLDtXTPtyYBicNC63tpj5r0kR98/BQhyhzutZjGMzEUyUH6A8MKt1RnxWuZdWLigdZj5Z8TJxe7oZNcbpN9FxhXhAwOUXwzLlvPm1zRh+KXXd1RBCdiO+js2KoidzsspMu0cL6E+FjafddjK0qvTyY9LGB0e4FvaYpam+t8ubQYAG2G2cAyiNZRSOYlk0wBd7PMhdUD4XGz7jRDwE8uPIa6H8ZOV0e00jENEjGF6wXK5/n2ZTSzxeNZASFFPRfoUtOrQFZOBgNS3YcAWuWk1ArI2XMLJudOQ/dDDHTRLlcLL1Vzz8Do4pFXJlLrfI9KwnPJdz7AoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvUkrrU/XxFaa9Z1NY2oWBc6zKtApV+WU+ec3ZmOnbQ=;
 b=oazjcxPF/lOLieZcf21kzKuk7itkFN3Gd0UPD3/AG/EscbFenmx49SsLb2/Rb3o0FU4K7NkNSVGcl7oEfp/B3a5UPdEv9OEcQAqPjEV3zbJMVjbt5wmqCfBWYpf2PS2Uj4lZPOjF3OPu1Ml2nrtTHWdjg+Bb3gK+ldb4dEdpObIxSZKuB3Eoz66QKwi1kEj+HarPVrNyKH7keXCoxWf5NWg/zCgWPAYHiz4pADq9O10fvrK3rAmw1qPWh5zuHvvGMuRO7QIlE4IyOhVnyIb0j1lXnHpQw0Scv1ayW1S0Jc2oRWDh+pPTiBB7x3KeTbR5PX2oSCcvaQnlD+Na4Ku56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvUkrrU/XxFaa9Z1NY2oWBc6zKtApV+WU+ec3ZmOnbQ=;
 b=sCc+LaAZoRSmPAmDD9dJe6/rDlgz0CeB8lhFT825Svrgxxoz/2XEUqCWDjDJaoN9OcZVmgIonObSzGO17uDEkd7hxYq7IffGNQX86kf0nKmiHXEeiDYG/u2SA4prPpv0CsGV9aRESD+0D7CpCjM8VQbv+5K6XSg3sZSMqVPQiF2mlwjg6hL9Cr3H2Gfu+Hvq3MCNtD+RZqkSrYoWw6pB8r98PIAjF/kvB/2EKoxSGpOgxS0LvpMhYT3H5Yb0z1Hs6bkYKjQvk1rzdowti1EkMbOmVyEgV5U6t+dddmVxdkmphdI6i9w/Wre3v4TrNi6K0zBLgiZj7cM4abeSK3C55Q==
Received: from PH7P220CA0088.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::32)
 by DS0PR10MB7175.namprd10.prod.outlook.com (2603:10b6:8:dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 18:09:48 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::a3) by PH7P220CA0088.outlook.office365.com
 (2603:10b6:510:32c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 18:09:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 18:09:48 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 13:09:48 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 13:09:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 13:09:47 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JI9lX42487637;
	Thu, 19 Mar 2026 13:09:47 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id A2503142E23; Thu, 19 Mar 2026 13:09:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, "Andrew
 Davis" <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti][master][PATCH] RFC: meta-beagle: Fix TF-A machine name for badge
Date: Thu, 19 Mar 2026 13:09:47 -0500
Message-ID: <20260319180947.1052020-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260319175402.2517003-1-jm@ti.com>
References: <20260319175402.2517003-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DS0PR10MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f19ffd-71ed-45ec-4d55-08de85e2b54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	G8BdYLJ+TQwn55cucXDJMUTi8OogDhdt/JqPVuyiSrhn774tz5Q7j3nacx30XspyK2t8iQLr4n8EJd8lcjnzYM1oX92pbxWkWkcwGDDjoELK2VlSav/NdDVpstTNWuztcyVXA4F8fCs1PdNhMa5D9VbkN5KLwoWPpknE10AqhTUifOkSdiQtCHIFBeEDEau3pJkoAtD8lwaCrSp3FD1+E5vOg9nnYfe8KIY2hEjQVNSAundpqTjx2l8c+Czs44Gd4Cm8LmIC9coBu7DeUur7arOazQpnSQVkNWQ+GlDeGP9WnYFFnhpnw7RuvCDfDuB/WmSb4FoePG9RPB0ASBxQytvxgI2z8KuMxDSISB6gXm1fvW8Uq5fP49AYH5/Oi53qTkQUfaFXYvBeAtbA88gK+RANWV0ax9QeMqVhhFZr38JsXdUArPPG3U2IaLeY4Cxw6gnECntFXgLOnIAeIgM95vh6bbOwdryg1WP+arMo3x6juG/rorwLX/LCNQUTmY6AZZs9GYcrjROku1+Y+ZxL3v+4ghXVBUcXj57LQ4nwtVHaEQlqCGQHGEFltr1z03gb7boegm/5+XUQZbjIIyCTeduK6eajLwocKoOzw0ZNbnJwcxg0tJmD+Z+bJ7r5Ynw9rucRmeH5OV+iOcgSLa9Z8pnuppxFtlw/WBuX0Hwkl7LvZ9JK+oGa0L9vac5xd4zOTwzMEkSCUlz+GXoDqwFZ2yYbByaLPtN3e+M3OqD+7MUwexIbtS0KJ+jh1rjkRlnQK0fmcraMVo4WEJpvacTKEA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	K+eKCSuYODGLuxJGf6T24z8+a9OBsFyVQv12jE2ebEagfFfIubJGm1+6q0AtvjbpXyJkVu6JouZCUWJPoTpInlOPOY4ruHMVIlLZrwPuhUbFy47/3vxjH8kg9bA77DKL8RilWxl9tc+ABPntXfGofSs2CV5UVxpn5+WMA9PW7fQYWVHa8zmrMjWEgyFsKp66kwXiZwd5++DyHYYj9tTJO3UFMAyloH7wjoRRbUduuuf2/7Ann3u3iEI2vbgH7JNuqVpjoWlyLM603RJYXOqFszUiHKJKgJ8P6yLSB/wQ0M7MJCLUTJtL+wrpJoKBi9ppDIXCj07Fqi2zvN84+jfgO/qzK9h6jOrLXKFaEROKt22sTdhDs7+YGgYI7mHYj749PVNTrYnTrpIve7SrqRdpgYiSLsZosWCLF2EdgfgDz4gyYX576ElMeScf8ZiT+3XK
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:09:48.3245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f19ffd-71ed-45ec-4d55-08de85e2b54d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7175
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19789

meta-ti / na / 20260319175402.2517003-1-jm

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
WARN - [meta-ti][master][PATCH] RFC: meta-beagle: Fix TF-A machine name for=
 badge
    WARN: Commit message does not include file/recipe name: RFC: meta-beagl=
e: Fix TF-A machine name for badge. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: RFC: =
meta-beagle: Fix TF-A machine name for badge.
              meta-beagle (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti][master][PATCH] RFC: meta-beagle: Fix TF-A machine=
 name for badge
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Thu, 19 Mar 2026 12:54:02 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9dddc443113b35444373ca3e03bd028c4=
fc2a43c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: k3: set console parameter to KERNEL_CONSOLE
- Commit SHA: 83573186e74241b5646a43a64c31396a009fa368

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




