Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BCB108B912
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:15:40 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11169.1774008933981054788
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 05:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=h+xLJK1Q;
 spf=pass (domain: list.ti.com, ip: 52.101.56.2, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjtiRtI+8zTi+U1bp/CVLJofYp/3hnr7pTZr9oz1eVVhdE1QDnV70rZ5P8kJfCqJIRy76j3KW+I/KbLxUUdvKN3TvJ3Wv1pnIBIS6KA5eIIVfEtK2/DfIRB42t4ZtofcQPnAh4/WUnemHpx/LWf6N2ALVa7oE3Gv/3FtfLRWBDLfzm1E6aE7lpXi3NtKCfcIOQWLOoF28IkSdHcedtht+N8poqrPJ0LB8q2cYH0p0ndp7c/wgZnNYlzErlaw6eyDNqt7+fjMyssRspS5yBHlcLi7BLBQXHF6gx3mHuTDCJAtyhT/Lj0l7M6WW3qXL0BzAFq/iBODZeIDFQfWaQeltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF5sQEVsY4M2EdI6FehVvJPghFnkjg4c1zZDgO+C4Hk=;
 b=TB3iAo2dwahf1wCL040C5k3ftw3992gxs2gbrfbf0EE7a17zVgYum2D08wYSM6JFGFlMTe6pqCgKQ8D3gad/ISaJGMgU2dk+CTVjsSxacHCRvKXHwWTmePm8M84Lzahsb7bOwfnp3YuYaLQX1gnkZ3UvA7vNnwXv0NsfyJN5rbLiLvLBZ+DMtd7/AJLsBWFsT/6uUurskLtDN7focG5KeprufphTctemofKodoFw/ONRYN9nB1lNOyJCa/9kbVZxXkJKYu1i4tyabm0hjJzHHdMr6uknOcZebEFRDMsikNumxqYG0k1QnYAiA/WydmZXcFdVMhQychZxLnBEtoVeZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF5sQEVsY4M2EdI6FehVvJPghFnkjg4c1zZDgO+C4Hk=;
 b=h+xLJK1QaxMMPcu4JNHu5zoBtfCr9wuMvvOsoZMR7EhX42LIsOuZraBMBSutLQbPu9lMWijmNnRk7kL5UAny054Yhak803/fuc+OQr0/AbAP2Ql20WxdJU7Ti5pt5ngoIPT+79YLpv8XYAmY9TBvT0EQ7NX+JA/iaBCxiiu7F/3rK0oFtqsoS/XEVsuBUVR/HT2VJA/HOMnU6fdlX7wC2yayuWP8HmqlqqPq04ZuA89b8HFg3zywkkrHoEuM7tmuHR944FmPAgKaFZ7Bz7Jkw7rGTqSvJdfkxbRH6j2iBjIU5MECDFqAG0DcjYQo8TvwPvrUuOdG1XWJaIaAQfPSKQ==
Received: from BL0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:91::26)
 by SA2PR10MB4700.namprd10.prod.outlook.com (2603:10b6:806:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 20 Mar
 2026 12:15:29 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::f6) by BL0PR05CA0016.outlook.office365.com
 (2603:10b6:208:91::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 12:15:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 12:15:27 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 07:15:27 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 07:15:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 07:15:27 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KCFRNF089021;
	Fri, 20 Mar 2026 07:15:27 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0F1282A51; Fri, 20 Mar 2026 07:15:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-ti][master][PATCH 0/1] Fix UBIFS build failure for am62lxx-evm platform
Date: Fri, 20 Mar 2026 07:15:27 -0500
Message-ID: <20260320121527.870503-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260320121402.269297-1-p-deshmukh@ti.com>
References: <20260320121402.269297-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SA2PR10MB4700:EE_
X-MS-Office365-Filtering-Correlation-Id: a636adf6-1103-40ea-3dec-08de867a5f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	s+nzJf5IJpMSe3Xp/u47n14iuzeGIoCcSbxxuOKMg1ILGDd8g44jXGGIn+Mm8y6ToCtQNDDNw2SHj05r+qdz2zs0aCMdh9z7QWjq2FfRvlCaKA8xfF8XYwbgYaafFQ8Vz0AViDWqn/8P4bqHAC1Z+05/rDHlJukCJmRS181QOXYIf4N26XD3wXh+CAlsLwzykNjlDlssFZOQjC62Sxwsyxh0BrqLflGLlibgAXvqp/XRgwU1YiXvh6U5fosA2Dm0492W0Fb14g09LeDUKwaPILNl542YvC4JRnfva+rlCThinsFKh5CY7hl/ILS4HzBESh0TJaG8iGiVe5SPQD85NkiyuSJIy7ytIpz2qDZ6uGSQM42PS+5TTTCPAZn1AYAjH6yfnNW8419Pgvjtl0lPVbL+32NqEZ9sBcNbRHA2Jd1dfuUSveorU8o4jp++oFgSH8GU0+iSNw8nu1TbW4gEHDthPj9rOBm+FA05/91KmWaMR22gksB85F6DRw91k5AGusdle+L5SWQXigLZ6NaJqt3CKSF/I3kKdPPX2GlHh3iAQenubdJENTSLC03YL5oaak6adV2J1DQDUeurlFegkMvKe/XBMSuYNJdgmXSlqdx6rKbDLTItnhqhsnnmQGn/aw23D+f2h9cJFTvd6sHcqo8mngPXCxjeBKcDeFFE6zLUULBe5Uq+LcCyOO822u5wjDqS6PqMqG+Zd8XBwTYuQNTcIV6GKeaDndDy6qUx+aZVn+mWCxy4xCOTK87pJ6eKirWm63ymN7N/wo9VSI1UZQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HoVrqGDlKWXQ4OMlFl5rP+QlY1qeBT7Uzmt79XIg70vKSIlyqh89pd7CkFEIaujYOQJiD3Clt2u3vSs0TenvLevUGa8Q9FjTJyg94wEIuXTGdeNs/Nll5qK/LW9TlMrR+w65l4UJIbyci7xPS+THzq6fHGjTfKVQDBA4CAaYVYU6Zpwhsu4jCttuZnB+6rYq8Gj2Npqd+R/OUANvf9Ye/9UQzSeN9N8QLlK85191wL+rREkLm4dRGyf/DWjKMlCSW6v57FvaQBFUTw6XehmJl5d9ceM8tZDvy1vfTzTCJiB15EjPuN4FyX9kGZ8MzGrJ6vhi5JEPkEkWexJDvfJSYTScoe+sxqCcffgqlnl8T5FQsCm20wLE2RIdhP5s9HWkXTvZOSP0laOljR2Xfkne35FBJL3dHLFdqaVDaefz8ZfZjexA8iDXtk8Vr028rcVz
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:15:27.8501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a636adf6-1103-40ea-3dec-08de867a5f82
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4700
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Mar 2026 12:15:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19797

meta-ti / na / 20260320121402.269297-1-p-deshmukh

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
WARN - [meta-ti][master][PATCH 1/1] conf: machine: am62lxx-evm: Increase ma=
x LEB count
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: am62lxx-evm: Increase max LEB count.
              machine
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
- Patch Series: [meta-ti][master][PATCH 0/1] Fix UBIFS build failure for am=
62lxx-evm platform
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Fri, 20 Mar 2026 17:44:01 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ca274c0979b002effad9cf49dc7379a27=
6a60f2b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Shiva Tripathi <s-tripathi1@ti.com>
- Commit Subject: conf: Enable dynamic tpm-layer support for LUKS
- Commit SHA: c4fc80ccd76ed65a98cedc0b77a64e576b691320

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
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegr=
oup-ti-core-initramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




