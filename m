Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.698.1637275784037469933
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 14:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A12940C3A;
	Thu, 18 Nov 2021 22:49:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4U3IeAUoeSc; Thu, 18 Nov 2021 22:49:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D8EDA40BA8;
	Thu, 18 Nov 2021 22:49:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3640A1746D3; Thu, 18 Nov 2021 17:49:38 -0500 (EST)
Date: Thu, 18 Nov 2021 17:49:38 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>,
	meta-ti@lists.yoctoproject.org, prashanth.ka@pathpartnertech.com
Subject: Re: [dunfell/master PATCHv5] vxd-dec-fw: Add the recipe for vxd-dec-fw
Message-ID: <20211118224936.GI18191@denix.org>
References: <20211118224026.5086-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211118224026.5086-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 04:40:26PM -0600, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
>=20
> Add the firmware packaging recipe for the video decoder
> for j721e.
>=20
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes in v5: Add TI-IMG license file
>=20
>  licenses/TI-IMG                               | 63 +++++++++++++++++++
>  .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  5 +-
>  recipes-kernel/linux/kernel-rdepends.inc      |  3 +
>  4 files changed, 93 insertions(+), 2 deletions(-)
>  create mode 100644 licenses/TI-IMG
>  create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>=20
> diff --git a/licenses/TI-IMG b/licenses/TI-IMG
> new file mode 100644
> index 00000000..8d2e6f9e
> --- /dev/null
> +++ b/licenses/TI-IMG
> @@ -0,0 +1,63 @@
> +This license applies to the Imagination D5520 firmware image, pvdec_fu=
ll_bin.fw.
> +
> +Copyright (C) 2019 Texas Instruments Incorporated
> +
> +All rights reserved not granted herein.
> +
> +Limited License.
> +
> +Texas Instruments Incorporated grants a world-wide, royalty-free, non-=
exclusive
> +license under copyrights and patents it now or hereafter owns or contr=
ols to
> +make, have made, use, import, offer to sell and sell ("Utilize") this =
software
> +subject to the terms herein. With respect to the foregoing patent lice=
nse, such
> +license is granted solely to the extent that any such patent is necess=
ary to
> +Utilize the software alone. The patent license shall not apply to any
> +combinations which include this software, other than combinations with=
 devices
> +manufactured by or for TI (=E2=80=9CTI Devices=E2=80=9D). No hardware =
patent is licensed
> +hereunder.
> +
> +Redistributions must preserve existing copyright notices and reproduce=
 this
> +license (including the above copyright notice and the disclaimer and
> +(if applicable) source code license limitations below) in the document=
ation
> +and/or other materials provided with the distribution
> +
> +Redistribution and use in binary form, without modification, are permi=
tted
> +provided that the following conditions are met:
> +
> +	* No reverse engineering, decompilation, or disassembly of this
> +	  software is permitted with respect to any software provided in bina=
ry
> +	  form.
> +
> +	* any redistribution and use are licensed by TI for use only with TI
> +	  Devices.
> +
> +	* Nothing shall obligate TI to provide you with source code for the
> +	  software licensed and provided to you in object code.
> +
> +If software source code is provided to you, modification and redistrib=
ution of
> +the source code are permitted provided that the following conditions a=
re met:
> +
> +	* any redistribution and use of the source code, including any
> +	  resulting derivative works, are licensed by TI for use only with TI
> +	  Devices.
> +
> +	* any redistribution and use of any object code compiled from the
> +	  source code and any resulting derivative works, are licensed by TI
> +	  for use only with TI Devices.
> +
> +Neither the name of Texas Instruments Incorporated nor the names of it=
s
> +suppliers may be used to endorse or promote products derived from this
> +software without specific prior written permission.
> +
> +DISCLAIMER.
> +
> +THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AND=
 ANY EXPRESS OR
> +IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANT=
IES OF
> +MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. I=
N NO
> +EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABLE FOR ANY DIRECT, IN=
DIRECT,
> +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, B=
UT NOT
> +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, =
DATA, OR
> +PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recip=
es-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> new file mode 100644
> index 00000000..cccda6bb
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "Video Decoding Firmware"
> +LICENSE =3D "TI-IMG"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.ti-img;md5=3D84ca7278930db0018706=
86ad997d6bb1"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV =3D "${IMG_DEC_FW_VERSION}"
> +PR =3D "${INC_PR}.0"
> +
> +CLEANBROKEN =3D "1"
> +
> +COMPATIBLE_MACHINE =3D "j7"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +S =3D "${WORKDIR}/git"
> +TARGET =3D "pvdec_full_bin.fw"
> +
> +do_install() {
> +        install -d ${D}${base_libdir}/firmware/ti-img
> +        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmw=
are/ti-img/${TARGET}
> +}
> +
> +FILES_${PN} =3D "${base_libdir}/firmware"
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-l=
inux-fw/ti-linux-fw.inc
> index c59120b8..f6d5b8d1 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -13,11 +13,12 @@ NETCP_SA_FW_VERSION =3D "1.0.0"
>  NETCP_PA_FW_VERSION =3D "3.0.2.3"
>  QMSS_PDSP_FW_VERSION =3D "1.0.0.9"
>  PRUETH_FW_AM65X_VERSION =3D "08.00.00.20"
> -PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.09.06"
> +PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.09.07"
>  GOODIX_FW_VERSION =3D "1.0.0.0"
>  CADENCE_MHDP_FW_VERSION =3D "1.2.17"
> +IMG_DEC_FW_VERSION =3D "1.0"
> =20
> -TI_LINUX_FW_SRCREV ?=3D "95232a584175a8ac872adf477b2dbb9ca68ba063"
> +TI_LINUX_FW_SRCREV ?=3D "c96a734a059889e571dcf30c0638157c690a6e6e"
>  SRCREV =3D "${TI_LINUX_FW_SRCREV}"
> =20
>  BRANCH ?=3D "ti-linux-firmware"
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/=
linux/kernel-rdepends.inc
> index 5e5241c9..76b7a508 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -39,3 +39,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-ev=
m =3D " prueth-fw-am65x-sr2"
> =20
>  # Add run-time dependency for Cadence MHDP firmware to the rootfs
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 =3D " cadence-mhdp-fw"
> +
> +# Add run-time dependency for Video Decoding firmware to the rootfs
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 =3D " vxd-dec-fw"
> --=20
> 2.17.1
>=20

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
