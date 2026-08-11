Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F7AC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 19:09:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62347.1786475364993213958
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 12:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XVKM3ClB;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ipq5vkb0;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BInqOu2114573;
	Tue, 11 Aug 2026 14:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1yYB6+A4jPAFz473isie4TqLdYx1QQyJtocpxKWJB
	Go=; b=XVKM3ClBzZeeYEvSJ8ts+1TxJ83W9gkS1hrzBXbTJqESDjdp0XolM04Ki
	3tK7R6+tiEX8ELZaHAu0ED9By53zi2f8Yw2UHp71w9xHGfoOOMkNw4tB4QqXkk7q
	Fcsp71R7bHkoHelrfErNlkuI+mVAEAH7bZe+1/vitpsnVp8ThU1HYdacc5x+Gsmu
	CXhmFEnAYDJT1suWa/7rGTfQjueasc5BEx3Stnwe1OsGbi8vNQCbLT5kT2HJSYpt
	8oLtB0Pfktpmue2VecNEtAfeBEXZn+41/AJjQcNgv+eg9hmh5z7uH5O5Xz4rYhVX
	pEJqzYygqSpnAASuDka38tBUG0ZJQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g09c20449-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 14:09:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0/2mfSCdouJMZ3eXHGMDzEvDBNJ4rGvSnr8zSjCq0aFr/efyy2TZrkWUoOXyXakTK4IawmsuHFbFjiUffPKsCubGBy505qIjj7Jp7F+yK7IF18RyFEdiGwEFtGh6mJM326240br39jXVPreF8uqTv7aVkvvA2IU2gulwBP1fjlpMwwNjhSZzcVSkiOcSoQ5QhOLBUcE0Bg9a0v152Xx8KlJTqT9GzG63hi5xRgnp714tXYPBhyqtapL9yZX8/L6DUjtedPSBk4ST35eKQmk2K/eUbZs7cmFLRPckQ21gHHdCoq1eMwBPHLSk20Fwwaf6O6ZfbxuJefHMK7BKOaz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yYB6+A4jPAFz473isie4TqLdYx1QQyJtocpxKWJBGo=;
 b=EQuRpWdI5DIH4c71xIKORYqNa2sVMrFFGUkHnbUxyk3u9XAtAy2lFA2B7MKE3CMzK5GA++3sRn8N/lWq1Gqag+1GA6cZ8X9fmFwYfi3ZpiQ+LAE1gAxQ3bLRO5i0lM57w+72sIgx3ZNt96RSQ1VRzr9dHG8KQ+8xIffeo1rycFXHRlgavaG3jyXZ0z80MTAmKwanVTBhdJBhetx6k+7PvwiJ5jdtgFz9YOzB8nHPv6p0AtAwhNsvrhYj76kHxNcOm8h5AY0O1XRGOuLOYQA2WK5S/c09d6+GSYyjLJ476qKaXwleXlo5VNrUenh1+npbl6ZslLaRasIdWAOtysz7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=dolcini.it smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yYB6+A4jPAFz473isie4TqLdYx1QQyJtocpxKWJBGo=;
 b=ipq5vkb0DNtSlaHH+yFuaEbAebXN++h5wBdELJyDuFiL57fz+VkwTYlj3dgzz49Wb4sLB7+PAGQ8UU/FwIicJSNUJgLWciZcNpogiiNkNOMYxLHdTr9nqgjMzkEUBh/UJ0TU0ncnAyD1sk3iFO/y5i65zwSzPrg62/5PyT66/I0=
Received: from CH5PR02CA0011.namprd02.prod.outlook.com (2603:10b6:610:1ed::28)
 by BN0PR10MB4853.namprd10.prod.outlook.com (2603:10b6:408:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 19:09:12 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::1a) by CH5PR02CA0011.outlook.office365.com
 (2603:10b6:610:1ed::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 19:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 19:09:11 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 14:08:44 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 14:08:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 11 Aug 2026 14:08:43 -0500
Received: from [128.247.75.81] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BJ8hmC704419;
	Tue, 11 Aug 2026 14:08:43 -0500
Message-ID: <40172c8d-e119-4231-8bdc-84203e68e58e@ti.com>
Date: Tue, 11 Aug 2026 14:08:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] weston: upgrade weston bbappend to
 16.0.0
To: Denys Dmytriyenko <denis@denix.org>, <antoine.gouby@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>,
        Antoine Gouby
	<antoine.gouby@toradex.com>,
        Francesco Dolcini <francesco@dolcini.it>, <reatmon@ti.com>
References: <20260811150043.97146-1-antoine.gouby@gmail.com>
 <20260811181911.GG19759@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260811181911.GG19759@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|BN0PR10MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ade279-af4e-4939-67d5-08def7dc06d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|23010399003|36860700016|82310400026|1800799024|376014|4143699003|56012099006|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	DQjFAFKlqjeOvhoLqO2dM348HzpYzc2u/eIWjfq3rQ5dSGFN8ZqDGtDtm6Rw+SG1WPp7GUW6bK/vGEZY/ezslP1wynv/K1HRe1NlAXpRwQuDVV/yf1bCMXyy2jruWMN1TBvg3uUETKLv+MOiRCcZeY6Oc12XMFeR97wWkhJIwrxeM96WOvXNWfTZv82l0Jyx4DqOYQq1Das88EbogSkbRU/UPMqvUp7fIFSQ4n+6lYVSmom79/hIKoTjqrey+nROpABj0k93jolcsDaU1dTJco3WOt/YPc73c4R+whhyDFUjg/3QRWSVK0ZdLRjXAfO3A7B2jK0A8NTuQjza3TyVlQMOwkYcCm06zxNsSoen4aSZxAYPDRU/90MQheJWhFBobHsFfaG/bD2R4zLhkIC8wIyuSEFKObYwaXRY7EyeDKctOc90JQfcbmhZwHqTXdk1EoK5OGHHmSRzVkbgJu/cNk2K9KryRJo04jzJla0rN1zAt/n91kz2uJi+t55Rrt2cnHQifT7Pln3cDPcAbtZZCRYgBbJZ3Jg7UCcmji1lpXREN2bWVj4yYWj9BiQZ3/hVcgxVLCLCRvz0ZwPvkq2bUPxzxbifPRC9ro8Yu5Kil+ewzceCsce1NfDm8frChJ/u9GUPARUDctbN/PqpG69kSaMkA5B8nO31a1UTx8rMRHX3ggEbM8MZ6oIUUo8CpYw0u1dHywFTKTY8psBRpdFyTA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Yqj7K51fawDXkqcZoV4tyrbMijVvoZGSQK0EzO5RFAHIA5KduZBz/HqlqEDhg5C5bAEESd2XkjrFURmIar1pdJXnlytjoTlPtT9fBsRNgceNMw/PmHrv2rx+h6U0EJt6RaN+8fUCHl7B6yKYoMrzZR6YPIDeyHJ+u6Ued7HAu3MZMXMJdwal30rvZh/6g+I3TLeX8Pz9kyuEgSIdjIneY8vfrmORSpi16seOCKB1OwBHMBTiJ+zm2zZW90jrxjLvsHCu8v/qfuUqxfHxcq0kwQ3qYNGfFHb/rS2FBKSUdy/uaBJeVM/Y62kVuUnbIEzJ4mxYXPlfYRcxqDlvEkwguy78pj/0ZTXWjtSqKSPbm5LNsgq+XJ3Q6oOsU3W7W9JSr/KqakZpy/c29a4MzG0fcTScpQz5sMafhRAWwcVAbLaQFnSEFEngSQy5DZ3B0ngd
X-Exchange-RoutingPolicyChecked: 
	E5WxQTjnp8pH7POdsXQJeKpazcHHrfNrL6qjptME3D9icV8ZxlWdZR4ih8XMg3uvjDiPzU8z098CKDNYszsMbrlC1zxSBV7Taxg10nkRHrK6sUQnO1NW3hwxyMvqOPp4NV4sv74lPNgvC0U9g3lY3TikVLLoYOYV9BRg0X3yZkxDZGgQbnZ6O+0baxKApOnvvIdQFp5Afdjp78tXU6/aS6VM2hnR5LKydKx6NJx5DYQmCHWapWEv28Hea3BuUucfSPsaJ9gub8hH5vkRmx+ujU0rEaDwtgDe0Rt/cvxS8h18RqdmPaGt2YPJeUuJOeDcUvcnKrqMcUG5LojSmZB6Bg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 19:09:11.1997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ade279-af4e-4939-67d5-08def7dc06d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4853
X-Proofpoint-GUID: lBajUkHcFaDptvzudl6Pu5pBytjf_FVe
X-Proofpoint-ORIG-GUID: lBajUkHcFaDptvzudl6Pu5pBytjf_FVe
X-Authority-Analysis: v=2.4 cv=PrCjqQM3 c=1 sm=1 tr=0 ts=6a7b735d cx=c_pps
 a=dDG42FMqTjgm/c7QxIpGBg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=m8ToADvmAAAA:8 a=sozttTNsAAAA:8 a=4ROVcmtBLFotI9uThl0A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE2MSBTYWx0ZWRfX19x6l+98GZqP
 Pz08C0pZIKQnIYr3cMBDtsZ5lCD7wfo8VCDxT20gtftYs18cMqoafRqe8bEc7CYki694a8Hhx/4
 0gHlfAaJhHz375yq0v/bTEKm4bg2BLw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE2MSBTYWx0ZWRfX4BQiBb6r7qYu
 sjTM8HNvbd/BPpHpxZ2pPVVG2u9nWRY1zzqro24yQVUTiGH3A6RrNUseNzgLzFA+unvTHOknIpD
 fAp4Rw/GgXyof+4GoqLT0IS6Eglrt/cnybjgyLJJf8BazfenhZrj8nczSwrnLCHMP0lTNapf8nm
 JAKvPSM2E7CjL7oCtZhuhWt/7G64gVR1P4x5cMXLlP6NwGqDEUHns6VwasB3GolHZf0oNSMZZn4
 n3NbhyQvjdU0OCThnOHHUH2AkQNwwBHYUiBqUzM54CCfRszds4HpA6WjN74EilHyaeJkv0F8pcN
 sd1niUTgzPkrYBlEb9vBR7/FjNJQqXfHa745WC5ab1c9hPA3KVUF8i2fa8tu06n12HZGTaJRpAW
 rD+6F0sf/MeB5guC1UstthLklAlwa+bpuQYBSW4OU2uexyvDgZk7zzFVfWvHBjBp1yjqcFTi/YO
 soGvcntmFIqljJVbZbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110161
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 19:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20248


On 8/11/26 1:19 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 11, 2026 at 05:00:40PM +0200, Antoine Gouby via lists.yoctoproject.org wrote:
>> From: Antoine Gouby <antoine.gouby@toradex.com>
>>
>> Commit ad85da159d41 ("weston: upgrade 15.0.1 -> 16.0.0") from OE-core
>> bumped weston to 16.0.0, but the meta-ti bbappend was still named for
>> the 15.0.x version and was therefore no longer being applied. Rename
>> the bbappend to match the new version.
> NAK.
>
> This hasn't been tested at all. The bbappend applies 2 patches that no longer
> apply cleanly to version 16.
>
> I have a proper change that I'm currently testing locally.

The current graphics driver does not officially support Weston 16.

I can run the full test suite for graphics, and see if this move is 
feasible. Otherwise we need to wait for the next version of the driver.


~ Antonios

>
>> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
>> ---
>>   .../wayland/{weston_15.0.%.bbappend => weston_16.0.%.bbappend}    | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename meta-ti-bsp/recipes-graphics/wayland/{weston_15.0.%.bbappend => weston_16.0.%.bbappend} (100%)
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend
>> rename to meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
>> -- 
>> 2.55.0
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#20247): https://lists.yoctoproject.org/g/meta-ti/message/20247
>> Mute This Topic: https://lists.yoctoproject.org/mt/120702649/9164840
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [a-christidis@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

