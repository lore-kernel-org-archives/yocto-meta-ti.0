Return-Path: <pabigot@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9A99E0123C
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 26 Dec 2011 19:00:51 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wibhq2 with SMTP id hq2so5710105wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 26 Dec 2011 19:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=BJVWAIdqe+edGv4+9OJqKce8OwUltjN7S4djdbuJJ4w=;
	b=icSY6zGqBtmjfwXGHqltywiooopp0J6Sgm4rzhgI8IKTMNh+hGGCPspGJiRVBC3ngh
	DMuPsFL4S5/wqwvm80mNFwAbUBhSRt5vF26dI4lzzGMBV+KFVr9EzvnkYCxGm1mtEpMZ
	Tphx5Q5oWytVej6d5CBjJoPqzH5KCDGRa5LqA=
MIME-Version: 1.0
Received: by 10.216.134.71 with SMTP id r49mr19763894wei.49.1324954849848;
	Mon, 26 Dec 2011 19:00:49 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Mon, 26 Dec 2011 19:00:49 -0800 (PST)
In-Reply-To: <1324311340-16981-2-git-send-email-koen@dominion.thruhere.net>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
	<1324311340-16981-2-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 26 Dec 2011 21:00:49 -0600
X-Google-Sender-Auth: _HswvzV8wCM6t0CmSza89dUwwYk
Message-ID: <CAPOJ94MifC47Lu8tNfia+f9jG2+syzxDSe3cKYOfKn9nSiONHA@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 2/5] ti-xdctools: update to 3.23.00.32
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
X-List-Received-Date: Tue, 27 Dec 2011 03:00:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2011 at 10:15 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0recipes-ti/devtools/ti-xdctools.inc =A0 =A0 =A0 =A0 =A0 | =A0 =A06 +--=
---
> =A0recipes-ti/devtools/ti-xdctools_3.20.06.81.bb | =A0 14 --------------
> =A0recipes-ti/devtools/ti-xdctools_3.23.00.32.bb | =A0 11 +++++++++++
> =A03 files changed, 12 insertions(+), 19 deletions(-)
> =A0delete mode 100644 recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
> =A0create mode 100644 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
>
> diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti=
-xdctools.inc
> index 120ebaa..c76ad80 100644
> --- a/recipes-ti/devtools/ti-xdctools.inc
> +++ b/recipes-ti/devtools/ti-xdctools.inc
> @@ -1,11 +1,7 @@
> =A0DESCRIPTION =3D "TI XDCtools (RTSC - Real Time Software Components - h=
ttp://rtsc.eclipse.org)"
> =A0HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/tar=
getcontent/rtsc"
> =A0SECTION =3D "devel"
> -LICENSE =3D "BSD, GPLv2"
> -
> -LIC_FILES_CHKSUM =3D "file://docs/license/xdc/shelf/package.html;md5=3De=
ace8fa313a140ef178ecfa0f53cc655"
> -
> -PR =3D "r2"
> +LICENSE =3D "BSD & GPLv2"
>
> =A0require ../includes/ti-paths.inc
> =A0require ../includes/ti-staging.inc
> diff --git a/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb b/recipes-ti/d=
evtools/ti-xdctools_3.20.06.81.bb
> deleted file mode 100644
> index 45bedaa..0000000
> --- a/recipes-ti/devtools/ti-xdctools_3.20.06.81.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require ti-xdctools.inc
> -
> -PV =3D "3_20_06_81"
> -
> -# This fixes c6accel, but breaks codec-engine and lpm
> -#SRC_URI +=3D "file://arm-linker-hack.diff"
> -
> -SRC_URI +=3D "file://fix-hardcoded-paths.diff"
> -
> -SRC_URI[xdcbin.md5sum] =3D "65151268d6be6ad6eb940ef7ed03af16"
> -SRC_URI[xdcbin.sha256sum] =3D "8ea6b851521ce41fe0b4a349b2d922af7e70f48c5=
0ad9fd21f62627446a834f8"
> -
> -
> -
> diff --git a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb b/recipes-ti/d=
evtools/ti-xdctools_3.23.00.32.bb
> new file mode 100644
> index 0000000..b2db76c
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
> @@ -0,0 +1,11 @@
> +require ti-xdctools.inc
> +
> +PV =3D "3_23_00_32"
> +LIC_FILES_CHKSUM =3D "file://docs/license/xdc/shelf/package.html;md5=3D4=
9b2dfbf48860a0da844709c3ce63a9c"
> +
> +SRC_URI +=3D "file://fix-hardcoded-paths.diff"

When I build this one, the patch fails because there's no
packages/gnu/targets/ITarget.xs anywhere in the work area at the point
the patch is run.  Which may be because the do_unpack log shows:

invalid command name "wm"
    while executing
"wm state $parent"
    (procedure "::InstallJammer::TransientParent" line 31)
    invoked from within
"::InstallJammer::TransientParent"
    (procedure "::InstallJammer::SetDialogArgs" line 5)
    invoked from within

Presumably some native requirement is missing.

Peter

> +
> +SRC_URI[xdcbin.md5sum] =3D "263aa11795670265551d36a8c77ad27d"
> +SRC_URI[xdcbin.sha256sum] =3D "880b4e263850f2a3c0ea7352c5b6e0a86692361e2=
6634c3b70dddc42c71231a5"
> +
> +S =3D "${WORKDIR}/ti/xdctools_${PV}"
> --
> 1.7.2.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

