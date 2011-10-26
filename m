Return-Path: <jkridner@beagleboard.org>
Received: from mail-qy0-f176.google.com (mail-qy0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5711EE006B4
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 07:55:18 -0700 (PDT)
Received: by qyk30 with SMTP id 30so2224410qyk.14
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 07:55:17 -0700 (PDT)
Received: by 10.229.28.147 with SMTP id m19mr6563200qcc.247.1319640916858;
	Wed, 26 Oct 2011 07:55:16 -0700 (PDT)
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by mx.google.com with ESMTPS id em9sm2275989qab.10.2011.10.26.07.55.15
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 07:55:15 -0700 (PDT)
Received: by ywm14 with SMTP id 14so2146792ywm.35
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 07:55:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.76.38 with SMTP id a26mr47326320yhe.53.1319640914821; Wed,
	26 Oct 2011 07:55:14 -0700 (PDT)
Received: by 10.147.136.2 with HTTP; Wed, 26 Oct 2011 07:55:14 -0700 (PDT)
In-Reply-To: <1319638719-31001-1-git-send-email-joelagnel@ti.com>
References: <1319638719-31001-1-git-send-email-joelagnel@ti.com>
Date: Wed, 26 Oct 2011 10:55:14 -0400
Message-ID: <CA+T6QPkgA835mxsxdyrVXD=yU3MRMg-cdxEQa8vQ4bN2m3cH=g@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Joel A Fernandes <joelagnel@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 14:55:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2011 at 10:18 AM, Joel A Fernandes <joelagnel@ti.com> wrote=
:
> Enable the PL2303 usb-to-serial driver required for serial output
> from the beaglebone tester.
>
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>

Acked-by: Jason Kridner <jdk@ti.com>

> ---
> v2 Changes: Enabled as a module
>
> =A0.../linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig | =A0 =A03 ++-
> =A0recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb =A0| =A0 =A02 +-
> =A02 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/de=
fconfig b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconf=
ig
> index 4b3c21d..4508d22 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> @@ -2558,7 +2558,8 @@ CONFIG_USB_LIBUSUAL=3Dy
> =A0# USB port drivers
> =A0#
> =A0# CONFIG_USB_USS720 is not set
> -# CONFIG_USB_SERIAL is not set
> +CONFIG_USB_SERIAL=3Dm
> +CONFIG_USB_SERIAL_PL2303=3Dm
>
> =A0#
> =A0# USB Miscellaneous drivers
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb b/recipes-=
kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> index bffebea..fbee01f 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> @@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX =3D ""
>
> =A0BRANCH =3D "master"
> =A0SRCREV =3D "1955a86594526e18f03c8d62db81119ffc4ccf0f"
> -MACHINE_KERNEL_PR_append =3D "k+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append =3D "l+gitr${SRCREV}"
>
> =A0COMPATIBLE_MACHINE =3D "(ti33x)"
>
> --
> 1.7.0.4
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

