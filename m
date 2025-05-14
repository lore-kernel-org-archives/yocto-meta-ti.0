Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50BDC3ABCB
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 04:35:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.132])
 by mx.groups.io with SMTP id smtpd.web11.95140.1747197327950572945
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 May 2025 21:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=PRQ4CC08;
 spf=pass (domain: phytec.de, ip: 40.107.22.132, mailfrom: d.schultz@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL9BIOdcmaLLGCq9fT+yFK7TqCegx4ZrTdSubJTFVtSoaXS6se/F9VsRrVvGDLDWtszGq3CaHJAMMmUMWVIKke4rEPSRhbpHvr/3bPinjPiugG+z7DRZtWQxrMH6ZTNvnm/vRCE2I681v1hx1JNWwOx/xlTO8pKZqCm4FRB24v5fFJh6SbVeMuF2HlNVGW341c+2QTkra7dsC+JxCIjjpeMLevYoLHawbDKQIoahyR5fUMXPbcnwIbGKFDIOuXeKPmX0AGo4S2/loBm13GMAOmHGn4KyTJg4uVFmKQjn7H51w9AHKlacqq7WVKMZkpjUDsGOkoGMkKlznpuDL2My3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JZJb8S/GmF8EA5ckWi6f6ZvXPsp80YFb96EcV4XEw4=;
 b=M7iQfmxD/jN4tnLUIF7ZLMe/H8ETsKjmQhK+ZtEOjHUHtpvs9U/UdKL9ChGUv6Yv7R/R1CWAk2kc8ePBmF37KsIA1/P29llFn2Jek3QTHQkn8/dobh7KO6liMoisLCHSmatRdCGdq0q1Ov+GjHCs2DK/UMPqhjAP7xb9bcGsJZRCMh4RXiSKA+J5NjkQWOAWt1sXTJXBodqv71rPoErnrtFDxkmpf0qc40o5z9/VOilUDv+w/e5+jF5Ui6HZHzTTd6ntt6wykw3+cEKvsDijFLUo9gv9OrnBCW/DJPFGb202o+CQ5ZtGpS9WLxGnkyU9OPH4YDtiiT8hMIhhL2HPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JZJb8S/GmF8EA5ckWi6f6ZvXPsp80YFb96EcV4XEw4=;
 b=PRQ4CC08SwjjSjZa9cNPCRzh9f1E87yfN4DLNp2qyM440tdbzEPWPoEpuvCUZ+iYxvRsdv6pJCxTX+UdQRysXXNWmc+fNgoWpnjJ7LqYjyKKODBxG0/EKzY11t9trA4W6x8F3y2+DrS4mhhfnsuU6YX/rXR1APp+150pHy1PcTLH+jOmXw+KHheaeix278v9ClQUA4t4WRfIUjNg5I8TenxrJaWnKwjhL9JHuaBmnj0dP7peNb6zJCP1zsCxXueAsYY4yhgdEgEWL22ztUag3lC5r06oglpNqHIHTqZ68fVSNF4JJhrxWv2lTSi7+UA1dGO09qU/E23emo9UF258oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by GV1P195MB2659.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 04:35:21 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%6]) with mapi id 15.20.8722.024; Wed, 14 May 2025
 04:35:21 +0000
Message-ID: <af87ab8f-4028-4704-9292-3725aef113f5@phytec.de>
Date: Wed, 14 May 2025 06:35:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH v3] meta-ti-bsp : Add build support
 for am62dxx-evm
To: p-bhagat@ti.com, meta-ti@lists.yoctoproject.org, denis@denix.org,
 praneeth@ti.com, reatmon@ti.com
Cc: v-singh1@ti.com, c-shilwant@ti.com, khasim@ti.com
References: <20250513145709.1181316-1-p-bhagat@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250513145709.1181316-1-p-bhagat@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::9) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|GV1P195MB2659:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abb8f75-f06b-4e48-a790-08dd92a0bc2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkU5a29ETTlMcDJSbTJkTXpmbTcyK1pYQllsRzJwTWZUV3hxVTV3YnBCdmdV?=
 =?utf-8?B?WHdXbTJrNzBQbVhsUEJMdERFRkxsZDhlY1JMMFFHRW0wMW9lSm1qUEpKWEFU?=
 =?utf-8?B?KzVOR3BpRWdUcnNOVTJKeTViSkQ3NC84YU4vS3czYzh3bmxRTUZhYW1odGFk?=
 =?utf-8?B?MmZCSUFQTllCeUNJN3hSNmJvYmJMVHU2b1lGbEdzSWJ3Q3JPSjVuMGU4S01G?=
 =?utf-8?B?Z3ExdHFNRUY1ekQwR3BwL1BYMVlZSWVhcDUzV0tkcklYRmNuSmFkaml3NWta?=
 =?utf-8?B?L3hSSms3S3d1ZWp0dzN2QnYxeDUvL1dWeHptMTROTUgyOW5NbEpjYS83cDd0?=
 =?utf-8?B?OHVGb1dtUXVLenpUeFFPK0hURXo1ajVVTWY5OFFlejlFVVM4SWMySFlQVTJz?=
 =?utf-8?B?aUFVbkpjUG0rcFlBNnV6VDd1N2Q2UlhPNFVwQjZHQk5lbC80dTltK2dVR25I?=
 =?utf-8?B?S0JYMDE5S09POU1zenZ1UTdXRTdJWFRJNENhN3Vwd0NWei9RRnlldjB5eFRj?=
 =?utf-8?B?VFJrNDdCbUx6aTNIWU9WNGJGdWdjVElUTW91RnV3RnhhaEdHSXREc2t0YkVp?=
 =?utf-8?B?dGx3MEJFY3g1eW02STFJYStYTmg4ZGdkUGwyRzM0SVM4cjRtRUxXNFpvcEFa?=
 =?utf-8?B?NnRHYXhhOGh6UWh1dEYxL2RsNDhHbmxxVEZybmxvQ0U2SWVLRk1kZmNmbXNF?=
 =?utf-8?B?TFp0a2FVZmhwMWJCQVBjRmtIRlZjbENISUg5RldqYm9kLytzYVRUTTdZMkFB?=
 =?utf-8?B?d3dYWjNEM2w1cTBIRkJrb2ZOdFF2TUJTYStXUTJDTTU2c3lZZEx5UUFOcExF?=
 =?utf-8?B?N1UwYm40OWxPTEVOVlRINisyZmJYTEFPWWxjbVRDSmc4SkNBL0Z5MFo4b0d3?=
 =?utf-8?B?ak8wMjByZ1FOampjM1FlRllOR2xOVU5uQmdVVlA4Y1hMYU1QZ1ZxTVdMY3k0?=
 =?utf-8?B?TG8zdytDZGZNTlBwanN6R1UzRlpzUDlqb0RhaGhsdEoraDNpYlpUNTllY2dR?=
 =?utf-8?B?OGk5NjIwNUc2MWc4eko3TTNvRUdoZnI5VlFjd0ZEWWJpaXJVNldWM1dGUVYw?=
 =?utf-8?B?bHgvbU9QRFN0Sm5aNWsxWmdnQmtqSDVFdjlaK2QwQUVQdzVoNmwwRzZIUWh2?=
 =?utf-8?B?ZEFxZmxPbkFiWUZRRVVKYnpjSFpRQjhOVmtDcFVTNy9MbEMzWkgzMDBaVXJE?=
 =?utf-8?B?YWtjZUNlVElCbnljTVZmanBqYTRNSE1GUklzT2tBbkplYy9SdHF6NTJlNytv?=
 =?utf-8?B?YWFoOE5kRU9OR3ZWa1pZZkFwc1lPRnovK1ljeXRJdEdXbVoyS2hVU08wckY1?=
 =?utf-8?B?MytuYzNOL2pvYnhyZC9RVXBXb0JNNjcvNlNVeWhUOTlCeUJZdlFyTkV1S0JE?=
 =?utf-8?B?VDVoeUZrek9sbkpJZ2VEbXlQYTh4d2JmUERlSlF5bXJGdTI0OTF6ZjJVU2Mx?=
 =?utf-8?B?UW0zejk1aURwM3BTWUNSRFd5NHIyRWVIamVUa0c3Zk1OY1pkY1dVYnZBSUho?=
 =?utf-8?B?YlFhMDNFS3d6L2VmbDkycU5PeG9sSm9mM0pUQmJqcm5tbVY2S1Jvc1oxc2p2?=
 =?utf-8?B?UTVOckdsYk51Smx2RTZSOEhEbWM0eUYzWkRnR0o3azJHd2sxYVJXMDdycDhz?=
 =?utf-8?B?R3BQaFBFLy9XOWZvaWVRZEZHMEwxcVllSkJaemZJTzdxalAwUXNKWVV0MG9Z?=
 =?utf-8?B?OHZIWGVjaXZIM0VFK2I5M0hQSktFdVJUejRoSzMvMHc5WU5Tc0t6Y3BvNVJx?=
 =?utf-8?B?TEdGdnpPblJVcW96YWY1RkxSUit2bGpxYUZsbHJyRSszZlV5UTVFUG1tUCtZ?=
 =?utf-8?Q?PekyIPgOQqkPzGpOOY7BZacV63UjQm4NYXFF4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnFoL0hvSjh2ck5ZWGs5aWdVd3pVTXlHTmJEQmNGUXBpdy9Ia1NlYmZCclRJ?=
 =?utf-8?B?RHlXY3ErWjNFYUwzbGNueDcrcVFJM3pHbzJUK2V4SngxOGFvNlpuNzNBZzN2?=
 =?utf-8?B?cEgyRlBOUW9sSWdudGhhZXpueHl3cEpFSTQ4eGZhYnp5ZE5nNVJDUHozcG13?=
 =?utf-8?B?UytZa1ZtZUxnLzNyZ1dScjBvL3lONVVOU0VXK2EreGcvcVE2NlJSZWpjSU01?=
 =?utf-8?B?bmcrRklkSXMwa3NBQWgweUtyeFgrN2h1cWJ1dm9ydU91a2Z2c0NOR1VGM2hy?=
 =?utf-8?B?K2NuT2JCcWJseFAxMWx4N2RUVjUrUXVITnpCV0lmVkFvTkIvdHR3ekxMNGhn?=
 =?utf-8?B?Q3Y2NjdpT0xuckNsTGYyWFVUblFQdmRLbE4yZGg2QkNJSEZTVDh6cDFKV3Jm?=
 =?utf-8?B?bWovN2JvUzJZYjRka0dGMmlEd3FuSnNNaEVIWnNXcERDbm91UnY3TFpEVThL?=
 =?utf-8?B?eHlUdG54UG81cVNoWUJyYU9rVmM0MHJjVzVudXhVenp5WFFsT2I4ekhZMkg0?=
 =?utf-8?B?YlNiSDJWakF2QmY2RitpVUJTaUZwbXZYS1ZLKy9vZ1hPemsvSlNCRGpjYWNG?=
 =?utf-8?B?bGYzM3Z4eUhRTGdwaG5KY3pjYnVWSlZQNjZlbXk3cVVmbXRIVG01RDQvaFZ1?=
 =?utf-8?B?RnBwTEFlREdRT1NTbzBVbTJnaDF3Q2h3ekN4TEFtcFhWKzRZc1d6a2FQU2Nl?=
 =?utf-8?B?WmRhblFKcFJPN1RObWJKdCtnZXBBQk5iQTVJK0NqVjROSW1QVU1FT0JqZFdQ?=
 =?utf-8?B?ZEtNRGdMRi83NE5yaDBYRDFuRHVvQmZ1MHRMYXlXUUhBdVVnOWZQZ3BUN3F2?=
 =?utf-8?B?YkZDUWlsSTNiclY5dFNpRHZESGM3K3dpRVpWdWQ0My9zYVRKdm43ZjBpa1ow?=
 =?utf-8?B?SWU1bW9EZ0dTT3FGV0lOcnFXelFvZzc0aTczNnZDZGJNL1A5YTcxYmkzdTFm?=
 =?utf-8?B?eG5SUkovZ1dEb2JUMWRkQVgwQzlhZXdlY3NQUS9CbERtVE5vWmg4WTl3RUxh?=
 =?utf-8?B?UCtXRjQ1cXo1aTNMZitiMCtJcjJwU2JxWHY1ZmgzUFI1RjAyM2hwVmhIYzlW?=
 =?utf-8?B?eHA0L3BrUW9ibTlIK0NlTmNYamZ4cWdKeGVjZ1ZJSk9aeTRZYzE1SWpaa2Fj?=
 =?utf-8?B?UkFGNHFoenZjQWpXUm16TkthTlo1SVhqcC91R0txNDBaY3dzVG1xT3RCY0FO?=
 =?utf-8?B?L1JsR0lDNmpZaGhOSXQzUWl1bHNLTEtCYW5TcWhnbmppcjNsWkNSakowMWIw?=
 =?utf-8?B?ZGcyZUtjWmNtMFRpQVNoRTBRenpiSnhHMzdBT29RSDBadlNyK0hiMG0zaGl2?=
 =?utf-8?B?cjJHdEFoL0VOLzFXM09mblhNNCt5WGJ0M0s1TWlabHRZVEdHTlhrRE9QR0dq?=
 =?utf-8?B?d1lhOXpPL0grV1RDdzlBcUg4bko1aW5qeUlxNWpKdDFVRUpvZTY4R2lzQlFU?=
 =?utf-8?B?akU0WXJLVnh2cEkxYmp6WW1PYnRLZEZKTU5GbEtKQ3VGaUFqZFVnYmFZTmJS?=
 =?utf-8?B?dHgwUDJaSjAwalc0OTlDV3gwVERHbnEvUTRSRmxKM280TnVoT1RMSDllY1Rj?=
 =?utf-8?B?aUtoczdOaGVDVnNnQXpVR3crSzJNYWtnMFg0Vm5hakxnclppWTJVWkY2RE1Z?=
 =?utf-8?B?U2xRT0k0NWtPTWRVVnZRVTV5Nm5IbXJUOXBTcFl5UFBYZlRxSWtZUGlBeEZ6?=
 =?utf-8?B?TTVacWs1QlpyZmNqK1JLdzVrVlVkT080NU9PNFExNUJqRU5uajVrbGhuS0pZ?=
 =?utf-8?B?RS9aVDBIQzZvZktOUDlwYXRuN0VIVzZGakpXdW9WNlJrTmVzbndHTGIxZTEw?=
 =?utf-8?B?UGhIZHZZM1VMcGV5eEFCOGJTUE5UbzlFWklOMHZUYlowRzV3OG8vYklzTDBw?=
 =?utf-8?B?ZXU1NG9iTkY5YjhzY2VpMGxDK29ROFhMRjUwd0VGbUxBc0Q0UitZK3prNVgr?=
 =?utf-8?B?N21CQmVGTTFzMkFMS1h6djBsVmEwcVFEU1pSWWpzSUEwVHJtaEw4Z1ZCK2RT?=
 =?utf-8?B?OVhsTm44NjBtZXJ3QUNpd2V2L0NDTGZtZGJKYlM3SUZ6ZjlRWW9rbldpQjhY?=
 =?utf-8?B?YTd1WFMrSkFJY2FxdXNpbTZGeDF1cFFQMUtRN3l6d0VsMVFkZWlSVXh0ZGh5?=
 =?utf-8?B?NW9UY0R0eFJ1c242OXlmQmpnSUlvbElNckhxeWhibjBxUndYT0FkNHpXWDFH?=
 =?utf-8?Q?H99EsXLshX5D4jvAFx+B8s/HItW0Zpm6nUAjqRaUUt6N?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abb8f75-f06b-4e48-a790-08dd92a0bc2c
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 04:35:20.9290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgOg/EN6WtQTlqvl5Nt45WdkkPoK2uBr32UA6yjNxwwHTlAqGeylD9nqqgz6TxAz6Ms9iYlhwSj7lpb/AafEOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2659
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 May 2025 04:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18557


On 5/13/25 16:57, Paresh Bhagat via lists.yoctoproject.org wrote:
> The AM62D SoC is a high-performance Digital Signal Processing (DSP)
> device with a quad-core Cortex-A53 cluster, dual Cortex-R5F cores, and
> a Cx7 DSP core with Matrix Multiplication Accelerator (MMA). It features
> a range of peripherals, including multichannel audio serial ports,
> Ethernet, UARTs, SPI, I2C, USB, and more.
>
> This SoC is part of K3-AM62x family, which includes the AM62A and AM62P
> variants. While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
> does not include multimedia components such as the video encoder/decoder,
> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
> processing, or the display subsystem. Additionally, the AM62D has a
> different pin configuration compared to the AM62A, which impacts embedded
> software development.
>
> The EVM board is a low-cost, expandable platform designed for the AM62D2
> SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
> jacks, USB ports, and more.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>
> Boot logs
> https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6
>
> Change log:
>      v2->v3:
>          - Drop cnm-wave-fw for am62d.
>          - Package correct c7 firmware for am62d.
>
>      v1->v2:
>          - Drop MACHINE_FEATURES for screen, touchsereen.
>          - Update ti-rtos-echo-test-fw to package firmware for am62d.
>
>   meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf    | 11 +++++++++++
>   meta-ti-bsp/conf/machine/am62dxx-evm.conf         | 15 +++++++++++++++
>   meta-ti-bsp/conf/machine/include/am62dxx.inc      | 15 +++++++++++++++
>   meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb      |  3 +++
>   meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb    |  2 ++
>   .../ti-rtos-fw/ti-rtos-echo-test-fw.bb            | 14 ++++++++++++++
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc      |  2 ++
>   .../optee/optee-os-ti-overrides.inc               |  1 +
>   8 files changed, 63 insertions(+)
>   create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm.conf
>   create mode 100644 meta-ti-bsp/conf/machine/include/am62dxx.inc
>
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
> new file mode 100644
> index 00000000..00906420
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM62D HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62D EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am62dx"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am62dx_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> new file mode 100644
> index 00000000..f2da559c
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -0,0 +1,15 @@
> +#@TYPE: Machine
> +#@NAME: AM62DXX EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62DXX EVM
> +
> +require conf/machine/include/am62dxx.inc
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am62d2 \
> +"
> +
> +KERNEL_DEVICETREE = ""
why not add the evm device-tree?
> +
> +FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
> +
> +UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> new file mode 100644
> index 00000000..ac4e8e17
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> @@ -0,0 +1,15 @@
> +require conf/machine/include/k3.inc
> +require conf/machine/include/mc_k3r5.inc
> +
> +SOC_FAMILY:append = ":am62dxx"
> +
> +TFA_K3_SYSTEM_SUSPEND = "1"
> +
> +# Default tiboot3.bin on AM62D is for HS-FS
> +IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-fs-evm.bin"
> +
> +# Since default tiboot3.bin on AM62D is for HS-FS, add a version for HS-SE
> +IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
> +
> +TFA_BOARD = "lite"
> +OPTEEMACHINE = "k3-am62x"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index a7d15e30..85cfc97e 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -33,6 +33,7 @@ PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
>   PLAT_SFX:am62lxx = "am62lxx"
>   PLAT_SFX:am62pxx = "am62pxx"
> +PLAT_SFX:am62dxx = "am62axx"

keep alphabetic order everywhere you add am62d.

- Daniel

>   
>   DM_FW_DIR = "ti-dm/${PLAT_SFX}"
>   
> @@ -52,6 +53,7 @@ DM_FW_LIST:am65xx =  ""
>   DM_FW_LIST:am64xx =  ""
>   DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
>   DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
> +DM_FW_LIST:am62dxx = "${DM_FIRMWARE}"
>   DM_FW_LIST:am62lxx = ""
>   DM_FW_LIST:am62pxx = "${DM_FIRMWARE}"
>   
> @@ -86,6 +88,7 @@ do_deploy() {
>   ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
> +ALTERNATIVE:${PN}:am62dxx = "am62a-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> index cf9566dc..654d456c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> @@ -31,6 +31,7 @@ PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   PLAT_SFX:am62axx = "am62axx"
> +PLAT_SFX:am62dxx = "am62axx"
>   
>   ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
>   
> @@ -50,6 +51,7 @@ ETH_FW_LIST:am64xx =  ""
>   ETH_FW_LIST:am62xx =  ""
>   ETH_FW_LIST:am62pxx = ""
>   ETH_FW_LIST:am62axx = ""
> +ETH_FW_LIST:am62dxx = ""
>   
>   do_install() {
>       # ETH firmware
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> index 86e319c7..54aa32bd 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> @@ -23,6 +23,7 @@ PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
>   PLAT_SFX:am62pxx = "am62pxx"
> +PLAT_SFX:am62dxx = "am62axx"
>   
>   FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -59,6 +60,7 @@ IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} $
>   IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
>   IPC_FW_LIST:am62pxx = "                            ${MCU_2_0_FW}"
>   IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
> +IPC_FW_LIST:am62dxx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
>   IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
>   IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
>   IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
> @@ -98,6 +100,13 @@ do_install:prepend:am62axx() {
>           )
>   }
>   
> +# Update the am62dxx ipc binaries to be consistent with other platforms
> +do_install:prepend:am62dxx() {
> +        ( cd ${S}/${IPC_FW_DIR}; \
> +                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
> +        )
> +}
> +
>   do_install() {
>       # IPC Firmware
>       for FW_NAME in ${IPC_FW_LIST}
> @@ -141,6 +150,11 @@ ALTERNATIVE:${PN}:am62axx = "\
>                       am62a-c71_0-fw        am62a-c71_0-fw-sec \
>                       "
>   
> +ALTERNATIVE:${PN}:am62dxx = "\
> +                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
> +                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
> +                    "
> +
>   ALTERNATIVE:${PN}:j721e = "\
>                       j7-mcu-r5f0_1-fw    j7-mcu-r5f0_1-fw-sec \
>                       j7-main-r5f0_0-fw   j7-main-r5f0_0-fw-sec \
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 57bf7a4e..f6cd3aa2 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -60,6 +60,7 @@ PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
>   PLAT_SFX:am62lxx = "am62lxx"
>   PLAT_SFX:am62pxx = "am62pxx"
> +PLAT_SFX:am62dxx = "am62axx"
>   
>   PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
>   PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
> @@ -77,6 +78,7 @@ PACKAGECONFIG:append:am62xx = " dm"
>   PACKAGECONFIG:append:am62axx = " dm"
>   PACKAGECONFIG:append:am62lxx = " ap-trusted-rom"
>   PACKAGECONFIG:append:am62pxx = " dm"
> +PACKAGECONFIG:append:am62dxx = " dm"
>   
>   COMPATIBLE_MACHINE = "(ti-soc)"
>   
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index ae6cca74..c37cf768 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -9,6 +9,7 @@ EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
>   do_compile:append:k3() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18556): https://lists.yoctoproject.org/g/meta-ti/message/18556
> Mute This Topic: https://lists.yoctoproject.org/mt/113091292/4454627
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [d.schultz@phytec.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

