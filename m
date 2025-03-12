Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D145C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 21:44:24 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.396.1741815858481263390
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 14:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=btmYwSWJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f3ecfa7a76so179126b6e.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741815858; x=1742420658; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU75xih7cfptDsZiVpBZjMCDQiyWnsChBVyV9OEggGA=;
        b=btmYwSWJ+TEjreAulVqyPbUIcNEwWsYk7bR1NIIxecIhJKNT7WI4FY+1bqhArs/mJ6
         m2XqXXLKgKKDEncoJw32oTugj0aENyFiF/EkyaHeI05/iANprhFgNaWePKS5rfcGyeId
         FgJz0wJU7EFqlTsfakyBQ8o7pzGtXO/ouScyfgPI1dojCQyRfksO1RdvufIxBdvI52fM
         lqSooGwSAvpzCzG5PqvPkWOzP5Z6ka7fBh2GRaN0zVxZWS7HOc81K3gY1uQ4kLXaPHq8
         Gzy4uFw56JMHW7GHFtQBNDXHmt5bygE1wBldkwqb2MDl42R1MDHXhM3VeTCIi/vvkPad
         8Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741815858; x=1742420658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU75xih7cfptDsZiVpBZjMCDQiyWnsChBVyV9OEggGA=;
        b=iPODW3L+90QYSewdmwUZVRYGKrnIpD8OYe8jxSBJ5cHZMxjJE9oGdRNCoQwE/QV5tp
         Xl6yCI0CSt+9KsJclvKQbIMGa90wffBxrN1wVZoJWw6DmAqZy82YN1NHHluL7zMfPFJU
         AhwY/GqZeMoD21Y6bLKqr+Cwj1+picxNpedpCChqL5hH3d5Yl3wredAzWZKMkbdds5gF
         40RbDKw/NOCyeNmh2F8diBHhvWkINUtQ3TWv/svk5r9yiV+CqF41UdfrnX1kVwG5uDS4
         Tj3XEbNfqFxtvp3p5hS62g+OflpEK9W2iZNeM25oMDS14HFGsMVf6+0lTeNSocwxSqI1
         1eEA==
X-Forwarded-Encrypted: i=1; AJvYcCXHF/3mxVJ77WGZvp5eF24OqHV6B6AQihon3wu0OZGh5Ol4cAj5bYWcimHNnkwMZaum9x0kOKf2@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzJukxnS1lRBN31SObXxf75iWm814Zo3mnQ6ji4PVU9RDAx50SZ
	vSZ5xQ1wJv74p46P8V8KFk6giopkdE6xgjdv9VQ3DaCj6P0292t1RtBuZwxGKLDx9SeetlfkzNr
	AnjhPDlytoHIpHic37uDUEDX2j7o=
X-Gm-Gg: ASbGncvdDSu67J6KLeL1PW7T/XxaxZyWTCdKj6MnXAEjZBunF06s3pols9Mp2Qp/GpH
	Jak2cRpY+5rcRIkTwVmNWB42XPLt9BA9icKn6MzYizBUVLBWfuqt7eYYB8y40V/wRMmbg8vxhhd
	MSbfpIQVqashAnO9lqCd5xrBU59IhWf3ijbAVRUSJdP6aZjHDDZTN1GVbhSWNK/Gegzg==
X-Google-Smtp-Source: AGHT+IEfaAIxrLZ9fe8zPINYpI5Ia1ubFLMvmsZWI/ubNQ+biKNABxhQF0vT4eCKrNAfiN48Yld6QUXdA5/6/WZkkhw=
X-Received: by 2002:a05:6808:234d:b0:3f6:a535:80a7 with SMTP id
 5614622812f47-3f6a535878emr7491827b6e.19.1741815857605; Wed, 12 Mar 2025
 14:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213803.1160562-1-rs@ti.com>
In-Reply-To: <20250312213803.1160562-1-rs@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 14:43:51 -0700
X-Gm-Features: AQ5f1Jqb6Y3CXDimltbpgA5dMnrkMD7l8K52zVQxCreQ1E_Acip9s4omA4R48rA
Message-ID: <CAMKF1sprtyknfht+5XmL4Ee76kybV4mqr0Ewg+Sz1RLXDqYgTg@mail.gmail.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-img-rogue-umlibs: ship
 module blacklist
To: rs@ti.com
Cc: denis@denix.org, reatmon@ti.com, meta-ti@lists.yoctoproject.org, 
	detheridge@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Mar 2025 21:44:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18375

On Wed, Mar 12, 2025 at 2:38=E2=80=AFPM Randolph Sapp via
lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Well, this is the evil vendor driver. Time to start acting like it.
> Blacklist the upstream powervr module if this driver is present.
>
> This patch also does away with the bin_package components. It was cool
> and found some interesting bugs, but we might as well start leveraging
> that Makefile more now that we're starting to get some more common
> files between devices.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../ti-img-rogue-umlibs_24.2.6643903.bb       | 23 ++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-uml=
ibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-ro=
gue-umlibs_24.2.6643903.bb
> index b8153711..565e92eb 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.=
2.6643903.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.=
2.6643903.bb
> @@ -3,19 +3,15 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-u=
mlibs"
>  LICENSE =3D "TI-TFL"
>  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f9=
9e3baa03de5207e76f"
>
> -inherit bin_package
> -
> -INHIBIT_DEFAULT_DEPS =3D ""
> -
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
>
> -PR =3D "r3"
> +PR =3D "r4"
>
>  BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
>  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
> -SRCREV =3D "d578666fc6ecd09f7d6c3431747f1d93d128fe28"
> -S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
> +SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
> +S =3D "${WORKDIR}/git"
>
>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> @@ -54,7 +50,12 @@ def get_file_list(package_list_var, d):
>                      file_list.append(f"{prefix}{package_file}")
>      return " ".join(file_list)
>
> -do_install:append() {
> +EXTRA_OEMAKE +=3D 'BUILD=3D${PVR_BUILD} TARGET_PRODUCT=3D${TARGET_PRODUC=
T} WINDOW_SYSTEM=3D${PVR_WS}'
> +
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_install() {
> +    oe_runmake 'DESTDIR=3D${D}' install
>      if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', =
d)}; then
>          for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
>              rm -rf ${file}
> @@ -78,6 +79,9 @@ do_install:append() {
>
>      # clean up any empty directories
>      find "${D}" -empty -type d -delete
> +
> +    # fix permissions
> +    chown -R root:root "${D}"

Why is this needed ?

>  }
>
>  GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
> @@ -141,6 +145,9 @@ INSANE_SKIP:${PN}-tools =3D "ldflags"
>  FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
>  INSANE_SKIP:${PN}-firmware +=3D "arch"
>
> +# common libraries
> +FILES:${PN} =3D "${libdir}"
> +
>  RRECOMMENDS:${PN} +=3D " \
>      ${PN}-tools \
>  "
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18374): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18374
> Mute This Topic: https://lists.yoctoproject.org/mt/111668777/1997914
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [raj.khem@gma=
il.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

