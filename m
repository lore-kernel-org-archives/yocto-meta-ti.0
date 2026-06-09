Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CFBCD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 21:08:03 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6280.1781039275618543064
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 14:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JCA7VE3H;
 spf=pass (domain: ti.com, ip: 52.101.52.21, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lid1yjSMrDtQHVn1+QVuQP3f8otV6GriQyl2WmufIuKzJjAw2eeNDQeV+pfAAOKQLUs0zHtqzsYsL10Qh6Yrxv/ZwugqClqkJ/6s8GpsqfuraSPXnmSc2JYju89+zf8cc80pMwqrKLE80UlSwCqZD/ZJA3e+Pu0Lf6TewDDKQJcRop1kWoEi9eIs20g766VkxaXSiMS03bOeVA/pmqU6cCN0oAdHohRWGT3vAV1U7sElMfLvBRTc+mbKqXGoHdH5W8dR2WEBncZ19awqfEpaHZQajMRTfejJHfRhGSfUc/NilkSH4Uxkcg2+lN2mZ+//swjT4nyuRdKRp/8Il45Oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dBMGxykay6vwsBHwj7j9VYsy/5DNo9yIcMfs0iXALQ=;
 b=B3v9HzozdDEZCVw1tuZ25qKQTapRiaNgE1gwuDRHc08kiSl0Np2TAUkReoayz9/YDF6/kiLWSY/HUWNJsrn38d7NIRE43N0cVy1DBhljklh6JcB594tiS+ZbZcPtXAALvkQhixkt3Ebd7JCj0iPDJnc0Tm/7CRyLErkhW1Z4hgL+iJ3EVpTM8qazaVnm3lWCYiMSA7P5o1MwnqSuS4s26owUxw1ngo9IUBBBmcCZEFQCyGh2KHB+SdyDcPEDRzWRTpIwR9jx3/N/XDcDef+v5tnLFdfNQuURF5rajerfgc6zdZftUU1VLWvuZd/FdXjShSw0/DUHpsboix9aoJZ+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dBMGxykay6vwsBHwj7j9VYsy/5DNo9yIcMfs0iXALQ=;
 b=JCA7VE3Hi/tRPw2nmu2RwVG+idQ8SrT3bVw0BDoy+WXm0Pgg49udx9x0AgpRNLkjWWdbBjq2B67sRWmeOYxItqdpW8Hy43zsznR4LM4DswbIxgxFhXI93gXkMuR27J/PtpXqgYEbncC+r95PYkqk4vGxgvJqtMgY7J55s9VxPUw=
Received: from SJ0PR03CA0280.namprd03.prod.outlook.com (2603:10b6:a03:39e::15)
 by CO1PR10MB4692.namprd10.prod.outlook.com (2603:10b6:303:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 21:07:52 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4b) by SJ0PR03CA0280.outlook.office365.com
 (2603:10b6:a03:39e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Tue, 9
 Jun 2026 21:07:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 21:07:51 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 16:07:51 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 16:07:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 16:07:51 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659L7pG02425339;
	Tue, 9 Jun 2026 16:07:51 -0500
Message-ID: <fe136348-e605-46f2-8cc1-52ff83578e33@ti.com>
Date: Tue, 9 Jun 2026 16:07:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged
 overlay list
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<denys@konsulko.com>
References: <20260609202801.18252-1-jm@ti.com>
 <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
 <20260609205307.GJ23325@denix.org>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260609205307.GJ23325@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|CO1PR10MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: d2498fe1-7ed0-4794-2589-08dec66b2b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Vcui53gsXkEhoBMGvyKpSuvsFx35OQP3ljLsy29FjNdltzyGC30UUmsPCM/DHlb6hCvtAHZTX+yUP9dhkeOo9mLNadIJODbnm/+DFvvrAtZo1g2rkhyw7PygFjZby98LBfvoZj+CgbzVvJ1u5QtS61pijELNxdo7MbZvbEI01emGvxMeXFXBnJcIS28hoKCaPuuI0gDBTlMy3o+meHMhrAQgYjScEn69N4/8RbLL9g98iirX+/3Wo+6gthvYWC1uvK3VJY1HoFb9iRoHvxu8qzLggmJpq70NlBgsBV+7EJHK1RhBUfpfeUSVhpLBHKUBQ9X686WPlqsgfySRFM7GmFsOLDPHnuRDPLrcxrXD6qyQN2WmA1Usn6vRRjfKid/eGjs33RGW+3PentvxiR44Hl8wt7ciXW2ealwZEIPxH4vh02budhixhAaAPLTc5ngNwCGeXjlmShQaTWMWRbZhhsF5UaPjwXjFFr14U36+qOGNxcwhiG/UuE6kXAqdG4K3TgIBdejey27X8VrbCW5e5NInZ0Si5lnyE6pYIVlb7QHwd7/VUzToodCMPtoLO34GT/AMJ0QDzGdHEVkCZzJwXiJH4jVGFKDdT9PmbXUKW/wI3t82uhoyyusfX3iXJlvpdiyePML7JCQZnBe5/szCDqqpywZySpl1y+VlY8phUUFK446KSzFS1dSqRrBVLlGH1mvoEGhGVbycHacZDrU4s0dPiuNUR9F5L87HFHHF9Oc=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WsveJwxpdAOf2DKNU6ZYFGUm4bdqeJYB4JgWyHh2dHpQ5XUsZ5FhK352TBvDl0kU2DKbjEKxA6nlhpuVUUHd3f3p9BbBuYSRrx7oZrciZup+osyAyDZ2ObUivMF0GapB/V73qMPoYvlRtmrwyrFrYft+jf1YsIX6MAHEx79xpzfgRpnm8Jo/nswe2Ngxh7xAcCth1+7sntPmi02CniuiWk0ANlZba6byHeT1Tp7s21eNSoMcV6fnO4YLdjg66C4zxkSqpdd6uwKY/ayuS9jCtzHHJTFjcePVbpHgsNQ3qlFZn9HSdEGKW7m9bwooxGFX2F5t6mrnp0kEaNhJtvTtyAuPvQJtf/UvVYpue6fDftRnxQkZJ0rcVJHmcRU+ZZZNqgOCjYeoHe5u7kJgWEn7dg5x2KyZM1E3GCjctcmtlaPzXr4M5jlpLR4VRAL3wyiT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 21:07:51.8687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2498fe1-7ed0-4794-2589-08dec66b2b17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4692
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 21:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19998

Hi Denys,

On 6/9/26 3:53 PM, Denys Dmytriyenko wrote:
> On Tue, Jun 09, 2026 at 03:45:05PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>> I assume this is for wrynose as well?  If so, please make sure to
>> add it on the subject going forward.
>>
>>
>> On 6/9/2026 3:28 PM, Judith Mendez wrote:
>>> Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
>>> update overlay list packaged for AM62D mostly to include the new
>>> k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.
>>>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   meta-ti-bsp/conf/machine/am62dxx-evm.conf | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>> index ef9df2f7..c776ffbf 100644
>>> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>> @@ -7,7 +7,14 @@ require conf/machine/include/am62dxx.inc
>>>   KERNEL_DEVICETREE_PREFIX = " \
>>>       ti/k3-am62d2 \
>>>       ti/k3-am62a7-sk-edgeai \
>>> -    ti/k3-am62x-sk \
>>> +    ti/k3-am62x-sk-csi2 \
>>> +    ti/k3-am62x-sk-ecap-capture \
>>> +    ti/k3-am62x-sk-eqep \
>>> +    ti/k3-am62x-sk-hdmi \
>>> +    ti/k3-am62x-sk-lpm \
>>> +    ti/k3-am62x-sk-mcspi-loopback \
>>> +    ti/k3-am62x-sk-pwm \
> 
> Why are these needed? Shouldn't the first removed more generic prefix cover
> them all?

Its explained in the commit message, some of the am62x-sk* overlays
no longer apply to am62a or am62d. I did not go test each overlay,
but for now, I removed the overlays that no longer apply to am62a/
am62d with this change

> 
> 
>>> +    ti/k3-am62a7-sk-mcan.dtbo \
>>>       ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
>>>       ti/k3-am62a7-sk-e3-max-opp \
>>>   "


