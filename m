Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7FDCD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 20:45:12 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5830.1781037911145032503
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 13:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ijD5n/Sl;
 spf=pass (domain: ti.com, ip: 52.101.48.59, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NauOW9oQXhP8L8MoZa/3UlY4uUvOppJWWkKMVDx4uZuVnw+EJXMv+5b4mijIEdAVe46VvXQT/rvlUVSEmCIP+4bjoTFQAHZ2V0R0khmJKlJDuLirHBl+jvzjtpsHr36YzTDayPQM30GiuA7QkAKywARvCgfJuTqxQxnLL8F/QJSqY45y/lO2Tj1Z1uXQg390KaoWSrlMu61vlU/4YyHqeInMC4wLFYtF0QokEeW2kT7+8lQ3SaUft22VIRJvUj25apeYmiQxo+wxWGi+E+NQzOHt9Hho/sKJWz815fBgrEN28bqqyuC5bLfUsMjZLWfX9X4iAjC1YrOGGyeBGgLydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHlxvtItdy69B6Cers5GAAVJr6mFXT0mMMJdecW0oJY=;
 b=HG6vtEeDOsMoyWitnX/sgBl8u3CFpEqyI2zxPnv4O4pd674Z9DYYR7UDQ5lDr/7teumkIj58rHsrC0sPvVizSabP+GD0K//AU4wRLBotFA8930FwVs4lm/SyZ4c/jYQ8+MKi5rrMvIBAti9AyORN75BcVJnrkiwtXPPrhIuKdmHMlGeZF/02JCljNCMabvCvdbsGcqR182WzIWteIzEzU4yBIwtV00V3l8PL+sJoRPhEb5pBgyfzvPk2VsT2YYlDPxEP3rizVqoExqrGVuolaSJ/1EbBFAzvnxg6NobAOILaxwtdBwGc0wxq6Cdb2VanM1ATZg0sl+FbGDHSy3mPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHlxvtItdy69B6Cers5GAAVJr6mFXT0mMMJdecW0oJY=;
 b=ijD5n/Sl1ERs3KkN2zj+frWd6PRnfVbJ/Mj/gnImmtN/3qCL00oOrXIXhmQxJNxa5ZO5TPQR/tXeEbaDjELoJAMo2EMjUlc4XPvG2GnzYd9nffn8LzYpSmduOfkpOqZJ/lXTeapBylGzFQtl6mmEWJgTNiKBIqhcOB5TAZXCUxA=
Received: from BL1PR13CA0105.namprd13.prod.outlook.com (2603:10b6:208:2b9::20)
 by CH0PR10MB4908.namprd10.prod.outlook.com (2603:10b6:610:cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 20:45:07 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::93) by BL1PR13CA0105.outlook.office365.com
 (2603:10b6:208:2b9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 20:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 20:45:05 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:45:05 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:45:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 15:45:05 -0500
Received: from [10.249.64.82] ([10.249.64.82])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659Kj5kD1837795;
	Tue, 9 Jun 2026 15:45:05 -0500
Message-ID: <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
Date: Tue, 9 Jun 2026 15:45:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged
 overlay list
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
References: <20260609202801.18252-1-jm@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260609202801.18252-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|CH0PR10MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d56afda-7e28-49ff-8a89-08dec667fce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NIpiuIDMk5SwloG5rePcBKBABlxTdbOJgzw+0wURUCXvTVRVdHR4/VMfZs7cqFd75Z/fBxzFOE0gk0hUeE6HsNTHqfidpXleLTpF0Brv97c4DSW20AHB7f6mu6ZuV7rKrJtXmehDPS57mskAXJVrMh4Av85brtBbmEcZK6GENq1MQex5WdAKBC2mCrv7oxYNQRh2v1RG95NocPdvd+Ln1LUhvmoh0mU9zx4Q+jGK9VZqb9CC3SoNq/ppLWr5ViLqkHSSwUd7ntxzMyso8XL2aPAQD+CI/gd2yauHZKSITszkiCTuLvgRItliyZfQiGjTA1ERYa1K6CMLss1IYQ68b20Bad1mZ2RtumZRUfgJtKdMOdeONNYULRGYLIU+YQNyrTy/RJVnJPBVZfKz7J54sb+MXZ7UeNGwOBsEqkaF3X7GxtDnsS5I5h3xogMb/to+Z0NgrnkZ2e2MO332Yzw6pr0iu0c0bE442gsDgxqxOkc97MW1P2FR5XHZNj6xuia8MTIgoQxIoTNZLYIQFZchW6Mxq1iClx+UwnueBn7axMvLb2gM9nyjmH4tIc10h9OsVKatPTm7tBz5TMzbOcI4LI7mnK49KE++YXIoqofKExg0FEMnnSrWehb0hGNgmbbFxL98hchOF+KgvniqNpeDqbtxua/kGrTepirKr7X3qhgDupckgx/nV3WQ8gzr2iVHdBiTVl5l+sNDOrmbNgJ9D/4KuQxLtWn0NTfEBjXq9qw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	59TI9gNtTnfZiHm/A8F/wqa+l2LcsHPj8qq4RRoR6EO0pB8syE0K4/NkIzHPcCDb6r0OgtCNrizNmXSpLigprKkKqSFG+pM8Iv1HQ+JAYFzgF8zU03sPkmXfIK0go+xVlCFqJQVlhLjFQUeC9zQBamAyYZn4cW/EKscAlXNK35Tlf1m1QAF3uvs3hee1sjTGohufnAwOR/raQ5jclfhZSUOG7h/qF2x/kf4W6PyCOAtqG8GIma+OAFbd42gmuU4ZX1AG4EL0J9FBHNIzngEq8c8iWzwg8ErpCWIle+MgIV3KRSIsFBkiCxSut6zh4BKhBjDye7XgW0xjNYPOsftr5VUDtFAfzoLJVIpcE4CDW7NI21EGncUEoeTxIDKXhiZdSqqMB3EwsHSQJ1K4qYJU9jmxr8KfZbim/h/yz5dhBcmURxRyHQXNSDuLD5fnwbzP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 20:45:05.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d56afda-7e28-49ff-8a89-08dec667fce3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4908
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 20:45:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19994


I assume this is for wrynose as well?  If so, please make sure to add it 
on the subject going forward.


On 6/9/2026 3:28 PM, Judith Mendez wrote:
> Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
> update overlay list packaged for AM62D mostly to include the new
> k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62dxx-evm.conf | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> index ef9df2f7..c776ffbf 100644
> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -7,7 +7,14 @@ require conf/machine/include/am62dxx.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62d2 \
>       ti/k3-am62a7-sk-edgeai \
> -    ti/k3-am62x-sk \
> +    ti/k3-am62x-sk-csi2 \
> +    ti/k3-am62x-sk-ecap-capture \
> +    ti/k3-am62x-sk-eqep \
> +    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk-lpm \
> +    ti/k3-am62x-sk-mcspi-loopback \
> +    ti/k3-am62x-sk-pwm \
> +    ti/k3-am62a7-sk-mcan.dtbo \
>       ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
>       ti/k3-am62a7-sk-e3-max-opp \
>   "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

