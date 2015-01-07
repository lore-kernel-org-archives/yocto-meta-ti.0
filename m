Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99B49E00571; Wed,  7 Jan 2015 13:41:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.180 listed in list.dnswl.org]
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77E89E002F9
	for <meta-ti@yoctoproject.org>; Wed,  7 Jan 2015 13:41:41 -0800 (PST)
Received: by mail-pd0-f180.google.com with SMTP id fl12so7031032pdb.11
	for <meta-ti@yoctoproject.org>; Wed, 07 Jan 2015 13:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=M8jt/gsS2S/jWqSTWKg4i8eyvI2PEzaAjdi6ptRu6Kw=;
	b=DWu+3N6CudQ5pHzUEd///JEGLhxJtkWj9HN09d29iBmaISk7PESbbvi2iEwy6GLodC
	rK2dqbxo/+AWXz+yYJ4PhLCi5E2evmfA8jStd+zOjBQvwOhGAc9fsnKmfn8R/Htt90R3
	BE26w749qaoBZnkQUhpVEA0K6pBVFV+vnQ19NSHvERSkuKkmgN2zQqxWx+zUyqej7AA5
	mxJ1jKkXp38CwOxlMX9eSnoQaN57Ilg3MP+5/dxR6puq1l9vJd4JaeNRmqp8Ybx4/nBO
	Rlre9GBAhPLog38djjr+GbTrWdKrKhDnxFpAFn98Oy6o26hMqFl4CfMFZz2TNGdHYcF6
	5rCg==
X-Received: by 10.68.68.172 with SMTP id x12mr9151287pbt.71.1420666900981;
	Wed, 07 Jan 2015 13:41:40 -0800 (PST)
Received: from [172.20.5.84] ([204.15.241.100])
	by mx.google.com with ESMTPSA id i11sm2646877pbq.23.2015.01.07.13.41.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Jan 2015 13:41:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1420660417-10807-1-git-send-email-sam.nelson@ti.com>
Date: Wed, 7 Jan 2015 13:41:39 -0800
Message-Id: <65768290-CDB1-43E2-90E1-94FAF845E36B@gmail.com>
References: <1420660417-10807-1-git-send-email-sam.nelson@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
X-Mailer: Apple Mail (2.1993)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] pktlib: Adds recipe for pklib component
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
X-List-Received-Date: Wed, 07 Jan 2015 21:41:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 7, 2015, at 11:53 AM, Sam Nelson <sam.nelson@ti.com> wrote:
>=20
> - pktlib: provides library for handling packet descriptor for keystone =
devices
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
> recipes-bsp/pktlib/pktlib_git.bb |   25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
> create mode 100644 recipes-bsp/pktlib/pktlib_git.bb
>=20
> diff --git a/recipes-bsp/pktlib/pktlib_git.bb =
b/recipes-bsp/pktlib/pktlib_git.bb
> new file mode 100644
> index 0000000..8cd43d9
> --- /dev/null
> +++ b/recipes-bsp/pktlib/pktlib_git.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Provides library for handling packet descriptors for =
keystone devices"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D =
"file://${WORKDIR}/git/COPYING.txt;md5=3Db7982a377c680ad71ca2fbb735982462"=

> +
> +DEPENDS=3D"common-csl-ip rm-lld qmss-lld cppi-lld"
> +COMPATIBLE_MACHINE =3D "keystone"
> +
> +BRANCH =3D "master"
> +SRC_URI =3D =
"git://git.ti.com/keystone-rtos/pktlib.git;protocol=3Dgit;branch=3D${BRANC=
H}"
> +
> +# Corresponds to DEV.PKTLIB.2.1.0.4
> +SRCREV =3D "a9aa56afed54b0a04f36d2fdb248cad5dcac6ff6"
> +PV =3D "2.1.0.4"
> +PR =3D =E2=80=9Cr0"

drop PR

> +
> +S =3D "${WORKDIR}/git//ti/runtime/pktlib=E2=80=9D
                      ^^
get rid of double slash=20

> +
> +do_compile () {
> +#   Now build the pktlib in the updated directory
> +    make -f makefile_armv7 clean lib =
PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> +}
> +
> +do_install () {
> +    make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 INSTALL_INC_BASE_DIR=3D${D}${includedir} =
INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> +}

you might want to use oe_runmake and EXTRA_OEMAKE to accommodate the =
above make calls.

> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


