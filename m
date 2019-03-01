Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A79DAE00A84; Fri,  1 Mar 2019 06:55:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.176 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09796E00994
	for <meta-ti@yoctoproject.org>; Fri,  1 Mar 2019 06:55:16 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id s1so28025305qte.5
	for <meta-ti@yoctoproject.org>; Fri, 01 Mar 2019 06:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XlbifgIB+iHjnpwnhIo2G7/dM8L2X0c8Ou9kZDWy5pM=;
	b=fg1pTdlTgTUOx+moFgd0Lnp0jYWPfVAuTiSdDl2l8/by69p1shay7r5Fz9v4bQbUp5
	uGnyblx+2Xix5LzQlvt7w7L3am21CNoGmYQ9AzxjGF8zaJ5m38zY5XO+oLIu0xUwFIlm
	vZD5+T2cRBsA0WeXiBay5jffacogd/GQdePZNDC3Aka0IjZr2YXFfFf/muayDLQwg49u
	CN5Xk4LUsnNNWHWUYH/JkKf1trZHzjyWWdjIt6Ua9nNmlC7IPTeTd3kVTnwbwg7Xv16t
	FuhIdMnYy0UPueYJLqDyhpAfolWySbU7/wWGGRS5ajd9tXZ7nGkh5oVHjb5PxjOV9z9X
	SHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XlbifgIB+iHjnpwnhIo2G7/dM8L2X0c8Ou9kZDWy5pM=;
	b=UDiP0Agmrdpd/CPHSZNcJ9TStx6YzHXaz61c+NHLWxg6ZQUy9IQg5hRghAGw9BRoA0
	Ip/N7Q546nIp71mt9yjpxOqnAHVy9hh/NK6BsLakU9AvZ7glNMSBidxM2FuSUzWh1a1C
	VvRz7J7xQsudjXNRxYwJgmu8IqYsCKtC91knI1jc2u4Kwo2QrfXMq2iRI94tyqMJqwak
	Ts5a7htvaME3VGPD2LytxIwq8fkSZ6mnKWqorv0TCCCUivn55ENx+401i/hFzyTQgLsD
	N8DhxiFyvjbYTCkx6Yr5w2tnTWtRW7H9GDgquv6XnwGS1FgnjF9Z0PVRBNsxjPZ6b8hS
	BcNQ==
X-Gm-Message-State: APjAAAVZG4F1/e1+Zw9vwTZjPOsVod4LxlSXBw7c7s2xaklK0PFkSU4+
	TBvk01Hla0FluaxhPYUifdagPabVThHSP3FBtkY=
X-Google-Smtp-Source: APXvYqzwDsYC8O5v01i/X6YPzj251BEz+avHRm735v0rDHyHz2pjssn57NZnbYBV+42V8+mmx6yJFXDELj84nWqTQxk=
X-Received: by 2002:ac8:300a:: with SMTP id f10mr4181858qte.236.1551452116022; 
	Fri, 01 Mar 2019 06:55:16 -0800 (PST)
MIME-Version: 1.0
References: <1550866849-31173-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1550866849-31173-1-git-send-email-j-stiffler@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2019 06:54:50 -0800
Message-ID: <CAMKF1soxpPcwDzfzeKL1aKPwOt9eOo+h180EGqDtoVp-Pyd5bQ@mail.gmail.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2] gcc-arm-none-eabi: extend to nativesdk class
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
X-List-Received-Date: Fri, 01 Mar 2019 14:55:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 22, 2019 at 12:33 PM Jacob Stiffler <j-stiffler@ti.com> wrote:
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes:
> * Use COMPATIBLE_HOST instead of anonymous python to limit to x86_64-linux
>
>  ..._6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} (83%)
>
> diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> similarity index 83%
> rename from recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> rename to recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> index 1140f27..ae3d1d7 100644
> --- a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> +++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> @@ -3,7 +3,6 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>
>  LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
>
> -inherit native

this means it is also available as target package now.

>  require recipes-ti/includes/ti-paths.inc
>
>  SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
> @@ -13,6 +12,9 @@ SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6
>
>  S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
>
> +# only x86_64 is supported
> +COMPATIBLE_HOST = "x86_64.*-linux"
> +

fails on qemux86-64
https://errors.yoctoproject.org/Errors/Details/230712/

you have to limit its availability to native and nativesdk only.

>  do_install() {
>      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
>      cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> @@ -20,4 +22,6 @@ do_install() {
>
>  FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
>
> -INSANE_SKIP_${PN} = "already-stripped"
> +INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

