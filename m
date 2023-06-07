Return-Path: <xulin.sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDA5C7EE2F
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 01:24:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3804.1686101049689466767
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 18:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L4zfnkze;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5522b25c03=xulin.sun@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3570pA6S029111;
	Wed, 7 Jun 2023 01:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sTEN2GDMqLyKFyH9DZ7ehKNLIIMyWSeUgH54Cvf8Ick=;
 b=L4zfnkze0kqPAdA9QsZ831qoUIzyvf0Q9kiq2Q/R7Y1kSTRik6H1E9exrft9yOkv3jh3
 lhRB/5nPHl7EALziwAM4fGVwYL5dcnA7uMRlTX+utTxo+iidobnpp8mGL+izw4SoWHFF
 40ki3kFQX+KY9lxugAuG3LoFFgGelqMjvR2LFKixanIdvkCRp9fTGMnKqQvugV5Y9EIR
 QJzRW1uFwzJykWEIbz6D61SlOK+8FkzQXYGa4WtgOsj8ELGRdPa8sdD9aX4okkvsgMPc
 +3wSrlrWHvO9SUZGVj530jtjf07xVY6rGW2L1n5OqNJTGrKICtQ9o5lihwWUEVHQBMIv /w== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2aafr8aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 01:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcOkJ5VMnRpnnC2rKqD8AADS8pnrvxIhyJMn9n573v3fHLIwiQbimHcKxAaVA/XtOJI0lJ6HAH56yIRCJeONgbMBl4RmBfbnkCnWYqEiRkFpdVQ06RpP7AHEresoPsmKi2v9Fxif3emkWJD8TPn0OoVch7l7MCqyNxonU++DiEGvnckDr0KTKOE4L/GBW9Nvv253vWG7Q/9h8xWW5PB6EHdItSaiORVTf4dUv/tDLw2k/8yEj7VfFh0eM6Mw3CcoUlItcodo0GNXvPIe0/UXn9PcyfY59SoA5lI8AyWPQS12cVJzzedObQ6QWAaKmNNSAf1RKdS+X8asZUVj52QhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTEN2GDMqLyKFyH9DZ7ehKNLIIMyWSeUgH54Cvf8Ick=;
 b=VYCExLq3rfOHxMOnBRp9AK9H4KrNvak6fJuv2Qoh/tK3cDwSxOcz7/qzIB7QtGER4DNOirVEdnG2Jll3Hq4Jc2bEe+Z+YT49af9LKCO1jbeGiwDtcxpAUOsxeXJDyBOs805+i8s95znD4cyMoVFv6Ja3tu0zXa1PEMsllHu8ob5b12acQvsVh/GnDHg0jbrAQJyBt4/mDE0wj3sdKpRLXolpNs24qaahYj/PfFa8blLJ3enCNKZYeR26/oxZ8jI50beGvF1nP6tgXnN2AVXP+sElRy7LFTJrTpaZWuw89fO2s4QwGboigw6jLJfMZATBnAw7hss8Eitxe0llKgIIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5)
 by SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 01:23:59 +0000
Received: from SA2PR11MB5193.namprd11.prod.outlook.com
 ([fe80::4b11:55db:3c29:27f0]) by SA2PR11MB5193.namprd11.prod.outlook.com
 ([fe80::4b11:55db:3c29:27f0%3]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 01:23:59 +0000
Message-ID: <a789a021-64fd-eaf5-799c-f923ecea7fa2@windriver.com>
Date: Wed, 7 Jun 2023 09:23:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][meta-ti master][PATCH] ti-img-rogue-driver: add
 KERNEL_CC to make
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, denys@konsulko.com, meta-ti@lists.yoctoproject.org,
        rs@ti.com
References: <20230606033706.32554-1-xulin.sun@windriver.com>
 <20230606210239.GS9226@denix.org>
From: Xulin Sun <xulin.sun@windriver.com>
In-Reply-To: <20230606210239.GS9226@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To SA2PR11MB5193.namprd11.prod.outlook.com
 (2603:10b6:806:fa::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5193:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: df698929-79bb-4026-01f4-08db66f5de77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YMV80BRgnT6RxWvz0UusVwbqN8YULQmI2BldWcblAumRrwplZguxDFcDgpYnQ3wuqFtAj+kw2fBQVFekOTn3ya9BriBmyqy4aOg83/FSPe1ewXDmpvHGGAvcHvnrOnghLUnVs1Kse7nby22rPt4bhhtIxqOZZ7TYp1X++pc/gs/8mko9ZSHYQcnjcSTVc8BgyXAXBOI3tm30GyHjfkI+KjR9IQ1vmRxFkwgH3H93BxKMQ0TyrcUVJ34WUsl7sTZS227y4wLCfCL3dpUe4p8wLtw9f/lEweyKJVzSw7OWeVpjEjD9SlUXjtmxQ/6Hs5xq+7XwdHyq+JvxfX/k0bfB9YTDAlbIHHeGhZOqAFN9xqJh1/+CLH4FpUVR30ILQmmAQ3cAAbA9AT93S5i92wnwjXng7f0Pj0aFDeccCUoQiIX41Rq+mdpB+RNQj8YCBiAWfl6B53gnVNpTjnKnV5okGYmrUBJdIbdGYm1pCJJ7943k/A0yL9MW/ZAv+MhPmGXWUO2549vKXO/bpk8MV3MITIS7psLqeqs6cdSzWwNbH/P+BRFFKeEQzbRdIV5TTnRz9/gbMzNseMfrKgxvGf1xAWJZB9cqYQ9iQMur4nYPeC4XlTztB4fMH5KktGGPLmKZFqFpa22n0MJ5BMbsIUzxEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5193.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199021)(36756003)(478600001)(5660300002)(6666004)(8936002)(8676002)(316002)(6916009)(4326008)(66556008)(66476007)(66946007)(41300700001)(44832011)(38100700002)(2906002)(26005)(6506007)(6512007)(31696002)(53546011)(186003)(86362001)(2616005)(31686004)(83380400001)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVBrZnNSSzdWWDkrUk9CeWxzN0pvTDMveFFoeHF5SjY4SnRWUUQrWXNBRW1r?=
 =?utf-8?B?STkveGcvajBseXRRcExNSUFmaHMyY3F5T2oyNzhIdlZxSHVib3h3RnNoSExT?=
 =?utf-8?B?SUhVNEtTdHQzejhiemJycS82WE5sYWp2OXRvVy9OUUp0dmY5WFNFQ1dFejhx?=
 =?utf-8?B?bktQYVpDbVkzSG9KVWZHekM3R1E1UnluMnFPVFZJWmJoS0JTOERMaHp0RVhV?=
 =?utf-8?B?N3AwS1F5bFdpZTkydkFjQVNDK2FCdE9Yc3NUNXMremozQUtjZ0JMRkh2TTU5?=
 =?utf-8?B?SHZGV0xveGdITitYa1FjdjltRGg5NUUxSWJUdmh6cVNHNkxzbVBINUpWalpE?=
 =?utf-8?B?b0RvanVsMm9nL2tlWFdNWjB2TEpzSG1aMWpKVzdvYWVORGZiMHVsVFR6Tkhk?=
 =?utf-8?B?L1R2N3FqSTdVS0M3RytMclhoWEQyby85SnpwMjZ3TWg4MXJTejl6TzBlUEIx?=
 =?utf-8?B?M2daNCtrU2NnT05pdWc3VXltVG9GeXhsL0s1Z1ozVGxxNUpMYWc0Vm5GNU5a?=
 =?utf-8?B?QkRhekhwKytxazlxUjlPdi9jUnRWSStscXpjN25MOThpWWZGTmZ5dkg5bUc5?=
 =?utf-8?B?dlRlRERDUFRGY094cUF6RHIwSU16YThzR0phRVZ3d2VCa0hMWFNJV0hBTUtj?=
 =?utf-8?B?SU02NTlCVXhVRzZpYzhrNzFuNURBRE1FUFhDMko0bGN2LzJXbkQ0N1dUZDhM?=
 =?utf-8?B?WXVKcVI5UklQeUZBc3pJR3I2cFI2M0c3WElydmJwY3Y2R2hBcWphM2QwSVNL?=
 =?utf-8?B?dXdrRFM0S1VEcWlaTDdNelA3aVV3aVJUdmxnOFl0OFpUNTVwSDhOZXAvVUxW?=
 =?utf-8?B?ZG5Pb3lRYjVzekgzbkhjRkQvV2EyRmVUOW1QNkU1MjAwS1lPTk9MUjFEWHFS?=
 =?utf-8?B?SU1TNE13S0Q0eXBDclVOM3hxblZULytVK1NFOWpJQmFlUDNCRU5BNkIybjIz?=
 =?utf-8?B?NXpDdzlRMVhEVnBjVTcyS016cGxqYnh2aTAzRWNIWmtVckR1R3hZRDFyd3oy?=
 =?utf-8?B?aTZGeTZGY1ZGU25PRGcwU3R0UlJLUTBxUkxUbitDcW1NN1RGdHdGKzRjQ2JG?=
 =?utf-8?B?U0FGZUxsdEpkNmN2NVAzNFpUYnpLYlY1Z0lkNFZIYXYrbnlwOGc3b0tBR0F1?=
 =?utf-8?B?Vmd0eWZFVWZKMW9rdjVlaVp2WkpFYTkzSVorNFZYNG5IOEMxSHFPeGxDSEs3?=
 =?utf-8?B?ZDFYWWNjYjBMNDhGWWZBZGs2WURkUWZ4bWtWOUw5QUx3UzlnSytjMnJTMmN0?=
 =?utf-8?B?c0hsM2g1d1BYVjRGOHRzWUVPenhlNXlZbmR3bFV4TSswK0I5SitCNXA5WklH?=
 =?utf-8?B?QnYwVlVnSHRBOVJGNmx4T1lieEdCTXQreTl5dHpxSklNdDlMc2RMczhTeU5m?=
 =?utf-8?B?TWFkMndYSjdCVkg1Q1lMcTdoRFVmemdLbU5rVElMQk03T2haTnM3RjE5L1dK?=
 =?utf-8?B?WldoblhTNk9YUmkwdXI3SUFVUWRsTGZuSWNXSVd4UDNDSlhDVVkzSlJwOUQ5?=
 =?utf-8?B?R3VhSm1OU1E4bEw4c09KNUZuTFVQUnFPeWtNQWJ1MGp2a0JRYW5BOEFPejVy?=
 =?utf-8?B?eFVrUWVZckZFbFVqWmVDaEhQNXQzVUJmOW1sZU5jNHl4SGlFNGVnVDM3Y1lh?=
 =?utf-8?B?ZlNPYTJtOFlxRndIZElFNjhyRGdFcUxnWjRxS0tFQXRXZndUaitiY3JJMDky?=
 =?utf-8?B?WHNTbWh4NjBQdEVOMHFTWG1YK3l5ODRCTUplMkZkMGFWQTlGR3h5SG5vYzd0?=
 =?utf-8?B?eGk3ZldrYjdkZ0FDTnRvbE42RlRqejVNWHJaeUMwaExUYWM1dkJwTGlHTlJU?=
 =?utf-8?B?ZjdFZFNRb1BCRWhnQWJBQVU2SDQxcTY3S2tybEpBQkxhVDU3NGNEb1kycDRU?=
 =?utf-8?B?ZTAxcEpPSHlYMXRSd0FlSXArbUxYZTFKQzl1RzEwYVRTWFhXNXpucXlqMXpO?=
 =?utf-8?B?NEdtV1pVc3hlQjJTSmpJZkFZQlJOWG0xNm90UDR0N2hZNFZUZi8wR2NVa21C?=
 =?utf-8?B?VS9BMlJnU2hZQlRmL2t1TGVzemJ6Z2hjbDhuWTRyNk9lYUxWNHNjQlRtMHJv?=
 =?utf-8?B?VW1BaXRpTEpEVi8vYVRoVS8rcWE4dDRHYXVWeWZZSkpOaCt6aU00VHlZNVpG?=
 =?utf-8?B?NENvZDZadXhqQ3NWUUlGYlpBdXdpRll0ZU9JaE0yMngzYVB1L1BNR0tCdFdE?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df698929-79bb-4026-01f4-08db66f5de77
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 01:23:59.1475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/KDt1r/oAYZV6pAAaeI5sNG573M+aZ/zgWN4YZXumKaJEFalmhydHqkPWvTpXH4chfRSx+ZvyCMSAnI/lCOjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
X-Proofpoint-ORIG-GUID: Td_MIJO90WsWtTBR46HJ-QvyRquKYq2k
X-Proofpoint-GUID: Td_MIJO90WsWtTBR46HJ-QvyRquKYq2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_18,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306070009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Jun 2023 01:24:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16684

On 2023/6/7 05:02, Denys Dmytriyenko wrote:
> On Tue, Jun 06, 2023 at 11:37:06AM +0800, Xulin Sun via lists.yoctoproject.org wrote:
>> Bring in KERNEL_CC variable to avoid below building issue:
>>
>> WARNING: ti-img-rogue-driver-23.1.6404501-b do_package_qa: QA Issue:
>> File /lib/modules/6.1.31-rt10-yocto-preempt-rt/extra/pvrsrvkm.ko in package
>> kernel-module-pvrsrvkm-6.1.31-rt10-yocto-preempt-rt contains reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>> ---
>>   ...0001-kbuild-wrap-cc-in-double-quotes.patch | 47 +++++++++++++++++++
>>   .../ti-img-rogue-driver_23.1.6404501.bb       |  6 ++-
>>   2 files changed, 52 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
>> new file mode 100644
>> index 00000000..6faf6fe2
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
>> @@ -0,0 +1,47 @@
>> +From 48ac628f0c6e679c165f08fec18818f802b535d1 Mon Sep 17 00:00:00 2001
>> +From: Xulin Sun <xulin.sun@windriver.com>
>> +Date: Tue, 6 Jun 2023 01:28:31 +0000
>> +Subject: [PATCH] kbuild: wrap cc in double quotes
>> +
>> +Set the CC variable correctly, to avoid below building issue:
>> +make[1]: aarch64-wrs-linux-aarch64-wrs-linux-gcc: No such file or directory
> Upstream-status?

It seems the upstream repo does not provide instructions on how to 
submit patches to this "ti-img-rogue-driver" git tree.

https://git.ti.com/cgit/graphics/ti-img-rogue-driver/tree/?h=linuxws%2Fkirkstone%2Fk6.1%2F23.1.6404501

Thanks

Xulin

>
> Anyway, it seems quotation should be applied not just to CC, but to other vars
> like AR, LD, NM and OBJCOPY. And CROSS_COMPILE and EXTRA_CFLAGS are already
> doing it correctly just above...
>
>
> Randolph,
>
> Can you take these changes to upstream repo so this patch is not needed in
> meta-ti? Thanks.
>
>
>> +Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>> +---
>> + build/linux/kbuild/kbuild.mk | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/build/linux/kbuild/kbuild.mk b/build/linux/kbuild/kbuild.mk
>> +index f65d6a4..2085766 100644
>> +--- a/build/linux/kbuild/kbuild.mk
>> ++++ b/build/linux/kbuild/kbuild.mk
>> +@@ -97,7 +97,7 @@ kbuild: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile bridges
>> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
>> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
>> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
>> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
>> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
>> + 		AR=$(if $(KERNEL_AR),$(KERNEL_AR),$(KERNEL_CROSS_COMPILE)ar) \
>> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
>> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
>> +@@ -133,7 +133,7 @@ kbuild_clean: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
>> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
>> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
>> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
>> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
>> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
>> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
>> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
>> + 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
>> +@@ -160,7 +160,7 @@ kbuild_modules_install: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
>> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
>> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
>> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
>> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
>> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
>> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
>> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
>> + 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
>> +--
>> +2.35.5
>> +
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
>> index 76e3d801..b3fba3c4 100644
>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
>> @@ -20,6 +20,10 @@ BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>>   
>>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>>   
>> +SRC_URI += " \
>> +	file://0001-kbuild-wrap-cc-in-double-quotes.patch \
>> +"
>> +
>>   S = "${WORKDIR}/git"
>>   
>>   SRCREV = "93c66ec66136654849809132b86d3b880ee96ed6"
>> @@ -31,7 +35,7 @@ TARGET_PRODUCT:am62xx = "am62_linux"
>>   PVR_BUILD = "release"
>>   PVR_WS = "lws-generic"
>>   
>> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>> +EXTRA_OEMAKE += 'KERNEL_CC="${KERNEL_CC}" KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>>   
>>   do_install() {
>>       make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>> -- 
>> 2.40.1

