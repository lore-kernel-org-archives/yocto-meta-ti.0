Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18479.1792659553679162440
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 01:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XfkmtfWr;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=rTJxHzZK;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6x2Gh3298776;
	Thu, 22 Oct 2026 03:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fw/8sAO5684AogJUgeE+SReHn64Wk9KrC9ZTEky1o
	60=; b=XfkmtfWrR6ZFy7YBDwOtYMUNGDh4/7X8eK5AIohYCEN7dwvLLktSkO3DH
	OTFkBPtEEX5g9sNnMacumzuf3FL4xr7tpBj/HFMnQZdLAfX1n8G+Wh1VQFOtOcla
	YMbQIWRmczsadke9Y/TBBwBJBro/QpgbCDpanw7FoRt0Yf2xon+UB7DTbsDxOcii
	sq1T1ASqVUVZhj5fhZAdLCy9+wPZEVKxfBu2m7zMRmUwvaANl0kfNS2rg2l2dbnK
	FpJfGjEwSxRXtPQtpOxibj3btt4sSEynVgUyDN4X8WOollfDGvbUqG4j1VkGepMU
	ARBXgebhmKbCMrAOHpT8hr841uUdw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010009.outbound.protection.outlook.com [40.93.198.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hf9ekj1ej-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 03:59:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzaisESareghrRJqrb78wAUkliQQdE1DzqJfzou+eLyxJSjxAwG8WW5wyd5EcHWTi5TLWI0kprlt+WxRzpLO8JUCpoH/1gt9v1LHWjaKT1YLp/92ZThuFhf6ps0u7Ycp8qdX8W41Ihx+D9kQLfVhbZ9Hi1at+yW+4+fTItN7bfTqgPyEhcjGFTH8UCNHiLow4VbfuRQYr7DnJingwrKTsr0KP9En+Xihu4AH8TtVd4QNY6q8CGwMVvWegPpfCq7u+WDcHYvDUuz4YwHSKnp2kO96L4TJ95Fpmcxir5vw4n4IzDcln6J1t4NF5aBhoZobL4ihr5ApCOkznxtGxrpHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw/8sAO5684AogJUgeE+SReHn64Wk9KrC9ZTEky1o60=;
 b=qsyDD/Ote89dnGUSVmz+S5wOOF5shzjwHx1D4in6E8WkKXoXWSGEP/ahQc5o+dKrMSOQJopt1GyxYmp3kgQ+T9t4gsVYAkxGW1bWyuX6CIuuBml0b5Rw5UeYoA9V/kfBHGvsCBaoEYC0o0YB531931SFyhlSb7DX0P5fvTpUfPyCbLIkxx//HVGDixROw+SyqzA7N0PY2u6ssgconQwA4Iygkm4l5x9Hv1x+swpTUQIsG9VXFpaIS/FbvRYqZMSGvDlTqfXgqj+947wIUUV9QQoOyag6W/6atTkZGyjgwTh3E5mQ9J8fvnZE02imhnzaKIXUJUV6rFpm+YL7MktAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fw/8sAO5684AogJUgeE+SReHn64Wk9KrC9ZTEky1o60=;
 b=rTJxHzZKV6Vy4VrjON4vsqjYKFTK7gGj5UOnW18C92MxurQN/YoS+3jYqNNvhynGu3DaWKq4NpNyOxp2KeTNIUj2J20FdTG6AA+6VyNxp1JFlgxTRWJ4gjltYJJwnzKWQaVgm/5mlj9QX+RseYVKppyNXU7A708VM8NZI6opXo4=
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:59:06 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::38) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 08:59:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 08:59:06 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:58:54 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:58:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 03:58:54 -0500
Received: from [10.24.51.39] (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69M8wqnR1090701;
	Thu, 22 Oct 2026 03:58:53 -0500
Message-ID: <2911c136-e3a9-4012-b00a-8e5b3f06faec@ti.com>
Date: Thu, 22 Oct 2026 14:28:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH 2/2] am62lxx-evm: Add DSI config fragments for
 display support
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
References: <20261021145213.853962-1-r-sharma3@ti.com>
 <20261021145213.853962-2-r-sharma3@ti.com> <20261021195015.GX4190@denix.org>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <20261021195015.GX4190@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 2303af10-e5d3-4398-fa8c-08df301abaa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|22082099003|18002099003|261021121427099003|13003099007|261009223027099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: TBO03Ie/nqq5YLF660tauu1TlwRjK4P+oPR7Q52p3Sh5+N7/QtocDaAlD2VB99VV4IgMxkWhVo8pzy0Jkcf6T02OMfh/yJH9n+PgqSkhUGcNSf1yuEsZ6PDh9tO1JhZ5yBZreRgDldUshZ0ItO7yKXqP8ndRRkfVnDQV2guU2QdPAdOkkZyWZM3mPK/Szyz7iqaqQf6wkz2QI7s93rk24k6nyz912hO94muGHgG3v287jJyPg+mcEZQRxcR/sXR/57MGUbzD3zx2/uzVhenzBiE299w2rs9DlIlTRoEWr2prDKSPguOFooA3FLRz7sBBo6JAu8wNe3rS3KysdxClo7U62vxk+5svnVBn40E3wOe5XLZZgIAzesYplEMeCkOEBw32roIDj2NPypkUVWH2r+0sRRqI1z0Ll3U51Hx2a7wuEQFQOSE0PaZUxTqUWO8oh9H+lkc6o6Roz7ogqs1bWn1hbZfVBpyHdWMwZkDtHxrZ3G3BLsvpjtGTSXfUf1HyYjfqChIyfLvXqz2rhDQVY8nT1qsawNxBZTvDOlFNALabPq1wPqQHKRTr/ZJp62YLrrcTJK+KBd+MtNAp20FA+cAaCQfqfyCMtQFVGXU1FnCCGcYQP1r7yuT2rUrVI8uWi1qwCkzdck1fvn8aBuGWx6NvOUxq38aT2xJPxMl+7nc=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(22082099003)(18002099003)(261021121427099003)(13003099007)(261009223027099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6+gekOx63Mk+sr5is/WyVdxFNkLw+rQaFKajhLdN8zYdjFD4siRdik9+BvC7kopJE0tbCtHzMsnnp6PdSMFrHt2fZQJdU20xy3pk1rLOhFS24lBYanNs9gHuuHosHnc3Szau+Xvoz0DVYx4MueLO20rVttqIWTzNAhmlt+vgYvzj34aeyxF15tMoc/SAafMSC2Ewmt085L7cBzU9ChNqXWBifdJ1Ifrl1HWx0h7Lb+htxE/LycmSV4T0wL64Zl+X6xhr+YCCQMKaLtaBbpZ7NapqfVe/BVQfFNr2tVAYqjzQMPl8tx3YyjknXW/9eLVBzidSdoccFtX/3ZlfIz6saWmn32LjL04OhWmPRx4QxlE6XykJ8hiKr5OT4Z6XxeNebO+cgPtKh+fOJwYFcHQ4olbxJ016NOfvbL1hbG23GRfJLooKDFBImsZMPjkTGvIs
X-Exchange-RoutingPolicyChecked: Y7CSQAfkMRNS1QaqZ4Ju1lQHqkkr0mlEs6855E1YSKZeyKpZDRbYJhl+5wQ/kR4TG1hD5J35gvFEuYenrSFQFaqBF8ZDHdFI7ubPouEGjZkYVMgl4XtaOKV2oJQPF3u8fCHgCXFdtPPptTPyc0WERQgwrT5T5v0tevJ6dsk92ea0SMMivD9dW80yMT1DBMxcoTYhDH7CeHLWbIWarqhXmWAY13oQqTLBbjCw6ctRMnkVOE1jOca7OT9mQk2xKtkeeH/c5XOUj+Qo7Nog+ehOkrb3BgHinBk+WJNvRgab7glUXDT+ZWtssjj4lkGWneC9RKnUS9rAgCeMrn+lOHBx6A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:59:06.7813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2303af10-e5d3-4398-fa8c-08df301abaa3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX2XohEmh7zbwP
 WJou804BzpwFW9vDyEWpUI6gzauRNfhbmTCQx/SZ7nzqseJ6zDWrvCSNMJdbhEoBvU384UaPgEC
 EE/kwrG6aeQoajO2K8Bt9m/CSg712Tg=
X-Proofpoint-GUID: pFLgES13ygY6UWutaUeLVAbsUlHmeVtg
X-Proofpoint-ORIG-GUID: pFLgES13ygY6UWutaUeLVAbsUlHmeVtg
X-Authority-Analysis: v=2.4 cv=Td8DJhQh c=1 sm=1 tr=0 ts=6ad9d05d cx=c_pps
 a=MYJxclL+TLfs1lE1Gew55Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=mTSPhFVBa9BO4JlltgMA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXyzUbMAolLksm
 UPr0EuzVcUK3O7JrcRLfAOiHigcG+0Vw3R6KXRIkpHbeZxYklVu2gfV0TVOO76O84AKQL+KYDmq
 lu0NfRtILheAupLkPGHBfXy6yCDY2giZ74jR8Wy1G4IUC5pjFqaNcL1M11Hk86rKhye5saXks6t
 G4+J/hbCOe3ijsLDbr2fNegg7Z088vHQ7ZMJil2fWDP1WbLvT7Od8cx+kN1IRgDCc4VsIclh9lg
 CzIDcGaHyFZktP+PpzjvCykShQcPJc7sw2KDN42U5+KTKGUYTKlBBhHA4VxdzEXqwO/GnWYyecm
 ehsH5vON7wMfSe0paH9faIidudefmltg77PWRVc2s2iObcx7K1VzJXP9NZZGQ93KDAePWFfzju2
 NNimuyEfjznrOqi68woIbMMJSgjHsxhPTrLpwhf9ggzpWlEZDT66dhBe9at7UJe4Am4nqW9st2n
 lKxxYVoOcju5sThKgrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 08:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20484



On 22/10/26 01:20, Denys Dmytriyenko wrote:
> On Wed, Oct 21, 2026 at 08:22:13PM +0530, Rahul Sharma via lists.yoctoproject.org wrote:
>> Add U-Boot configuration fragments for DSI display support with
>> Raspberry Pi panel on AM62L EVM.
>>
>> The fragments enable:
>> - am62x_a53_splashscreen.config: Splash screen on Cortex-A53
>> - k3_a53_dsi.config: DSI support for K3 Cortex-A53
>> - am62lx_evm_dsi_rpi_panel.config: DSI Raspberry Pi panel support
>>
>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> index 7a422617..e3d3bdd9 100644
>> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> @@ -26,3 +26,6 @@ UBOOT_DTB_LOADADDRESS = "0x84f00000"
>>   UBOOT_DTBO_LOADADDRESS = "0x84f80000"
>>   
>>   TFA_BOARD = "am62lx-evm"
>> +
>> +# DSI config fragments for display support
>> +UBOOT_FRAGMENTS = "am62x_a53_splashscreen.config k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"
> 
> Do these config fragments exist in every U-Boot version we support?
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boot
> 
> Same question for the other patch.
> 

Hi Denys,

This config fragment was added in 12.1 SDK release happened in July 
2026. So, this is available only in ti-u-boot-2026.01 branch. I have 
sent v2 with corrected version along with corrected Yocto version.

BR,
Rahul

