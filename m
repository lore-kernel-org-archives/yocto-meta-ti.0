Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A1CCD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 20:59:12 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6058.1781038746693381880
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 13:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HyFCLtTI;
 spf=pass (domain: ti.com, ip: 52.101.53.55, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYm+zLGLCY1L3S0EmkuvS/mXHCbpQOYiS0BEh6dUdylTMhWwlFG4hS7AQk84ZB67GESHtDo6FptfUsd/j92uVBEH2HWnqvgNGaUy8dhrvLM2/qU6HXTFIB/QK++w0BQHD5X1aggHJk77xMPB/vFr1o7NweHazEGEb62WNSkk//Gd6uUx2V6JnrnOp0H8VlmbHl/zSckc8kT7Zdoa32qdQ/Ls5Cs5mVcia/dzXkEVN5/zf9VrbZz5yJT6Zw/oMTJNdnbXD4950mjvZJ+Md4Kq8lb1+5msnAZ2hFT+LD38zeP4qk2jejgwaiAr4Y5A+Dqd8fFKodtkwOyyqFHSwZ4Mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wot/x09Ys3hSMHZVsvw0i5C8vmhBGzTg7P3JZ2X5Zhc=;
 b=wndSjEs3WgNNdIDJD+7v6yAB1wEJOp+RYrCIVAAzhfB+AtHimNU/mVYWCLt8lDJMfmyxJeABQ9iloLaSqr8cr1V6NC4BVjillPzcxbTbYwsngymZLy8f/K557f9gtuGT+yTcJOKEa80/Px0h+Yr1B9MfO8M8Skf7cT5Ky3+cxcqZpI8dvOsAtfgHBK+bmVVdnOwgfkhKCMGFCfYxvZS3AiWl161Mbwn962trEvJ85Gxlh5t8CF5h8gF4y+COyi1U2nygJf4L6v3XhfCIPMCtG8wVORtT9xNpA7dAIgZ3xv3Nv7QlemZ9vGZ32CNNtBKgGfMGt0P4JxeaHqhVHHEjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wot/x09Ys3hSMHZVsvw0i5C8vmhBGzTg7P3JZ2X5Zhc=;
 b=HyFCLtTIZg7rYfbB1TnBYqNCpjUGw5BTEk4LfCeI0TYQP3lUnJ+BkTap0/oueqBZKQv8lue44ZztzCybD0SIK539VKKVINayJbJQxlrz2UsyuAMhZz1Q4gVBUPvIC55MHFLt8ANVYxI/e4pzsXblyvVwrmrdu2WcfajEAYx+3kQ=
Received: from PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::27)
 by DM4PR10MB6696.namprd10.prod.outlook.com (2603:10b6:8:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 20:58:59 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::68) by PH8P221CA0002.outlook.office365.com
 (2603:10b6:510:2d8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 20:58:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 20:58:57 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:58:57 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:58:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 15:58:56 -0500
Received: from [10.60.28.114] (ula0226330.dhcp.ti.com [10.60.28.114])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659KwuS32410701;
	Tue, 9 Jun 2026 15:58:56 -0500
Message-ID: <af29fabd-905c-4ee3-a092-7635a413e8d1@ti.com>
Date: Tue, 9 Jun 2026 15:58:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged
 overlay list
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	<meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
References: <20260609202801.18252-1-jm@ti.com>
 <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
 <20260609205307.GJ23325@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260609205307.GJ23325@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DM4PR10MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: be7dbf3d-2e4e-4a5f-74a7-08dec669ec8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|4022899009|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Ir/+4cK+OfRNWW2X2X3D8S4DiEaQYKfjZqQfpES5aT82UZoJughewEBbHlvARrm7R1w5aLLdrcQ3JnelSMV+UvW99kFF2Qidrze6D3bo2XRFEIlc16obyghlNFTIJOyHy1apEPek9Ryc8NRSHcbDmM3FG3oi/8rWe8Ghwvva9odl1VVYirwELyVRtO9w8Kt2UdZSSOmS/utvjfj05g3rcx0Jn5Gor3ECwQaYrLybRjL93Ciz97t/YlsOnM22dsAnDUD1q3wI+TREnZ+gZGLELZU5ZtLnAZwLxwu61UXhcA4vGOa1CrubXM/31lx6l0DA9SIdXufnaiC/jZPXoQdk39rTaZXiVFVA7VUIffy3bP21PfF5WNQ+f9dFajo19Jig+m2H2WFmju1+3lMq1+UdXsUtU/Fdwe2dQwVM4soyKiHmtwyeBgKpV2ndLyyz92AQA/N2m38dcg9ictKG2+4nicG30CZGGEniEnzdh+xZ8KaZA130Tjyg75hxBPu/tdJxXBMI+9c+xU7tvB390x5KCQDZUAU0qp74twdHz6B8wHmjKPeppBeoIFwgMmKcNbjcHFWXwTuRuWJwxEN0KSMABu/k61nTfcwMHPwkqp7CGz0qPd1bfsr2ouBUaFDZyGP7JHVBW36r06cFFIAuueYHk4CrSCyxkS99yvKY/CXgrmqAdbu2EU9DruBF6LNInRi2jweJ9fWSWsRmEMnzIeeU+HDtJImjTuFYlLyWmTq5FCE=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(4022899009)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SjFvwYRboxZlrYp6BIFnInEHelKLhqx0WsjHPgVhpu+a8Y4vjLtEKeYye/kKiGE2IvFvlE+mPZy0FcfClMTk1x3S5Pnb69/b14E6yRHG2WtCqHMHhcoWizNMW0jpag+IgD7ZWYY3aHSNi8uCafwipA7THqUxe8DzpJEJxXrBaX0Xgzr50S8caqtwTGkciAeBElbqFNQR62nuy06GtP/ZQT8vV5cCngpRd2yQa0BV+DXLfm6nksjOBUeF4aGb9MT6xcuyU1jMsIaR22U5J7RlEryCrZJeSQ3oOURwhwzkX2hF3nEgK+v9fPiTaHVbhjd2Ntd5x+BNYKggLvQmDkAxA0pY4WLnOIcXOY2IG2U5LygTxMswwyFgtgH1WFWY0VXrkE4YeYTyx6ccoKUbMPHTw3EodjlsVQ1uYd0lEncPLR/pJsekxjcK6tSpUXqStMxG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 20:58:57.5038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7dbf3d-2e4e-4a5f-74a7-08dec669ec8c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6696
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 20:59:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19997

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
> 
> 
>>> +    ti/k3-am62a7-sk-mcan.dtbo \

Also this one isn't a prefix, it is just a full DTBO file, why not:

ti/k3-am62a7-sk

or some smaller prefix so we get all the future new overlays.

Andrew

>>>       ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
>>>       ti/k3-am62a7-sk-e3-max-opp \
>>>   "
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#19996): https://lists.yoctoproject.org/g/meta-ti/message/19996
>>> Mute This Topic: https://lists.yoctoproject.org/mt/119730108/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


