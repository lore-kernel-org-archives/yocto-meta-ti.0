Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583B4C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 02:56:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.57692.1679972188834691027
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 19:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O0EKjq0O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2451438e97=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S1urJb008705
	for <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 02:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=AtUfbScEDu5zdGncdrHzFrVZRyNoayWIJDbKvVUjJC8=;
 b=O0EKjq0OMOY1HjGsH+kVHUWjw7oovfOFM/ycUsV9nupKa0YjqTvtUj4YBbj1TM44pg1q
 RUEp8Ta1V6nQZehLsLoFM1L1LQ0bwnOvhXFlP+hYqHXWsQWhh5rA6js8jHxng5Y+tZYV
 0IcrO+/jB5OrsZuHEeXl1i3PC+I8vLxv2+wn49dHhA32JscF/jwCG/Ez6LdzsftUlwlq
 IAxYoGPO8NA0cD4956deYhFC6YrtNnRATljACZnsWsXlZJtQkv8pmkGfYnxuayhGDn1T
 kQbjGrenomwqPXiOHJp6MfRndMvSUNN5JF+LpqBCKkmcCxR3g5qOL+j1pin71S6kR7gL Kg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php642qgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 02:56:27 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Mon, 27 Mar 2023 19:56:26 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 27 Mar 2023 19:56:25 -0700
From: <kai.kang@windriver.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [PATCH] mesa/mesa-gl: remove version from bbappend file name
Date: Tue, 28 Mar 2023 10:56:21 +0800
Message-ID: <20230328025621.15198-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EryzH-IQ3G7kfR88eoqRptLbokQ9GG8M
X-Proofpoint-GUID: EryzH-IQ3G7kfR88eoqRptLbokQ9GG8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=847 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280022
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 02:56:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16247

From: Kai Kang <kai.kang@windriver.com>

Remove version from mesa/mesa-gl bbappend file names that no need to
rename them when mesa update.

Issue: LINUXEXEC-26101

(LOCAL REV: NOT UPSTREAM) - Send to meta-ti on 20230328

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend}            | 0
 .../recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend} (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} (100%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
rename to meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
-- 
2.17.1


