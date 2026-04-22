Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D00FA1FDD
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 17:53:54 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88847.1776880425718709822
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 10:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AIYDMMD3;
 spf=pass (domain: ti.com, ip: 40.93.194.4, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfXhR9gkaNqI2KBLlJ/s9VlQnZWiAODO87EbkySaQQ9AnqMlZYqeLTOeSBRxVMOAmB0vw1sE3Wffjuj/yHMCudCyfr2LDyUDPID28wAFNxHRJ7d77GZxrKghsWJMkj9Zdm6g0C8a+KmjqkhXLCn4gxmSFUKAq6jfS8IiRmeilEbgNpqXQ3YXz2YXM/c0xyqRfWZgCH0HNd5PoZybhA4WmrID9eMArfdxNFuR10qf2vjyZYMSZl+OQ4IJxBK8gg1ei/rs82hVzyPQ+FFTPuPweGin/Hryb0kQPz0DwYHGW2RmHUHLQEBmEANmowjY/CmwIAY6enZuWYvspTiG29OVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCCMaaiQWj5nDAS6emzOZo0/oDcvuf//suOE/8/318s=;
 b=CIElSsFk5AZaxShfq0/beopAcKe3lWSem6hDme1P/SVq8GAz8Ek03Li62hGSpaP2rKUfZ/2jju5zqnXzQpOs1n9X6dgMcEnrxKHK0lZEoV0lbLvknCZgE2NlMb+Onl8aCHYOXF85HJlaiW+aAtYtYqeAdEK7e9eZy8Rg1VhPy6uyw0N/20C+n/dOZsTFAPuNHIwm9Kp8y99za9dzgPudYnOD0G+gigZTIcPWjHpKpDrKHgmmFYkegGGMJRtAvdzwEZE3CryEzr6+SXAflIab3L4i29fkkmgXdjY6kTsSCR1Sn/b8nYbhG24zq+wCvR3tV82bBnG5D01eda4yskbb3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCCMaaiQWj5nDAS6emzOZo0/oDcvuf//suOE/8/318s=;
 b=AIYDMMD39B7fHUvtYvliDBPRP5aGxLnNLzZWv9WKbPRn75W772xdXMrCyGMBpUUaCRWRmSClgu+zWFs8X/DocXCV7zseVLfoAsAX38lpVfY7otpngH0BidYw5xEfiUypKsTHnxD0TPoTVMijjf+plADzhhol3iaJXNo3EW0niQU=
Received: from BY3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:254::24)
 by SA2PR10MB4713.namprd10.prod.outlook.com (2603:10b6:806:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 17:53:42 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::5e) by BY3PR05CA0019.outlook.office365.com
 (2603:10b6:a03:254::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Wed,
 22 Apr 2026 17:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Wed, 22 Apr 2026 17:53:41 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 12:53:41 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 12:53:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 12:53:40 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63MHreek2823385;
	Wed, 22 Apr 2026 12:53:40 -0500
Message-ID: <916c068f-f439-4870-a91d-22865c22991c@ti.com>
Date: Wed, 22 Apr 2026 12:53:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH] am62lxx-evm: Override serial console to ttyS0
 only
To: Randolph Sapp <rs@ti.com>, Yogesh Hegde <y-hegde@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <jm@ti.com>, <reatmon@ti.com>
References: <20260422062227.4098420-1-y-hegde@ti.com>
 <DHZTYKIA3SU8.1RGLJYU49Z18Y@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <DHZTYKIA3SU8.1RGLJYU49Z18Y@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SA2PR10MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: 2178748e-0b39-4503-cc64-08dea0981716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	P3bdyikn6r2NESaWkK1Yq8jMCUokMK9Ecs9m/uzrLr9MKKkR77M6pQlA9zHX57sFDB9aV4G3SZ+vl9Elf+oF1vGxYa+XCuoOFkVR/Xb0DZyMquUmqMNlQiMa6WJq6ImT69LOWlEx2skClHNbBTwb/M091OnNybPm01EKaa6pZg314YgSDtnWbq/Eqyc1sMD4ae8ueuIbTt313H3IFnqFGlDpoMkUftG7qFwoUpCRo/sDK+TLlA5WEMsZjWeP+r6gj8KEJwslouQHv+svoTE742gYyR+XLlwdBi1SK6sZdB1JHuY4sAsg4nP6FFLuIcEk/9pZs9Z6Uwrt4Lp12vRijPqw6dU+yATzb0iwmefv98LYBqKS3e3lKzr+moCTxuvdMnAEDOydU6hVwk8ecSk0mXxyghUKVl6kTq76b3XtSIF1r8tgVEBPabksxu74I+cUgPQ/3l6dSMqoISVVVVTVJQqp6yhGTD8yxPqUAeoinuQyVsk43JSLQvXGPMCqMAX5VXmlQLGNn0g0vuTb6JJTOTtucCOKNDC9Ao+LAy4WmJg1F/tLdKdMxrI0IT61DpFUAmkMZb835GX9/MRuyxxr/AkWrHZfLJi7rieIH29ABGaFNkvXVCWmlQAVH6aM5O2aTWfaAX95OLdddjjKe5yCGDTFkzZbjqVY38kryB6MaRhr4tf/S2KXkL+BA8zsbc77vzYx8RXReMqPhv4hImkF3oGS1Vc12PUEUvP28d0mY/G5aCprON72hDYcldn3sVbUZQ8wwNYDvVd/3xJseWZBBg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O2vGgFRBYVeLzsIAHskbLO17UfTuq6LGSfQXIM+h+vm093Ga1JMrD1dgfWbB2AuWw3Xkn0gZjE1flA7fZSvww4vZcohTTZqPquxlNL/oWFDDWdTSQDqoYqCsD/U/u3J+V0QtsyTCqWpglOixdlulZotIYmvaXTNEczVTJukX+kAT6R3vIerguaXCqqn4fy8Hx/RpXbuzG62ZtiP+rK7XivLQAIR/tUP41u60kRLT/eCnTN6kKNz0uk6LVPZNMrfBIDpdx30DTufoZTllfZbAUdRjspPt7aq8Ne16VS+ympxXwEw26fpaJUZcnGkvad+lzIxNFC8f9e8784Wild4v1T6bWCfAWmSd41XGmdDQoKCcqsv7sQRp1k+BloImfhxYVaGgsb26671iA4SkFvu9e78r6yaGciPqwEu0mwKUPZSUxsgt12g0E6xm9lR3fBE2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 17:53:41.4723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2178748e-0b39-4503-cc64-08dea0981716
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4713
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 17:53:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19871

On 4/22/26 11:39 AM, Randolph Sapp wrote:
> On Wed Apr 22, 2026 at 1:22 AM CDT, Yogesh Hegde wrote:
>> The am62lxx-evm board only has ttyS0 available. The k3 default
>> SERIAL_CONSOLES inherited includes ttyS2, which causes
>> systemd to wait indefinitely for a console that never appears,
>> significantly increasing boot time and degrading user experience.
>>
>> Override SERIAL_CONSOLES to specify only ttyS0, allowing the boot
>> process to proceed normally without waiting for unavailable consoles.
>>
>> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
>> ---
>>
>> Boot time is increased from 33s to 2m18s.
>> Boot time is measured from power on to TI LVGL demo
>> running on HDMI Display.
>>
>> Logs:
>>
>> root@am62lxx-evm:~# systemd-analyze critical-chain ti-lvgl-demo.service
>> The time when unit became active or started is printed after the "@" character.
>> The time the unit took to start is printed after the "+" character.
>> ti-lvgl-demo.service @1min 32.588s
>> `-multi-user.target @1min 32.577s
>>    `-getty.target @1min 32.575s
>>      `-serial-getty@ttyS0.service @13.002s
>>        `-systemd-user-sessions.service @10.847s +660ms
>>          `-network.target @10.582s
>>            `-systemd-networkd.service @8.748s +1.799s
>>              `-network-pre.target @8.735s
>>                `-iptables.service @7.477s +920ms
>>                  `-basic.target @7.363s
>>                    `-dbus-broker.service @6.661s +466ms
>>                      `-dbus.socket @6.310s +434us
>>                        `-sysinit.target @6.263s
>>                          `-systemd-vconsole-setup.service @18.198s +391ms
>>                            `-systemd-journald.socket @2.781s +335us
>>                              `-system.slice @1.282s
>>                                `--.slice @1.282s
>>
>>  From the time analysis log, `getty.target` takes 1min 32 secs to bootup due to
>> serial-getty@ttyS2.service failed. This service fails because there is no
>> hardware associated with ttyS2.
>>
>> ---
>>   meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> index 677d6955..edfb4057 100644
>> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> @@ -4,6 +4,8 @@
>>   
>>   require conf/machine/include/am62lxx.inc
>>   
>> +SERIAL_CONSOLES = "115200;ttyS0"
>> +
>>   IMAGE_FSTYPES += "ubifs ubi"
>>   
>>   MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 12000"
> 
> Systemd's getty generator might still try to grab ttyS0 in other scenarios, but
> this at least fixes the default behavior of trying to wait for the kernel serial
> console on this board.
> 
> Out of curiosity, why did this change for this board? As I recall Andrew and
> Nishanth had a debate about this a few years back and the result was to
> standardize to ttyS2 for all k3.
> 

AM62L isn't "K3" in a way, it doesn't have the R5 cores taking up a UART.
While we probably could have aliased the first MAIN domain UART to ttyS2
anyway, this feels like a good time to get back to the more standard
"default UART == ttyS0" that everyone else goes by.

> Reviewed-by: Randolph Sapp <rs@ti.com>


