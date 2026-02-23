Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A921FEC113C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:56:44 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5000.1771880199007602747
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AyNo6rjn;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.12, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gftlFBiX5WBQjZdxq6Xup1k9nSVH7fRfS9ELfXM1KpmW7l7tF7/l6LvFzQbWFIHmTrt2s4ml8YEDEJfVpx0MDVOeHQ9Y19xAnN5HNBtaE2um1ER9YaC6nCfqovM9NknX6fbqUPwT2hk7D/m/wMl7OdZy3FpCUJH8cVZsMcZa3LhdSP52yjNkMuuYrFuBNagzywj/oeLfJyu476ke4UqnXDoNVGJ/mrRP9LmbPXwtq6KxI2WpRgZBbovjEMTAl3mfxPejeWw2O9V/0UFeISdBHOvi9f4z37zIUfB5g2Xj+LQJQriZ8D/Hxwgi89gAd65GxQhKuRZrLhnppQoUPaYFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLlY7tiWO0JJ0D4yPndwMiZV/u8n0w2rA51fzFszRbU=;
 b=og+BFax1xk/1RdIqg0WSDdWm+anzQjUqalqD0brJ27scd8X2B/JAGTctPy8BZgeK2hNC3nGBu3RhkCPKNbSqskn4HjOSPBw5GQUpCtZkPfHBQBvH6H5vjNQ4zBj8Wy3CSVb11iHzoyiF/mXuiXfKrQMAA865NcQSnx2wQfHNgjDfd1cQrREKW227lW+Mgl4b9WubkdgoiicVJjSgXpAdTN9vFICuesOKNGazb4yI9IkukQ/o8UtMCLzdbKsrh3Bez2z8dg/5E1kaOtek25SX1nOfqhV3Qp4UwsLoifTfC7tDeG48PIBnzzLrEIyhmbkP3lPyjaCUX/9cm5+HKx+rVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLlY7tiWO0JJ0D4yPndwMiZV/u8n0w2rA51fzFszRbU=;
 b=AyNo6rjn4InTsX1hmkj/Npny0Mt3B/vRZb3ysbiWQfTMysCf1uetD/pnjmPrXT2wx2UQFYPPE3SS0PjxxeRplL1XbAe6LFCa90UmjgJlL8/xhVAAwAvjw5HeRRRU9/x7U+tPmurq79YriQ/29RdJVSoSPPkCp4ExrTA2VkZocHo=
Received: from DS7P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::6) by
 DSWPR10MB997825.namprd10.prod.outlook.com (2603:10b6:8:36e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:56:36 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::ec) by DS7P220CA0001.outlook.office365.com
 (2603:10b6:8:1ca::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:56:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:56:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:56:36 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:56:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:56:35 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKuZtB1000958;
	Mon, 23 Feb 2026 14:56:35 -0600
Message-ID: <d61c8299-a7d7-4c82-ba6a-4e6754d78407@ti.com>
Date: Mon, 23 Feb 2026 14:56:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] optee: Update to 4.9.0 tag
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260212221955.3319340-1-reatmon@ti.com>
 <20260223180946.GP11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260223180946.GP11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DSWPR10MB997825:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e547f6-8d2a-4738-efa6-08de731e08c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVE5eXRnOGFtc3NybDVqUmN4Mnk5YnlLNmRDeG0xUnRkcEkxcVJyYmk0cGdM?=
 =?utf-8?B?NVRYTlh3TGQ1eERiV0hFWVcyeHpwc0xPOFpVNW12S3lET3dONnhqSEtSVkRR?=
 =?utf-8?B?NDJVbFovYmpoZUZ0azl6MFRIcC9ubWVXelYzcU92Yk51Y0tIRzYrbytkeUtB?=
 =?utf-8?B?d21hT2lYSHczblY1TGI4RzEydkRQWlFabDd5UmNZSmk3RmRnWXVvYWhWVXJW?=
 =?utf-8?B?WWJKbThpdjdoUG5xejgxdXlCclpVWEJFeFdKUEJlbnRCYXpKQlJSRytqcWFE?=
 =?utf-8?B?N3Z2WjB3VDNHRTVENDhTa2pVaDN6aE14VDIxWHB0THUrM2x4ZE5TcTkyYlZq?=
 =?utf-8?B?ejQ5Q3RFbG5idFJKN0JXSE9xcFR0UnFYUGE4ZnpNazQ0OGtMTkovTkRGMDBW?=
 =?utf-8?B?VCt2Z0xlRHF5M1k5bGdMMUNRenZrSGdDWVJqWlU2SS8xZG5DVkNaUTFmNkZl?=
 =?utf-8?B?dFArbFJYZFAvSlRrSlM2Ui9yNHZCd3VVY3VwZWl3OW95TFptbWtXUHVmZWMy?=
 =?utf-8?B?bmJUd1VSQzE4bER3dGNxOFY1Y0dpaHUySHJ2dHhKMkdXZ0V4TG9ZRXBxQ3FQ?=
 =?utf-8?B?SWlEbWtqWVVWa3dqWlM3TXFRcFNRTCtiQmEramNDb1dpeHFCVmdIT2htV2tE?=
 =?utf-8?B?RXRPcTNKQXVBMXUwRnZ6Y1d4MkQvSHFEYktHZUxEUFVUUklkamZJSjhzVEdt?=
 =?utf-8?B?K0Z3NDdpL0UvWnNFZ3dhZW9ZaVFVdUFUTWk4c3hxYTBTd2pmZFNBUm5jQUZM?=
 =?utf-8?B?SVZMWThjWHlaMTdHYzJOZFpSUU4rVUtDdlpnT2dESTR5UllrbUloTHZ1WXRM?=
 =?utf-8?B?c1dNV2wxOElOQzRydTlQbU1MazhBVndBN2FMTEhFUzl0aFpoc2ltTExXQUdU?=
 =?utf-8?B?MCtHYVg4WGdpMHJvSUF1UDgvYU9VRFIzZDM5QXBKY0VmKzFOU2xWeHFmLzNW?=
 =?utf-8?B?QXlQNjZXM2pIVkVJem9UYUUybjZPcm5QRGlDVGo4eEwzM1RRK2R0ci9QNy9q?=
 =?utf-8?B?RUZra21kZ0JLVHFKZUlpR0xjTUJZa0s2ZlhpRitBVzdUakloNjZzRWdDcm1x?=
 =?utf-8?B?UWNGc2J0T2Rub2VScll4WURMMWcxVXZLTkU4Wk5sWlZ6SC9tbEhyVGcrdklv?=
 =?utf-8?B?RGNheWRZSE9yZGtuTlBSMzJ3dm5UYzRZcXErL2ozNE45YVMrTUE1L2Q1dGpS?=
 =?utf-8?B?aW0vQ0RST2ZpWk9FUWxsNDd1bEdLUjZVT2dIQUVyMDBKWUx2blF1R2xQRFRi?=
 =?utf-8?B?TXMxNWJjRTdZTWpmNFM1UDA4QVZhc01qWkxwbU1vdFo5WlVDci9ZY0pFSVdx?=
 =?utf-8?B?b2hZR09zVlhIelRrU29UdzA1dHBYandaby9WU1k5cktnSytFQ25pMmdoa0Np?=
 =?utf-8?B?NUpla0IrUWV2N2FNRmtCRExzZFpWakk1QlJ3dVkyT1VhZGs2RUNZV0F2Z3lq?=
 =?utf-8?B?cHpaREIrdERzTjF6U1RFcnZyMjEveFk0SjR4S3RzQzJGTHVqYXdlMzZzSWRR?=
 =?utf-8?B?RzhEQm9XTzByRm80bnZyRVlZdzIxcUFUQXQ4NzlNUVVEQThYakxvK1ZhMnQ3?=
 =?utf-8?B?NkJpekc2L1pvVHBqTnJGN1BBY0JSajExUWFHc2dJaHVrd0prK1BRRjVyYWtI?=
 =?utf-8?B?d0hySnptQ2xkWHpkSDFvT2k2akVFRTR2bXNxbkpkTkNhejM1YkJGaHFobGRt?=
 =?utf-8?B?TlZKSUxNR3p2Z2EzbEdVdU4rUmRWdWtPVWR6M3dnaWtQUHQ3SnFJMC84SHFX?=
 =?utf-8?B?UXlUUEgyN2RESmp6a2tVWkZuSXVhS3RXV3piaFVaWVhxRXN4Nk5qTlVrTyts?=
 =?utf-8?B?YWZRdTVRUTVXOFdjbTVIKzBuRzdPZEdWVStyenNhZzgrRzZWaFk5cDFMdmZ2?=
 =?utf-8?B?ZmlVbjhnMFZxSGpNc3Zsd0VxUC91ZDJnWmloSDJCdTg2SUwzQk9vTmtUMTN5?=
 =?utf-8?B?eElHaXVqbzFjN3V3dzBrbUFmK0V3VFdhS0VBWXhqYmRINUh0aStoUmZ5R01m?=
 =?utf-8?B?MTNwUklKMnJZckVuQTBwQ2diWS8yRkFrekxhanlzRVpGVk4vaDFvQmtzcDd3?=
 =?utf-8?B?SlJKTkpFZVRUQStyWDNndHJvaURkdWVqQjA4blhXcUNOWkIxMjJNTVBlZEhz?=
 =?utf-8?B?M1BRNFNiWDJCV0xUQzFkQUJKSDRwRlV6ZnFkOWpSRGpCM1Y3d2JzczAxR1pQ?=
 =?utf-8?B?SndrTVM1dmFGOGNqZFBzaHIwWVZLdlpTMmlDdTdxNVRtc3RkbzgxbGR1MjRB?=
 =?utf-8?B?UmFhL0QwYmZMSUNxSmhpbEFIcmtnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B1HlLeXJBoJpCldkefpEAUjvN/WNYlSHdnv2aIRCEIn5AvNFupNHh+vr+sxJi1HP4e3GkZ3TgjMuI05qwDAsHMr0nRNyvdSnrIW24lA4uBjpNJWB6DugmHHhIz+q0IRhNUf44J1FH67kL9sXdFAjGBLYMkaCdrtZoOiORBNij/6MSAhMG8RvHQZRV+kt4S2UD95bShq/tMsCAt33CyMycuIsGVjktulH5lh11DqP2r76QCibp60bf2kbRDJKNgMdIMcVOGfxB3eQeyq2k/VxPEiMx1qb9a6XAbCzk7UQ1S5EK0lJPnCZPJjkH20Sij/KJoNEIYG7Lh+ZTuMky8s9Lfgi72lC8hx0nJWmDg4xh6AeYRR/QuBOmsaS4RhUInGygxL4zjH3w5CyAPDK4T57VbD62WFjpb/q+FC4vkdEgOGagNS17FWZnJ5CC4iXNa+p
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:56:36.5691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e547f6-8d2a-4738-efa6-08de731e08c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR10MB997825
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19565



On 2/23/2026 12:09 PM, Denys Dmytriyenko wrote:
> On Thu, Feb 12, 2026 at 04:19:55PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: Manorit Chawdhry <m-chawdhry@ti.com>
>>
>> Update optee_os, optee_client, optee_examples and optee_test to the
>> newer 4.9.0 tag.
>>
>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Removed platform specific backported patches that are no longer
>>      needed.
>>
>>   .../optee/optee-client-ti-version.inc                 |  8 ++------
>>   .../optee/optee-examples-ti-version.inc               |  4 ++--
>>   .../recipes-security/optee/optee-ftpm-ti-version.inc  |  4 ++--
>>   .../recipes-security/optee/optee-os-ti-overrides.inc  |  9 ---------
>>   .../recipes-security/optee/optee-os-ti-version.inc    | 11 ++---------
>>   .../recipes-security/optee/optee-test-ti-version.inc  |  5 ++---
>>   6 files changed, 10 insertions(+), 31 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> index ec10cefe..68b6b262 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> @@ -1,6 +1,2 @@
>> -PV = "4.7.0+git"
>> -SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
>> -
>> -SRC_URI:remove = " \
>> -    file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch \
>> -"
>> +PV = "4.9.0+git"
>> +SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> index 91dd5e60..6ec2a83d 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.7.0+git"
>> -SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
>> +PV = "4.9.0+git"
>> +SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> index edc9d68e..350eb9c9 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> @@ -1,3 +1,3 @@
>> -PV = "4.7.0+git"
>> +PV = "4.9.0+git"
>>   OPTEE_TA_GIT_TAG = "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"
>> -SRCREV_optee-ta = "ce33372ab772e879826361a1ca91126260bd9be1"
>> +SRCREV_optee-ta = "a09269b15de635e1816fe832e26adfbfb44c5455"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> index 30dbb430..83087030 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> @@ -78,12 +78,3 @@ RDEPENDS:${PN} += "${PN}-ta"
>>   
>>   # This is needed for bl32.elf
>>   INSANE_SKIP:${PN}:append:k3 = " textrel"
>> -
>> -# LPM support patch for Jacinto platforms (J7200, J742S2, J784S4)
>> -OPTEE_JACINTO_LPM_PATCHES = " \
>> -    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch \
> 
> The patch file was left behind unused...
> 

I need to add that check to PRC.

>> -"
>> -
>> -SRC_URI:append:j7200 = " ${OPTEE_JACINTO_LPM_PATCHES}"
>> -SRC_URI:append:j742s2 = " ${OPTEE_JACINTO_LPM_PATCHES}"
>> -SRC_URI:append:j784s4 = " ${OPTEE_JACINTO_LPM_PATCHES}"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> index 9b1db77b..8f75db04 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> @@ -1,9 +1,2 @@
>> -PV = "4.7.0+git"
>> -SRCREV = "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
>> -
>> -SRC_URI:remove = " \
>> -    file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
>> -    file://0001-compile.mk-use-CFLAGS-from-environment.patch \
>> -    file://0002-link.mk-use-CFLAGS-with-version.o.patch \
>> -    file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
>> -"
>> +PV = "4.9.0+git"
>> +SRCREV = "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> index 2d8fd8b2..15b43063 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> @@ -1,5 +1,4 @@
>>   FILESEXTRAPATHS:prepend := "${THISDIR}/optee-test:"
>>   
>> -PV = "4.7.0+git"
>> -SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
>> -
>> +PV = "4.9.0+git"
>> +SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

