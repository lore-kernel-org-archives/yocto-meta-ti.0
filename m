Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4F9FF6E99
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:49:33 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1882.1773787767966349136
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HA7WVE9l;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.2, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRF35G9rR378jBKtw5yf/Bg5h65grMZbSXawUR8F6Gr6HMvrfTO+pASSoqKevT+/oEJNeYSimnGFkIOUkMfGmXnEpspGztuFgAd79Kccm2vSBS7dvDEinfwhGsmKazsfOgV+hqDFlMTEhyRR2Fa7FlFhQWZXRPsaTplUHKJQcri90uag/jhWbKrVa6zv+t4mTCasKJlZcDjaVYdCY5MRUlJteAkXMiLIHd/FD819OlXkUR3e3FxEsTS7RL+PGls4ncoC8I70nBs9XS0of9oGfpUtkMMPqgFWf0y/R4+e8r/XpVxuL/nugQiTDLRvaOhfOtfCqC/yDByklgIk0Oz28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCu8HYp9byNN5XmZ4WjO6cdu7Yp4zln/kJDKDiZX3zo=;
 b=qqed6dCrFdtNC0u1BC7bbycoo/S3eDomDrTUO1GhSY6c/EHVnoeuOaamAxs0/kNWgba5J67Nr7dGiArWg/WjD+vrF9zKjz/dVH/BEAZ8rP7dCcyYhcNArIVHd+i6YdNVj5R67AiWALiUB+35Jp1D6CKejpr9PdZlTeIaY1AbvnZNpT6Jqij4Ry6eR80SmWkJT9r7f2s4mwEV3WlCSt+iw4NQxnh7W7atoc7aNtSiI2zRfYJghPfMlBYVE/2vwHN9UdVAiTVIvrygupjOKGtwlS07js0dOM+BdHvOOCSzrm0sLfO4EyOVo0fP+cF6h4tT95WofbfbSPts2LmJxLpLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCu8HYp9byNN5XmZ4WjO6cdu7Yp4zln/kJDKDiZX3zo=;
 b=HA7WVE9l/E1kxJfYwO3FRfJVCBzUNbe458p9/1i0eTGwGfeLBk0XZLV11iKebFnUN8eUwCs/WGLBBGKXQRBecxgv2/f8XQPqjNmB3FREEZuxkd+xA4FA138auwm86KqUK2AzlsdTUvzGc9Y8cHex58ZOewSo0D/ga3pZ8Lls7m4=
Received: from SJ0PR13CA0166.namprd13.prod.outlook.com (2603:10b6:a03:2c7::21)
 by CH2PR10MB4214.namprd10.prod.outlook.com (2603:10b6:610:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 22:49:25 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::6e) by SJ0PR13CA0166.outlook.office365.com
 (2603:10b6:a03:2c7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Tue,
 17 Mar 2026 22:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:49:23 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:48:58 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:48:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:48:58 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMmwa33479894;
	Tue, 17 Mar 2026 17:48:58 -0500
Message-ID: <47cc1b8d-8b38-46fc-b395-cfce064a1aef@ti.com>
Date: Tue, 17 Mar 2026 17:48:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] layer.conf: Update the layers to support
 wrynose
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260317223608.1973962-1-reatmon@ti.com>
 <20260317224047.3892383-1-prc@list.ti.com> <20260317224210.GK11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260317224210.GK11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|CH2PR10MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d87f99-5553-47a3-c44e-08de84776f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	q3xA7Vj7E5OdsEfpRmRTT7T8PMTVo0iJeBTdNX8h2nmgBJOebsbEgsscyv1h2C5gvgIcSlU9maDw2icz3rCHq3B83uu8smryQFRIZluH/OiEsJO0KTUwLhZufUcGwSxfEepbgk6oqnSVC05hQMC19FD6zs8+WN66WjDTVZAMEkdp6TujHy999oAlSNg3Ja7VejzCZtnPl8FlsoX6Z8mpYIvSKSRi1MaxORbTQT1ulgBqzXzUwELEY6HpDL01Y/HhbwYObEyUnIZTnXSW8nWkk/6myRjWDGM8PRYsKUiZS/ScrChewcb/DVEklNb7nvYFrLYm3/YlctiMmkuo+jdr6MDFnHxkhJMelXWdoQyzeFvJjh3e9g7pu1D7qTVRREXehTDbKLUU5/tSkT1jdi/DCo3nLjJ09VvBGL6WmhHOvycYINYiVfbZ5Y1daiLGkNKbNMXanxt7ozpDbvq9+36U4az+jPKOYUd28tV4/8lLBFhOl1+ArDgk4dX2osmSGhGpt2pSi7GBu3U+SwsNiKO4V8ntUJZLv9xIoCoLyOfx7E0cViDGQj3oD3Anv2C3k8kFEuoluBsoE/A1j6Qbrhpzs1/mwmHgsDPlssaBGI/rl2GhpfTeXoB3NTSrDbo6RSyrM4rKQNGn+NxDknDOoq0h3KxT1tia9cgZbSlUzRDwSAhaeuCVFf4KcKi6sW98cK1n8n0kKMz+WJkj+2d48VuXigpgUZzvUibr4r5sC9v/LIXwO5yzlIXHiY1SD0ArHJhcb3H3BcKgIgHzZItpv0GE2A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OHmVMI2p41zBPIlukGsNc2nykmqfGEt0FHjscUDraXNF/J5KJSIwPfKp5t6PUT3Lq44WBV2n7JN6sj3a32bEJp3UaRXXbS9zbQ6D5E+GaC0W2nW51e1BjdWBwC87By76u6HDm78bbDvVPx86tBnqtheWrpdABBvHGF5IEkG/f+GrpOBavDYEkzf8vw0AURF2upYrtWdVWAcgRVRFkLEyRmn3xiH5Px0Uv11KXAdBCv6G6oUXSVIv9rEQMqJcGQ+W04YWJrqiGEDFpMPD+iwfI9isjnDuXk+FNI1O/J5GqWeZo1APw6vV2MGMSoY6rJGyVx5p7i6g64JkBhnwo/2wUAF4YOIQ8CshBps8qc3SaZL72+dUrgzrDJzgxEOJF4LDSMjTRbGDUN8PrG+um8ILwvpazUuUbLtN5ZSP1HddbvHlPO69zNvvhlLlqOXuBJOa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:49:23.8246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d87f99-5553-47a3-c44e-08de84776f7c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4214
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:49:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19755



On 3/17/2026 5:42 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 17, 2026 at 05:40:47PM -0500, PRC Automation via lists.yoctoproject.org wrote:
>> meta-ti / na / 20260317223608.1973962-1-reatmon
>>
>> PRC Results: FAIL
>>
>> =========================================================
>>    check-yocto-patches: PASS
>> =========================================================
>> Patches
>> ----------------------------------------
>> All patches passed
>>
>>
>>
>> =========================================================
>>    apply-yocto-patch: PASS
>> =========================================================
>> master
>> =====================
>> Summary:
>> - Patch Series: [meta-ti][master][PATCH] layer.conf: Update the layers to support wrynose
>> - Submitter: From: Ryan Eatmon <reatmon@ti.com>
>> - Date: Date: Tue, 17 Mar 2026 17:36:08 -0500
>> - Num Patches: 1
>> - Mailing List (public inbox) Commit SHA: 4dd012ad40961d0b94f9fc5a7a2e2e80ac191885
>>
>> Applied to:
>> - Repository: lcpd-prc-meta-ti
>> - Base Branch: master-wip
>> - Commit Author: Ryan Eatmon <reatmon@ti.com>
>> - Commit Subject: layer.conf: Update the layers to support wrynose
>> - Commit SHA: 0dde7f7b5ac2b93fabf28f6de445fa5d2067ee93
>>
>> Patches
>> ----------------------------------------
>> All patches applied
>>
>>
>>
>> =========================================================
>>    check-yocto-repo: PASS
>> =========================================================
>> master
>> =====================
>> PASS
>>
>>
>>
>> =========================================================
>>    yocto-check-layers: FAIL
>> =========================================================
>> master - FAIL
>> =====================
>> ERROR: Layer meta-arm is not compatible with the core layer which only
>> supports these series: wrynose (layer is compatible with whinlatter)
> 
> And we are going to suffer from other layers catching up for a while...

I'm locking down oe-layersetup temporarily...


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

