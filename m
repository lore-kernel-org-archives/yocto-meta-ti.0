Return-Path: <pabigot@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A140E0123C
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 26 Dec 2011 18:30:45 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by werm12 with SMTP id m12so6480286wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 26 Dec 2011 18:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=TFgc03j40yHGSQBTuY7VSFE/ykGIwogMBCYRSGvRkM8=;
	b=b2dxFDO+uXqhhmDFipxPXeNFkIAkgvlXm/u7g791tVIHedvMthPvnNXoPu318O9KsL
	i9hzIoUBxd501aeG4vbNpX9SiOug9YAf3qC/9nGT5K+4YSk6qYbngkxgF1thaZ3ANHgN
	hr2MrWuRu8Ugx8AsSGDq1gyL6ff60ah4wQeZ0=
MIME-Version: 1.0
Received: by 10.216.133.29 with SMTP id p29mr14616171wei.49.1324953043614;
	Mon, 26 Dec 2011 18:30:43 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Mon, 26 Dec 2011 18:30:43 -0800 (PST)
In-Reply-To: <1324568025-24923-2-git-send-email-koen@dominion.thruhere.net>
References: <1324568025-24923-1-git-send-email-koen@dominion.thruhere.net>
	<1324568025-24923-2-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 26 Dec 2011 20:30:43 -0600
X-Google-Sender-Auth: w6fkBSA_7gjVkHF8MClmTj92Y6Y
Message-ID: <CAPOJ94N912prRNSmFg4+wiV27pVEoQPCbqg50hbawAWYP-w-ng@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 2/2] ti-cgt6x: add 7.2.7
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
X-List-Received-Date: Tue, 27 Dec 2011 02:30:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 9:33 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0recipes-ti/devtools/ti-cgt6x_7.2.7.bb | =A0 11 +++++++++++
> =A01 files changed, 11 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes-ti/devtools/ti-cgt6x_7.2.7.bb

When I build under Fedora 15 do_unpack ends up putting the
installation in /opt/TI/TI_CGT_C6000_7.2.7, causing do_configure to
fail with:

NOTE: Checking autotools environment for common misconfiguration
ERROR: Function 'ti-cgt6x: LIC_FILES_CHKSUM points to an invalid file:
/prj/oe/bb/build/tmp-eglibc/work/armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7=
_2_7-r4/cgt6x_7_2_7/LICENSE.txt'
failed

Changing ti-eula-unpack to use the --installto option instead of HOME=3D
gets it unpacked in ${WORKDIR}/TI_CGT_C6000_7.2.7 instead of
${WORKDIR}/cgt6x_7_2_7, which is closer but still doesn't work.

Peter

> diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/=
ti-cgt6x_7.2.7.bb
> new file mode 100644
> index 0000000..aab1b96
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
> @@ -0,0 +1,11 @@
> +require ti-cgt6x.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D62f46f1125a152a2e213b414d=
b7ac600"
> +
> +PE =3D "1"
> +PV =3D "7_2_7"
> +PVwithdots =3D "7.2.7"
> +
> +SRC_URI[cgt6xbin.md5sum] =3D "71a0768a541fdebd9c35d44301019d1d"
> +SRC_URI[cgt6xbin.sha256sum] =3D "211477f0142d603975544abe3c45cc3b77a3b38=
038158676c60812806378738b"
> +
> --
> 1.7.2.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

