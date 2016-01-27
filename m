Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C1FFE00C13; Tue, 26 Jan 2016 22:06:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8A3AE00C10
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 22:06:41 -0800 (PST)
Received: by mail-yk0-f178.google.com with SMTP id a85so229290232ykb.1
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 22:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mh3JMWJCiRorvoXdfT/RcYHV2jCNqezi2bsmCeNMbvw=;
	b=ya4iMjUKo1zGy52YT6tKzuvOC9QEIVNy17kUszxTK2nAN2+xacZ7o818gMCvdIfrO2
	GbSwu99LmhW/MfJuGFFy6ZK5He7sYFYbQHVbnrnxfDkgIDoEHBvvGkYkStuEGWqaL/jV
	WdfSssYzN6/nRtF0R3KIaWID4LJab9InKSRiJSbbGQcTYX4CiKalTlJzDY5mm8bNgQCK
	TGtfSOfJTC7ZY9pb1XyfvmHlr6nM0MvQLIPyZ4eZbyZLyPsBEhsXMIXa9GaHk6WQpQDd
	HObVzfQHSYoiMdWKSaY45V6n04BqxRigkRc5ZaQTAUN5JFFJJTZrvZ5oa4dgQ5iM7LQg
	NqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=mh3JMWJCiRorvoXdfT/RcYHV2jCNqezi2bsmCeNMbvw=;
	b=KiizY6B544E56HRyjsGXFe6oY1pUwt+i8Ut/JvQxwgCWOBVIAN/+HwpuMQvdURnDON
	mrYd7/ZZQxp5TJ2FtiJG8qn1Vugjc5kd0+JmIKa4EfYU1QC1r4pxPB7jdmbUD64ffskV
	r9A14Fom6mRruQgfd9SQXkPHp5vZjwRsn0VVxJcvdZSbHLgdy02fsj6gXB0z7J9YmiwB
	rBTytjuekv9W+T9+U01u9mQPZRkFa6kumCUp6TRO6YGRslHWRLMuCi+RgcpfpouRWnjV
	gDHbZV4ejqB5j/cpSDjOYhHvbZK7mLVCBXLUXCyyC9LtscsG/PYoH//5IvsOdBNHo+Vt
	WM1A==
X-Gm-Message-State: AG10YOQZgqFtrcZGcNBmbugefmOHq0Z7NUMx3eTVPB9f7VNu2ytR8Rvgqye5P5arxEj5UQ==
X-Received: by 10.13.241.199 with SMTP id a190mr15128335ywf.47.1453874800901; 
	Tue, 26 Jan 2016 22:06:40 -0800 (PST)
Received: from [192.168.1.2] (207.sub-70-192-133.myvzw.com. [70.192.133.207])
	by smtp.gmail.com with ESMTPSA id
	e6sm3798333ywd.23.2016.01.26.22.06.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 22:06:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453843011-28530-4-git-send-email-j-stiffler@ti.com>
Date: Wed, 27 Jan 2016 01:06:35 -0500
Message-Id: <BCDE94FF-91BD-464F-9EC4-D55608450073@gmail.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
	<1453843011-28530-4-git-send-email-j-stiffler@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
X-Mailer: Apple Mail (2.3112)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 03/13] ti-pdk.bbclass: Add class for creating RTOS PDK components
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
X-List-Received-Date: Wed, 27 Jan 2016 06:06:43 -0000
X-Groupsio-MsgNum: 7815
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9CB41D5B-A1DF-48A3-8C53-30943126EEAB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9CB41D5B-A1DF-48A3-8C53-30943126EEAB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 26, 2016, at 4:16 PM, Jacob Stiffler <j-stiffler@ti.com> wrote:
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> classes/ti-pdk.bbclass | 66 =
++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 66 insertions(+)
> create mode 100644 classes/ti-pdk.bbclass
>=20
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> new file mode 100644
> index 0000000..ae76fdf
> --- /dev/null
> +++ b/classes/ti-pdk.bbclass
> @@ -0,0 +1,66 @@
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +inherit perlnative
> +
> +DEPENDS =3D "ti-xdctools ti-cg-xml-native ti-sysbios =
common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native"
> +
> +DEPENDS_append_omap-a15 =3D " ti-cgt6x-native ti-ccsv6-native"
> +DEPENDS_append_keystone =3D " ti-cgt6x-native"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> +
> +get_build_dir_bash() {
> +  if [ -f ${S}/package.xdc ]
> +  then
> +    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk '{ =
print $2 }' | sed -e 's|\.|/|g'
> +  else
> +    echo ${S}
> +    return 1
> +  fi
> +}
> +
> +export CROSS_TOOL_PRFX=3D"arm-none-eabi-"
> +export TOOLCHAIN_PATH_A8 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A9 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A15 =3D "${GCC_ARM_NONE_TOOLCHAIN}=E2=80=9D

Did you try using -ffreestanding option to internal toolchain ?

> +export TOOLCHAIN_PATH_M4 =3D "${M4_TOOLCHAIN_INSTALL_DIR}=E2=80=9D
> +export C6X_GEN_INSTALL_PATH =3D =
"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +
> +export ROOTDIR =3D "${B}"
> +export BIOS_INSTALL_PATH =3D "${SYSBIOS_INSTALL_DIR}"
> +export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"
> +export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
> +
> +export XDCPATH =3D =
"${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL=
_DIR}/packages"
> +export SECTTI=3D"perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
> +
> +PARALLEL_XDC =3D "--jobs=3D${BB_NUMBER_THREADS}"
> +
> +do_configure() {
> +    BUILD_DIR=3D${B}/`get_build_dir_bash`
> +
> +    mkdir -p ${BUILD_DIR}
> +    cp -r ${S}/* ${BUILD_DIR}
> +    cd ${BUILD_DIR}
> +
> +    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
> +    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
> +    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
> +    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
> +    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
> +}
> +
> +do_compile() {
> +    ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
> +    ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS=3D"${XDCARGS}" =
ROOTDIR=3D"${ROOTDIR}" -PR .
> +    ${XDC_INSTALL_DIR}/xdc release XDCARGS=3D"${XDCARGS}" -PR .
> +}
> +
> +do_install () {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    find -name "*.tar" -exec tar xf {} -C =
${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
> +}
> +
> +FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_9CB41D5B-A1DF-48A3-8C53-30943126EEAB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaoXm4ACgkQuwUzVZGdMxS9TgCfeCngVnSjPbctVsSSa+paZRvL
7kkAniNi9G+4Q8msifWQ+IRc7foiTi2J
=WkWi
-----END PGP SIGNATURE-----

--Apple-Mail=_9CB41D5B-A1DF-48A3-8C53-30943126EEAB--
