Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BF58E00A4C; Mon, 21 Oct 2019 14:33:07 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F4005E00839
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2019 14:33:06 -0700 (PDT)
Received: by mail-qt1-f195.google.com with SMTP id g50so9345538qtb.4
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2019 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gYQi8KF4MIimdiulQ753nlQ9EqeFe7OfSxZ4escUTH4=;
	b=YDmALy4M920z1UgG6HKq1yYpXC3+cJ/EvX3UuWYlZyy1+72+y1MiP6jwThi+JuSW9V
	vVZPcFi8hyXe0wIznyN9HlsAHY2sVfrEJZbnC2xn8Wu7GKobC1qyn1sNMTbDkrvCqxjQ
	KgIVLY/OusaozMrqKZ38E/mwPDZH2s/shoky3XPTED4EgEsF49LzP2VbmpTAMqoCmapP
	valHgbaKfkOZ4oGQFhdwlCVU23tGy7fy72olpwq5gKJMcfY9sl2rgRsAJ40aH+TwX+pA
	CNy2A2KQijlHOGXw0U4FgQL/AABnQim51FuhSL++H27F2C25q1Bvw3itSWIInT0vyMJD
	Ehpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gYQi8KF4MIimdiulQ753nlQ9EqeFe7OfSxZ4escUTH4=;
	b=d8BQS+Qh2CnIXZrZGuhpktG0RKFCUCCRsqEeLWhkyiDaVxr/YV+gKXi9RumJ05oPis
	D23eJINQuYpCEwVs+dQtMTu71OYSnoz7ylxWLbLqbGZ+TpacZFQy0TXgy86qpY5cwSr1
	QJKTJUeYBukteyvl888dIoG5Ga3KEiPEkmqTD3KgEw1AvDj94bDnqOtVWa4KgeLYIXei
	h88IfRlFH3BUs/iFJz5jxgYQrKHK2Kv5s7rVrt9daFLg9xnEfffxotY3zpqEdH4RDJhU
	ed3niEOP8hz3jcATPo0jPLtN1S3kOyGpG1EHh5pGtl3lAgOjQXkSvGlDXgnymBMmdshu
	4lUw==
X-Gm-Message-State: APjAAAUq1DNhdfZ0VG8o2R0OlPN8KGI3FnOUMtBJOQOpe+w9d2BpFjhX
	+mHaWpfKxeHtFazWBnN2q0X0e4upAwJuJEoyrl0=
X-Google-Smtp-Source: APXvYqwYiHQ83+qarYEGKfg9Q+ywJoeQQfzIQirf+YR0u/3TBhw636hS3Aht81wUYVmH3tFNahZE0vq6zvXy29KJ8Fc=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr27074273qtr.378.1571693584737;
	Mon, 21 Oct 2019 14:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191017174109.17002-1-denys@ti.com>
In-Reply-To: <20191017174109.17002-1-denys@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2019 14:32:38 -0700
Message-ID: <CAMKF1srJazaTzus6_Oq+F_6A74qk6JXuzd3EHMiR5uv0Gmy0Yg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH] ti-display-sharing-fw: update to 06.01.00.00
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
X-List-Received-Date: Mon, 21 Oct 2019 21:33:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 17, 2019 at 10:58 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../ti-display-sharing-fw/ti-display-sharing-fw_git.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
> index db095d90..9115b6b4 100644
> --- a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
> +++ b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "TI Display Sharing Firmware"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>
> -PV = "00.09.00.00-git${SRCPV}"
> +PV = "06.01.00.00+git${SRCPV}"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  inherit deploy
> @@ -11,7 +11,7 @@ inherit update-alternatives
>
>  PROTOCOL = "git"
>  BRANCH = "ti-linux-firmware"
> -SRCREV = "4a86f16df9b44798851e51fa465825710cda76cf"
> +SRCREV = "e7be1ab85266c47236330e2909997d20fc62e312"
>

I get

Cloning into bare repository
'TOPDIR/downloads/git2/git.ti.com.processor-firmware.ti-linux-firmware.git'...
fatal: unable to connect to git.ti.com:
git.ti.com[0: 198.47.28.207]: errno=Connection refused


ERROR: Fetcher failure for URL:
'git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=ti-linux-firmware'.
Unable to fetch URL from any source.

is this temporary ?

>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=${PROTOCOL};branch=${BRANCH}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

