Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E836E00B9D; Thu,  6 Jul 2017 10:26:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF706E00A9B
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 10:26:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66HQsQ0014858
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 12:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499362014;
	bh=PQ1LzFcYW1GA37VPbW9EKIJiHCEoHfmy9XgcownDj+U=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=S6LH00t3QZDdeTp3qkZ/vliaFy87k4neiD7IV59CL4SJ/YSH3TabdBoMnPD2nV8AJ
	dde1qZfjHD+wOtLVeCCrhvVfHEF+DofI5ZCk9jHiTirDus7m73DBqkKmgtqZWIST/x
	RwcT110b+VzfiAuTr+nCiuuEXTpUoFtMKRyGF7fU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66HQsM1014391
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 12:26:54 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 6 Jul 2017 12:26:54 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Pang, Ivan" <i-pang@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] ti-staging: Inhibiting sysroot strip &
	package	debug split
Thread-Index: AQHS9np90ubWCWAwrkqci47GnHxIRqJHDPYA
Date: Thu, 6 Jul 2017 17:26:54 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A74379C51F@DFLE12.ent.ti.com>
References: <1499357178-23074-1-git-send-email-m-radhakrishnan2@ti.com>
	<C45960711C772449A33A51ED1374F08A40626766@DFLE08.ent.ti.com>
In-Reply-To: <C45960711C772449A33A51ED1374F08A40626766@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-staging: Inhibiting sysroot strip & package	debug split
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
X-List-Received-Date: Thu, 06 Jul 2017 17:26:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The board module failed without this patch.
So, the references to ti-staging.inc needs to be removed from ALL the recip=
es?

-----Original Message-----
From: Pang, Ivan=20
Sent: Thursday, July 06, 2017 1:08 PM
To: Radhakrishnan, Mahesh; meta-ti@yoctoproject.org
Subject: RE: [meta-ti] [PATCH] ti-staging: Inhibiting sysroot strip & packa=
ge debug split

We had a previous discussion on this ti-staging.inc file and the conclusion=
 is that removing this file is the better way going forward.
Are there specific recipes that needed this patch?

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Radhakrishnan, Mahesh
Sent: Thursday, July 06, 2017 11:06 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [PATCH] ti-staging: Inhibiting sysroot strip & package d=
ebug split

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/includes/ti-staging.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-st=
aging.inc
index b588805..ae523ce 100644
--- a/recipes-ti/includes/ti-staging.inc
+++ b/recipes-ti/includes/ti-staging.inc
@@ -1,4 +1,6 @@
 INHIBIT_PACKAGE_STRIP =3D "1"
+INHIBIT_SYSROOT_STRIP =3D "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
=20
 ALLOW_EMPTY_${PN} =3D "1"
 ALLOW_EMPTY_${PN}-dev =3D "1"
--=20
1.9.1

--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

