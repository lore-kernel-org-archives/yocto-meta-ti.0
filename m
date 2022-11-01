Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF6BC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:50:01 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.53])
 by mx.groups.io with SMTP id smtpd.web09.2713.1667321395608196663
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 09:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: sancloud.com, ip: 40.107.255.53, mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3wqZxRP7yIRf8VE7Oe9Bnfo/i+EuWL9Qm1bMzaAZGRGgpPARvGwd0O/3DFgeM8qLCWl9ZDk8yEPUt9VtT1FG8W6vhjzFhXSNbM7CERTjxUv95uMJo0NJruynozi7Ru92iDy7Axy6pacvq1eUNvumu7p88ecexZX58QXOIk/UI2rB7YEyBF/6vfrTUyu1eNpFw8dqZqEv1mBoqRoKpvd4oCTuoPRnjjRYWIe1Y7B5G7+t9YsXiim+dxTioQNaLN7S63olIOOuIvvmsZNzHbkI//b2O5csRvCDfDcklQ4TP7QwaiH8ScTkhuN31Hvp/2NYIE9ZnnVzAYeX7Av4PnXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVhpROPrikPNeHMz2a67n3nl0KAo8rpaxcYtgFFiBto=;
 b=h+DPCMXqSyaEj3i2TSEJOrmQ9C/6Y1G6iRIcatYVRplSyztegFHHl39DFaKBfYBnP3ZHTHPT9RAMB9FSOaO1QYcj5Wa19AtuARtdOXnXwBKGuiY1hC/o6sqR6d0vPh6WjAMxWi6KxeBjE6+zvUyGqThbFnscxwmL49i80pmhDtwyB0hbFNXY6BWev7rnn+pL5ilF+C4Kx9ZrsHARAaQS7mETExdkTcL4K/uPznVXvIS/uX/BlJWtljKiocM198ZKZbHGiOP90nI1CyxKgXTmqmw7LjGgY2/XCDxhM9xqsXbs0caTMiqn7omy7BGThJKH5gpC7E6yyCiqaIDmHoeTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from SEYPR06MB5064.apcprd06.prod.outlook.com (2603:1096:101:55::13)
 by TY0PR06MB5379.apcprd06.prod.outlook.com (2603:1096:400:216::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 16:49:49 +0000
Received: from SEYPR06MB5064.apcprd06.prod.outlook.com
 ([fe80::ae6a:652:b9d6:adb1]) by SEYPR06MB5064.apcprd06.prod.outlook.com
 ([fe80::ae6a:652:b9d6:adb1%5]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 16:49:48 +0000
Message-ID: <e563bce4-c0e9-d75a-f602-45f877e9ed99@sancloud.com>
Date: Tue, 1 Nov 2022 16:49:40 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
To: Denys Dmytriyenko <denys@konsulko.com>
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
 <1721551A6FBDDE25.26638@lists.yoctoproject.org>
 <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
 <CAB2aN6P44KSxngO4JNaCe9df5Bqjh1v0eDFCHZ5FAOn+JK9LnA@mail.gmail.com>
From: Paul Barker <paul.barker@sancloud.com>
In-Reply-To: <CAB2aN6P44KSxngO4JNaCe9df5Bqjh1v0eDFCHZ5FAOn+JK9LnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0195.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::12) To SEYPR06MB5064.apcprd06.prod.outlook.com
 (2603:1096:101:55::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5064:EE_|TY0PR06MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e5be00-610e-4b64-11c8-08dabc29169d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3CYf1QM8cVTPm+ree6jwAKNvCaYOopaOGHbeCimxR8XDkkCjAxV/z2HZ9c86KlzkxZrQirL9WT5wWFKVhLUmSM66othL4q5JSbZKf8snuk0jC77XInygvFOBLjyOdtU9myZpAylKdtapLt+ykxNFcB65FNmYER6G4Kypel7vumhIUVYTSaZv7sGWYp2+taWlzYsS3zBZ+wm7fJCUGG0oI52Mz8qjHhXcyJVsPMylZP/JvawSiwdvXAQ5hE29U0Z9ARCHdlfenfZD57YgYqqhdBipj8Mx9rS6kGu3x/e2cvauW0iwiRt/2voPTks14zt8hCrAVCIJssUEwrjCskNnlAFdKt/OtIX9DKs9pEHf1570gg2bHRBETzNDTcyzPI3xy8fh2JAsfVmbe/9qTHTVnit5aJw8t6I7ocX9NhCoQFIVBfiW16xBm1/4p71vrlbJRDQTpU3GycfzGvIQubpi0Trv+tiXT83NfBC5rSYYbHuwqSEZDgPkvJKVCuYbpbWNknD+pBKzys3zFgCBViBOCNbU7+gzx3vrIOEUZF6DVqhnPYGG28YgJnyGfGUaxqh8/RC54MwCH7/LuSd2JDdLQlD5ONpU3Qdh0K4TPR5Hi3A+OBRQ6TpDF0474sJtNeU8WeVE9r4aCgq5FsVtdA729ntQL5ki2UIReUIneE6u/IM/D0qS+QiwCJghvVSDsAiPpQimsnl1806Gkns1dhXe52Zl6GcBmMHb/G+uGLF74DqLMy5Hjdj0+I0BWkHgcihJ/EXFDiGaDa22E/qhIm0yhh/ILcYSCVJjveKpvafpR7Nmsl9/Kxj9jqo/RP2G20Ip10py3fgTMAHUViUEDGAG6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5064.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39830400003)(396003)(136003)(366004)(376002)(451199015)(6506007)(44832011)(186003)(4326008)(8936002)(66946007)(66556008)(66476007)(83380400001)(8676002)(53546011)(2906002)(2616005)(31686004)(36756003)(41300700001)(26005)(5660300002)(6512007)(38100700002)(86362001)(966005)(6486002)(41320700001)(316002)(31696002)(478600001)(6916009)(54906003)(786003)(6666004)(175373001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWRveEJIby9YVml4dGVCSVJpaFJaK0RFWENmUTk2dk1VQVlNN1h0VUlQMjNP?=
 =?utf-8?B?VGFVZTJGK1lwN2pHR2dCQUgwN21jcUFkS3lhVzVUQWlJbllSTzFQMG5Pa2Jj?=
 =?utf-8?B?YWdnNEZrOTlzdkZ4VmFMZWpHT1VsN1EvOTUwWG1GY0tiRWRzaXUvb0l3NHhQ?=
 =?utf-8?B?Z2t6R2t2cEZneUEwS0RydDMxRmxEWWI5YUtIc1orTzk0Sy84blFYY0ZjOFpZ?=
 =?utf-8?B?STV1V0poZnViNm42UXJSanBNeWwvTzg2TkQ1dHUzRzc2ZklBNjJFTzNqdmpt?=
 =?utf-8?B?VmhFYTEraXhVZTh2VTRoV1JFems4MVVNMXBmN2I1Yjl1WUNMWDZGc1dHWUNM?=
 =?utf-8?B?UG1XZ0pjbG5mSkhBUENaNEViM1NQZUU1V0llbTY2UmJ4MFlLNmplazRtQXAv?=
 =?utf-8?B?TmJJTkRkV2RHQXZaMWVYYmdlSVRmRXIzRDA2d3VtckRETFM0aUFFV21iKzlG?=
 =?utf-8?B?WFlzakVKbEFESU1YMldlL2pwa005dGtnbHEvMWZRRTZ5M1Y0WVczY1dxRXM0?=
 =?utf-8?B?TVFDeVJFdmRPS25lNjhDS3JxNGtnQzk0bTcvRE1iRXQ0V0VydHc4dm1UeE9M?=
 =?utf-8?B?aTl3UjRvY0w3UUZQODdYS1BDSkIxQUpLSWVFblNkVFRlMlJBbVh0b2RSdDNl?=
 =?utf-8?B?MThyMmZnV3NQZGw5ZVZZcnlSYndmQnh1MS9TZllXV1FCRk83d3VQRW9JdE9C?=
 =?utf-8?B?SkZaZFpQSmRTZHdhSDd4MC9aYkpmZTdyUWw2ODBtRjlMY0ptYW8yU1ZqYjh1?=
 =?utf-8?B?ZSt4cHZob3lmUml3Q01senNoN283aG54NU9KTFEvYnp4dXhmb0NXTi82c3N6?=
 =?utf-8?B?VG5JY2xkTDJMMFlwZmcrS00xNk9JUFRaUWNlRlV2TkttdGl3eGdWRWJFdC9E?=
 =?utf-8?B?aCtNbDAzR2syY3J0b0lMN1NhbXJ0K0F2UVV5TExLZXkwMFN0VmpJSEtUZWxJ?=
 =?utf-8?B?eElHNDhaVE05MWxSSWsySkx5Yy9xMlh6SHB5QjZsc243TFZYbEJMU1J5U1VH?=
 =?utf-8?B?d3NoQTNWMjQwbHk5Y2xCT1ovQnorRXpyWUJRQng3RUc3aVk3dDJkNUlqc0JK?=
 =?utf-8?B?a3lYNElGRGY2SytHbnFTNitpd3ZNWll6clFNUUxLd1JnYjZnd0pyVWwwdXlO?=
 =?utf-8?B?dlIzUlJBZjJFMi8wUUs4dm5HN2FsMjF1eC81QlRFbnNseHJxVUlTN1FtY0t0?=
 =?utf-8?B?V0h3WlNTNjlESmRrZWpxYmdJRmlMQ25qSnNmWWgydzQ5YStvU3pHNWJCcUNR?=
 =?utf-8?B?T0F1RDk4VldTaHczMDdKQXhDOWUwSjhsUE9UVVdsWVpUa2lvRlQ0alZlUXRW?=
 =?utf-8?B?YnhXOXI3V3NsMGVkRlYwSWJvbUl3TStvc3dVd1JqbVM5U2kwckRTc3NwTlA3?=
 =?utf-8?B?SVlVUGJ3dU1HZzdFRDJvejd4MDI3M0VIMERCaE5yZzA5dzhscjV6ZkF1YkZU?=
 =?utf-8?B?V1JrR2FubTdQTnFxTE85c0VBOTB2MTNWVS9zVXR3M3MzK3FaamtKMUNjY0hw?=
 =?utf-8?B?UkE0VldRSWpSUTU1NEY3dVIrWU9IWWVwRXNWMDNHY2dVRWQySm9sZXgzUTcz?=
 =?utf-8?B?ZW0yMkZWd0g0c0JaT1BkOUEwNlRYQzhjbXBQSzFySTFnZU1idGVBTUI3OUZr?=
 =?utf-8?B?NnZDeUNyQXRuNWhQWVF0M1l5MTdhOGNyVFZSNXdxaVJkZnZYZGxTWHk2YThq?=
 =?utf-8?B?ZjFON1FmSWxaem1QYnA1TVlNdGZmbGxseFFBSEZLbnNtMnlNclNKblpwQnBu?=
 =?utf-8?B?WDJPWW1ROU1ULzhDR0c2cGFBaWQrKzdwK2JBNCt4TW1vK2lKdDJhNnBnV21t?=
 =?utf-8?B?ZlRQOENjS3g0Tk1lNzVQUENCVDJldGVKNC83SDZQa3FKUzh2UUY4ODlLRXdU?=
 =?utf-8?B?eE5maTl5Yk13cHNLazU4dHdRenNPN3A2Y3ZWdE9hTkNFREpiOCs5UERldktT?=
 =?utf-8?B?aGJXUU8rNHg3eDJOMG1XNHR2WFVHdldxRy8zc01uRTlobUZsZ2IvRjFWd25F?=
 =?utf-8?B?WFRZTDNkU3FBbmJ1OGgyeE9xaHp0RmNwelYrekpDUU1DUWEweXhad3B1d2l4?=
 =?utf-8?B?c204cks1UGgrWExjalBTMVE2Vk1NUWw2b2JmaHg5aXRZTTJnNlJFZk9lU0JB?=
 =?utf-8?B?aFBIbFJvWFNqeUJHOGJjbFR2SDV4bUtIOFBicXB2Nm9xb1ZRbklYQU5iQk9D?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e5be00-610e-4b64-11c8-08dabc29169d
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5064.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 16:49:48.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e0f949f-6a74-4378-baf2-0abfca8d5e06
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HJxn/1j6Hg13/s/nysJc9eAiImPrq411pPWa+QF1qLrWsKYW72ujwfhVRU3KowCGWlnC210kISlNdT5rW8rcTu3oOULQMoEms6cMPCdDwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5379
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Nov 2022 16:50:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15214

On 26/10/2022 16:12, Denys Dmytriyenko wrote:
> Weston 10 build failure is known and is being worked on.
> 
> For details and a temporary workaround see this:
> 
> https://patchwork.yoctoproject.org/project/arago/patch/20220329053703.2367559-1-denis@denix.org/ <https://patchwork.yoctoproject.org/project/arago/patch/20220329053703.2367559-1-denis@denix.org/>

Hi Denys,

I've tried the patch included in the linked email. It allows successful
build of core-image-weston & tisdk-default-image. However, it does not
work for AGL builds as weston 10 is required there:

| Run-time dependency libweston-10 found: NO (tried pkgconfig)
|
| ../git/meson.build:154:0: ERROR: Dependency "libweston-10" not found, tried pkgconfig
|
| A full log can be found at /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
|       #1: bbfatal_log, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 184
|       #2: meson_do_configure, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 173
|       #3: do_configure, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 149
|       #4: main, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 197
ERROR: Task (/workdir/meta-agl/meta-agl-core/recipes-graphics/wayland/agl-compositor_git.bb:do_configure) failed with exit code '1'

Is there any way forward here or do we need to wait for Weston 10
support from TI?

Thanks,

-- 
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/

