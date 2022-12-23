Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57127C4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 14:42:29 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.59])
 by mx.groups.io with SMTP id smtpd.web10.73623.1671806548712533230
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Dec 2022 06:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: sancloud.com, ip: 40.107.117.59, mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7Hkb1C6g6qpsof2U3X9UYIUOsW8NQYn93UeMEYbmB3Th18wgxMMcL6WD3rWaGXX0J8pDzshQhE3suEeRI65dQ75jUmgahCoSzx4xUgVn9W+YQTQrcwlwuFeVNxBqE0Oao4WD867MQ5g5pV66flSBo3m1UUgVB14TN4UPHGS8GW3nLVBgj+WUnEdRcqw3VaDMKQCNLSWEwU7ji41m2MbayMmdSb0E7/ZhHZN/NEUWP462iG70QZWDz0Qoyp3BbScyWZ3HrXCwaBNZvfiAMl8Jr8SGe1xKY/S+5ZD+n1zXJXn3cK0uQBA2/dq+q7iLLMStyS8owh3oW8LnARfdgVjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFfZ4EJkYEazQuv54cUl3GVAIYQ4brRlS6wq27ZsJNc=;
 b=MaMFdN4THZ7FRTIk95l+O/T9d58+OheR1soZnpHR8s9e9y1NSGiM+8dwhizNEQFpay4sw3UoZj+0ueqb89Xlz+h1jYIz7Ujo3u8SUOxNZWVstEYXYvjcP4ICIfjZrw4VNs2xgAiue+y6H6Z9Et0iiL+RZ3lB3PIbZy4gtcBa4oxzGDA8iPGyyZzvXM8Tnrb0ex601jM0Q30Upg+fJXY2uJxr0wyXdFC4H06gj/17vFs9JMGMy8kbWrqHzEz6Bve83NKiC0WMaLeQzTdpBcLrqH2KmJlwVvUEKQB+j2J8LrmxMLo7xkWeqdo+/czzWNzM0eKSCdwl3PfOAGywvjInYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from SEYPR06MB5064.apcprd06.prod.outlook.com (2603:1096:101:55::13)
 by PUZPR06MB4602.apcprd06.prod.outlook.com (2603:1096:301:a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.13; Fri, 23 Dec
 2022 14:42:23 +0000
Received: from SEYPR06MB5064.apcprd06.prod.outlook.com
 ([fe80::195a:2d6f:8000:fe5a]) by SEYPR06MB5064.apcprd06.prod.outlook.com
 ([fe80::195a:2d6f:8000:fe5a%3]) with mapi id 15.20.5944.013; Fri, 23 Dec 2022
 14:42:23 +0000
Message-ID: <4b9d9f9f-3b1c-4584-0b57-1b3d04a2b10d@sancloud.com>
Date: Fri, 23 Dec 2022 14:42:12 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [EXTERNAL] Re: [master][PATCH v4] meta-ti-bsp: Graphics recipe
 overhaul
To: "Sapp, Randolph" <rs@ti.com>
Cc: reatmon@ti.com, denys@ti.com, detheridge@ti.com,
 meta-ti@lists.yoctoproject.org
References: <20221215040632.1404997-1-rs@ti.com>
 <91ceba60-0648-18ae-3890-50006ab84532@sancloud.com>
 <DD29NR.846A5X9VPNPO3@ti.com>
From: Paul Barker <paul.barker@sancloud.com>
In-Reply-To: <DD29NR.846A5X9VPNPO3@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To SEYPR06MB5064.apcprd06.prod.outlook.com
 (2603:1096:101:55::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5064:EE_|PUZPR06MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 7574740d-8e4b-4601-8a11-08dae4f3e704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+rI3h56RcJlyNbVzm8XTBRPG4iuAFAFsR1x+4+oImeGDaqCD+2dp3grlQE9W2Kv0xpNPyUCPPkqVLd/5mbCIQeSowNCbJRK7Z+kdjbos8usqubcHv8RGu+3+BFz9f1e7jTkyPbHrBNQHAbcvCPGci+pTx+7q6V1Th+reDZ9YVk5aqf3SU9Xrz8E8I99H6KEaeP2tDG01cVFwyvDqLkaO6xkc8YQvAikUP8EFjiehEYdVPDqJGwq3VcZQbLV2KkM3rJaMHYxackpOGJSUhzuAaKdFp07d7kf+Jj4nRZnfnTfAn3//R7TC9nk/ZeUvqi0BQnMLTx3NXmo0ySwvDXandF6/NbBxR7pYqRnDp/sisjCp1aEGN1q9a5VpyUpgFcx3+divww/W4KLrMsE3MK1B5sNgEhfZSZzhl+xLPIbO0aomLEHwx8Gg22kB5A7KeUeNvu8zNg5H+DGG2RVn/cPdak7zE7bJIP9LvxgGkr50wDG8rlAD8oCPE8n+54Fwi2JyzNeSyn74rPoFdOZAN8mxFncL4FYcOQd0e1trFT+oHL4h9SymIn6HojnqggHxbRTQjQKGkTOlVNFJzdqi9VXIOOoUxzQuEuQm2N4AZ3rrj/w6Tr1K79n4aHkNdGvdyNPdheUQQoEffOJP7+F48lV6AYlks+vS4B6MdKQZPNQpthtCwDCWIuRKzITH8K3YHsL80Xllavwu15y4ANrtmdb8cvwEC88Rd1ig+rKOCDHFJ4zkEdQ/Moq93CxcvwZqmekF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5064.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(366004)(346002)(39830400003)(451199015)(6666004)(31686004)(478600001)(6506007)(966005)(6486002)(53546011)(31696002)(6512007)(2906002)(186003)(26005)(86362001)(6916009)(4326008)(2616005)(5660300002)(4744005)(66946007)(8676002)(66476007)(66556008)(8936002)(36756003)(44832011)(41300700001)(316002)(41320700001)(38100700002)(786003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGhNVVZhcU5uUFJUZ05DTlhzRHRzT0hqNDlOVTEyVGhTS2IrU3QvdDZIQ0Vv?=
 =?utf-8?B?aWRUWnBqWUlxS2hEOHViSmlyUHY4KzB2YWNqRWw4M1Awd016bUN6M3ZmYStW?=
 =?utf-8?B?YS9ZZS9GSUNwRG1JY2lxRDZkSDd5S1N6U2VrczJROW1ZZit6dDB5N0xFS2lU?=
 =?utf-8?B?SlIrZDh2c2pwTVJRbkZ1aXNXTGxieXIwYlZtcjNJemFXUWhYUFZxQ1dxWkNu?=
 =?utf-8?B?Y0dWRStMdG5VMElmTmt1Q2djb2x6VUZCallsbkx3enp4cnFBZVdoWWNKbFBZ?=
 =?utf-8?B?VnJ4bEh0K0tQZWIzUGkyU2MxMXlvSlZRZkJRWnRxN2RxMVBSTXJLczRvWkxM?=
 =?utf-8?B?SlprSjh5MmRuUW1IZGFQU2tQbHBtQzFmRHdnUjhKSHZCMExZMlMvZnVxeGsx?=
 =?utf-8?B?bWRmenl3T09YalhHRldoaEdlbzQrUjdlWmlpTld2QzV4aDNQem9jdlRDUWhr?=
 =?utf-8?B?ZjQvQWdpUmlJMXdTZVVuRjdmUVdhdjExZzdkVitURmorZXVxc0lJcHRIMVNa?=
 =?utf-8?B?UmxTL0dCbmJhZTA1ZURWbDhrNkVaSDlsWGI3NkR4Wm1YSEloc1Bha3JWV2g2?=
 =?utf-8?B?V2s1a3ltU1VCekJ1Q3NSdllEK3IxVyttalQ1cXE4MHZ0MmMwLzFpdHBROGVm?=
 =?utf-8?B?Sm12UjJ0cml2Q2dJSXBheDVvQkpFNmNCNVBBVXNnWGF5c2JmZk95bXpFQUw2?=
 =?utf-8?B?QTNPOWtFQXJqaFltTE5qNzN5cmt3RU92bE55ekdYMWZFd0xkMUpzdHpRZTlZ?=
 =?utf-8?B?NFluNG1Od0JIWnZXQ2h0TUtEYlBkQmNCLzdPUFMzcWdPWXRyRTVvZFJEbUQ1?=
 =?utf-8?B?dmhPQmlHVll2Y1dmZFZmUGI5ME4xYkxtSU5Rb2hsWXBUK3J4OHd4U1NBT29C?=
 =?utf-8?B?WjFkUTFVd0RtNDFyelN5c0c3RGxib3J2THJjQTNpc095NzFwOWsxbkQzVWxN?=
 =?utf-8?B?OGZ0bWxaZ2lrR29sSGxpVnloQ0hxRDVIQWVWNEZqVjlDak54bE9TK1djTVMr?=
 =?utf-8?B?S2VXejBCT2xQSEtFUU4xZHFIOXpDS25nV0Q2YjV0eWhRZjVabEh5aHM0bGNI?=
 =?utf-8?B?SENDcng3a2xqMm44LzZiVytQTThZVHF5T3JHeUJsaXFuR0QvZHRRV1JPTU1s?=
 =?utf-8?B?dXhiVXZGbjRMd1IvU0FNVjF1ZlNGT2Q0aHdTNUhKTXJqTC9BeEZuSjNYK2R2?=
 =?utf-8?B?WlJneXozQlNySnM3ai9Wc1djQ3g2UU1jbjExKzFZdDRJWXp1Z1BjeHpGaWxN?=
 =?utf-8?B?V25NQWFaR2dsQ3cvUnlGWGpWNSswT0VyTm8zcVk1U0tmRUNpVHJRSlBrNDVB?=
 =?utf-8?B?a25rMTdXNENHYzNQQWlPbjdxUmwzaTNlUUpsdUxJUTl2VUU1SjkyNlRCbFQw?=
 =?utf-8?B?eUdwUkl6ZjlxbG1nMFh0NU5TM2JWY1A3Ym16OFpsNmFVQmNNR2FPKzk1ZFM0?=
 =?utf-8?B?TTMwYVdzdmQ4aGxVWmFaeFhyNW0wNTFNOVR3aVR0emE1QTNiZktiWTZLeHh2?=
 =?utf-8?B?Z3R0YWxZckMwOGp5UjltTWxreHU2QUorS01URERDQzliUy90N3phSXFWYjE2?=
 =?utf-8?B?MlVudEh4aTF6d1FEbHZnTDZwSmdOSE5VQWs0aXFRZTRKR3hNeDBZTVR1K3JR?=
 =?utf-8?B?b3BuWTd6K1huejFETU9nL3BiWFNFU2pYWi9GcnI0STdpVjViUlBLbC8xVzQ2?=
 =?utf-8?B?blVBU0Q5NmpPNzcxWEpIRFZFeWUrZUx6V2lPcGw3N3EwS3RQRWtSZ3lkMkpZ?=
 =?utf-8?B?dTU3aDRWUTBYNFFYU0xiTzZITGlJMWxmZzZDRmtVbXdQd1BhTE9mSXQ1Ukwv?=
 =?utf-8?B?SFdmbjlNcksrdVFKaW50ZkJiY250d0dSNXVsTGJ2MlA2ZjRTb0lwTXVtV1p2?=
 =?utf-8?B?Yk02eEV1Tm5rdDQ4d0VkQmlJYUJ1K2xTSWhia2UxQXJnK0c0bVlkNHcxd1Qx?=
 =?utf-8?B?VmxxNXl2MVhIVVZhNEVpN2lka0h1dUNWN25jVnl0UnFCdjVFcGtzOWFqSmRs?=
 =?utf-8?B?SU56NWZrVzN3VjREL2oyZUc0Um9XbFlURHZnemxPcENreTVEZjh1V214M0pa?=
 =?utf-8?B?d1dmdEwzS0hGSmlONkJQZE9Pa05QUWU1ODBiTFlRUmlIdFVVcC9OVWVNMGk0?=
 =?utf-8?B?dDE5aXloMHFqTzBwUzIxQkw5V3VPbzVWSExIZzYvWnRCUWdoOE1ZQ2dYVGFV?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7574740d-8e4b-4601-8a11-08dae4f3e704
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5064.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 14:42:23.3334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e0f949f-6a74-4378-baf2-0abfca8d5e06
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tgg+wSDc8vvW1mGABMoTPzb3/7XHtXYW+6phIlEy8T/B8PkmWkxDGEkelbDIZoue4VhdOLtKrS/DYzB1UUGUaDgyDTByBuUVBOaZQUldOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4602
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 Dec 2022 14:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15503

On 21/12/2022 16:41, Sapp, Randolph wrote:
> On Tue, Dec 20 2022 at 15:02:51 +00:00:00, Paul Barker <paul.barker@sancloud.com> wrote:
>> Are further fixes required for the am335x or am65xx families? I'm happy to test any further patches targetting these SoC families.
> 
> Yes, futher fixes are required for SGX devices. I'm not sure when to expect those patches at the moment, but I'll keep you posted.

Understood. In the next version of this patch, please include the list
of MACHINEs or SoC families which are addressed by these changes. I'd
also recommend splitting this up into multiple commits if possible so
it's easier for external subscribers to this list to understand the
changes.

I'm happy to review & test graphics fixes for am335x/am65xx/am62xx when
they arrive as we're using those SoCs. Please feel free to Cc me on
those patches once they're ready.

Thanks,

-- 
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/

