Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F966C77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 07:42:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44942.1685346157495311654
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 May 2023 00:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DdlbfRJr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5513157f7e=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34T7M1lE011641;
	Mon, 29 May 2023 07:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=X/AO3RepszWg4RR4GJfkjLbA+KwQjff9sEclnF/lz2k=;
 b=DdlbfRJrGwLBZHAhv/9KMe0hdcuT385QiO48Q3aG6XlpOBvQ1qG0RODqnQeKtX4VtfBy
 RXpypO4TZiOiABZFR35qCwHwpAQIJn2DSVKz/Ew/4Ya0iyf0za7cCGRukjFxDhwvTESZ
 t1ktIKlfNReV1sAukmgiuAiDvzc2RisH3udZnps68pvDTey0824eX1VK2tT14vJ0yFej
 sQSF0GTnKu/dlbAZJVVYvOWPkZpZYluu6l1Ku2GBSeoYe45Uy7HAQxQNtBvyESbaBASC
 6rVLOFzZI+tCnmcxtb8a8Z+It6D/eFqt7Vi9HQILjJDSzbMV/WuAC2vC8ENxSHTZwmPT aA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu730sku9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 May 2023 07:42:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX6lHbnNQD0UeXgtt6kz/YoQwN20NMQob8Qls3iyoxAo2+7/rIaU7K8FdeRTpCRMzVexFR5wF36AKR9xPC6fWATACyCbmxxb+Q4VZxp6bJvqZuSP7qMdTYuQFeivEBHTWGfJnamIH0YfgBUUiz93/56iLkKt0gveUamvSETEhq5haIFj394bqNI5yX+V0dZLFxheJgEMk5Wkk6MABeXMOvS+L53RsDIYfvMl70GhnJF9xAFzbyGzZwNM4bPYHoSy/rCInkWUBtKABNIw+ftBFX49a2Gjmky3obC9QyC+LsoBWML1w+UpMW7iPdHuEoJNevGwcjLAeOx4wlqzE8hsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/AO3RepszWg4RR4GJfkjLbA+KwQjff9sEclnF/lz2k=;
 b=KaJzwcBu2QuXkdQSJiZMVb3tecalz8TMfiBQ/PQc7sXfxYWdwSwxgFZRJPbpA39QYSJfZRcgA0B4c3b6JykTilI/vgfJyNTHkIEk2VcQyStW8PuXurAU035nlPeC5SSAFXuOnSnz/ZDzUDtzhxMleiIhG1PLlZdKZGUWAvkD0Uk+NRkJWg6ntFghtG1+Ime+uwrWovuHu//D864oQGQ0gcZpBqtNUoYtAWAlULHvq2fXbVEOxGkgk/e006sesMSkm/hY8fDCO3Dr+d9RPeTgjaJ8/skmrNAI8fV/vKkCmrAZn8BNuqBqptaPvJUS7JwthKyuqA3gzl0RoZVmsmUaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 by SJ1PR11MB6082.namprd11.prod.outlook.com (2603:10b6:a03:48b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Mon, 29 May
 2023 07:42:31 +0000
Received: from SJ0PR11MB8270.namprd11.prod.outlook.com
 ([fe80::7f82:e88d:5163:7ce3]) by SJ0PR11MB8270.namprd11.prod.outlook.com
 ([fe80::7f82:e88d:5163:7ce3%7]) with mapi id 15.20.6433.018; Mon, 29 May 2023
 07:42:31 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: [meta-ti] cnm-wave-fw: Fix old override syntax
Date: Mon, 29 May 2023 15:41:02 +0800
Message-Id: <20230529074102.909101-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0232.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::18) To SJ0PR11MB8270.namprd11.prod.outlook.com
 (2603:10b6:a03:479::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB8270:EE_|SJ1PR11MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: fc851700-71a8-4920-2f1d-08db601841e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T6F1PwffpyhmB2EFFIp0iV8ONgYV1eDD94JvZxLRCuZljOE5O3KNtpAW22+hIVrcYcPZT4W5SKnVe22p3qaYvXE+wTek+DLIAh1w0O7oIvN+2w8Ud91UBkVi1YOlCATflmdv3VZe4owo/Uc/1vV0sEG6NWtJTxV9xsLQqvpLbC7Otwz6WoyciSQx4gVPIHl6q2c4AuvM4aE5IhySNg9VFwpy6+wguInCPuSI1QG1R98FfgyxGkUeMo7zxz5TwOj/3N97nvbNrb82gFlKi3SZdxaYJdzRtV3aTzH5By5JqL8eAr5ufh7w672/KZHOKB+kYRWXfEphLmp73mv81DmxD1XuXAq+Anl754m3LIruzXA+SdUy+3Gs6xwa48zsILYMeM1muZy7CUNoNP6WfwO2zevlodMd9LeIIeOlu1NJKHK5Z8T8mJYjzr4nQnEhUN/FIo8/gV5suY7mE5C7afo6TfaiN9Jyb77VcNP/FHflNUy9WSPstXFPR5Eyc7Grcnvym4+TD2e+j6K50UtbYRtQ9MVWfMBMnQcro0oKYNTvBHkg+cKfANlkg024djBJ811UltkVHjMeSF+nAoOc1+xuPznfu5+wudXzKaXjwU+KOqi7EiQXHiL49EicXdIxxRuL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB8270.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(346002)(366004)(376002)(396003)(451199021)(110136005)(186003)(83380400001)(86362001)(478600001)(2616005)(2906002)(4744005)(66476007)(66946007)(36756003)(66556008)(4326008)(6512007)(1076003)(26005)(316002)(6506007)(6666004)(6486002)(52116002)(5660300002)(41300700001)(8676002)(8936002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yZjcTniFUFtLzshWkJjpm2E+SecNfZfR6ydGA0xNUpMOHjgC5VFsNRmLyLlK?=
 =?us-ascii?Q?wec1k45IycYh/89zhOo4kk2lAgU8LJnETfYz1TV722D72dtQvjq49cj18Reb?=
 =?us-ascii?Q?hwo6WdMeoYZw23TXSzkkUM6LrXw/P+eup699UZL13bkD9iIe6wLCgV/HzuIL?=
 =?us-ascii?Q?ROaQ/V7cq8IhGAYS4gJHAtYF/nR9wmA8OJyxqY/7KK70phSaDuR6Q7tImSmi?=
 =?us-ascii?Q?IKMGdbDIUnn2VfzTobE5oaF7/fn/MxPJhwHthDTCVyDfufkmuLrzLpssEEMC?=
 =?us-ascii?Q?RvzQ0uXBKwSn0Qa1f5uJyKoQgptttwQD0ZJ6e34iB4Ji9k4aLmPNfOvGC1Nc?=
 =?us-ascii?Q?2gpQuWyUpxGUOogJfbNc8w1NJHw58ct90Tl4Cao+PuCz3zUsdpyKzZV7xGNs?=
 =?us-ascii?Q?hGp4CgqgHLylVsC8rKlX3qz4NH04elzHI3aYrmHA8wCHIN0uf+yiU0niGtEE?=
 =?us-ascii?Q?OvN0WT9nHbZlEQeH2b1qac9ovLkxQNgsKOpq8X0On1sHpGqDGtz4VN+Z5uHk?=
 =?us-ascii?Q?avZsZV72CM90KHcMUAuJNWNzbTvhiGRyyCbor8qODzy758Xu3OfSx34ZKWf7?=
 =?us-ascii?Q?ScdNAtRhZn1zoOQaRmBs9/MYsXMdsASWK+U3/lYAH7qhe6UW8Bs7tCysf/6c?=
 =?us-ascii?Q?w8XvK0aMWHsrT/FOtU0PL/mNMDHz3Js6qkk3ZrRzxN7o4VHEVUVQsx/2BwPS?=
 =?us-ascii?Q?t1unTIHKrAy7qjnaJzweX9IucEaXTrQrGf3sqUioDYy1iZ5AsP2mIOZIP3jm?=
 =?us-ascii?Q?TQkgB/0iB1SrqIwqZBUpBE3AZPfAoeiubk2cYa1uZ5FE6nisPh+MtTORzfWV?=
 =?us-ascii?Q?MmJWDwaJM5KdpyIBTC18EMWqZ/VivY2i2ZX+E+mlUwzn9Gotm/1UlAlVnyTC?=
 =?us-ascii?Q?Q0s5TqKenwBBCzyNhYtOPePaVZnD6e5Z5Oriam3cmpOelU4rulMAL1TacdFi?=
 =?us-ascii?Q?LcaXdCS7FdT3/ksQcDp4gkAF81Pqr672QjopOcvrtxwxKdmf+reGLdgtztXJ?=
 =?us-ascii?Q?9pCwDosK7oYrq62y1Q8aOGx/aB041PdYGb9nB7Q7DN8WFFosA3AMzYrrGxJ/?=
 =?us-ascii?Q?LX5Q1x0DDYmEVu6vtzG5ZpcJb/X6ZQWa7bObqEViB9ReCsBtWJflgpAU+EKt?=
 =?us-ascii?Q?dRMzT2MajSgfagWM5JJS0zEfWdQDrKzehBgGtU36Rb58RHKXsOPxa8wbbsAc?=
 =?us-ascii?Q?5HtbjCHREPjz3ed6irjpZrIrxuFMH2nF0RHoGr+OsICrHjz2ybJMxQDHVpbp?=
 =?us-ascii?Q?eZiBuENOYLou2QYhV5nxK/uMjkpTfNZ61l0SpKnx1IZqDh38Ntu7ATj0e38d?=
 =?us-ascii?Q?ZSx0iKJh+g8jENYT0y1Q3xfqf/ABjgaKFqlr0HOpl4q7YXpmjZh/elv+2HwF?=
 =?us-ascii?Q?4is26QiEWTCmbLrpEfWxQopNvfuI1KAPbJAQ5l/Dx3uvd9Vy+gNHmoRv3Xwu?=
 =?us-ascii?Q?cB8rVlzoy7lKMcujFXXm24HpOn+1rWbcDEwrA25ARKfRv4IH/lwcCvT0mDN4?=
 =?us-ascii?Q?V7XeQ2QchDx9MUbO3afsOCmYAI7w7x6kENMkGCVsLK7UhR3/+03iSWtikps5?=
 =?us-ascii?Q?NCRXIKHB3LpDJY0jq5sapDBQydLUEWZ6FzPef7Tl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc851700-71a8-4920-2f1d-08db601841e3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB8270.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 07:42:30.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBGxpHTlOGrXDuNrcTtoOoaU4i5BsP5KzPWHCAym39dqyz3PsZKqzMRoD8y0UL5CGCHB6qsyKbpFBR1pJwWUPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
X-Proofpoint-GUID: 64HxdJtdPQh03QhY_NUYsok6TsiGAx-j
X-Proofpoint-ORIG-GUID: 64HxdJtdPQh03QhY_NUYsok6TsiGAx-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_04,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=733 clxscore=1011 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305290066
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 May 2023 07:42:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16618

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 2f75f4e36832..a667d3356c34 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -27,7 +27,7 @@ ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${nonarch_base_libdir}/firmware/cnm
 ALTERNATIVE_PRIORITY = "10"
 
 # Set up names for the firmwares
-ALTERNATIVE_${PN} = "wave521c_codec_fw.bin"
+ALTERNATIVE:${PN} = "wave521c_codec_fw.bin"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/cnm
-- 
2.39.2


