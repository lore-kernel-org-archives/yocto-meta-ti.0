Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2203C61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 08:08:49 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3274.1787990919160802367
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 29 Aug 2026 01:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KBLkWe5F;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gzgVcZC5;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T56V6E3141995;
	Sat, 29 Aug 2026 03:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=NDRfCMAtUFqh3bg7AbuoXq0TpI3CGiSpIwiKxf5ap
	sw=; b=KBLkWe5F/PPY8xNvIBsi+tlhBU5zAYTZiy90AnovPn37MMudOo5h6gk7F
	SUZ2osM1dWGiiASH4kk5RNvU16I2/yIcy6jGkO3QhKmVBygZFnGtp5YQBSyj6p9W
	ToDpMEZ3iSlDxQMhBE7tC+jrTeeHZc80KyydFAPs1ZIg8XS8w98JAOeMuLDIghl6
	Xi1McY4lV7tEWOmjpKlPzKjo8Sf2KHBMT5LpawOxjtIspFr+eglv4PDH4RKhdMWP
	C0XtFK1CO0gnaCubMpWm6YV+38CThZ/BEvcX5Try3MsK41cbTbPPYzfPhxQePY0o
	ndrie/j+aJFP3kxBZWf3kAUtt0dyA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012024.outbound.protection.outlook.com [40.107.200.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gbqr28nj6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 03:08:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3S90bJMMSFGHGELg+5+2uCc6/Dgn1GM9RZtdsE2tSfudXLZZptOKgHeyIWQ42iaOY39qRq6/UCCmcRL5OUotnCYIv6ciIUuQLizHLR9rbjOudQ3nN/VsSTK5HcRddfXqrZ8yTmkHjHbGkSU9vQGuvekyGbp7nG9qgmNkyEXo1zAsYsm0cD0NJ3deR7zpNIhs0XpTMscfTNkguWeasQeloU5PoDWWGWPAmMbcF7JzmsJL6ti8ELiIiJxKYBdKTe9WEIPRjfBbqI/451uuEpM2kPwJHlKy96il+dXa8WId6JEn+2xEvbW+0frd4m1Jp8LCTVHb6PUIzjznoiuMzUIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDRfCMAtUFqh3bg7AbuoXq0TpI3CGiSpIwiKxf5apsw=;
 b=TdUfoL7do+mlyGUpNR06NvzPiZuvynGD/CXSX1gwzOllwFoc/R+ejOGwGZQRTfRvXNtK+BGzD4NJIGs13LIblZeD2N4Iq47miQAO9metmLKOvn0Cze8TOeKU3N2wFGz8OWFkvLnDpUdYqvKpCGFcpPXV6fQHboisckIL9FMgTnt+baMmFGiPmbvCK6x9IMKkGsMKizxQAHziFLCIPErN4hLMOMDdJZcZ/M6ZR8I0LPCW7rjDe7Eb2Cj3GugvfRUeJadK8KqNzb5rpPDKH25+rf2WVBZIu0xZRObt9H/b0WqCL3IQGV4V9zdX12dUg1ulu3zUGmks9Yg8m7m+YIcxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDRfCMAtUFqh3bg7AbuoXq0TpI3CGiSpIwiKxf5apsw=;
 b=gzgVcZC5A0oWy34E91VmqogJ7hGM9RRaAvc7zMJjw6ERYkcFm1RIuwrTEjs05GAdeX43SIRUsUUa4x7xdZE7lY0ejYPNGWPC/q+pclT0ImT2jcOezjfXCWns4dCdiHBa43yYjXp8yWD/9eACClgr8ym/IKXKjBRCXkn7t9ZETNM=
Received: from MW4PR03CA0171.namprd03.prod.outlook.com (2603:10b6:303:8d::26)
 by LV3PR10MB7770.namprd10.prod.outlook.com (2603:10b6:408:1bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 08:08:30 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::48) by MW4PR03CA0171.outlook.office365.com
 (2603:10b6:303:8d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 08:08:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sat, 29 Aug 2026 08:08:29 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 29 Aug
 2026 03:08:28 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 29 Aug
 2026 03:08:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 29 Aug 2026 03:08:28 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67T88PQe092099;
	Sat, 29 Aug 2026 03:08:26 -0500
Message-ID: <c50539cf-77da-4219-927b-4cf72a0ad9fa@ti.com>
Date: Sat, 29 Aug 2026 13:38:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3] ti-vendor-kernel-headers: add
 recipe for TI-only dma-heap.h ioctl
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <s-kapoor@ti.com>, <p-gupta5@ti.com>,
        <u-kumar1@ti.com>
References: <20260828145834.1304057-1-gehariprasath@ti.com>
 <20260828174448.GK19759@denix.org>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260828174448.GK19759@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|LV3PR10MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb99d65-30fc-4432-546d-08df05a4b5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	lvDMz0E9p04hSQsnnDNeHvz+biMu7TPgo+SmMwTWjab9zGeolJ6MKmR0kX3YWLP5++QdoTYH4zaI7k7WCfdz6He4RtlHk6UeSw3+lIcbUU4w7DQABKgZoTRn2duSJ9SEg+rhZnqzdzaak7Agm0sPdHc0NentdNJZy93CLvDA6ZRE81vK6pPx2iafBDmorHSmMeO5JuNBnEb6qv46JAczywkG/UqYzDCaZ2VmliENQ/nveUWFx3005CM+7o1PCnab1jRyWdzDD5R6C4SwSTd71xBlCh1xgcE4kEUjPthSNYuDh5LjHLPf+EiBwW9hbJjlZfcejLFtEzwxQ/uxoO1pjQOXWAgbdeHvvxA6ojW8jgU6TDliSeDTITliHRkppTmrDzlQ08/ElH5QVzi0T5NJKmhSuwG/29zuVBMuWOU2yEwaB4TTV+jZkekIN43ScWUoZ3Vp1SdRFCI3xwhuh2IPATpgL6eOJ4VB4GpwVJedfyt9E/2QS9yKA4TvI+OBA8ePOImfyvDSX/3jqE6rrmhIDJEpnNQpyflnlS7wA8Ytm7x/BUhD60D+ap1M8QeTfper6JqGl6Mn1wjtWLgbuCVihjTxv7w2ZruLiZD5RX4ihXstX2IfjkPJ0YnHU3OkGnqTp56nNo1uCM2qtmaU2XHEEr8xJ+ONfqGHneK8qtwEw/qeDLCkz+y79M6aGi5zfC6f0PaxY4lO+RAHA5obS454lA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0WI0ssbyScgo/ZY1FYlHHxNRTCJfTHa6DvCwW/iosMLhyGK4R4J/JGW0w8O3kiUNuwyKCqCGIJpEIsTVZ19RIM247ICwJB7L77LiD34j2Yu8r/yYHahmQdADYlWGaxSoF1kbodeOsq5PPhUGObUUscYsXjMA1gfQ07RshO2g/tyFNmBGErVsfu0LIJCYGf4Bti6IZnpSL+UAyHbOngUC8NrCGo2FO71oAxvfhcZ0qbzjyNs7HPpWEXkc/1nMX70cme6K5skS+ah6JZDhcDNhRU0CD9SOkTIH7deK8vZ/e2qKrh24bfIdMU4qE6pqRVUrY/B3F85HuL0It/l13Cyvo9VwiKvv1ehlPTqBIpgaQazCDbbvX2fncpkKxFHB6xOE/dmjbmWN6FA0EU7SwY4v1Aeyj4TKSk3BbYpsQuAR+bgmRcnZrC6v7SeQ7LQsn7nE
X-Exchange-RoutingPolicyChecked: 
	OpVlXh9ibJs6lUeS+ydU6G4nGR3QrMkmb1VnBTSA9SgoANJ2+UfcLwvnG1TYIxyoWY0bjN1WWgN6/TfbowtNLax7SZqSdwmyRendWquHVLMJpSVov9hppCmJJOWuLd6kE6xzsTdt3VYwYd0ynIvPmFSbhrmHQ6KuFcsUogG6SVhIMG0ZyCyinzCNGWZovNPVAHz2/txXZ0dy+toQ+9AerNKGLZEdqhqiG/kqlPlGRsvnskQ3OpCUYO0lw556aROetycOaTAvck5X4cwJ289Gag490rXh8NVTNX90qXy5CvE/JNDaKnWiO6G54XpHnqyb7l2mVm8CWX8IEdJ9YsHrBw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 08:08:29.3543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb99d65-30fc-4432-546d-08df05a4b5ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7770
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA2OCBTYWx0ZWRfX1AmW/+6pqpSb
 WAzf338//8GkpJnL1YgXLM4NRUQA2Oxo65rIereNkpNVK/2k1coDczGFREaPqemOECj4a7ff+e+
 bbHObQ+Y6nqzkALeVdOAefQP0MtfqRc=
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a929381 cx=c_pps
 a=sWRNDn+RSbH+kxTJv0thDg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=cN9th1_XAAAA:8 a=j2cuYrLWqIFSORdcfZkA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-GUID: gzFJ4gOSQ5Gwk9ZGKBDI0pteUkouOagM
X-Proofpoint-ORIG-GUID: gzFJ4gOSQ5Gwk9ZGKBDI0pteUkouOagM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA2OCBTYWx0ZWRfX2nUkbMegvCz3
 HesWtcGQZuKWXOACWI1tjjnDWPJRbWk6y2K9QMKMC3KcIl2X8unSii/D7mmYSk/euIKRrIUi2aM
 nzB5ozBZhRjB6At4S0ZIhD8MEgTbuoEZjw4iC4Kl+h1uHB/rdFatbn1gUoAwiri3eT5FCbKvcbM
 XAqHro8qIY4AczakoXWEpnlFyIsvaXK18YHMUE8/hOAxJ0/i2qABEhPNSb9vxtrczbn99omcdeK
 dopgZWK67w1PC2kRkNWYKxmXQfpY+um1As/Z1/kdyoQD4u8MGb1DFfevw0SzbGmReVclbsAi8RW
 XU4TxPwB5ziYrJHsW1eBHu3oreoIej1XhR7nBfx6bAhU/KM2pnTYC0wSxG/iMUzvlx5HmJ8W6Nm
 dEpXWTZmh6RN0XN0Mtudv46XKp1YJL+ElovYP8y4kiPk+0VDcCAfTLoNVxbJ3tE8UnqwU40rMcb
 e/7wKzAhvm1/n0LALzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290068
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 29 Aug 2026 08:08:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20309

Hello Denys,

On 8/28/2026 11:14 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 28, 2026 at 08:28:34PM +0530, Hari Prasath via lists.yoctoproject.org wrote:
>> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
>> downstream. The standard header provided by linux-libc-headers' wouldn't
>> have the custom changes.Copy it straight from the kernel's staged
>> source tree (STAGING_KERNEL_DIR) into a separate /usr/include/ti/linux
>> path instead, for userspace code that needs it.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>> 	v1->v2: Address review comments in commit message and recipe description
>> 	v2->v3: Fix the patch subject prefix
>>
>>   .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>> new file mode 100644
>> index 000000000..5d570689a
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
>> +DESCRIPTION = "Copies select UAPI headers straight from the TI vendor kernel source \
>> +tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
>> +that needs them but can't rely on linux-libc-headers carrying TI-only additions."
>> +LICENSE = "GPL-2.0-only"
>> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> 
> Why do you need this dependency for do_configure? Moreover, since you don't
> have do_configure nor do_compile, you might want to mark them as "noexec"
> 
> 

Thanks for catching this, will fix in v4. do_install() is where the 
vendor tree dependency needs to be,not in do_configure(),will drop it 
and mark it  as a noexec.I see  the cpsw9g-eth-fw_git.bb uses the same 
method.

>> +do_install[depends] += "virtual/kernel:do_shared_workdir"
> 
> How do you ensure that virtual/kernel is the TI vendor kernel? If it's not,
> you'll be copying the original unmodified header into the ti/linux location.
> 
> 

okay so virtual/kernel can resolve to linux-ti-mainline or linux-bb.org 
or anything set by BSP_KERNEL_PROVIDER defined in per machine conf ? I 
don't have a complete understanding of how these are organized in our 
Yocto project layers. Let me check how to restrict to only the TI vendor 
kernel where this header file change is patched.

Regards,
Hari

>> +
>> +do_install() {
>> +    install -d ${D}${includedir}/ti/linux
>> +    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
>> +}
>> +
>> -- 
>> 2.34.1


