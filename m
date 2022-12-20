Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2913C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:03:13 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.67])
 by mx.groups.io with SMTP id smtpd.web11.52293.1671548585192231003
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Dec 2022 07:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: sancloud.com, ip: 40.107.117.67, mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUQuBQ+V72lE5csEaSzWOtV6E+QL91/uZRd5QLYkTAWUImAbAmEWk1/L0uKvkgZhwEInJtLtObRUifggVORcOkeVdJ5vLipi/SZKiKCQnUWRgY7hkOg+QkvZ890uWgS3X25jIwmJ3LUps73cpBRKjrphTgaKApC3WtENfUggmEs9Ov69A53acF8A2shdKFy0+yeQ8CRDZNlnEubddnIStlqLOQzsNq0BWkxnjTte6SAVyNbKiEZGXqaYllffCVS4F4ryDQhPf5zx7ehDDI6tFthRVuvmklTLGzzgJkPmGaBMBTLfmpX/kyAzrERBHHdmi47tZBawt3587NIiTkvKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMyWrk6hZuu/09/Lc87INjpeth/WvaS+1VZAcjbTTmw=;
 b=cnAaOzot9xotJcYPn/M7Bk03fVA8KvsGDm0r8ax9byebbOgsXfqUtWVV/JwK8tXE3/VN54JtNcu1Cy8z6+Z/rKYTprCkwvHujcFZGo/OdA/kPS1kMWFra70pbR104CbHi/qgNLVKUM4gm1eI5iRea+kdNjNdVVTlAuTjFfGlQRl4qR6IMdb9MWx1lmrfsow0SeQ7QTl5sYiYi/SX8sKzK1fn2HUBA1P/n84FN7O+hLEp2yFm/pdkXB1Qu4SdCBm/HyQb97tSaapbaWypzPHRdTWdEQp33O+xkERewkWKYZJqsn98c47Thcp6VyWoWffr7e8g7FTNPozzPrCYCjsQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from SEYPR06MB5064.apcprd06.prod.outlook.com (2603:1096:101:55::13)
 by SEZPR06MB6231.apcprd06.prod.outlook.com (2603:1096:101:e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 15:03:01 +0000
Received: from SEYPR06MB5064.apcprd06.prod.outlook.com
 ([fe80::3343:e4e0:2fbb:3c9c]) by SEYPR06MB5064.apcprd06.prod.outlook.com
 ([fe80::3343:e4e0:2fbb:3c9c%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 15:03:01 +0000
Message-ID: <91ceba60-0648-18ae-3890-50006ab84532@sancloud.com>
Date: Tue, 20 Dec 2022 15:02:51 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [master][PATCH v4] meta-ti-bsp: Graphics recipe overhaul
To: Randolph Sapp <rs@ti.com>, reatmon@ti.com, denys@ti.com, detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org
References: <20221215040632.1404997-1-rs@ti.com>
From: Paul Barker <paul.barker@sancloud.com>
In-Reply-To: <20221215040632.1404997-1-rs@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To SEYPR06MB5064.apcprd06.prod.outlook.com
 (2603:1096:101:55::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5064:EE_|SEZPR06MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 4619e9b5-e425-42fa-6044-08dae29b4999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uKfJ7AnXndpJWCwi7thHrKV2rc3kgtl5c2br/5v7usn5/L+kj7ODnXKuzbkVY1Igpd80TUW8+uQWaevW4IlRsOpxm3P3L/9ySE3VEy134WS5JcgBFi9YTfnIqCzfh7HaDc8Fl8I0lA0X0vxJFwH6wec+cKWTC27N8byBgXhLSnch7h2VxJ0fV3y8stW+dP4zkl4l5X/KTjSfAYZArd/t56HcsIjdl9nucBnKAQwa7+k4AJasBhMxUBLbSptB+RBpWCMzUNUUYSeKy4KsgFv43rd49F25RB9nDcB6H3D0pPvRUz6Xv2KhzBS6YVv/m7IyYOTcLeFc/KDpr4b1s0sYz6TxJfOKzFc4T7+GYFh25I5fqZqonE/r/k7b/wFn5eYwfamrdm55kdJSwcHR19WHIDPiFvfgUcp7+fWYkObaqIR5v3eYZl+KUJopkoY32KBDeM0zYONSW3ObrVGDmzs+g10tRypmUHAG+KcA/4avdPZFZcCQp3yW0pGMq6AGVu+X3QIqaFcmIBOzzOXo8MuYKQwvNzEGExv0nc+RFeI33pcfQbyophw1OwflkJicmsJPwwTdjekdMMeuMrgdUoI9QqvoP9NshNO75YKCgx47H8KZJn47DJ2pj0Vh0BBh8ET3Q8g7MTxGBLFZrmUB+AA+/FrMDZ7d76OtRNIXY3oIh6M+5GVSRhPmnhO/HDcdZPsi8qxFTYW0y4Klz5sRdEa0/6d6BKUiFvZuknj2vATKT4aaU3dgNVzWnGGFHaUlSxVo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5064.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39830400003)(346002)(376002)(136003)(366004)(451199015)(41300700001)(4326008)(5660300002)(31686004)(8936002)(31696002)(44832011)(2906002)(8676002)(41320700001)(66476007)(86362001)(66946007)(66556008)(316002)(786003)(2616005)(53546011)(6506007)(38100700002)(6486002)(26005)(966005)(36756003)(478600001)(186003)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXE4UURNdzcrN0Q4OVZwQW11b28zd2hUVkNBN1J1UUFrcXJjbFk5NGFwTUl4?=
 =?utf-8?B?MlpQeVlCZHBHZjk4YWtwU1ZFQllCWFVzcXV6QWhxcHNnbE0waW4yR2ZGM01k?=
 =?utf-8?B?RHRxL2k3cGdYRWJ2Q1MxbkVrOWxSVFVyUXZwMlBvSkFIZTREZ2xtSjlYMVNw?=
 =?utf-8?B?Mjl3TU4yTU5zcjFGOG5ub2Fxc1NkN2NGT1Q5MjhYeXdrY0drcjUxd0szUnVD?=
 =?utf-8?B?Tjk1N1NiYUFCYzVuakQ0MURzT1NlZ3h1MGVSRjBoR29obHZIeUlxVXA0RUFy?=
 =?utf-8?B?L29GNkh4V1cyWHdvd1RidDJuU25Zd3M1VERCV2c3OEhZWnFodjBGeld0THNK?=
 =?utf-8?B?WTVna0grSG5HTmI2amxWQjAxeWJKRTBMNEliUkdaZDlHZmM2Ulk2ZHo1Q3Aw?=
 =?utf-8?B?RitNeUR4Qk9KTk9JL0pxdm5rMW1XbHd1ZHdQaEhxMDBKOUpqVW5FOFlocjJz?=
 =?utf-8?B?ajE0cWZqTVM2TEdSNW9lcmorRDBocHZzWlo5QW5WS1dwS3pMdmFwYk42clhK?=
 =?utf-8?B?cmgyUUpGNkx5UmZIK083REFPdnJUWk9XSUZ2RE1ZY0oyVWxvWWFlK2Fvc0dG?=
 =?utf-8?B?ODJwaWtjT3lxWHV4L2xSalVoRGFoMEVrWXUwQlN6S0N1M1JYcGppZEtEU2ZV?=
 =?utf-8?B?SHpTaTMxVUJDMjQ4cjFGK2lDRUZjUW9kMU1FY1RSMFprSkVnR0RudHdDbFhI?=
 =?utf-8?B?b3lRZE1rcW4vZ1g1Zks5SllpTTdmcVl4NlVsaUtMR1FWSVFqTVM1ZE4xMkhK?=
 =?utf-8?B?bEJrSTJhblkrdWpBNjlqSnRRZ09LRzBxVnRqV2VoRkFCS21wNTQzYzFMNC9N?=
 =?utf-8?B?cnZ6WUZEcXg5anlUekVBVUxsbmRJTk04dDZQTmc1eXNpQmw2S2lVZS90SU5D?=
 =?utf-8?B?d2g2Qk9GeXJVcjBoNFB6MXNYTHozdjFqRVBpbkhKL3VHTVljWEE5cWxEWWJo?=
 =?utf-8?B?TXhraSs5aHVxM3FRQnk3TFFQckQ5S3ZMSVlKRlRFTUJsNVJ3aTNCcWtVaW5R?=
 =?utf-8?B?eFNoMWRSbnN1QjhmWC9vZkdiZlFTM3J4a3VXVGdXcFhCWlFGUkMvTzl4cjl0?=
 =?utf-8?B?Vy9maHZqUFQyZStlam5vd05oU055VkdtdmFpUzQ1NDlEVDZqVDJuV3Q4d1Vp?=
 =?utf-8?B?Mk1uaTRNbDdSQkF4SXFZMEZPellTNnpFTUY4K1JJV1hvWmd4c0QyaXpzaXFp?=
 =?utf-8?B?Yk5NS1Y5bFIyTGxCdXd1dUlMa3JUdUVMUEFvNmQ2ejhlNUE0MXUrT3R5RHg5?=
 =?utf-8?B?azZrVkxpbjQzb2M4cWd3UFh2YWlYM21LcXEvNlNpZ2w4aE04UW1KQ290Y0do?=
 =?utf-8?B?Y0Z0K3lRc2wzTEUzU0xGZXcrUFJUYnpSbVB5TUdNdjVKL2c2dk1QYkFWd0ht?=
 =?utf-8?B?Z2dTOFNXRE81OEtjbFIrZ3h5aFByQ2t4VDJka1VpNlJ6U0QyU21ueU1GQXBt?=
 =?utf-8?B?dnpCUzlhRlNuTjVvM2ttbkJrVUt3ZUhsZjhvZVVmYlpwY3ZGWXhSZlpHUlN1?=
 =?utf-8?B?OXd0bUFRaFdSZ0JOMCtIZ0hwMHI5T2tWa2lYYjdhbGRxQ1pJOUVHNmowOEV3?=
 =?utf-8?B?clZaUDlWUG02UFJvT0NlcDFHNUc0SlBUT3cwUmZNY1k1M1gvN3BBeTZyalBY?=
 =?utf-8?B?aG52UEU3L2MrVTBESXNFMmhZTkRxVEMzdTF6bEt4RE5lMm9ncW1lSE9rNURM?=
 =?utf-8?B?SU55OU5WdlJ0UE9wdUY2ckdMdk01QVhmVi9sNHpuaitRTnF4MXUwbXZ4VlhJ?=
 =?utf-8?B?M3Y5bzJUSitFamZLaWpCNkNhdkI3ZUhESFQyQ2ZxbjhEUUVGMG9rUngySklJ?=
 =?utf-8?B?WVB6S2ZaWVNIU0k1dHBMWi9iQTU0VHhBR2VVc0pPVUJFTlpGOHlVb3lZeWx0?=
 =?utf-8?B?bURvdG5JdkNSbTh6TkJXZ00wcmgrbHY2d1gzSDZpSks5Ri9zOUpRQTN6Ulox?=
 =?utf-8?B?RGxMaTQ5ZEtWT3FPYWNBK05pUVFYU3NCandiZFFnNkY0Zk10b29VZmNuOU9X?=
 =?utf-8?B?c25qMHJpUS9kWjFIcVU1ejJoZkk5WXppTzc1YnhBOElVTU9sNGZYOW1xazBV?=
 =?utf-8?B?QzZDM1lvdmpkY2VjbExPaXVldEV0R2pIMzJRRkNOZHFqWkl6bDZkemVYTnIr?=
 =?utf-8?B?NktYa3ZVcjh5MjhySzRvOThtWUEvYkhsdExSNElRQzZKWStzTG5iU1pNbVBS?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4619e9b5-e425-42fa-6044-08dae29b4999
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5064.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 15:03:01.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e0f949f-6a74-4378-baf2-0abfca8d5e06
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf6HT616dxI37NYTRVawi2rlaoL0GM2LlUZPV47pFDOVhHorXjDmC7LGV98+Qmp30H4Dm/S14WoA+err82dxyKfdlZbYtPBE3SAQKebYRhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6231
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Dec 2022 15:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15495

On 15/12/2022 04:06, Randolph Sapp wrote:
> Individually package rogue graphics components to prevent conflicts with
> other recipes.
> 
> The package ti-img-rogue-umlibs will now distribute the window system
> agnostic components of the DDK. This being the IMG's implementations of
> OpenGLES, OpenCL, and Vulkan in binary format and the device firmware.
> These are the only components that cannot be open source currently.
> 
> The mesa component is currently piggybacking off the default mesa
> package. It's not elegant, but it reflects the implementation well and
> allows users to config mesa as needed.
> 
> This all hinges off of the new rogue-gpu machine feature.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/am62xx.inc   |   8 +-
>  meta-ti-bsp/conf/machine/include/j721e.inc    |   8 +-
>  meta-ti-bsp/conf/machine/include/j721s2.inc   |   8 +-
 
I've applied this patch locally and tried to build for the SanCloud BBE
(with am335x SoC) so I can test things out.

The layer tags/commits and configs I used are as follows:

    poky:               yocto-4.0.5
    meta-openembedded:  50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79
    meta-ti:            2a5a0339d5bd28d6f6aedaf02a6aaa9b73a248e4 + this patch
    meta-arm:           904f8e82c2772986fad500af4f72f5211a7ff831
    meta-rtlwifi:       032a394e7569d1254cd17a0358475b986e64a5a4
    meta-sancloud:      d1a93ed2205eea11e7cdffbc70578f07d5a609e4
	
    DISTRO = poky
    MACHINE = bbe

Both core-image-x11 and core-image-weston fail to build as no suitable
provider of virtual/libgl can be found (as seen previously [1]).

Looking at the patch, I see the new `rogue-gpu` machine feature has
only been added for the am62xx, j721e & j721s2 families. Are further
fixes required for the am335x or am65xx families? I'm happy to test any
further patches targetting these SoC families.

[1]: https://lore.kernel.org/yocto-meta-ti/0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com/

Thanks,

-- 
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/


