Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1998CC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 18:28:30 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52198.1782930503811716702
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 11:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=n8/hg8fR;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=rUKPqf43;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 661GpudK053826;
	Wed, 1 Jul 2026 13:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bzN8tiYhO7q97xIqAAtEnkSC2VEYFa/kKDHkseGqs
	zc=; b=n8/hg8fRK6F/5Yqn4+kgCLfjeWOHlEMOojwNLMkkezPeNolAIu8LbXUYz
	VpcTNzIq37ogZ+fCxKHkEXqsQwjpsXWoLCi4o/2QSzD7iJF19BdAsfLd2+dZEjsy
	raN9zO+XFSUt9uxiS99AsHhY9EK/ew0P2lCXyYpCar2fU0EEkuW8HQINSI061AfG
	e34i9on6rwAUBcdOug6btMigGklydLlLM2kqT8QdfYdHhp85c1M03B/xfNRw9c6Q
	MupxIWMF0cd3/gsykz5o5UhjcPJCC8vsUUfdtJdQkGueWwnp449uG9lVzSRFZUBH
	jxdAP5hCA5RdbSBMNAOt6aaKzpn5Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f52482mqp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:28:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbQBXvAy/s5QIMP8BH6y2APb+qgzSf03ruxSLCaVngHeidVz7Sv+ojA4oEeGo+yQZW8YWIi6a1jx+2OT2CKkYJsLlCkyEpAeMPVSz9Ruo+2VNQ7VQirko0w4aRlyqEqc376Pt/1jAzB633txy3hINBxwTNsqZ2zj7jh2Qm3sVnuHESLidE07M2wHF/plo3R5hCq1VOfx0zb+RJMjG0Fy3I7ufb7Ht8g0MfMb18PNl4OmL4aam1OfklhD4H24N5TLRQVyByS+6DwNaGMrIDuQk4byKLv11wlw3sz9uuvOJSbF9R/U3qKcW1y1Ug3MrHXE91EIlv27n77IdQDZhN0N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzN8tiYhO7q97xIqAAtEnkSC2VEYFa/kKDHkseGqszc=;
 b=uKSsiKi6V3mjhUUBcs5hvIr/zRc/xTt2K7qPngPfiy716q7FBciq87RjWO/A21idEwOcY8eJ+Dt9HHvjKL+vzO+C/QGpxfkhXEqt3IXUl9Na2DVYHTCEAfQsJOqSjySUwwP1sOiokfwXRCkHBjAOrZom/IaLXTT5nk6mmtT0VWApi6JFoyetPB8AuOn32rdS+QIfDxUIm1CMLjUXHwZNMoEs8zbrBqw6iilalIURUgDEreY+ZI3XCFM/BQVjhfH6e7FnS/BUuhcQBfqa0N5kuculrlrNH555faIZfLh1vdJDzf18NYtYj8c/PWtWOeY7R1Qk2YhWJUmhUAHBeMQ+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzN8tiYhO7q97xIqAAtEnkSC2VEYFa/kKDHkseGqszc=;
 b=rUKPqf430eTtwsIZy1iYIzn08w+OX4QG/Y7eDQw/2sMNN3GMhfCE0mG24+CgrrhNLyfJplm7PcVihlm9w431RIsG3/ss/HgQRQdHY7ZcONijEcErw/3K/R9eGQqwlIEg8cTBE1bmt543yzAqdq9E81WEgkLdGC0Sz7elHXvWuB4=
Received: from PH8PR07CA0008.namprd07.prod.outlook.com (2603:10b6:510:2cd::16)
 by CY8PR10MB6611.namprd10.prod.outlook.com (2603:10b6:930:55::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 18:28:15 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:510:2cd:cafe::37) by PH8PR07CA0008.outlook.office365.com
 (2603:10b6:510:2cd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 18:28:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 18:28:14 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 13:28:08 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 13:28:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 13:28:08 -0500
Received: from [128.247.75.243] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661IS8nH1430820;
	Wed, 1 Jul 2026 13:28:08 -0500
Message-ID: <6dc28dc8-3b4d-48b8-a5a3-798824bde02f@ti.com>
Date: Wed, 1 Jul 2026 13:28:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Build tests with
 dynamically linked library support
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260630174314.1561862-1-a-christidis@ti.com>
 <20260630225135.GH10186@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260630225135.GH10186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CY8PR10MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f5740a-1919-46ed-a9e3-08ded79e83a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|13003099007|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qh3nfyYaVCsqeMYLr3gbmwWVrKIU2ASblrsdX+Va4SAAEJ9c+kTP8ZwVE4PL/qy5HroXmP5wGzoduLlA7o3uJVuSwk39cDua247MBP8Fhz8kyNCWGWJQ83eKzaDU5IMmkaX7kGR5jHB3LVMPpRR4AciUOdHwzWxcifF/wzhUhEvbJFT1S0SkBZNYIR9cnY36RjLc9bZiZvHqWXdl135/TrhklQ2VJZ2tv47a/IioYPSwcmlf5cEvuNL0c9ZZowGwrLF+F9GZ2EdZF/Lay023WIVe2wNctQYLFOwZBMROC3TqrkYgW7w3H5wScxjEnxJFErpieIqh+sQ7VhQPNiWjfR/FgMaMN+uRQYgWAEfIhA284E496KP1K0GOsUfWEHTMRCf1ckQOa9+ZniQ7thAXEdWeV9UiFCgtNu5VVtP8Impl5crlA/98scrFeMVTyNZnrAH70b+fXc5aR0jzfjWjJeBiCzdtjjnBNN4vkvuOJ2aNXx2wbZQu/n8tPY1ZuOrRHjmpVGm06VtmEeIBh8tR0cptPcQ1CX2GAWr9o+xixH/MVSguCwRXZYAn8lWh+cW9y1Twf1/vaYxpChqZdhR6kik3NCzDYYr5Mm70Kh1BkaESYcz63hDkAoyS1+rOqmI98PhTB7JJoMmabH9dIfmadgz+qasCil9wynDeDAqaGNEKlnLO9yheqenAccTB9O6nN9V/P7FmBLcXCXk1gTWtxA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SWH8tZbRv5FIdjL3NKwRavv81PFv9XxMnYeRKbbOuKGV3qPLqJ+SK4aPysXBsnIs6C/6WK2XauSoVeQ8Pf60tHq3j67RT+7EkyGgU5VapV2SJtwU4Rpn9xdRCLZ/q2PdQsfQpsccqZyy79pSW746G/e81HHon4UiSK+jnIiJqNKjmv20ng6jUd84cpG8WsfssNbp8r2j1sfzk/IE2N87IIbIJGOerX1tp085woABMdRwfbsKhYSM2aqXYI/4QP9n0y+CWenVtoiWn+Vi9kMOEgl9hHBxN8fTUlm5Cs1zbTMBheMlKsV82bC8VDJTGDapOA4rRpkM8kHKjLDXxZ/mObgLYRuKU5+vy3eU2szdGq+69y3jdkZ7vqCzPF51mklmM+wz62HLGA3YLMRY3yxcUA9AzJxj80RKgGHRR6xbL3CKuAEsaJ6QbOcG/8d5aJpq
X-Exchange-RoutingPolicyChecked: 
	EFpH7pVes6NdyykydHFHpa6Z9ZrlKsdBqUR/NpnlKOOUFMe0X8VjDmP9I/cZ8fAGC76mudcWBiHx8k58nV7b4yx3SEL6uHCxWvcXDeVg7S29H9uRzbIkGt55NA0MIgoZb7E4ctSagJvUcNMsXMZhslrs5FdBeZcuHKe0VL/84a0WiIuZhK/I7WPSFOYHlMrOdklZB0ttdzBmlORETAnM3/0E2kfNHDtImZHFt8/T8f0h0mZeEIRTQHhR/yKtxY4+cm1b4NVXQH0s6GBhhNRYkgNFUbnOputJ1ZMls9o9pzB1NOYEn4APk6dEG+opTKytr3G6MSrZXZ+veSWn/1rFew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:28:14.5102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f5740a-1919-46ed-a9e3-08ded79e83a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6611
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE5NyBTYWx0ZWRfX1zljUmLNlB8b
 CXANkNmfIGt9snNWQglcsiZHPjHrijqI23s6igh65C/F83Hf/5yBYAZTbc5p2yWQU1h+YQ+JMBX
 JjToccJGY/dHKYMYqEyWwFhpVN0ew+7myCdYnpiyFLnpW2U/qxhKOO6V/UGnSW4SqQ9MXoNOMJv
 GM+0P+Oq+O0QdC2XDjzd5U071E+Y57uMUzmM50tW4B30g7VQlvu64Fg4ZDD0AVQ11z9DzLnA1yX
 HHzLmLIrN/Aa75GJsuc8EPSxiv73nwpNUMKcTC336cMHajuttERDfrASMotqAO4seuEPkIptPG6
 p6VuZksymplY9PzPaUYTqsSlJSdfwSwQ8P9+ZWDkOa7wktAGInzpQIU8XKyHwLlIgvlt496JLWO
 BMiM/c9PY8daMfrRGxrRQlOM28C8uQBymahizauaHmcIW9IUdDihDjlTRmcLLgAAi5DtRRO6qpJ
 /ZWK72C8YLaNCoT177A==
X-Proofpoint-GUID: AWuiLjsaESZhUhVQvpMFdSzhP3SL4K3L
X-Proofpoint-ORIG-GUID: AWuiLjsaESZhUhVQvpMFdSzhP3SL4K3L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE5NyBTYWx0ZWRfX2bmuFIxAIZtL
 eiNLxiMl/etXQK1ptec7Q1iolRlVLYBO0IhVU/2ieG6cm7LgZGA61Y78/OPHRP+5LvpEouj0JfC
 LDOEHrYrFx4MsgVQdWy6jyMF69lMJJ4=
X-Authority-Analysis: v=2.4 cv=EsTiaycA c=1 sm=1 tr=0 ts=6a455c42 cx=c_pps
 a=LQDsqUhXq6x2TIKBD9Oruw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=drMDCQlcjXKNizG6SlUA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010197
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jul 2026 18:28:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20114


On 6/30/26 5:51 PM, Denys Dmytriyenko wrote:
> On Tue, Jun 30, 2026 at 12:43:14PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Carry upstream-submitted patch that adds SDL_TESTS_SHARED_LIB option,
>> enabling test executables to be built with dynamic linking against
>> libsdl2.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   .../recipes-graphics/libsdl2/libsdl2-ti.inc   |  9 +++
>>   ...TS_SHARED_LIB-option-for-dynamically.patch | 56 +++++++++++++++++++
>>   2 files changed, 65 insertions(+)
>>   create mode 100644 meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
>>
>> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> index 33ff0632..959818a1 100644
>> --- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> @@ -1,5 +1,14 @@
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/libsdl2:"
>> +
>> +SRC_URI:append = " \
>> +    file://0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch \
>> +"
>> +
>>   EXTRA_OECMAKE += "-DSDL_TESTS=ON \
>>                     -DSDL_INSTALL_TESTS=ON \
>> +                  -DSDL_TESTS_SHARED_LIB=ON \
>>                    "
>> +
>>   PACKAGE_BEFORE_PN = "${PN}-tests"
>>   FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
>> +RDEPENDS:${PN}-tests += "${PN}"
> Now that you are no longer linking statically, you should try w/o explicit
> RDEPENDS here, as bitbake is supposed to detect this dependency automatically.
> That's what Andrew was asking last week...
>
Understood. I was mistaken, originally "bitbake -e" option did not show 
the package dependency.

But looking at the image manifest in the deploy dir now I can see the 
main libsdl2 package is present alongside the test package.

Sending revision.

>> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch b/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
>> new file mode 100644
>> index 00000000..cc435b3a
>> --- /dev/null
>> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
>> @@ -0,0 +1,56 @@
>> +From 96512412805f34ac6328290221c7ad83cde342b3 Mon Sep 17 00:00:00 2001
>> +From: Antonios Christidis <a-christidis@ti.com>
>> +Date: Fri, 26 Jun 2026 13:28:24 -0500
>> +Subject: [PATCH] test: New SDL_TESTS_SHARED_LIB option for dynamically linked
>> + tests
>> +
>> +Introduce SDL_TESTS_SHARED_LIB to allow tests that expect dynamic linking
>> +to be built.
>> +
>> +Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/15907]
>> +
>> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> +---
>> + test/CMakeLists.txt | 19 ++++++++++++++++---
>> + 1 file changed, 16 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
>> +index 288645d73..8e5bd68d3 100644
>> +--- a/test/CMakeLists.txt
>> ++++ b/test/CMakeLists.txt
>> +@@ -87,8 +87,17 @@ macro(add_sdl_test_executable TARGET)
>> +     endif()
>> + endmacro()
>> +
>> +-if(NOT TARGET SDL2::SDL2-static)
>> +-    find_package(SDL2 2.0.23 REQUIRED COMPONENTS SDL2-static SDL2test)
>> ++option(SDL_TESTS_SHARED_LIB "Link test executables against the shared SDL2 library" OFF)
>> ++
>> ++if(SDL_TESTS_SHARED_LIB)
>> ++    set(SDL_SHARED ON)
>> ++    if(NOT TARGET SDL2::SDL2)
>> ++        find_package(SDL2 ${SDL_VERSION} REQUIRED COMPONENTS SDL2 SDL2test)
>> ++    endif()
>> ++else()
>> ++    if(NOT TARGET SDL2::SDL2-static)
>> ++        find_package(SDL2 ${SDL_VERSION} REQUIRED COMPONENTS SDL2-static SDL2test)
>> ++    endif()
>> + endif()
>> +
>> + enable_testing()
>> +@@ -247,7 +256,11 @@ elseif(PS2)
>> + elseif(IOS OR TVOS)
>> +     sdltest_link_librararies(SDL2::SDL2main SDL2::SDL2test SDL2::SDL2-static)
>> + else()
>> +-    sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2-static)
>> ++    if(SDL_TESTS_SHARED_LIB)
>> ++        sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2)
>> ++    else()
>> ++        sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2-static)
>> ++    endif()
>> + endif()
>> +
>> + if(WINDOWS)
>> +--
>> +2.34.1
>> +
>> --
>> 2.34.1

