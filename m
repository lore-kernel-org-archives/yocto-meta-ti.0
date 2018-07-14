Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16F10E010BD; Sat, 14 Jul 2018 10:36:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2E50E00DB6
	for <meta-ti@yoctoproject.org>; Sat, 14 Jul 2018 10:36:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6EHa5FS118761
	for <meta-ti@yoctoproject.org>; Sat, 14 Jul 2018 12:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531589765;
	bh=Td2+ye/1Y9ctlgFskSJ35yNsk1/lDX8OLrV0fIRqK1I=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=klM1Cq+8LeV61f2TuwMwbeTdFF7gQpkAGJkTL+I037D0Uwmc2DzX3bwV1bbj+5IOM
	0fLyarI6deRxC2PLe6/SCA5bmHdkHT+GZMEaEc7xBiDmQplCuKTt7o4ktZCoqEsREw
	aIwIvWjcmy4lOo10HrY3ySp3JSbrVv7y+60oJuts=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6EHa50T011483
	for <meta-ti@yoctoproject.org>; Sat, 14 Jul 2018 12:36:05 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Sat, 14 Jul 2018 12:36:04 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Sat, 14 Jul 2018 12:36:04 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v4 0/3] Enable SGX on k3 (AM654x)
Thread-Index: AQHUGxBCst7qWpzdoEK2U1yjXJkzBaSO+/Uw
Date: Sat, 14 Jul 2018 17:36:04 +0000
Message-ID: <601fdf040a5344628a07063db89cb138@ti.com>
References: <1531515249-12170-1-git-send-email-e-ruei1@ti.com>
	<20180714011535.GO25410@beryl>
In-Reply-To: <20180714011535.GO25410@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v4 0/3] Enable SGX on k3 (AM654x)
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
X-List-Received-Date: Sat, 14 Jul 2018 17:36:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you very much!

Have a wonderful weekend!

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, July 13, 2018 9:16 PM
To: Ruei, Eric
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v4 0/3] Enable SGX on k3 (AM654x)

Thanks! Looks good now, I'll merge it.


On Fri, Jul 13, 2018 at 04:54:06PM -0400, Eric Ruei wrote:
> Enable SGX on k3 (AM654x)
>=20
> Eric Ruei (3):
>   conf: machine: k3: enable sgx
>   ti-sgx-ddk-um: add k3 (AM654x) support
>   ti-sgx-ddk-km: add k3 (AM654x) support
>=20
>  conf/machine/include/k3.inc                        |  4 ++--
>  ...14.3699939.bb =3D> ti-sgx-ddk-km_1.17.4948957.bb} | 12 +++++-------
>  .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |  1 +
>  ...14.3699939.bb =3D> ti-sgx-ddk-um_1.17.4948957.bb} | 22 +++++---------=
--------
>  4 files changed, 13 insertions(+), 26 deletions(-)
>  copy recipes-bsp/powervr-drivers/{ti-sgx-ddk-km_1.14.3699939.bb =3D> ti-=
sgx-ddk-km_1.17.4948957.bb} (73%)
>  copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb =3D> ti-sgx=
-ddk-um_1.17.4948957.bb} (81%)
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

