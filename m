Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A95B1E00D28; Mon,  4 Mar 2019 14:19:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BEA2E00D14
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 14:19:17 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x24MJHiS096720
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 16:19:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551737957;
	bh=JdNSxW824947ewWQh3a4J1H26HW+LtNjbBmhvXJVSbs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bUk8Ry+vcTgl8AG+/3TuVYgo3qNqU/0TfzBQuCNEfe9KWuF4hH7hzISk2SbDH/Gy2
	kHMr4tIe3j9qZZfOYOnGzg82X0SJHei0eybB9oV5K8aJSZm6IDb65eAFzkINbHznrI
	9Str5ECC49Wot3zfZrrdqFmhiPh8/fAMsLvkrJqg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x24MJH1t106737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 16:19:17 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 16:19:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 16:19:16 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x24MJEYq017664
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 16:19:16 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 4 Mar 2019 17:19:11 -0500
Message-ID: <1551737951-45344-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551737951-45344-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1551737951-45344-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-ndk: Correcting the SRC_URI link
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2019 22:19:18 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ndk/ti-ndk.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
index dfb09de..9afde31 100644
--- a/recipes-ti/ndk/ti-ndk.inc
+++ b/recipes-ti/ndk/ti-ndk.inc
@@ -6,8 +6,7 @@ LICENSE = "BSD"
 require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/ndk_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/${PV}/exports/ndk_${PV}.zip;name=ndkzip"
+SRC_URI = "http://software-dl.ti.com/targetcontent/ndk/${PV}/exports/ndk_${PV}.zip;name=ndkzip"
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-- 
1.9.1


