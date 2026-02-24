Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981ABF4BB71
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 18:31:45 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27322.1771957904477044154
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 10:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hY5HIQFR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.43, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbZblYGy0XJ/F4Bcq0VSDxosUHy4cKrfemFCkANdkUSBdg8NfJYLJ3Z7OFBmARUjgIalXQkq7P50OU9kC0bdllouSY+LrrdhMcQYVgpXT+jsHGGDOF+JH1TlsaAUUDueMvJW4vx+170/ETNlcP2HusdnBdlhAEXOJ+myCIJ02dXAsGTaImx/Cqqb5hJKsekB1irK63zX420emZpTXUvTpc9SkBGNRnJ19OcEum0ZTwcsuw+uMR2C4ri7jGBHAdT7+QInVvtFmRyuMIPnABt7m8GzKdOlH9Hqn2OSySW42leAOob8pct/PWqQ4yY02rHgunV50PFfYyRlU9+bvWc7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuTtDo5gpUkGPq7z4120ZMzOiD+OZcQoxOgPTzdYyC8=;
 b=hCZRCh+3oKegJDWdpsCnsoPPi4WqGclglCLdEkQinhnTePlFCPGi21Ez/50gxvGLUJHbLbwZ1eVe+5V9aDjVoZQ2EsyHsQ6Jd105UhiUZF6mndR+e0IXt/em9O2iEl0H5X+iHqC0Sm7omJAMSMkzge+xl44sD16LyDjcLzi6pvfoejN19CtUOqBPS7MMoJIJ2p5F8v+V3rrg+85FXJtWipyF2EfvVz0YVEZIDWcVzO14n/9UBBIEcwHWWc+hiGy/rbDFSZoM9l5ZZwVqWa/kJ8M6lQtUUhH9M3vun9mLvYi/bHvN6qvaa7uyHJVwWfovrg+17sjbXgeP1LO4yKf/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuTtDo5gpUkGPq7z4120ZMzOiD+OZcQoxOgPTzdYyC8=;
 b=hY5HIQFRa7AhjDFwo5Z+9R36Ie1ycI3V+VtApM2Q3ffOchJ1h+TM+w2S47h0XdYFg97AJhwb9uzOtHaQboFfsnkYGTKsRQYHzrIvW87anssCjUW62x0hbIFrnvHDgpacYomvfah6CQw5K6yt+S1bqf6mxD6JY2ayGes8BHWBt7o=
Received: from BLAPR03CA0032.namprd03.prod.outlook.com (2603:10b6:208:32d::7)
 by DS0PR10MB7222.namprd10.prod.outlook.com (2603:10b6:8:f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 18:31:38 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::14) by BLAPR03CA0032.outlook.office365.com
 (2603:10b6:208:32d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:31:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:31:37 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:31:27 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:31:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:31:27 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIVRKI3214109;
	Tue, 24 Feb 2026 12:31:27 -0600
Message-ID: <7b4a7756-a9f6-4b63-ba83-391411255e52@ti.com>
Date: Tue, 24 Feb 2026 12:31:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 2/3] beagley-ai: add beagley-ai-ti
To: <rs@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-3-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260223235744.3928753-3-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|DS0PR10MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: a1460128-9a4f-4e82-7b99-08de73d2f1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N000dldhSzU2R0lRUkloZEZNYytpaW1jRitOWkIzSUFaR0d0M05UQnRJUmVY?=
 =?utf-8?B?ZW1YN0wvUXdUeHM4QTY2UldLWXU1SWJiRmF6Q3E1amM0ckpIeXY5SmUxK0ph?=
 =?utf-8?B?bkVyZjNCb0FreGE3b1VGZEtxZ0NPQU5DUnU0clUvdmpHcVY2dC9BOHMvazFU?=
 =?utf-8?B?eW5uN2VkT0ZkdW54b2hreVo3SkdubEdRallLSEsyVnhVT0pnaW5QbWdQL25D?=
 =?utf-8?B?VTlmeWx3UmM4MXJMd0FnbGo1MnFtRWpWa1o5NzZXMmg5U0NUcFFOQW44M2Jy?=
 =?utf-8?B?aUs0RzNvZmZINkpNVDNuTFdRWkxtOW9mYUloaWdLc0lUTDArZ2VaNWJnbjFp?=
 =?utf-8?B?SGxTN0IwU0g3RFB1WnBtb2J1UFZuSjhwaWFiT1JEYzhmU3JOcXFDVTdUTGYv?=
 =?utf-8?B?WkpaL3Q1L0oxY3RSYm5SSUlZQ3R0ZjhSYnJKTTlXVjd0MWxOWG00QURnNmhY?=
 =?utf-8?B?ZE14d0VMRlhOT2R3M3VqaGFoM3BHZGdnZzhPZnlUL1o3U3JKWmxZRkVGL3pT?=
 =?utf-8?B?VzJnaVdWcDBXR044azNZekhpb2FwTkdXOU03YVRIS256MXBGQ3pUOFRTMDlx?=
 =?utf-8?B?Sm54Z0RtMmhoRU5IWk8zdDl2OS9uK3N2b05rSnZBdnU2VGkwd2Rrd2EzSmYy?=
 =?utf-8?B?UUt4UnFUWHY2ak9tK1NDMlVkakNsQkRWREFEV2ZWMlZqdFhNV1dOR0oxM0xW?=
 =?utf-8?B?MVZhTHd0NFlZWEYzdVllWGV0aFlIdWZUVno2VFpQUFBjMjB6dG1JaUtESXQ0?=
 =?utf-8?B?eFdIaXhsS3VSVTRvcXNERVpDL2kyYitNR3lzVXhvT0J5U29Cak1qdU90UTBa?=
 =?utf-8?B?ZXRFNE5xZ3pSR0RmZHhCMjdZY0p2cHo4eWlIYUNLSmFwZjNqaUhieDJEWUZ1?=
 =?utf-8?B?c0FSNFhUUWZ1U0F2T1BWclZCbG9hVnJVQ3ZNSWlHN0ovTHZhSUpkWUxVZEd0?=
 =?utf-8?B?N2NiZXp0a2dpdTF4ZXpSSmFOSEhqYS9tOTUzWU53U0ZDdzl1U2ZmYWJOUzZk?=
 =?utf-8?B?aHJuME42YlFYNDFmQ1p2K043eXgxWkRXTlpjMEJtVFhsa0RXTkRTVEdabWhv?=
 =?utf-8?B?cHFxYlhRNzVLSWJLT3lLV2F1UlpoUHkrOE01WitJdHlDZDF0NndzODB6TGRO?=
 =?utf-8?B?Qm5ISm1WZmpUQUs5V00zOWhoSldPTWNBMHNTK1RZODBEY2o4WExXWE5VYy9O?=
 =?utf-8?B?WXFLLzVmU0huZ1BqaEhzL2RqTGNwVHozMnQ4ZjRwUVhSYnpaTXVxSFpLazd5?=
 =?utf-8?B?TXlXSWowWXdJTUR5THErTmtnZTloU2czMGdPd3hQbFlVK1ZtUVJiVGkxc1E3?=
 =?utf-8?B?aVREckdqWXNPNnNqOTJBdmlVTDNmUWZ1dnlhL1dQZitMcWhCM3U2SVFiQytn?=
 =?utf-8?B?WlJSWkFLQlg5TnJRRzBhcFJDSFVRUWNTUHRiNGE3RWpHa1NuN2VHTTh5RXhM?=
 =?utf-8?B?aXZzM0x5bERVUkovbGhDclZVOGNXenZQTGgwL1lPYkVpRE9rNnlkWmMxSU5o?=
 =?utf-8?B?aE04NnVhMEk1TGRza1IzQkp2ZlUwZHh4a0tuUm5LNlVZdzBESjlrbENld0k0?=
 =?utf-8?B?dTBUK0l0Y2I3SlFuUk5CaEY1VXpIRjU4RHF3V24yR2cvU0JNRnp0NDFyYXdB?=
 =?utf-8?B?OU9DUTVKbzUyY1hCVExQWENlaWV5Skt6T1RmbG52NFZ2UUpET01Kb2xBRHIv?=
 =?utf-8?B?azdyQTVkZjRtZ2xVa2FrdXhVNWZucHc5OVZmaHl1VDBIV1RZWStGdzN5SEJ1?=
 =?utf-8?B?RldPTFhXUVVDNmU1T0MxMHBoeEVGcHZDeFFKWkpSUnpzK1hldlBFUkJqZ0Rv?=
 =?utf-8?B?SjQ2VGN4bmdMZDE5YkN5N2V4NVJPVVNkZGxwVmc3RnVPWlRyZTVaSFNiWnB3?=
 =?utf-8?B?SFRmMndhYmYvWTNDS3I0ZEQ3cnVLT0traDVOakVsWXdnMGNVUVFjcGIxckU0?=
 =?utf-8?B?cWpQelkyejZQV09lZUE3K1lzSTRwQktRbHhhdWE0QUVuL1FqQmRaVGpsdFlh?=
 =?utf-8?B?OGVKZmVHcVdiWWthTWpWMmNMQ1R0QWsza3FCdGREYlFSOVNwdEQ2MzBlT21S?=
 =?utf-8?B?Zk1JUGkvWTZQNTFvOGt6VjVCYW1UNlUra2c5N25BWm5HQVloTC80WDZFaXdp?=
 =?utf-8?B?OWVQekVaak5hdWdyVWRueUdiWTU3dHBoZ3ovRkVGTE03cHFsd0xnVG1JL0th?=
 =?utf-8?B?bUdWc2FBeS9uSjFON0NiTndieW9lTmVkRUt3Ri82RjVnWUFmUVlJWDh5VHlv?=
 =?utf-8?B?eDQvY28ySlB6NTVpTmhBUWlIMlBRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	n/MIjQ6Y6eKVfFeDIwrtZ3PP490Cj/Brf2/OwrEvaLqvaG4spWkhmaOsC1/L8wSBP9x0R7lMsMDOqslrUHS1MfsyBfHRHMP7NwgcfGVayDXL0f2jrnBAuvl2ZvBMqClq/ddvu1eTAGiDPxqvn3vHIkFERPdEkNIa4r6eo+gEhE1YVGtJGMPsCU9Ehmtwdwj7yTy0QgC6EPL0/XCM9XtIQlXtBsk5xO6jNBgluxciIwuu6AVNIqp2Xd417mSVSpJliWdoDPqVPT+ywisPVDpbSeVeqFq4cX5cqGB7vMhxwtleF5vyLGRyor8/iVpqX+m70Xbq3IBXtHnpHDUL2bcrTxsEsac0+uSMxl8vSCZ1Agbbyec2xLb85hOQWNdAAE4ZlykhytM8JlzhT+47AV6vZBKWw9cpazTA0q0V1fk5ENK/R5h8Sb2cuXIaH+xe8FbP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:31:37.2276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1460128-9a4f-4e82-7b99-08de73d2f1fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7222
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 18:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19588

On 2/23/26 5:57 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Split the existing config into a beagley-ai-ti and beagley-ai that
> includes it, like the existing beagleplay machine.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-beagle/conf/machine/beagley-ai-k3r5.conf     |  6 ++----
>   ...agley-ai-k3r5.conf => beagley-ai-ti-k3r5.conf} |  3 ---
>   meta-beagle/conf/machine/beagley-ai-ti.conf       | 15 +++++++++++++++
>   meta-beagle/conf/machine/beagley-ai.conf          | 11 ++---------
>   4 files changed, 19 insertions(+), 16 deletions(-)
>   copy meta-beagle/conf/machine/{beagley-ai-k3r5.conf => beagley-ai-ti-k3r5.conf} (61%)
>   create mode 100644 meta-beagle/conf/machine/beagley-ai-ti.conf
> 
> diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> index 06c74cf9..2d6948d5 100644
> --- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> +++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> @@ -2,10 +2,8 @@
>   #@NAME: BeagleY AI (R5F)
>   #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
>   
> -require conf/machine/include/k3r5.inc
> +require conf/machine/beagley-ai-ti-k3r5.conf
> +
>   require conf/machine/include/beagle-bsp.inc
>   
> -UBOOT_MACHINE = "am67a_beagley_ai_r5_defconfig"
>   UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_r5_defconfig"
> -UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_r5_defconfig"
> -UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_r5_defconfig"
> diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
> similarity index 61%
> copy from meta-beagle/conf/machine/beagley-ai-k3r5.conf
> copy to meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
> index 06c74cf9..eaab2d57 100644
> --- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> +++ b/meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
> @@ -3,9 +3,6 @@
>   #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
>   
>   require conf/machine/include/k3r5.inc
> -require conf/machine/include/beagle-bsp.inc
>   
>   UBOOT_MACHINE = "am67a_beagley_ai_r5_defconfig"
> -UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_r5_defconfig"
>   UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_r5_defconfig"
> -UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_r5_defconfig"
> diff --git a/meta-beagle/conf/machine/beagley-ai-ti.conf b/meta-beagle/conf/machine/beagley-ai-ti.conf
> new file mode 100644
> index 00000000..d6d05264
> --- /dev/null
> +++ b/meta-beagle/conf/machine/beagley-ai-ti.conf
> @@ -0,0 +1,15 @@
> +#@TYPE: Machine
> +#@NAME: BeagleY AI (A53)
> +#@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
> +
> +require conf/machine/include/j722s.inc
> +
> +UBOOT_MACHINE = "am67a_beagley_ai_a53_defconfig"
> +UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_a53_config"
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am67a \
> +    ti/k3-j722s \
> +"
> +
> +MACHINE_GUI_CLASS = "bigscreen"
> diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
> index d73d0506..d2c68201 100644
> --- a/meta-beagle/conf/machine/beagley-ai.conf
> +++ b/meta-beagle/conf/machine/beagley-ai.conf
> @@ -2,18 +2,11 @@
>   #@NAME: BeagleY AI (A53)
>   #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
>   
> -require conf/machine/include/j722s.inc
> +require conf/machine/beagley-ai-ti.conf
> +

We should flip this around, `beagley-ai-ti.conf` should include `beagley-ai.conf`,
not the other way around. `beagley-ai.conf` is the "deafult" config using the
Beagle kernel as one would expect of a Beagle product. The "-ti.conf" version is
the odd ball in that it changes the default to something else. Plus that would
keep this patch more simple, only needing changes to the new "-ti.conf" file.

Only downside would be this is done the other way around currently for
beagleplay, but that would be an easy fix to switch it too.

Andrew

>   require conf/machine/include/beagle-bsp.inc
>   
> -UBOOT_MACHINE = "am67a_beagley_ai_a53_defconfig"
>   UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_a53_config"
> -UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_a53_config"
> -UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_a53_config"
> -
> -KERNEL_DEVICETREE_PREFIX = " \
> -    ti/k3-am67a \
> -    ti/k3-j722s \
> -"
>   
>   KERNEL_DEVICETREE:bsp-bb_org-6_6 = " \
>   ti/k3-am67a-beagley-ai.dtb \


