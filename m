Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFD6CCF9E5
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 03:57:03 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.28])
 by mx.groups.io with SMTP id smtpd.web10.19855.1761796611356736002
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 20:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WTcM9GfP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.28, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLZfSzuosZ8REHbfmAs22lbeEiNl2TKMo+YvWlRYLgysg2Ne8ClqTj2JkOZfxMDVn7sa45AZjX4l1UXQoeGdExtcNCkP0wFZacFz1iSui595x0ssE7yE0ijlUrhAkqb5YIndwtqo4NBJrTjxf8xpjGOKKFf6Fjru1bRvGKu6UGgEuw/gpcF+JbGUmtyvAYpOufC+B6nN/TtcR8GsmAzgHyJmCDAymeTOUt66qW2rAtxOpB6tsIEPdQJB3cRS2zJwOo62/H0/rOh0IpR/h+M0XrTIlv52DPeaUzqcaxIygU8XAHz0oihpJfd1/tBz3rUZkha4TKu1SdUz+0uPsGFL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5kr1i9pfAHZjMPhEWJpFe0H1ZYYpReK6xrDUFicAC8=;
 b=vdcOv7OOt+C279kOVSq79NZuGBe5PBJOChxSkKyxZ5Uhvp2m2GTwPfDHPT0X6wn/+dHvp9O6VHbuzobN81UkhgYGBlMyqkVhFxVmPUD5ZTIxc6M9dBLiimAfuThVg9mOwyGKuQfH2N00lLAVjQlg8xBm2To6SBHZj91b4SaFOcU2Mk9g/ObbR+6Fmqh6HTsZBiGNR64RIFzNfiLwx5fgQ4JTdfFGlQrlMED5QLky51JrTpiCKQpG8czNAcfwrwkgopOD8MzzM2BgTdp/Bv4ROWREV6Q4CD4uWUqvmWTyx0RZN+DNWYBNDFr/ebYwzMko+SPbwOOsHXqE6zyH4df5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5kr1i9pfAHZjMPhEWJpFe0H1ZYYpReK6xrDUFicAC8=;
 b=WTcM9GfPAuvzfcaxU3U+NUjH7D1+wkJQxmWCAE+1UUmSvW2PUVO8PkrL9XZN+g/viLFdxrsR+8ecv692sUtZBNnt4VUeEjPivFuyWLoFCSq4+nekiD/dAaulvuHFdalfe1Z/eLYeFLEsevBcEGUzYcTdU4MrMdx6gomQrdlXOoU=
Received: from SJ0PR13CA0083.namprd13.prod.outlook.com (2603:10b6:a03:2c4::28)
 by PH7PR10MB7852.namprd10.prod.outlook.com (2603:10b6:510:2fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:39:48 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::38) by SJ0PR13CA0083.outlook.office365.com
 (2603:10b6:a03:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:39:46 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 22:39:43 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 22:39:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 22:39:43 -0500
Received: from [10.24.69.90] (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59U3dfuV1198070;
	Wed, 29 Oct 2025 22:39:42 -0500
Content-Type: multipart/alternative;
	boundary="------------aY0i9Hx2ek0JC1xNJqkPaYo2"
Message-ID: <13f9b7f8-37a3-47fe-97f9-5a52f0836967@ti.com>
Date: Thu, 30 Oct 2025 09:09:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v5] ti-librpmsg-dma: update
 ti-librpmsg-dma SRCREV & LICENSE
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
References: <20251029060209.707510-1-v-singh1@ti.com>
 <20251029201133.GH3125@denix.org>
Content-Language: en-US
From: Vishnu Singh <v-singh1@ti.com>
In-Reply-To: <20251029201133.GH3125@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|PH7PR10MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 679dcfbc-6762-47be-7736-08de1765f8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGxkL0tFOUJvKzRnOG02NTlUNlcxcExvWUwydmVBamtEUWh6SHVXbCtYdjY1?=
 =?utf-8?B?WHd2aUdvalRvdzJRWWFlY0hsR0VtUUx3bDE4ck11dVZhN2JSeWN2MFZRNkov?=
 =?utf-8?B?QzFuWUFkU2YraDc3Rzl0TkM1emFUeS9pOTBVZlNKUnBwMlRTVWtSRzU0N3Jy?=
 =?utf-8?B?OG94U2ZKdW1ZNmkxNld4cUVpOXJMZmNpN3NWZ2E3RDMrcnQ2d0QxWTdFU0lR?=
 =?utf-8?B?QTBCdU9nL0NyLy9SbkhRUk9Sa0s5blBIMTU5MVpxNWgvNnBiUVZqQzBWV3V5?=
 =?utf-8?B?YndaUTNmUXFJK3Y1WVVpeGhadEYxU21yc20rOFRKMk15ZCtycERtU3V5NDk5?=
 =?utf-8?B?TnlSR0V1K0k2S0N1YUpEMHZSUmc4QzJCZFBOTXNLQjlDejQ0cGpRWTlqRm1z?=
 =?utf-8?B?SmdLUUszaGRaSWFwOURyS3RNNDdKTGRrVk9jUDUzZ3VJZmtZd2d0Nzl1dU40?=
 =?utf-8?B?cEozdXVuQjlqbUp6em5sSFJkWjBBL1k1T0F1b3Vhb0U1SyszYkRLeVU5RHIz?=
 =?utf-8?B?RDJuaVExUTh0K0VNSjZFZ0l6YnNBVUd6MG5EeW5BNHI3NHphZjJ0MUVPTUlk?=
 =?utf-8?B?ZXlPalQ3aTB5WnBZU2ExZ1IwR2JodVFKU2hvVkIyOWlJMFNQOUsrSlN6Z0Zn?=
 =?utf-8?B?eWtHWnJZSHhtelFxa3NhVFVuejkxcDlGWEw1OW9yOVJiVUhDc043Q0RLRURO?=
 =?utf-8?B?alVZQk9CV2YwNFJnWGR5dW9sSUNVNWNtbkQvZGI4RWQzNjdhdGJVa1F6ZzRw?=
 =?utf-8?B?N09XTmtXcTQ0cXdsaVdTVGNhMUNvNVpGR0ZHNDJRb0xmZm5YeXZMbStMaHVL?=
 =?utf-8?B?anc5dEpaUUpIT3hqdk0zVW0rNFArbFBwQjFIejh5YitlbzVia2ttYkt5SEI2?=
 =?utf-8?B?RCtqMG5JWGE0QkNmTjBHaW1ZWi9WaEFkOFErSlhUSXYvd0VjQk5YVzlPYVF3?=
 =?utf-8?B?bU1qWCtLdytiQXp1YnlxUHh0MytHSjBUcGdYcitwQis1cVg1Lyt5NUc2bVZw?=
 =?utf-8?B?YWh2SkV3ZHhobzVXSnpwNHZzNUtpSWNYRkRubUE3QVBGQjc1M2gralBEUURs?=
 =?utf-8?B?djJPNzhOcWdxWjBtaDMwTXk2U29Sb2RzY3VhWlgvK1JwSkcxZ1lYRTBHSmMw?=
 =?utf-8?B?MTdUN1c1cDZ3ek9pSVczTTVUd2pXZWZwMVJMWjI0Z2RJTnZrbVF5V3RFV3J5?=
 =?utf-8?B?K0twekM5SVVRVzdRb0FLYW4rdlRwMjd2bTlIVHFIWEtQN0owdHQrNWEwZExm?=
 =?utf-8?B?MVpJc0JMbjFKSHNaSGhaOWk0TVZBSFFPVmJPYWRkOUdpRU1EYURDNFZTV2Iw?=
 =?utf-8?B?UzdvaWhZc2UxelpRQWtnakVkSlRtMUREenRJcVgwN1EvUFJtSHVsWjlKbXVJ?=
 =?utf-8?B?UUpHSWdkelhEOEgvdnc2RXNtY3BTbjhNdGlZYW5rSU1BbnFZbDJyN2FuRmRn?=
 =?utf-8?B?MGVTelJieXJTS2N4Ym42YzhtZ2tvNzFlSXdPZUF4V2VDTjIvUDNPY2w5WTRD?=
 =?utf-8?B?bllvRVYyNXUxQTNTcHNScitCK3JheTJsT1dHUmNXMXB4NkY2VjVkMDAxQm93?=
 =?utf-8?B?amlIaElMbURkeVJVWnhuZ0Z3L1RiOXlNYmE2Zll0dkd1QUZ3UEJTS2VTaXVY?=
 =?utf-8?B?OGpWYXFjM0pBZ0RoQlMvNHNHZzJ3eTVZR294TTBETlJkVUh0OUNrVFp5ZDZM?=
 =?utf-8?B?ZXZYRjB4WWpPQnRiY0w3NXg0TFUvQUNvTVFhOFZDVXJiSjRSOXdQTEl1bEFv?=
 =?utf-8?B?anVDd2tOYVZEL1A5TU9KVi93cTJRUFhoZzlKMzVTVzdjaHZhbDVXL0R3bFMx?=
 =?utf-8?B?cnVINW1hL3djYXFidytPai8yU2VkeEttUUZlR09DRTBVM2k4QnV1NUpQb0tO?=
 =?utf-8?B?TGRQMnpUam0xbHBaU2xaMmI3bFAwcG0zdnlleXNkdFhiYWRWdTNZb1pWdjNR?=
 =?utf-8?B?K1I5c0Nyc1RlUDQydG02RURNRThhVTFVMUdzdE5ubk1vMzVRek14RWF6eElt?=
 =?utf-8?B?bGpxcEVLYjQ4NDM4dzEwdVVSZVV0UkJTMThXVUZYakZsUFZMRE14MHBEN0RG?=
 =?utf-8?B?eHl4NXBXcGhhMzNFQ25CaEZCeVFyVTRDZmtoOFJCaUszVFZMSkYxb3VvSDhy?=
 =?utf-8?Q?19GQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:39:46.8233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 679dcfbc-6762-47be-7736-08de1765f8f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7852
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Oct 2025 03:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19211

--------------aY0i9Hx2ek0JC1xNJqkPaYo2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

On 30/10/25 01:41, Denys Dmytriyenko wrote:
> On Wed, Oct 29, 2025 at 11:32:09AM +0530, Vishnu Singh via lists.yoctoproject.org wrote:
>> From: Vishnu Singh<v-singh1@ti.com>
>>
>> Replace MIT license with TI-TFL to align with TI release policy
>> and product requirements. Legal approval: SRAS00013045
>> Update scarthgap srcrev and disable 2dfft example from lib build.
>>
>> License-Update: Replace MIT to TI-TFL license
> Sorry to be pedantic and blunt, but that's not the reason, that's tautology.
>
> License-Update tag (and the commit message in general) must answer the "Why?"
> question, not the "What?" question. We can all see the "What?" question being
> answered by the code change itself. There's no need to repeat that with the
> "changing X to Y". You need to explain why you are changing X to Y...
>
>
Reason for changing the license is that SRAS for this is approved with 
TI-TFL license and C7x firmware used is licensed under TI-TFL.

I will update the commit msg and License-Update tag, if this is ok then 
i will send v6.

>> Signed-off-by: Vishnu Singh<v-singh1@ti.com>
>> ---
>> Change log:
>>         v1->v2:
>>                - Update commit message with license-update
>>         v2->v3:
>>                - Update SRCREV (license updated in README)
>>         v3->v4:
>>                - Add branch name in patch subject
>>         v4->v5:
>>                - Update latest SRCREV
>>
>>   meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> index b624871d..7600f867 100644
>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> @@ -1,9 +1,9 @@
>>   SUMMARY = "RPMsg DMA shared library"
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM ="file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
>> +LICENSE = "TI-TFL"
>> +LIC_FILES_CHKSUM ="file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"
>>   
>> -SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
>> -SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
>> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=scarthgap"
>> +SRCREV = "153951932925a72346b76d98b2774952c48a82fc"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> @@ -11,6 +11,6 @@ inherit cmake
>>   
>>   DEPENDS = "ti-rpmsg-char"
>>   
>> -EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
>> +EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=OFF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=OFF"
>>   
>>   COMPATIBLE_MACHINE = "^(k3)$"
>> -- 
>> 2.50.1
--------------aY0i9Hx2ek0JC1xNJqkPaYo2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Denys,<br>
    </p>
    <div class="moz-cite-prefix">On 30/10/25 01:41, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251029201133.GH3125@denix.org">
      <pre wrap="" class="moz-quote-pre">On Wed, Oct 29, 2025 at 11:32:09AM +0530, Vishnu Singh via lists.yoctoproject.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Vishnu Singh <a class="moz-txt-link-rfc2396E" href="mailto:v-singh1@ti.com">&lt;v-singh1@ti.com&gt;</a>

Replace MIT license with TI-TFL to align with TI release policy
and product requirements. Legal approval: SRAS00013045
Update scarthgap srcrev and disable 2dfft example from lib build.

License-Update: Replace MIT to TI-TFL license
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sorry to be pedantic and blunt, but that's not the reason, that's tautology.

License-Update tag (and the commit message in general) must answer the "Why?" 
question, not the "What?" question. We can all see the "What?" question being 
answered by the code change itself. There's no need to repeat that with the 
"changing X to Y". You need to explain why you are changing X to Y...


</pre>
    </blockquote>
    <p>Reason for changing the license is that SRAS for this is approved
      with TI-TFL license and C7x firmware used is licensed under
      TI-TFL.</p>
    <p>I will update the commit msg and <span
      style="white-space: pre-wrap">License-Update tag, if this is ok then i will send v6.</span></p>
    <blockquote type="cite" cite="mid:20251029201133.GH3125@denix.org">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Vishnu Singh <a class="moz-txt-link-rfc2396E" href="mailto:v-singh1@ti.com">&lt;v-singh1@ti.com&gt;</a>
---
Change log:
       v1-&gt;v2:
              - Update commit message with license-update
       v2-&gt;v3:
              - Update SRCREV (license updated in README) 
       v3-&gt;v4:
              - Add branch name in patch subject 
       v4-&gt;v5:
              - Update latest SRCREV 

 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index b624871d..7600f867 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "RPMsg DMA shared library"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53">"file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"</a>
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3">"file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"</a>
 
-SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
-SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=scarthgap"
+SRCREV = "153951932925a72346b76d98b2774952c48a82fc"
 
 S = "${WORKDIR}/git"
 
@@ -11,6 +11,6 @@ inherit cmake
 
 DEPENDS = "ti-rpmsg-char"
 
-EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
+EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=OFF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=OFF"
 
 COMPATIBLE_MACHINE = "^(k3)$"
-- 
2.50.1
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------aY0i9Hx2ek0JC1xNJqkPaYo2--

