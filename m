Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49049E004F1; Mon,  4 Aug 2014 09:04:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88B19E0030B
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 09:04:07 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74G45Xx022671;
	Mon, 4 Aug 2014 11:04:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74G45DR029026;
	Mon, 4 Aug 2014 11:04:05 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 4 Aug 2014 11:04:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Thread-Topic: [meta-ti] [PATCH] beaglebone: use the am335x_boneblack u-boot
	configuration
Thread-Index: AQHPr/tFbBlE/SwIXU69zD7JuIq8epvAm3b7
Date: Mon, 4 Aug 2014 16:04:04 +0000
Message-ID: <CDAEECB9-550D-4013-A3C9-07520AA88C9D@ti.com>
References: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] beaglebone: use the am335x_boneblack u-boot	configuration
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
X-List-Received-Date: Mon, 04 Aug 2014 16:04:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How does this config work on the Beaglebone white?

> On Aug 4, 2014, at 10:46 AM, "Alexandre Belloni" <alexandre.belloni@free-=
electrons.com> wrote:
>=20
> Using the am335x_boneblack configuration for u-boot allows to save the
> environment to the emmc. Else, it is not possible to save the
> environment at all.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
> conf/machine/beaglebone.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 8a83a1aeb569..0b4dce3ad647 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -11,4 +11,4 @@ IMAGE_FSTYPES +=3D "tar.gz"
>=20
> SERIAL_CONSOLE =3D "115200 ttyO0"
>=20
> -UBOOT_MACHINE =3D "am335x_evm_config"
> +UBOOT_MACHINE =3D "am335x_boneblack"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

