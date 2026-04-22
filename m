Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F1AF94CD7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:54:00 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73032.1776840834399448042
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 23:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ERJEfgM3;
 spf=pass (domain: ti.com, ip: 40.93.194.10, mailfrom: gehariprasath@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTQSRFSU/7hnncpdg3yL2tmCVK91B8HiOtBFpx4QBTvUsKesoTOspRCkj14VTJ3XI7w6RLkOVJQbooltk5lrxz14ECuEo7MwqnXBPrZ3Al/0dwczV2eZLr4InJ4oVt2yJ5XxJQ8129K69pFOZCI2mbsz99ZDMqxZxxt0m+SbfrN4YfcIHQLq0zpNOdHw9OETYgT3Xh5dO0fS3B0gq+A2MlgntqOOritJZkQfgmBIlLfVTjj4BnbKkbC98kojo/IvhrZBe8foAy7L4QRqQAcZTvwPeIG5sAB46ewROJPgC0AtCCL2HOguQNBI2yfvDZOmCVe0zoSOQbOQP7byWM0jeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzZFKDl6jMn+Ttoi9+wlWufMViTZtmvDcOC3NMTwYRI=;
 b=pRQqygd/oT+Q58w+FuuHfwXI2XkN2x3rUNZ3WjOGVSj5B/J8AgOZZrNatzyrMcfHGyQk8CymsCzQ+cYX1RQi1EziqH/2Aj0XtcRIRBm2y2KVfjoTKtBT6veVIG+jZ+qvwl5dyi4ckAfUML/EM21FmOnLz1EuzXeRJs+eB95qpdlrrvdhfgK/rs4vNx3VymTd10nP74jhDaXDTRYZX/ZPnXXqDYVXqTv2TJy1BR+9vzMRnT+hXtR0aYiYaWNfSk+jDXC4KcBZ0lKXOIuqi2A91F7P7/U76QjFKy2VIS8m+nB1GXo2pF5k8WDOFe10GC8WBFGz4KdRwPQVan5OesoUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzZFKDl6jMn+Ttoi9+wlWufMViTZtmvDcOC3NMTwYRI=;
 b=ERJEfgM3f/nnpli+6m2FRBLlUkNixXMcZQlLDDcd3Q7qSsAxqdtDYGQFg30bToE5gRwrmEEi5xTk9RqH+TYAo1mjdfG7jWeXkn1ZjFY/suKz61AjaglLGRh8bW696I2SBdZJORZ3Vlpf80pYdg9uD1TbuYHNXij7u7abtbZnCPs=
Received: from BLAPR03CA0068.namprd03.prod.outlook.com (2603:10b6:208:329::13)
 by BN0PR10MB5205.namprd10.prod.outlook.com (2603:10b6:408:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 06:53:51 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::7a) by BLAPR03CA0068.outlook.office365.com
 (2603:10b6:208:329::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 06:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 06:53:51 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 01:53:50 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 01:53:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 01:53:50 -0500
Received: from [10.24.52.136] (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63M6rlVa1923038;
	Wed, 22 Apr 2026 01:53:48 -0500
Message-ID: <1bcfb891-a9c4-4371-9ccf-3bdec183e4e0@ti.com>
Date: Wed, 22 Apr 2026 12:23:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] am62lxx-evm: Override serial console to
 ttyS0 only
To: <y-hegde@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <rs@ti.com>, <jm@ti.com>,
	<reatmon@ti.com>
References: <20260422062227.4098420-1-y-hegde@ti.com>
Content-Language: en-US
From: Hari Prasath <gehariprasath@ti.com>
In-Reply-To: <20260422062227.4098420-1-y-hegde@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|BN0PR10MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: f465732f-12d3-4b8c-07c7-08dea03be96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|4022899009|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	gefdQZhBhbj8rhJMsZJ6TVFBkeK7OPqZaq60pLY1BHHi+8Kx6SArP6wAIFCmd8tL7TABj68wRLj8ByfxxUdAPXqD11WlLvq6SJDMdYduL5g5rdnOAZEvF2cW6/FtUaOhIlfWUcHFjgJT39Ep4EEa7tZ94UxZq6D7UcUtNB/I/50bIxfUJxsxJYrNb3sJTcRA/HgXGKwCWRsPy2pOdv4GVzu6+SamvGHxfK+gyM87tuwjrOIdRdybUZfksBQWHb+Q5wy5kH69pGLtKnkwuPL0P/iJyW+7TZMiKxbQbA/J0bCpzUZZM5unlP0mL33BgrCFz4DkWKmPSEHQFgu9rLsJgdKJnW6eAl3CW58R4MpofEaCVFkE7NYTYkotv5uon4dIl/fRgMTc6qtTNatGpEemUX4T8l7qC5Yc2V33M01Huu+t0zgTuxcDIGbiogcIDFcLRs0JOy48+okG1PYr+ycTVlKJduphNfeNCOaDpTCGWiqZy48OrNlXvSiYxLq3VoaE3646eOg8ezcdAXDn0vsQmhgVdsN9raRP8IXNAGtL3lSaeGerwsVaGlQCMjhDMr+195Syzqyafliip51c7xcsCTg46Ti1YdaIeTxTmISVIPrx8E4CiwIdxVO+ujiMu3mj4PeF5EmznPxoLtdfwMlcR+o4BTkXq588MSHwHJAxsjQp981rDHkW3oKkyNbY6uMNYw/fJKAwzMXsqW1SP0/GtCCxZsuKEbhTlJJsVZlI8Zo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(4022899009)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	akVtPqtp/020FNP5IKrdVurcibiJLpkkla31FfPNdq7o8UqIwtBDsrcqxW25B+iNFmq4KfcNTemhAcjWPVrtpxQELiydBefLeY2mMY92ihzzBptJFPg0aJ5qzdDHFDcJnltZxDOcZzIJQZiON1l+CZx0KOsEhBsiaS28z5XafcmYmaTz8Bi4CqSWwLZUuSBywdP42cJBUUU8eWcOlj1Mbixg6yc3261sz2n0/6fu9ccxasRQ/0tM5dfuw659Sxlzxy6LH5GCRjFE5C2bucRryxeBdmShbZt/i+64QHhS664MPkTmGdsS/5gVGgb1gjG0+JQyc5yuH+MjX8x30CVi6Ulra7OQ2SP7ivP+Q/U1L7ONtwFkQRQbFj/+MYL/Oz6JfwOi22LVpNNjWZMylOV8VjrdeMJVLrP4VKuRNP67WQbW5VguoBFaBHIsmh8rwwnE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 06:53:51.1776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f465732f-12d3-4b8c-07c7-08dea03be96d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5205
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 06:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19864

On 22/04/26 11:52 am, Yogesh Hegde via lists.yoctoproject.org wrote:
> The am62lxx-evm board only has ttyS0 available. The k3 default
> SERIAL_CONSOLES inherited includes ttyS2, which causes
> systemd to wait indefinitely for a console that never appears,
> significantly increasing boot time and degrading user experience.
> 
> Override SERIAL_CONSOLES to specify only ttyS0, allowing the boot
> process to proceed normally without waiting for unavailable consoles.
> 
> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>

Assuming this is only an am62lxx-evm only constraint and not at a SoC 
level, this override in machine conf looks good to me.

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>


> ---
> 
> Boot time is increased from 33s to 2m18s.
> Boot time is measured from power on to TI LVGL demo
> running on HDMI Display.
> 
> Logs:
> 
> root@am62lxx-evm:~# systemd-analyze critical-chain ti-lvgl-demo.service
> The time when unit became active or started is printed after the "@" character.
> The time the unit took to start is printed after the "+" character.
> ti-lvgl-demo.service @1min 32.588s
> `-multi-user.target @1min 32.577s
>    `-getty.target @1min 32.575s
>      `-serial-getty@ttyS0.service @13.002s
>        `-systemd-user-sessions.service @10.847s +660ms
>          `-network.target @10.582s
>            `-systemd-networkd.service @8.748s +1.799s
>              `-network-pre.target @8.735s
>                `-iptables.service @7.477s +920ms
>                  `-basic.target @7.363s
>                    `-dbus-broker.service @6.661s +466ms
>                      `-dbus.socket @6.310s +434us
>                        `-sysinit.target @6.263s
>                          `-systemd-vconsole-setup.service @18.198s +391ms
>                            `-systemd-journald.socket @2.781s +335us
>                              `-system.slice @1.282s
>                                `--.slice @1.282s
> 
>  From the time analysis log, `getty.target` takes 1min 32 secs to bootup due to
> serial-getty@ttyS2.service failed. This service fails because there is no
> hardware associated with ttyS2.
> 
> ---
>   meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> index 677d6955..edfb4057 100644
> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> @@ -4,6 +4,8 @@
>   
>   require conf/machine/include/am62lxx.inc
>   
> +SERIAL_CONSOLES = "115200;ttyS0"
> +
>   IMAGE_FSTYPES += "ubifs ubi"
>   
>   MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 12000"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19862): https://lists.yoctoproject.org/g/meta-ti/message/19862
> Mute This Topic: https://lists.yoctoproject.org/mt/118950880/10119719
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [gehariprasath@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


