Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071A6CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:26:24 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17073.1781087181223039797
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 03:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ABIsnajX;
 spf=pass (domain: ti.com, ip: 40.93.198.65, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ks8NA2P7B8EFarm5Ue7U+QJ8jF4bVFYsGAhnJBNwbz4GqkzixfPUo1n3SHt8bPEeqcfsL3/clWm4Hnqgfu3e+G1LHeO8iOEBTM54zVVFh8ckUA1/kIWs1dcGiijQRkmmPIQlQqJvqYNhpV5qcFn+LK/EV9GWVV7VwGIMyJQkOgsY65cOFhwyiST+V9i0ElI0CrVMywRzdZgjF19T8uOzQ9XgKbUFnndUftGN0l3wfQjbU/exeP1Xs9+72d8Kx0nIahFicALr2vc5iPexxZ0hgSuWaRfL+ZntR3F478QvyH/AnPznCpp6v7zyQrZ1qXAh/7gNpSPEQrh21uofxU4MxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjoPbPa1C9GaUGvGoF4aZfe74u3G02XgItpJHa2KUws=;
 b=kTfqiYRl58uK6mJumTYa3vk+c+CKTq/ClVcPjJ3zjK0MfqHyRrozG3M6f/F9pY28uq3CojHaWeOiQnnLPM834RGu5K9lrGEl1IR19RAHWV5Q1MUB+Bwiw2LSLGbsoP1MsFnmHQgKcsXMxq2qAX9rGiW9YBaMSWgpg60R1aYrr5+d9pCbqHYQR1PfVInN4Ghrenm4Udokq9HwVBnKKh2CFLmrtAE7vxQIm10HkbgEZ2PX9KvPF9KGVRv0V5FBF4hLYZkuAzUE4y7AKtIRj+EA93kM5H4BR7mZDRzq256ijna4DD20LPJHkVLoaCJPL7j0/hEmkTjM5lhG/+svnOfrdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjoPbPa1C9GaUGvGoF4aZfe74u3G02XgItpJHa2KUws=;
 b=ABIsnajX50XSr1ov2a9ywyJjVSZXwJCrGx5qs58GkeeM2oB+qcMWYtX3m5DtPLrZT97DRPQJAOOy/HxAWh1VRukn0ZzP3pNc0NhKScQw6QZ8KkMzI0YGfDSVfBLcFBNNQxORBLjQ6LKvVsCGlHpJWG65cy6UmeF+BAbXAD9AiyY=
Received: from PH0PR07CA0061.namprd07.prod.outlook.com (2603:10b6:510:f::6) by
 SA3PR10MB7096.namprd10.prod.outlook.com (2603:10b6:806:306::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 10:26:18 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::28) by PH0PR07CA0061.outlook.office365.com
 (2603:10b6:510:f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 10:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 10:26:18 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 05:26:17 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 05:26:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 05:26:17 -0500
Received: from [172.24.233.89] (yogi-work-pc.dhcp.ti.com [172.24.233.89])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AAQFjk3089523;
	Wed, 10 Jun 2026 05:26:16 -0500
Message-ID: <7b465487-5987-4420-9550-2e016fb4fe9d@ti.com>
Date: Wed, 10 Jun 2026 15:56:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubifs and
 ubi for beaglebadge by default
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>
References: <20260609103052.2451227-1-y-hegde@ti.com>
 <c6c07667-08a3-4b22-88ad-9ae5542a4d14@ti.com>
Content-Language: en-US
From: Yogesh Hegde <y-hegde@ti.com>
In-Reply-To: <c6c07667-08a3-4b22-88ad-9ae5542a4d14@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SA3PR10MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: e1aa8e51-910d-4363-7f45-08dec6dab562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	VRSDiY3pi5R2euyC3sUAU/Xj7KAP2kUcfcKJM4JQCzqBCxSSw8FSxNXyLopsKyaQM0ZaaSlWoXjrOIxMmLhdnJM7BeFB6GTFHZTB5315VQS6RnZ92EUvoG3GmsRNZmhtCa9O1zoCtviYe83ODXkt1RCrk9zDZEiGeEc6lPOB3MA5qqvIX5n0oYDZvnvRql28MqDODK6G/KgyflDYc094oIJEkOWqWW0ePMsZzSQKE09+5G09JSKthF6zyNtP9xfGnI6PsqgscyceJr67pQ8fwIpYYXhFESIxQSay6+gcBSakxKIATvxUh+mlfN0Qiydm4HbEICQTdOrqiLT/WseZiyYktmQuwk49WtsjuBvKV4Vwf2laM1P14cVCHmrB000xWo3dO1/VOA6ErGD70BHf1MBtK4/1gfKCMQB8zB9k5JeRyV3SA7ttRzJAjKwAHnzcNFibeHNiE5hQWE4VhWq2mSrY8CxNI1Zpt+r+mlynidYtDh9D3gLumkda89PE3R4fkVAVB9/9QlCisw5yi4Qv4BZDbIbi8uLShdflDK8hBqHseURrxY3FjQQXgc1o5I2tk+t1YIx9AUsRayGWrGEzsqCkF/oLudNKBi6ccxCPpgNUy1REhwryiOubAx9e7/VdUDv8NWSICBMHFLT/Lh3MVFV73t/7IEkdlFeWHJpqARFFstyI18ojmfYSD8q4oXl4izQI8/uPIAHOhxXm8DPP4nwa/GpuHQKO7m7rqr+xfAg=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xHcRNF8dNForpaHuroSe5TLPnlSLruZVpGqXD/f6fet91SxTsqr7ztJSQ8/9ifHE8mWg29zvoOH+dpX6uhnAQk0f1CSKMkNnTYVF+2VgHShwBYHTWPYKvcRrm8s0aIf0CSx0dpFYMj/tPBOHt0cYYN8vv86QPO3blvQrtfDf9+xpo9z1MDRAdiLH6qK9pIsEy7LWAXIZ2jVmq9cZci5bdH5enTWMmSjueFr7S3PSWExqpHaRvxVHcfeCyAddnHGt2Q3hwB1Ubbqn/FDfEqg8kK+Nu+LFZS38/QzBFUWf5bpYZbVE8ghbTWRyNQ9kkj8OFWd3N+x69szfILRrVuvPREqTpMh6doOIqpEtzXcOTi9I00zFMblQBVyR+0E2i+W8m967kQrt+vlz0jH0LmimV8oph8dSU4MJK02ulGIBM1XqdaymiXgbGdw9KP7vUqcr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 10:26:18.0626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1aa8e51-910d-4363-7f45-08dec6dab562
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7096
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 10:26:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20005



On 6/9/26 19:35, Ryan Eatmon wrote:
>=20
>=20
> On 6/9/2026 5:30 AM, Yogesh Hegde wrote:
>> Beaglebadge has only 256Mb OSPI flash and except for
>> arago-bootstrap-base-image and arago-tiny-image other arago images
>> doesn't fit into OSPI flash. Hence remove ubifs and ubi from
>> IMAGE_FSTYPES to prevent unnecessary image generation and build
>> failures when adding packages to the arago-default-image.
>>
>> Those who want to run arago-bootstrap-base-image and arago-tiny-image
>> on OSPI can enable UBIFS in local.conf .
>>
>> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
>> ---
>> =C2=A0 meta-beagle/conf/machine/beaglebadge-ti.conf | 2 --
>> =C2=A0 1 file changed, 2 deletions(-)
>>
>> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/=
conf/machine/beaglebadge-ti.conf
>> index 78525030..5295296d 100644
>> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
>> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
>> @@ -4,8 +4,6 @@
>> =C2=A0 =C2=A0 require conf/machine/include/am62lxx.inc
>> =C2=A0 -IMAGE_FSTYPES +=3D "ubifs ubi"
>> -
>=20
> If you are going to remove that then shouldn't ALL of the UBI settings (b=
elow) also be removed as it does not make sense to configure something we a=
re not building?

The intention behind keeping `MKUBIFS_ARGS` and `UBINIZE_ARGS` is to give a=
 reference for those who want to enable UBIFS
via local.conf. They don't have to calculate these values.
=20
Machine config still defines the hardware max limits while users get to cho=
ose if they build UBIFS or not.=20

If this is not valid reason, I will send a v2 with fixes.

>=20
>=20
>> =C2=A0 MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
>> =C2=A0 =C2=A0 UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
>=20

--=20
Regards
Yogesh


