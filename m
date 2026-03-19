Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053D11091923
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 21:06:19 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6541.1773954378299688918
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 14:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=W8qNe8HU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.59, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrP9AlLvw46Q99Wz4ctL90I5dWbF9pSaed2A5OY87IbCrlzj0ENviAigpbJGVv1KaVoisDRmSU/mFAh22WWgH+Yd4pwNW8qgpuDYShIUu8uAvZZAr/6vA2lZ5kd/5Vu4YnyYPt4v85tZYgEz35hmWFg2YHKX4yeBru/OYhB5z85/+eMnybiesl485sbPu4D8Kp1dybydEPb2Vb8HDEWiEA4THogg9WQg7uuE2n+V/ITRH1B9yqlGg3CAQMTfcz33Gm8Gj0jLCmNocySAtB7GuLThJbEvwurvJtr897BmOxQ9i0ari3djmiLYbLqVZT449rFHIIpYn23ckzxwgi5QoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtpQWjDQ8zIlWxEmN6FCB3xoD8BAiUGvL05Bv8M/vb8=;
 b=nQpA+WhCCxrJBBwdYGKA4pLxcRv4p5WXDa7m3MhSCQ3AjO5Ek4M54JGMyiIeM417gefVlA/fgoy3A2utbzWOrGHJxIRonNP+HjGvaCkSot5EpwBEG1aXnVkL3DMBfUBz0CUTQb8/+RMdzFkhQjqVFktX1sXOltSg6KZ8kYaeoO4z+t12xz6C/FSuc2QiR6TyMr1f8ewYncVeS9hyQpeAp9Ae4yZCPoLwZKtbFDW9YJfOB8dF6ujcBaa/3M1p4HHXvKtmf9J0MkG8k24l+YqtX873CZ12SBzI3QeyvvN5amFSWRtPf/67k6wVJ9nBU2B2vgp44BwcIVld7YIGly6l9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtpQWjDQ8zIlWxEmN6FCB3xoD8BAiUGvL05Bv8M/vb8=;
 b=W8qNe8HUPNa2a0/W84bh5Ay9pOktkVmQ+ijWGf5ygHmOAiQVoSjAvMNUHQ0BqdlgDjvow8FkIThfVh7I/29wyPEkMMw9Jfa1yeViIUAt7AxE4iJDgd+z5T9WISQyICkdUEDDuzX4czpXskDiZDJWnnpU7sWwYHiiQR29yAXWyKM=
Received: from CY8PR11CA0001.namprd11.prod.outlook.com (2603:10b6:930:48::27)
 by PH3PPF1D715CB68.namprd10.prod.outlook.com (2603:10b6:518:1::78d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Thu, 19 Mar
 2026 21:06:14 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:930:48:cafe::dd) by CY8PR11CA0001.outlook.office365.com
 (2603:10b6:930:48::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 21:06:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:06:12 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 16:06:11 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 16:06:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 16:06:11 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JL6A712698793;
	Thu, 19 Mar 2026 16:06:11 -0500
Message-ID: <9dccb79a-5074-4a49-a4c8-25b008196630@ti.com>
Date: Thu, 19 Mar 2026 16:06:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] RFC: meta-beagle: Fix TF-A machine name
 for badge
To: Denys Dmytriyenko <denis@denix.org>, <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, "Praneeth
 Bajjuri" <praneeth@ti.com>
References: <20260319175402.2517003-1-jm@ti.com>
 <20260319185334.GR11121@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260319185334.GR11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|PH3PPF1D715CB68:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d4b3f1-5c6f-4ef8-6f5f-08de85fb59d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mC+OTmGeiGKetIu/fumP+hbeBtFDZeuZ1jU3XmWBzTrH/4Pct9S6wj+dhK664T2HYxsd0kFJ8vDMRKMJY1aEH49DN9MDaUFwuGknMj/fp+lM6JvcJJcjAVrWgM8uchRB/kISjtLabR2VBtMBh9AkSq3wdaP64X9gCV33ppqwe9nYiH+OQiBOUnK0kNQLwSgE5qv5zZUefM6UiV23SAuAHgjE8ysWDHZaRKVO40GUOhUW4tE7NwQIbnjSe41+6lV6fZFl+DHQDyllwNrFL8qGPms4FKI/4lTK4uI4hCfpPWyRol4Qb3yUlHU0vojn+nQOT+xFcZzeUNDEjqBPKkTyblWOewFlEJn1m2KdwmzOSe5vT25DY0TGraC2QuqM51SvRZZI+dXtLCyy+pEE8dbh01xY7PzU8DoGTmlvEfGXgDO+X0YlfQtgQn13RNPGg50Vdt5UmyE4t05/gR9a1AmDDaXqKT+pUdgEfRjzRuhaDWiBWKed4JqxsJNYvhx2XBX4ZCPlBTipWHt2lw7NHEbutpDde5k8Z/OKf5ur3YkoH96o3NIrkQTea6dU/yLbhaFvLj5omCm3ZPb1jiPmbdK3FdHvygTftxKnF1STiBSMTQZ+uAkBudlcSVRZn1TQtz24VKk8Sa2EBi2U9sBrA2A3+2/pPkPdzjbM8XPkwJFvwC8BKBSA8CoB7gejoErm0CBGFALMiPHBbSAR2QNSL4msnldPiYEH9DtPFviDOThWSaU=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MXyQi+fZiYdoV39Pf7Gyw0BxpTGRAajNmxOH8FgtF5wbClSsXqqkYIne9YpPf0gs9hhQVK0Bkh8agdr2Tt6ZcaBYINl3Q0lWull88vKUoiaixHtBLH2JZdzwKwJvCZccKJ8FTT/qRaXjACsoaAyFe/Z8v07E2V9kv7zUPJX1B5f02IRCvKuI8VAnKXimR4r02cicNTAveQ0gkwkBXq/D5yYUZxoFUAHiZHCSYlBas4eRM2SOsOm6ywB4WaPPgJURYH8Hp/mk3KslSfOhUo4daRmBw1Mb1ktaI2usJjlSIhAtO2IO1lWO0GBdMjneC3ngxJpt8yI1cuuGA3PugU8ESF0R2etV2cp0J/ipnpsEmIRk3R8bk52WGXbaE/Mk6i6bLmBxYaAjJ6JavajH8+bg5SXxn9T+4LuoQ9SDv42Vo7onfYFxgkyKYy4f4dkMXHZZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:06:12.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d4b3f1-5c6f-4ef8-6f5f-08de85fb59d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1D715CB68
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 21:06:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19792

On 3/19/26 1:53 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 19, 2026 at 12:54:02PM -0500, Mendez, Judith via lists.yoctoproject.org wrote:
>> BeagleBadge board has been renamed to am62l3-badge
>> in the new TFA ti-tfa-2.14.y branch [0], so update
>> recipe TFA_BOARD accordingly.
>>
>> [0] https://github.com/TexasInstruments/arm-trusted-firmware/commit/d203b8453905178252094416448de009931087e0
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Due to build errors with arago-master-config, this patch
>> has not been built tested, thus sending as RFC.
>> ---
>>   meta-beagle/conf/machine/beaglebadge-ti.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
>> index d62730ed..78525030 100644
>> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
>> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
>> @@ -18,4 +18,4 @@ KERNEL_DEVICETREE = ""
>>   
>>   UBOOT_MACHINE = "am62lx_badge_defconfig"
>>   
>> -TFA_BOARD = "am62l-badge"
>> +TFA_BOARD = "am62l3-badge"
> 
> This looks reasonable, on the surface at least.
> 
> Andrew, Praneeth,
> 
> How stable is the API around TFA?
> 
> Do we want to keep multiple versions of TFA and select the corresponding one
> based on which BSP is in use (6.6, 6.12, 6.18)?
> 

The API "should" be stable, the only pain here is that until
this is upstream our names might change, hopefully that isn't a
long-term issue.

Since we are using versioned TFA for each BSP (scarthgap (6.12) will use
a different TFA branch than 6.18 (ti-tfa-2.14.y)), it might have made sense
to have made versioned TFA recipes. But I don't see a huge need to go back
and add that now.

Andrew

> I realize it's not specific to the kernel version, but to other low-level boot
> pieces, which all get updated at the same time, even though U-boot and kernel
> may be old...
> 


