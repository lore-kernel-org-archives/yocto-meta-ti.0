Return-Path: <manisha.agrawal@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D567FE0093F; Thu,  2 Mar 2017 13:16:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15A94E0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 13:15:58 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v22LFmW4027783
	for <meta-ti@yoctoproject.org>; Thu, 2 Mar 2017 15:15:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488489348;
	bh=o9Il2QxEshKh2Ti8ryAanjPbLA24+4DD+PGoEky1CRA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=XmNMSy/VXDZoU5a7dp300SoS5NC3QsU9rTVCrByegheGGgdfExxDSUkeU2IeJlwk9
	roMvrSjn8kjQpIFqSZwAm6EI/Z4XZM6F2xB26d8FzseZM0RV3Oww0EtUVwwePrlQfl
	4ocpR3hLWAJnk2p0axPz4/cwP68mQayvqgN4rGH8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22LFhrA022209
	for <meta-ti@yoctoproject.org>; Thu, 2 Mar 2017 15:15:43 -0600
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Thu, 2 Mar 2017 15:15:42 -0600
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [[krogoth/morty]] dual-camera-demo : Video buffers
	from CMEM
Thread-Index: AQHSk5MUzwJsnypsCEy25Qb9mmg7HKGCcHYA//+cUqA=
Date: Thu, 2 Mar 2017 21:15:42 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EB780B6@DFLE12.ent.ti.com>
References: <20170302202503.26165-1-manisha.agrawal@ti.com>
	<20170302211110.GV12614@edge>
In-Reply-To: <20170302211110.GV12614@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [[krogoth/morty]] dual-camera-demo : Video buffers from CMEM
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
X-List-Received-Date: Thu, 02 Mar 2017 21:16:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Appreciate the feedback. Do you want me to fix the subject and email the pa=
tches again?

Regards,
Manisha


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 02, 2017 3:11 PM
To: Agrawal, Manisha
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [[krogoth/morty]] dual-camera-demo : Video buffers f=
rom CMEM

> [[krogoth/morty]] dual-camera-demo : Video buffers from CMEM

Please don't use nested brackets and also don't replace PATCH keyword.

In other words, it should be:

> [krogoth/morty][PATCH] dual-camera-demo : Video buffers from CMEM


On Thu, Mar 02, 2017 at 02:25:03PM -0600, manisha.agrawal@ti.com wrote:
> From: Manisha Agrawal <manisha.agrawal@ti.com>
>=20
> Update git commit id to pick the source code demonstrating CMEM API=20
> usage for allocating video buffers from CMEM driver. This is to=20
> showcase the CPU access of the video buffers with read and write cache=20
> enabled for optimal CPU performance. Since the CMEM driver support=20
> exists only on AM57x today, modify makefile to  include the CMEM=20
> library conditionally only for am57xx-evm platform.
>=20
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb       | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> mo_1.0.bb=20
> b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> mo_1.0.bb
> index 6c36b98..1d1d836 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> mo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camer
> +++ a-demo_1.0.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d3=
354a64feeb4f19f52eb5"
>  DEPENDS +=3D "libdrm"
>  require recipes-core/matrix/matrix-gui-paths.inc
> =20
> -PR =3D "r16"
> +PR =3D "r17"
> =20
>  BRANCH =3D "master"
> -SRCREV =3D "5e250641bfbc8a1a90e5b98527d2012729d54c09"
> +SRCREV =3D "f52cb4354785e5f2fd63f7cf8ab02d99a2fbbea7"
> =20
>  SRC_URI =3D "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=
=3Dgit;branch=3D${BRANCH} \
>             file://desc_dual-camera.html \
> --
> 2.9.3
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

