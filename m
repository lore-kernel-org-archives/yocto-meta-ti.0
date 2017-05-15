Return-Path: <niko.mauno@vaisala.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FF8BE00911; Mon, 15 May 2017 04:14:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [193.143.230.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 64 seconds by postgrey-1.32 at yocto-www;
	Mon, 15 May 2017 04:14:44 PDT
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E75EE003E1
	for <meta-ti@yoctoproject.org>; Mon, 15 May 2017 04:14:44 -0700 (PDT)
IronPort-PHdr: =?us-ascii?q?9a23=3AAm7NRBKILLgJHveLK9mcpTZWNBhigK39O0sv0rFi?=
	=?us-ascii?q?tYgeI/nxwZ3uMQTl6Ol3ixeRBMOAuq0C0rGd6P6ocFdDyK7JiGoFfp1IWk1Nou?=
	=?us-ascii?q?QttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBAj0OxZr?=
	=?us-ascii?q?KeTpAI7SiNm82/yv95HJbQhFgDiwbalvIBi4ogncuMgbipZ+J6gszRfEvmFGcP?=
	=?us-ascii?q?lMy2NyIlKTkRf85sOu85Nm7i9dpfEv+dNeXKvjZ6g3QqBWAzogM2Au+c3krgLD?=
	=?us-ascii?q?QheV5nsdSWoZjBxFCBXY4R7gX5fxtiz6tvdh2CSfIMb7Q6w4VSik4qx2ThLjlS?=
	=?us-ascii?q?UJOCMj8GzPisJ+kr9VoA6vqRJ8zYHUYZ2aOvVxca7GYdMaXHBMUtpNWyFPBo6x?=
	=?us-ascii?q?aZYEAeobPeZfqonwv1wDrR2/BQmvA+Pj0DpIiWXr3a081OQsCh/G0xYhH9IVqn?=
	=?us-ascii?q?vUqM/6OL0OXuCyyanF1DPOZO5Y1zf67YjHaBEhofeUULJscMrd01UgFwTAjlmI?=
	=?us-ascii?q?qY3lOC+a1vgKs2iD9epgUuCvhHA7pAFtuDSvwd0siobPi4kIyV7E7T10zJs3KN?=
	=?us-ascii?q?GmUkJ3f9GpHIFNuy2ANIZ7QtsuT3xqtSok0LEKp5G2cDILxZko3RLTduKLfouQ?=
	=?us-ascii?q?7hLtSumcIit0iXdgdb+/gxu97FWsx+jhWsau0ltHqzRKncTOu3AD0hHf9NWIRu?=
	=?us-ascii?q?Z/80qnxD2BzRrc6vteLkAxjafbLpkhzaMumZcLqkTDGzP2mF3xjK+LakUo4uio?=
	=?us-ascii?q?5PrjYrXhvpKSNYB6hAfnPqohm8OyH+Y2PhESU2SF4+izyLrj/VfhQLlQkP05iK?=
	=?us-ascii?q?jZsIvAKsQfvKG1GRNa0oEm6xqnDjem1soXnWUfIV5Yeh+LkZLlN0/BLfziEPuz?=
	=?us-ascii?q?mVehnTdzy/DDJLLhA5HNLnbZkLfmeLZw80hcyAswzdBY/Z5UD6sOIO/1Wk/2r9?=
	=?us-ascii?q?HYEAU2Mw2vw+n9DNVyzJkSVn6IAq+cKK/Sq0OH5vozI+mQY48YoCvyJOYj5/7v?=
	=?us-ascii?q?ln80gkIScrev3ZsWZ3G0BPNmI1+WYXD0mNcODX8KvhYiTOztkFCCVCBcZ2qoUK?=
	=?us-ascii?q?4l+jE7CZmrDIfERo+xnLyB2z+7HodRZmBEFF+DDWvoe5+DW/cWZyLBavNmx2gI?=
	=?us-ascii?q?WL6gUKct2BevpEn90bUxfcTO/ShN4ZTi198z4uTOkxYa6zV1FM2Z2ieGSGQizT?=
	=?us-ascii?q?BAfCM/wK0q+R818VyEy6Ut2/E=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EIAgB9jBlZ/1UBGKxcGwEBAQMBAQEJA?=
	=?us-ascii?q?QEBFwEBBAEBCgEBhAyBDAefOyGXQUMhC4V4hW0UAQEBAQEBAQEBAQECgRCCMyI?=
	=?us-ascii?q?QRiYGAQEBAQEBAQEBIwEBAQEBAQEBAQEBAQEBARoCCAVDAQEYAQEBAQIBAXgSA?=
	=?us-ascii?q?QgVJjMKJwQNAQcCihcWrx6KRwEBAQEGAQEBAQEjiGgLgjE0hGNMhSYFngqHHIY?=
	=?us-ascii?q?nh1yFO4osiH+LRDaBLHCGB4FKdgGHUYENAQEB?=
X-IPAS-Result: =?us-ascii?q?A2EIAgB9jBlZ/1UBGKxcGwEBAQMBAQEJAQEBFwEBBAEBCgE?=
	=?us-ascii?q?BhAyBDAefOyGXQUMhC4V4hW0UAQEBAQEBAQEBAQECgRCCMyIQRiYGAQEBAQEBA?=
	=?us-ascii?q?QEBIwEBAQEBAQEBAQEBAQEBARoCCAVDAQEYAQEBAQIBAXgSAQgVJjMKJwQNAQc?=
	=?us-ascii?q?CihcWrx6KRwEBAQEGAQEBAQEjiGgLgjE0hGNMhSYFngqHHIYnh1yFO4osiH+LR?=
	=?us-ascii?q?DaBLHCGB4FKdgGHUYENAQEB?=
X-IronPort-AV: E=Sophos;i="5.38,344,1491253200"; d="scan'208";a="40975066"
Received: from hel-exch-02.corp.vaisala.com ([172.24.1.85])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	15 May 2017 14:13:38 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-02.corp.vaisala.com (172.24.1.85) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Mon, 15 May 2017 14:13:38 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Mon, 15 May 2017 14:13:38 +0300
From: <niko.mauno@vaisala.com>
To: <denis@denix.org>
Thread-Topic: [meta-ti] [master][PATCH 2/3] layer.conf: update with "doxygen"
	host tool dependency for openmp-rtos
Thread-Index: AQHSzWxNU8HRmgvrCEa/hxcxUuPlSA==
Date: Mon, 15 May 2017 11:13:38 +0000
Message-ID: <8d0c6267-8282-886d-cc0b-8c1a82ff036b@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][PATCH 2/3] layer.conf: update with "doxygen" host tool dependency for openmp-rtos
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
X-List-Received-Date: Mon, 15 May 2017 11:14:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <69FAEF891C8508468966E0844BAB4570@exch.vaisala.com>
Content-Transfer-Encoding: quoted-printable

 > From: Denys Dmytriyenko <denys at ti.com>
 >
 > Also, drop host tool for CCS, as it no longer provided.
 >
 > Signed-off-by: Denys Dmytriyenko <denys at ti.com>
 > ---
 >  conf/layer.conf | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)
 >
 > diff --git a/conf/layer.conf b/conf/layer.conf
 > index b59effa..87a28de 100644
 > --- a/conf/layer.conf
 > +++ b/conf/layer.conf
 > @@ -28,5 +28,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
 >      multiprocmgr \
 >  "
 >
 > -# Required by CCS installer
 > -HOSTTOOLS +=3D "unzip"
 > +# Required by openmp-rtos "docs" target
 > +HOSTTOOLS +=3D "doxygen"
 > --
 > 2.7.4

Please consider using alternative approach to native doxygen=20
requirement, such as DEPENDS +=3D "doxygen-native" in associated recipes,=20
or change to HOSTTOOLS_NONFATAL +=3D "doxygen" here. Otherwise this change=
=20
breaks builds on hosts which do not have doxygen installed.

https://lists.yoctoproject.org/pipermail/meta-ti/2017-May/009960.html

