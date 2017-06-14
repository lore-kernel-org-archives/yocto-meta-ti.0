Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70CDAE00B87; Wed, 14 Jun 2017 06:47:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F125FE00B77
	for <meta-ti@yoctoproject.org>; Wed, 14 Jun 2017 06:47:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5EDlIqr028322
	for <meta-ti@yoctoproject.org>; Wed, 14 Jun 2017 08:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497448038;
	bh=GX9rMs2NLahTVtFmA2JRBP2TOeT0hx0LfNVY6iiMAy4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=lP7Gn2tllnOjktqS4o9RQeMPHd1BoXPzWSUpltca9FuHWx+qzT+Qt2RH1r32KZfjr
	DLQHiJP5naSOqXmBwvnMvGRr6b02BcRFqtf87i6C+Un3MqTxhfJ28ioBp4F7nAbAM/
	c+GH5kAPNzfwIICZn5Yw37b0iH+hDBijD30RpUhM=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5EDlI3x030600
	for <meta-ti@yoctoproject.org>; Wed, 14 Jun 2017 08:47:18 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Wed, 14 Jun 2017 08:47:18 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [morty/master][PATCH] omapl138,	omapl1: add "omapl1"
	SOC family as superset of omapl138
Thread-Index: AQHS5HWY2DY2BTmfT06mNE/pd9q8t6IkYGuA
Date: Wed, 14 Jun 2017 13:47:18 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE14C0B7A50@DFLE12.ent.ti.com>
References: <1497379664-2671-1-git-send-email-denys@ti.com>
In-Reply-To: <1497379664-2671-1-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [morty/master][PATCH] omapl138, omapl1: add "omapl1" SOC family as superset of omapl138
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
X-List-Received-Date: Wed, 14 Jun 2017 13:47:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Tuesday, June 13, 2017 2:48 PM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [morty/master][PATCH] omapl138, omapl1: add "omapl1" SOC=
 family as superset of omapl138

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/{omapl138.inc =3D> omapl1.inc} | 2 +-
 conf/machine/include/omapl138.inc                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)  copy conf/machine/includ=
e/{omapl138.inc =3D> omapl1.inc} (64%)

diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl=
1.inc similarity index 64% copy from conf/machine/include/omapl138.inc copy=
 to conf/machine/include/omapl1.inc index 1949642..fb10af0 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl1.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY =3D "omapl138"
+SOC_FAMILY =3D "omapl1"
 require conf/machine/include/soc-family.inc
diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl=
138.inc
index 1949642..931995f 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl138.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY =3D "omapl138"
-require conf/machine/include/soc-family.inc
+require conf/machine/include/omapl1.inc SOC_FAMILY_append =3D ":omapl138"
--
2.7.4

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

