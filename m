Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10085F4BB80
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:18:36 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28570.1771960705478992007
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 11:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=k8cAGtj2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.31, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0gZCEgHaejWe14NVIhinRvxJicUiEovE10WYlnl5LE8+0M+m7Ngwu3fxakdS6sbAOXsxIxLeMZeTorkuTDCkW9spspgW655KGcy1DCZF52CzDy/DiH+KR92uVeTo8uuE3aGzYkS1ANGQwe7igELBweqF4dwyqGbCoQ+mlEEpgZl3ne2U8TxZi3sHlsklSYbFfs75AxgPSLEaeD9TqlXm2zapbFAlWCW7Fb1G5Qzq44bhUeWVR0bYl7cnw/kwTvH2GRKQf7eDiVyHl4ltNEYUEDC+sfei40uMSNKYQXOJVBmLlupO6/YYYeZ+7+Gzpt3LN6mQeUH8+Y5MqaKVhWKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbqBhkEMFQ3cCB8TW2ZzOzSJQa6CT8q98va/rqEVUn4=;
 b=vgcCFm1pQJW5zCCV/D08vLWAkBx47KsKr0JRdfe6ebuFU4rX1nLR/uXoLpem+64OpbM2tMfFX1rCaI0dJi7vgABPhAI1BvB86ZZg4TN0eEfJqcckEbNlazdStbHbkaRf2JQNl7OsnFN/C2sF/kKg5ptnC9Zn9+MQ28H6IY/CvqDXAzDRDEFFJRz5c5e2TgoDeBnJ6p8XCYFB3aHzIlNZxs2T9H1WBNVkEj+xaEPpQr86t6mpUCyhhe73ckQ75e9neXCiIqQlQXHaV73N0PdLzQWIx6+N0Hc6BxskRIMh+8fE6opVu0Sl4u2RQ+bBI8DNgunrwq9rt9DHG3WPI7QzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbqBhkEMFQ3cCB8TW2ZzOzSJQa6CT8q98va/rqEVUn4=;
 b=k8cAGtj2r93ZPEAgXoOe8gREWIpi6LUU/2Px25HIuPRmlLhF0FheFnmVXJMe2reS4hzNrGBMgBdadk34HsOTuZ4u7Le6KPNeWtU/UGoYpDeaL0I0XQ+nb/8yi+jKKun6CJwd8fdUsLnNwPqFoNTFk6Pa+400iprw4f8mRym1Y1o=
Received: from MN2PR07CA0020.namprd07.prod.outlook.com (2603:10b6:208:1a0::30)
 by BL3PR10MB6043.namprd10.prod.outlook.com (2603:10b6:208:3b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 19:18:19 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::27) by MN2PR07CA0020.outlook.office365.com
 (2603:10b6:208:1a0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 19:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 19:18:17 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 13:18:16 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 13:18:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 13:18:16 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OJIGKr3271788;
	Tue, 24 Feb 2026 13:18:16 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Feb 2026 13:18:16 -0600
Message-ID: <DGNFN60HKEL7.1TY4PIYPC2O1K@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 2/3] beagley-ai: add beagley-ai-ti
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, <rs@ti.com>, <reatmon@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>, <robertcnelson@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-3-rs@ti.com>
 <7b4a7756-a9f6-4b63-ba83-391411255e52@ti.com>
In-Reply-To: <7b4a7756-a9f6-4b63-ba83-391411255e52@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|BL3PR10MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: d52e2cc5-0257-429c-526a-08de73d97733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cEp3Wlk1eVhQcWNLcGdwWnFGNkkxOVFNSlZuZ1dWSTBLdjBKeGZqVjNJREhU?=
 =?utf-8?B?WEJ1M2lseEpmMWhsZCtZeW1vZkJDK2FzNmQ3UEJla2UwazN5WG44bnFJNUg0?=
 =?utf-8?B?SHZTdVFncUsrY1RqUkJPYjd3UUxwbHhtT3BBeG9tVjhmYXg3VS81ekJEcUQ1?=
 =?utf-8?B?Zk1pa3VnUXlZdEVYUXUwVlpLOGdKSzBQbU9wUzI4WWdQMVZZSkpSSUcxTzNk?=
 =?utf-8?B?ZG00T25UanhYTFduT0xDSUlTYm92SHdlaVlKSXh6M2NjRWlmWW5oZjNJR2NH?=
 =?utf-8?B?VkR3MkM1cjZoVm93eEt6VWVkVllSVDlIa0MvSmdpTUp4L3p6RCswSjNUSkhz?=
 =?utf-8?B?QWFuQ25DRm55dUxqS1FRdm1ZaVFqb3BJdDM2M0NxdG1Fb21yT3NUdmM3dUZR?=
 =?utf-8?B?Z3Yxb01WeXFkdFpINGpiTU42dWsrMm5SYlBicXRrSmZqZjJDcW9DT3VxNFpE?=
 =?utf-8?B?TlZEYXNUbGxUNXNUY0dpZUFSbGRKYmE2ZmlpcFdDOVlvYVRzb2hUTXA4ODYv?=
 =?utf-8?B?SnVHcy9MazlnVCtMdGE5cTJRS0FYUlRKS3VIRis3dnl4T2xPWktFQWppdUpx?=
 =?utf-8?B?TkY5WHJzMUJEdDNqemJTazA4Yll0VUx1Ym8xeVdVZkdxL2M2NGp6dkdBY1dp?=
 =?utf-8?B?RDFoRFliU01yMzF2VXhzc3ZuVUNsaHNMMElNWE5SenFiOTRwaHc4K3ZPWlBW?=
 =?utf-8?B?TGI1RXAyL25YSTR1TGlrVmlsMk1jS3hiMFhZeU80c0tROGVTdFNOYXV3cTZ0?=
 =?utf-8?B?bEg5YnFUOHAyci9xeXhvUFpkazNDa3ZPOGx6a2xNYlR5aWcwN0RVUHZxSFJj?=
 =?utf-8?B?SW02RkRNM3RFN2lVSlF2L2VrR0pSRWtzQzQ4TWpodnA4OHplUngyVUZXTXVR?=
 =?utf-8?B?bitpOU1hbVVHSmpyS2I5MW9tOFZQTXVDaVRVcGErWWtudUNab1ROT2MxZmpy?=
 =?utf-8?B?WWduaGtOUld5VjlERVhQcFRSR1lyRCtiODVkWkdtd0dnWC9FMFRoZnArdU9N?=
 =?utf-8?B?WVVQL1NNZndWK201SWtqYWhXTlorK0VpWVdNRW5rNjNIL0Y2VkdIQTdhTHZW?=
 =?utf-8?B?WGU0TXMza3pIQnIwdk5yNjYxUW84ZXhmRWdGLzhKdlZQTjJXTC9rNGdlSTlI?=
 =?utf-8?B?MzV2VFI3ZTFYVktndHJLcThLUmJwRE1vNkIwcnNadmxmWEd4Lzdmb2ovMjl5?=
 =?utf-8?B?RkY2TEx3aHFtWTJ6bWRXVW9PZThSSVU4MVFqRTB4VFgxc1VmWk1rZHRuZDg4?=
 =?utf-8?B?UFR1OTRCbmN5enJyeXdxdlJSZ01pK0JON2tSQlpXQTFseGFXOElqNXFTK0p0?=
 =?utf-8?B?dDdJNm8rTERTeURXYUtQYXh6MHVvaGVHR0UvRmZBQ29GdzFxamxDOWdUY0Rx?=
 =?utf-8?B?dmV5eUE1b21KUVp3U1N0a2JoMmlnVGNlb2tWelVkeU5xcUxNbk44Y3V0NkNF?=
 =?utf-8?B?LytaQ2dtM3hNaEp2eTZ1WU1uUGo0clhzRUNkbVFPVk5vblE3V3lhVE4rM2xo?=
 =?utf-8?B?ZXFkakVaWFhSTlFtQW8vUkNvTzhQSkVYUlZ3Z2RUTThjS1p6eFAvVEExdjQv?=
 =?utf-8?B?YTJvYXUxNFVqbE5OU3hMbUxKaE1GSG43Qm9OeUJXdGdKQ2M3ckNaZzJNcUpI?=
 =?utf-8?B?aVc3dFVNVi9EdkczSTJ6Qmg1aXpPMWJPL3lQVFFIUjVrTVd3c2RCUm4rRTVV?=
 =?utf-8?B?S2tSY2hIZXkyWEJuVFlvNEZXbUxlRkllMUpGZzZ0ZnI2UjVjWGpxZ1dqOWov?=
 =?utf-8?B?TUpyM21GZ2I3bUdjQk5NRWFWZWQxZGZNaTYzalEwenN3bC9IVUdhSkUwYlFO?=
 =?utf-8?B?Q3VrcnVDc2R5Y3dRbVMyMm4yWWNkbENHbjc3ZWU0dDh2Yk5WbE5HTzEwV0J6?=
 =?utf-8?B?RUlqaHBGY1JQZmQxS2xWN0Z1WWkraHZjUmh3SlUxcnI4eGFTZ25JNElLc212?=
 =?utf-8?B?cWtYR0g3SVB1bGFVbFdGK1NpTy9sYUMwWUo0ODR5SXJPSjJiQmZVTEVIVENa?=
 =?utf-8?B?WHh4MHVETzN2Wm5DSWNkYVhTaGIyWCtFU3VKbTlYa00yb1dVMnhyVHN5bkJJ?=
 =?utf-8?B?cE5OTWoxVitLMTRPVE16THkvVWhYWjRqV2tJc1hJbWt3QlRVZ294SG1YOWlS?=
 =?utf-8?B?YUdoeTV4cnZNSkdFVU9URlpwczBCcDFWcFVTd0tXQXg1ZzdwTldWUHgxWUxr?=
 =?utf-8?B?YlphcytoZ0RENlM1ZkJWK0UvVFEzN1l5QmNOTkZUTkFIaVBEdUZGNXNSVDJ3?=
 =?utf-8?B?clJ0S2ZLdHhSbFJkMkJIamVCRDlBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IzWpP/hro2umlVBgptKDr/riBue+HSUTOQpjcPr5Q+heIHshdFn81W+PHQB59nOWGZz67K4nTLdhxOb73Hh3FRTPOWsEAHAYAVWhlA4VRGLJFXMdLVQp+9aOJYKIzEJPbkacy1u1wCCgoCntm42suWQspSKnTgh8054NTQxVFbbDdMjmN0s8YJKOeO3SkyiFJxMnGbnFrdGqa5xLQ28IdZx7Jpru16gNv2a1eP98Zaj7xESqQOTE1ZCYwu5HiBJaq7frHH2JokkNmT8pFaSikfGJoZ43vIhRB5fs9rorKfg65/m7eXEn8dEC1HDbRGlFugfbLSVDptrCxDLkskW5q+0AEPyA5OjRXFrv8Q2wFVnekV7YFpx/KlpJeQ18QKbzvfTYQ5avS45qWa4SP8mseQmjk7WqqG6TWBYFRq5v+mPrk6xcgpZfcqRSsiRnECd4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:18:17.6622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d52e2cc5-0257-429c-526a-08de73d97733
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 19:18:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19589

On Tue Feb 24, 2026 at 12:31 PM CST, Andrew Davis wrote:
> On 2/23/26 5:57 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Split the existing config into a beagley-ai-ti and beagley-ai that
>> includes it, like the existing beagleplay machine.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-beagle/conf/machine/beagley-ai-k3r5.conf     |  6 ++----
>>   ...agley-ai-k3r5.conf =3D> beagley-ai-ti-k3r5.conf} |  3 ---
>>   meta-beagle/conf/machine/beagley-ai-ti.conf       | 15 +++++++++++++++
>>   meta-beagle/conf/machine/beagley-ai.conf          | 11 ++---------
>>   4 files changed, 19 insertions(+), 16 deletions(-)
>>   copy meta-beagle/conf/machine/{beagley-ai-k3r5.conf =3D> beagley-ai-ti=
-k3r5.conf} (61%)
>>   create mode 100644 meta-beagle/conf/machine/beagley-ai-ti.conf
>>=20
>> diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle=
/conf/machine/beagley-ai-k3r5.conf
>> index 06c74cf9..2d6948d5 100644
>> --- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
>> +++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
>> @@ -2,10 +2,8 @@
>>   #@NAME: BeagleY AI (R5F)
>>   #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
>>  =20
>> -require conf/machine/include/k3r5.inc
>> +require conf/machine/beagley-ai-ti-k3r5.conf
>> +
>>   require conf/machine/include/beagle-bsp.inc
>>  =20
>> -UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>>   UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_r5_defconfig"
>> -UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_r5_defconfig"
>> -UBOOT_MACHINE:bsp-ti-6_12 =3D "j722s_evm_r5_defconfig"
>> diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle=
/conf/machine/beagley-ai-ti-k3r5.conf
>> similarity index 61%
>> copy from meta-beagle/conf/machine/beagley-ai-k3r5.conf
>> copy to meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
>> index 06c74cf9..eaab2d57 100644
>> --- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
>> +++ b/meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
>> @@ -3,9 +3,6 @@
>>   #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
>>  =20
>>   require conf/machine/include/k3r5.inc
>> -require conf/machine/include/beagle-bsp.inc
>>  =20
>>   UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>> -UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_r5_defconfig"
>>   UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_r5_defconfig"
>> -UBOOT_MACHINE:bsp-ti-6_12 =3D "j722s_evm_r5_defconfig"
>> diff --git a/meta-beagle/conf/machine/beagley-ai-ti.conf b/meta-beagle/c=
onf/machine/beagley-ai-ti.conf
>> new file mode 100644
>> index 00000000..d6d05264
>> --- /dev/null
>> +++ b/meta-beagle/conf/machine/beagley-ai-ti.conf
>> @@ -0,0 +1,15 @@
>> +#@TYPE: Machine
>> +#@NAME: BeagleY AI (A53)
>> +#@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core=
)
>> +
>> +require conf/machine/include/j722s.inc
>> +
>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>> +UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_a53_config"
>> +
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +    ti/k3-am67a \
>> +    ti/k3-j722s \
>> +"
>> +
>> +MACHINE_GUI_CLASS =3D "bigscreen"
>> diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf=
/machine/beagley-ai.conf
>> index d73d0506..d2c68201 100644
>> --- a/meta-beagle/conf/machine/beagley-ai.conf
>> +++ b/meta-beagle/conf/machine/beagley-ai.conf
>> @@ -2,18 +2,11 @@
>>   #@NAME: BeagleY AI (A53)
>>   #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 cor=
e)
>>  =20
>> -require conf/machine/include/j722s.inc
>> +require conf/machine/beagley-ai-ti.conf
>> +
>
> We should flip this around, `beagley-ai-ti.conf` should include `beagley-=
ai.conf`,
> not the other way around. `beagley-ai.conf` is the "deafult" config using=
 the
> Beagle kernel as one would expect of a Beagle product. The "-ti.conf" ver=
sion is
> the odd ball in that it changes the default to something else. Plus that =
would
> keep this patch more simple, only needing changes to the new "-ti.conf" f=
ile.
>
> Only downside would be this is done the other way around currently for
> beagleplay, but that would be an easy fix to switch it too.
>
> Andrew

I agree that makes more sense from the outside looking in, but the current
version results in less variable overrides and less unused variables being
defined.

>>   require conf/machine/include/beagle-bsp.inc
>>  =20
>> -UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>>   UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_a53_config"
>> -UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_a53_config"
>> -UBOOT_MACHINE:bsp-ti-6_12 =3D "j722s_evm_a53_config"
>> -
>> -KERNEL_DEVICETREE_PREFIX =3D " \
>> -    ti/k3-am67a \
>> -    ti/k3-j722s \
>> -"
>>  =20
>>   KERNEL_DEVICETREE:bsp-bb_org-6_6 =3D " \
>>   ti/k3-am67a-beagley-ai.dtb \


