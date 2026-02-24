Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B3CF4BB6F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 18:23:45 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27191.1771957417675391273
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 10:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cPTToTXJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.21, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQH6kP6pAScu6+5Orj8vb67O/sgmTqVC0g1Y33CQarHGzrQxz5MYEXThDhpIZLRZuqAB4Up8KDp54xJnPfgoYKffBCE5Ty/Od0UxC0EaUtkncjkoZ81S7oZrmi/3G41xsq9nbaYe5cnuyaDq70AtOGAf2mBUKDxwS/N+XtbGjrxyKBS+k0CwG6FPMoejseOmoYbx+nZ420SII33W5R61h2yrBOCnGRrdq16KDK/03UG1ZZuH542icJX3RdRsdxgw6YtveBe7s/oP5o3ZJzWVvA02nKhnimrqXGO9AUVFoxut3deSBQEFU+ZZ5WoWgj74Tuj7GLxVEDezv0dMId1ZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6DJTnhh8haZEwQrLRR6Xu4YfNfEWbpYBHvMM5LMeDs=;
 b=kh8SIF7j2eEvKDYn+ioJ4wNt7f+Z7nB9UmDyUJO0kUlcnT9iW1E3Wj2YyEmp0cN82nZWPByvDmNTkuB8YPfhcH68irpIU4tQosQaQGCxySl+FaDo8HhgsNhBhZ30FhY82uSS0BJOQjotkALORb8g9VUIm5dQem+zReYTGfzpXpCRkItmiCIydAaYufDkiqws7swkmmqYObJ7Z1tkTLlbMdBXST3bXr7iQbcUIjXquO2WSyzKSONHDQjPBbEUl4yyJuJkUb2422RZShPGPJr7bci30yDqPsiWqNGpb7bNIex6gJPJ9/bJQZSJFwL3EWSj3lQM71zjuC6qLb6A3k3RWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6DJTnhh8haZEwQrLRR6Xu4YfNfEWbpYBHvMM5LMeDs=;
 b=cPTToTXJWO2iesryn+HvfrqNC2OKashXLNw3L327ocewsUa2TEysZ363eT2u0NN2YyTcqdd0XjP9nDrEnLQ9otkBRC6syopwtBf/1MPHlSdR0vEsUGy2N+fFmqVy5oP8JI8bqjMFKu+EUjkNyr2EnTAGrI7T0Ha7kE6XSxuisPw=
Received: from PH7PR17CA0014.namprd17.prod.outlook.com (2603:10b6:510:324::29)
 by CY8PR10MB6682.namprd10.prod.outlook.com (2603:10b6:930:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:23:34 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::8f) by PH7PR17CA0014.outlook.office365.com
 (2603:10b6:510:324::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:23:32 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:23:32 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:23:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:23:32 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OINVjX3202776;
	Tue, 24 Feb 2026 12:23:32 -0600
Message-ID: <54d8e905-52c5-4cc3-9e4e-aaef11df1b34@ti.com>
Date: Tue, 24 Feb 2026 12:23:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 3/3] beagleplay-ti: use the am62xx.inc
To: <rs@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-4-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260223235744.3928753-4-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|CY8PR10MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: e1430caf-9b5a-43a6-3724-08de73d1d144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTd5U0xhZGU0QVRoUGxFOEkvM2t2WFVVVnpVK2NhT2tmMExYdHRoSksyaUJU?=
 =?utf-8?B?NzJkLy9HbEkrRnEwTG5DSHJTbkYyQjFKaUdFeE9JVEprVTFXakppRUIvdFps?=
 =?utf-8?B?NEdEbTNPVk96ODZUUXpuNUVZbzFpdVVyN1lKMHNmT0Y2Vy9mVHVWVlp0ODM2?=
 =?utf-8?B?N0VudkxGTDJDeVhMb29tVkxxQmVzajhYcS9IbTJ5YkIwSTRJVHMyUTlBbjZt?=
 =?utf-8?B?NnJDRC9kbGwyNzZmZTMrVHhrTG43bjg4Vk4rUkFGYzFJaHdQWVFPTWNMckpk?=
 =?utf-8?B?R09MbVd3Yy9KckJoMHVjTklhUVBER1ZlSFZ6YndDVjR4WlFMbVByc25sbkdL?=
 =?utf-8?B?cU4rQlBaMjdBeVlmY2k2NGNvSXJEQW9UcXRmTGlPMnpFa253NnZWbGdEdFlC?=
 =?utf-8?B?M0FUTm9jY2owQ2ViNzRyVS83aVFtUzNyeFBaRmVjelhrL0lNbzA5eVNmamsw?=
 =?utf-8?B?dmpzVzlZTFcvbnNTVXlPZzNiaHBlbjdxVVlQd2RqNUJjME4vUHFaUzBkRW1Z?=
 =?utf-8?B?WHBzOWZ0VlFiRVpuVGJrZ0ZJUytrOE5EeXMxa2ttZllxWE5yZ3ZQNWFNVDBp?=
 =?utf-8?B?QjFnYXJTUENqN2lQNmdHdlBoWGc4WENrSENsNmJwTjM3eWxmM2pCNjNXQklp?=
 =?utf-8?B?Z2hJNGhiSmsrd3RJM1U3VkpGZCtWSnFya2dOR25CNnViL2RXNDU3QUliK2cw?=
 =?utf-8?B?aGx6V3h3OGJHYmFZTDB2azhnZDdyK1d4SEY3VElDVnUyS0dOUW9BVHBaeVZl?=
 =?utf-8?B?bWVzRWNxejIrS3lOVkovSkRZN2tIRDd4cmZ2UTFZOTVXSER6Y2VwNnQyWnJr?=
 =?utf-8?B?Zm1iVVFjaEJZRll0WEFJTTdHOVBNTC9mOVhzejhQMHpYa04xRThpeUpmRUdI?=
 =?utf-8?B?RHY3UTFpL1FVL0RjS29ITFNwdUFrc3AxeTd0RzdjYkRnWlh1ZWprMXlZMkFK?=
 =?utf-8?B?R3NBNGg2eDk5dE41eGh4bDVuTmZrendqZUFxbDFXRVBSdTVQRjNPSytZS0da?=
 =?utf-8?B?MExSVGVubTBKVXJ0R1REWWVlS1lrYXE3MXIrQlVnM1JoeVE4eThaUE5nMVhk?=
 =?utf-8?B?VmdEUnY4aVA4T3h1djNBeVc3ejJPamFyQXhOYWgxTDg4dDZ0dDhtYUNNY1dK?=
 =?utf-8?B?M3F6UGdrQVF1RXFKekxmalNUd3NNTTFMTFpudExGQzB6ZU5LN2RzcUNKNDFF?=
 =?utf-8?B?QUFmdDI5WkxqTXRXMVRQZWl2S1ZuMnJ6eDIxSXNualdzdmNsUmZMNVNQc1Nu?=
 =?utf-8?B?dmtmb2E3M2x5SXdWbHNCSXMyd3g4MkRjWTFUZm5IVXJtRmJhRGJwKzVpenpD?=
 =?utf-8?B?QUt2bEtoV0lQZmpTZWorbjVqWUxIYWZnS3BpWFF1d3dHS0lsbGNJemRXSmdG?=
 =?utf-8?B?akhHSVdZQTY5bUgvdzJQMDZMcXVVU2d0UlpwNmp1ZEFHWm51WldmQ3ErTmVH?=
 =?utf-8?B?c1RhbGMxeG1KaVBTN3c3TTFyL004ZHFDcEx1bmQrUDdrZ0VhYUxVcEpvVUNZ?=
 =?utf-8?B?Q0NJZDdsalREQ1h4NGlBNWkwSUcrZVBwRG8zZysxbGwwZTkxMS85eHlEajB3?=
 =?utf-8?B?Q1NLaDlxQjNtdnRYYWtUV2RBbExNWE53SVc3S2FLS2hYd04xcXdMckZUaEVF?=
 =?utf-8?B?SGg4U3BpWkJjUENxZUd3cjhVdUVTbWRNSXhmbWtDWTN2ME40aEJ4ZEUyMDBi?=
 =?utf-8?B?bXhnaGxJUTlEcENEZjVjRzVDcUZiTEFyTi9MZWN3OGRYT0xBTU94d21KRjZT?=
 =?utf-8?B?bGlMQ1psMTB0Wi9ZandUM3J6UkZsd2FmSUY2c0VpK2JPbFFhU2xTSFpqVEgy?=
 =?utf-8?B?T3VVYnUvWE1jWFo5K3Z5QnhRekhlbjNlNFJtMGFLRDQ0bmpSM0Q2bHZaekYz?=
 =?utf-8?B?dzlHSHNnd1pidzl0ZVdVenVWbkFiKzVXZWpyOFBIQ2tUVzM1c0hCcC9BRTJr?=
 =?utf-8?B?QjdXRTVCcmtKK29rY25nQ3cveldjWkFpMjA4NGMzanZiWS8vZ0I0SU11Y25U?=
 =?utf-8?B?SmlHanlyd2FNMnZ4YkpRN1FEeHgraEtCa2JYczVjeTNsek0yK0Fzc1orMWxX?=
 =?utf-8?B?ak5YT25Qak9nVWo0Q1RFMEJaUDdXZHdzZ0FKN1VGQ1VVWnU5V1kxUWVpQll2?=
 =?utf-8?B?anZJdk9leldxTTBpOW5sZFZmMHpCWXAwNFVUUUNaRGVKdVJFS3gzWWNtNXFU?=
 =?utf-8?B?NW5ycWV3RlJiZHMrS0V5ZUxYeEZjajg5eDcvSzI0bldGa1B2ckZ2MTJrbXVm?=
 =?utf-8?B?bkVTdk14eWUySnh3d2hoTjE5RmR3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7j4/Dtx28+I4DKk43X5H5g40w7hod6bh9qrEUXhsEgQRqyhSgdl4fL9X2auRUVDPuQYD6XMp1kicI7hZTmw9x1P27XA6e55g+Tz9vl4rIBcYjBpmcEefuLMyQI8wTPOx71LLHsE34HspdWJGPB9su8rv7GJVlO2gRsWh8Pcts09o0n64nODQ5MXpOVlDQV4729nDlQ0uFtLcQtovDnqrK+hQthFpwG8/VVGA5MlSBkm6rH8NLxfdw/R0JQufnBUKO0BUAwAl9u9g3YZzic5blHms7u/eW68xVLIvESknJP5CbRnledi1j/Co+uuCqKK3wLJH76az3jpwqG98Ho1eojV35L+GY7ZXE3GugnVwGaWPDEAcSslL1VG8pp/FPkk3azttX+vpSHjOtuKxxKMiRhZucIMgdrni5I5wj5WMDyEMqA4VwVjFbZleH8QsA2TA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:23:32.8670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1430caf-9b5a-43a6-3724-08de73d1d144
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6682
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 18:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19587

On 2/23/26 5:57 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> We should inherit the am62xx.inc and just override values as needed.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

This one looks valid even without moving it to meta-beagle and should
be done regardless of how we land on the other patches in this series.

Acked-by: Andrew Davis <afd@ti.com>

>   meta-beagle/conf/machine/beagleplay-ti.conf | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/beagleplay-ti.conf b/meta-beagle/conf/machine/beagleplay-ti.conf
> index ca88fdfb..4e69c819 100644
> --- a/meta-beagle/conf/machine/beagleplay-ti.conf
> +++ b/meta-beagle/conf/machine/beagleplay-ti.conf
> @@ -2,23 +2,10 @@
>   #@NAME: BeaglePlay (A53)
>   #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
>   
> -require conf/machine/include/k3.inc
> -require conf/machine/include/mc_k3r5.inc
> -
> -SOC_FAMILY:append = ":am62xx"
> -
> -MACHINE_FEATURES += "screen"
> +require conf/machine/include/am62xx.inc
>   
>   SERIAL_CONSOLES = "115200;ttyS2"
>   
> -require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
> -
> -TFA_BOARD = "lite"
> -TFA_K3_SYSTEM_SUSPEND = "1"
> -
> -OPTEEMACHINE = "k3-am62x"
> -
>   UBOOT_MACHINE = "am62x_beagleplay_a53_defconfig"
>   
>   SPL_BINARY = "tispl.bin_unsigned"


