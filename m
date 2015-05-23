Return-Path: <meenakumari.s@hcl.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 390A8E009E6; Fri, 22 May 2015 23:44:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 66 seconds by postgrey-1.32 at yocto-www;
	Fri, 22 May 2015 23:44:33 PDT
Received: from GWS06.hcl.com (gws06.hcl.com [203.105.185.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A91DE00988
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 23:44:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.13,480,1427740200"; d="scan'208";a="140708931"
Received: from unknown (HELO NDA-CORP-HT03.CORP.HCL.IN) ([10.248.64.35])
	by GWS06.hcl.com with ESMTP/TLS/AES128-SHA; 23 May 2015 12:13:22 +0530
Received: from NDA-HCLT-CSHT04.HCLT.CORP.HCL.IN (10.98.132.29) by
	NDA-CORP-HT03.CORP.HCL.IN (10.248.64.35) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Sat, 23 May 2015 12:13:22 +0530
Received: from NDA-HCLT-MBS05.HCLT.CORP.HCL.IN ([10.98.132.20]) by
	NDA-HCLT-CSHT04.HCLT.CORP.HCL.IN ([10.98.132.29]) with mapi id
	14.03.0123.003; Sat, 23 May 2015 12:13:22 +0530
From: Meenakumari Shedole <meenakumari.s@hcl.com>
To: Denys Dmytriyenko <denys@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti-cgt6x: Fix installation for native and
	nativesdk classes.
Thread-Index: AQHQlLkFIjMl+WUEN0+iBMk2LHYcip2JG2gm
Date: Sat, 23 May 2015 06:43:22 +0000
Message-ID: <E4938C0D959B3445943720B88F0721343743E34E@NDA-HCLT-MBS05.hclt.corp.hcl.in>
References: <1431088437-30316-1-git-send-email-j-stiffler@ti.com>,
	<20150522175849.GB8903@edge>
In-Reply-To: <20150522175849.GB8903@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.4.252]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-cgt6x: Fix installation for native and nativesdk classes.
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
X-List-Received-Date: Sat, 23 May 2015 06:44:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I've compiled these modules using my own toolchain with success with the de=
fault compiler flags(--with-fpu=3Dvfpv3 --with-float=3Dhard --with-mode=3Dt=
humb)

But I had a little trouble, when I tried to compile  the LPM utilities (lpm=
ON/lpmOFF), since doesn't support thumb and hard float.

I would like to know if I continue working with my default compiler flag, I=
'm going to have issues when compiling.

Error Message:
/usr/local/xtools/arm-none-linux-gnueabi/lib/gcc/arm-none-linux-gnueabi/4.7=
.4/../../../../arm-none-linux-gnueabi/bin/ld.bfd: error: bin/ti_platforms_e=
vm3530/linux/debug/lpmON.xv5T uses VFP register arguments, /usr/local/xtool=
s/arm-none-linux-gnueabi/dsp/local_power_manager_linux_1_24_02_09/packages/=
ti/bios/power/lib/debug/lpm.av5T(lpm_api.ov5T) does not
/usr/local/xtools/arm-none-linux-gnueabi/lib/gcc/arm-none-linux-gnueabi/4.7=
.4/../../../../arm-none-linux-gnueabi/bin/ld.bfd: failed to merge target sp=
ecific data of file /usr/local/xtools/arm-none-linux-


Changed compiler flag hardfloat to softfp also used multiarch Distro Featur=
e but  faced same issue "USes VFP regsiter arguments".

can someone suggest me if it compiled successfully.


Regards
Meena



From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Denys Dmytriyenko [denys@ti.com]
Sent: Friday, May 22, 2015 11:28 PM
To: Jacob Stiffler
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] ti-cgt6x: Fix installation for native and na=
tivesdk classes.

On Fri, May 08, 2015 at 08:33:57AM -0400, Jacob Stiffler wrote:
> * Many RTOS packages assume that the entire cgt is installed in a
>   single directory as opposed to standard install paths.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt6x_8.0.0.bb |    8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/=
ti-cgt6x_8.0.0.bb
> index 69c6d60..2353ebd 100644
> --- a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> +++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://ti-cgt-c6000_${PV}/LICENSE.t=
xt;md5=3Db6311962635a4f1563
>  LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-c6x/LICEN=
SE.txt;md5=3Db6311962635a4f15630e36ec2d875eca"
>
>  PE =3D "1"
> +PR =3D "r1"
>
>  require ../includes/ti-unpack.inc
>
> @@ -49,6 +50,11 @@ do_install() {
>          install -m 755 ${binfile} ${D}${bindir}
>      done
>
> +    install -d ${D}${datadir}/ti/cgt-c6x/bin
> +    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
> +        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
> +    done

Would have symlinks worked here as well, instead of duplicating binaries?


>      install -d ${D}${datadir}/ti/cgt-c6x/include
>      for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
>          install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> @@ -102,4 +108,6 @@ do_install_class-target() {
>
>  FILES_${PN} +=3D "${datadir}/ti/*"
>
> +FILES_${PN}-dbg +=3D "${datadir}/ti/cgt-c6x/bin/.debug"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


::DISCLAIMER::
---------------------------------------------------------------------------=
-------------------------------------------------------------------------

The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only.
E-mail transmission is not guaranteed to be secure or error-free as informa=
tion could be intercepted, corrupted,
lost, destroyed, arrive late or incomplete, or may contain viruses in trans=
mission. The e mail and its contents
(with or without referred errors) shall therefore not attach any liability =
on the originator or HCL or its affiliates.
Views or opinions, if any, presented in this email are solely those of the =
author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction, disse=
mination, copying, disclosure, modification,
distribution and / or publication of this message without the prior written=
 consent of authorized representative of
HCL is strictly prohibited. If you have received this email in error please=
 delete it and notify the sender immediately.
Before opening any email and/or attachments, please check them for viruses =
and other defects.

---------------------------------------------------------------------------=
-------------------------------------------------------------------------


