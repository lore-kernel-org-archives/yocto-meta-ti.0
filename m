Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9A8E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 19:49:51 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30.1771444188541812532
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 11:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Hp3eOJ+J;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.34, mailfrom: hnagalla@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksnvOuIY0SYdpp6EBAgM+Rfdvs3t4jEjLLVrFR2Vdb51mcHUx66ZqT49AjcYyHJlY4XRsHZGdRJjBYGyG+H61t6PONIkHM+gqy3HXxnpWPaCH3wwVRfF1KzU2cMFf1TgzUIFVpKQBTUQ9zqkPc9azzNq02ej+ZWyWXUiIucHFMbMusg6A9zJ6mvH4NgepN0our1/2RqVp4vJT83gBAKeHdWDtjywielZyocvnGSJ8YJzYj7iBiQWLAgV1MJqBxs+uEFz69tt4Tog0X/slmQ2bG6YlRgUnquydCXnrL+bGLDScQnXKTNClCXygboua/2adt5lcvynsTn+10G+zz60oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lR1rCuX9Z9TctOJBrv42zTYaJ1g7A0iWDQnnN14aCI=;
 b=rhVmAvLnHMBeTG6ldYER5VIpFM+IoOSGJcOgCgIos4/y4PlcuSu9ncv7OjQCRSa4bvz7+mXsIjYWs8MzFMPGVnJ2lt2KdbdkTXEE9C0fSYcZ+pjnMHHaYTQsWZ0N5/ZQm5qy7XS/1gRxGrqSwaSWrd8ZqFNWAG70tMzJATyZd1t3PbagQ82P8AuxzxYmwHV3rI3TV7auyrg24L6qgNyv5WRU8ULqu1nfcJYo9dmY6WNObva2DgbN0Mkfd4K+k/ErNB6mnHq2s+VBjPRjjdRzZ2aDttpWDyJ1w+Svu96WbY8mwTSREK6gdVA+QYW7tSQmqDrU7r9dxa8iJ3Rcf+/0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lR1rCuX9Z9TctOJBrv42zTYaJ1g7A0iWDQnnN14aCI=;
 b=Hp3eOJ+J2792hGlZ06EVqD1YQjPGT+Ieb3acTKl0NTMvr+zyW42SYYYxbEqON7S/D1jGZGAv/3ZYDGs7gf4XupFMHQNNI0XW5AzpK1O0qSDIQ8AM+d8XfzbFUZ1wqGk6xxzE3TR+5G3gDvhXIx1stT7twnv293UiM+jp9VccAq0=
Received: from PH8PR07CA0025.namprd07.prod.outlook.com (2603:10b6:510:2cf::13)
 by DM3PPFEC98198CD.namprd10.prod.outlook.com (2603:10b6:f:fc00::c55) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Wed, 18 Feb
 2026 19:49:44 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::9d) by PH8PR07CA0025.outlook.office365.com
 (2603:10b6:510:2cf::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 19:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 19:49:43 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:49:43 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:49:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 13:49:42 -0600
Received: from [10.249.66.119] ([10.249.66.119])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IJngpv1384070;
	Wed, 18 Feb 2026 13:49:42 -0600
Message-ID: <1b3d8c26-49fd-74c1-6ab0-9c474a7d9200@ti.com>
Date: Wed, 18 Feb 2026 13:49:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.11
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <nsaulnier@ti.com>, <b-padhi@ti.com>
References: <20260218192325.12701-1-hnagalla@ti.com>
 <c14925c4-93a7-4313-b0b8-218be2915faf@ti.com>
Content-Language: en-US
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <c14925c4-93a7-4313-b0b8-218be2915faf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DM3PPFEC98198CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef7c3d9-0d67-49d3-56eb-08de6f26dc94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2ZOUzFRSzFVS1RxVEJDTWkzRGhaNy9nWVF6WnlxdGZwWHE3dDRBK3JlWWN4?=
 =?utf-8?B?RUNWcERlc3JYY2dDRkpNdGs2M0ptQThMOEdhUkp0Mzk1S3NtQ05zVDFKSXZV?=
 =?utf-8?B?TTdWZklSbklzSFlPZGhnUUsrakhXQlFDb0pVN1dDNXNaa200S0dQWU9vZUVn?=
 =?utf-8?B?R3plcjFPd1FRdlpIRDNPYk9FSnRoZExwMEFiTEpEcUYxNGRSa2VWQ09iay9z?=
 =?utf-8?B?TGhtSDdqZCtkRU9XVDFDUlJsaHpwNHJjZDVQNW5KQU44VnpqM1o0ZVJ1emcr?=
 =?utf-8?B?RGhaQXoxdUFRVi84QzZnN3JTV2pHM3FZMFQ0cnFGV1ZkSmlpYzZtRFdNdFpT?=
 =?utf-8?B?L05mZlJLWE9xM0FGT2lMaEFmckRqZWp2OUFtMUdRZ3RxamxhRGttZEFKUkVw?=
 =?utf-8?B?WGFSd0tNcUJuUVpEblBkWURvLzVhMFA0SjBOS1ZIMitiZkFOOWFWQ0FqdURw?=
 =?utf-8?B?OHRoWkNzSlJpK21tV3NQdGxNTExPUmtWMzRIcnRtTGUrQmdVa01TV2xYczIx?=
 =?utf-8?B?TWJlVElPek1XNTMvZ2JKQTc5YWEyRHp1YlljdGxjaEJTd0J2MmR4ZHkyZVBm?=
 =?utf-8?B?SzY1aEM3YndFSXBPWlBqbGJGeU5KeURUc2ZtQjdtT205Mzl4T2picG93eU9a?=
 =?utf-8?B?TzJXV1JkMEIrMHc4emdLaURWMmxkcUFnVElVWG85NzN5bGdVM0hGSzc4a3Mr?=
 =?utf-8?B?QnA4STQzZlFNVzVSZk4vVnVnUWdOUjhodXZtazNLK2o1ZzJjaEZXZDhPM0w0?=
 =?utf-8?B?MmlLVzc2cFl2Rnk3YVZJRjdpcS91djd5cjR3ZWExYnBUUCtQUDJ2VWxUZGky?=
 =?utf-8?B?am1NRmNNREtGTGt3alJvMlhxNGt4ZlV4QkpZUU1hZEhVa1JFSUp5N3Y0UnB3?=
 =?utf-8?B?dEJXTjRSV3lmMTFVYjJDeEt6WERDOElTVFR3K29GazVkMXFtWUNHNFExMmdH?=
 =?utf-8?B?N3VNUUszNFh1YWVYb3E4b0ROK1JzM2E4clRPYytoYU1kK1ZnMmxtVDY4ck8r?=
 =?utf-8?B?Y3Q5VW9GKzRJa3k3bEtHNXAzRDlCVlhTaUgxRklLY1hzWDZDY3VrYmxNcFM4?=
 =?utf-8?B?aHp5MEEweXQvNEtCcEc1VGdCeGhlS2I2MnJlOEVwcWprRzZkTWFXejlOaWdj?=
 =?utf-8?B?djIycERPVU1Zd0pRcWg1RUs3aUlxVFBZTXlYc1RLNnIycnQ3Zk5IQmRSVlFX?=
 =?utf-8?B?dzlFNGk5ZmprV09LMEV6b3pUTHAxaGVNWURqZUVQRzdLNUlUVHdhZVdRK3cz?=
 =?utf-8?B?TVNubDJrTjE4eFcwckUrUytnS2l1VktWcEZuL1Jkd3cvb3M1MlNwdWJ2K2Vp?=
 =?utf-8?B?MzBJS0ZMOUgyaDk3VFRaTFZBQXFnRHlMNjFBUjZPNXZvZENMdEg3RHlpS2ti?=
 =?utf-8?B?UWZod1RQRm9pY1BuVnBodWJFcDBvaTBpODVMdmt2elFVcDFMSTdzTjRuT1VO?=
 =?utf-8?B?UWg5VndMcmpiMEFScytTdUR1OVJaV1JvNVlLbnUvRVRCeHk3VEw2RmNic3ds?=
 =?utf-8?B?ZDl6WExYRk5tRk52bzZmU2E2SUxBbG9yVzB2OWZ2bnZOVWNZS0dWS0RnRHhC?=
 =?utf-8?B?Vy9PMXY2NXU1R2c2SkN3NThJMUl6Z3lVU1pxRkhnVEd0ZzFiczRKY3E3cmlB?=
 =?utf-8?B?SVZLY0dpM25SakZGNTZwQkd3YWhSb2JKNXdta3R2K1pJUTB4QTJPbk9UOUJK?=
 =?utf-8?B?emRkSW56eTBnZGFMV1RLK0FaSGM5V1NqOG9QQWJ2djhPNllxL3ZVcjlrVmht?=
 =?utf-8?B?WEFiTU5wL1BEK2N3RE5HK3RCRjJsQ2tiUXVPRVcyTHI4K3AvN0lvV25tNXlv?=
 =?utf-8?B?VENWVFpJZm9nQWRFTmFxU2IxSXhrWXNDbml2N3BnMnlvNjRGVUtKaXprQ1BL?=
 =?utf-8?B?UERUMURpeHJxZDlaMTNtelpyNWhRWXVZZ2N6c3NEUktzWG1XcjV5L2hyK0R4?=
 =?utf-8?B?VE5URTdnZkhVM1NzTWN5cXdvNE0vc3JaUzYzSUpnb0F0WXlKYjY4QVJRTzlm?=
 =?utf-8?B?VDZlbXE1MXF5SEIvVk0xM1VrbVVsTTd4NlRncW9YVmhsOWt5OUR0Q0ZoWE93?=
 =?utf-8?B?QklrTituOG9GWXh3enRxZitqRVVaQnpxTmR6QTkrUUJYd0V1TCtWY2JncEsv?=
 =?utf-8?B?S1Z6NWcwLytpbVRjMWNDM0dVeE9CNDB1Z1RYTXNOM0lxMGNmU2tZVEpVMTli?=
 =?utf-8?B?bUZvU2RpUmxBUW9VQTlScDY1VncrYy9iSVlVcHYwN0hWR2dINFpSNDJPNjZ2?=
 =?utf-8?B?Z1J1cEJhU0dnTVkzWVdyNUc4YU1nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9Y/gMzgGZvj0p7xWyAyCkLGdOKzIkHMlclBWpl0mg3DNNkcBhFDG/FV4OB48O7W/u+wN2ZjURLDTa5Q0pQi9MFqtiaKbtoAuP7ba7s7sH/99SpUCBcrvKPD4XDD4JGjFAdNYVirC7xZZkFIJZmybu6IskTaIO/p/PYBuq702hdtThpPkL7ZXeTPSJ2ue4qfC7nOHKzZPWAMSbKRdxhdxQxCSdAB1QbMjoAQcs6yVqbGq1DPt5idWn9yzRWIyMR6pTSL6r/nHpkRpFfFcUxs3XMsR4TIWxQfwgQpg+ih8m1czDHC0h7aRpzpAFEueBChqiBNWCwsR/yoZPUSrPbKRW0aGz0BIOGA4jwU9GMzO1NT44WHYIOI2cE3CHAypCVTK1GWFYApFc3kqh/BzzeQeeNjc0pG3UwQlMs4tvk8O6AWlAsB8dfVqY8ng3Yf4jUsc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:49:43.2727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef7c3d9-0d67-49d3-56eb-08de6f26dc94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEC98198CD
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 19:49:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19542

On 2/18/26 13:31, Bajjuri, Praneeth wrote:
> On 2/18/2026 1:23 PM, Hari Nagalla wrote:
>> update ti-rpmsg-char library to 0.6.11
>>
> 
> Isnt this intended only for master?
> 
> Why needed for scarthgap as well?
> 
Yes, it is intended for master. Will work on scarthgap branch as well.

