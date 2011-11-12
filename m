Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f41.google.com (mail-qw0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 283F9E006AF
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 20:04:42 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qam6 with SMTP id 6so111979qam.14
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 20:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=D4oMDMzuq/AFd7M84wWev2ih3t/LL+hVdXoGP+4q3Ag=;
	b=mX/U+VaLqkIinU5a219ppw/a+rvdiIrfLl82Fp+HGeJC0B69PaFYEdSYgS2wOOsXeB
	Ij4D//L+UueASCN4OAp3jFyOFupM1USeQhAhJddhwVD/4qNyNtSWVRI8a2203s1iQcWz
	nV54zkOeNEVFZZEYxEjziYt6sItrGsIAP6fNk=
MIME-Version: 1.0
Received: by 10.229.52.143 with SMTP id i15mr2264353qcg.188.1321064971579;
	Fri, 11 Nov 2011 18:29:31 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Fri, 11 Nov 2011 18:29:31 -0800 (PST)
In-Reply-To: <CAPOJ94PgPPcxmf08_9dSnCro1k1RS8SXrKc0yONRPEyxN4cqtA@mail.gmail.com>
References: <1321040836-29819-1-git-send-email-bigotp@acm.org>
	<DF9F3F54-64A1-467E-B9C1-BFD29A4AE722@dominion.thruhere.net>
	<CAPOJ94PgPPcxmf08_9dSnCro1k1RS8SXrKc0yONRPEyxN4cqtA@mail.gmail.com>
Date: Fri, 11 Nov 2011 19:29:31 -0700
Message-ID: <CA+M6bXmOxofjV5yfxiL2eaymQiPUV3+YZKgNByCTiFQPtHp4fw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Peter Bigot <bigotp@acm.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sdcard_image bbclass: correct MLO path in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Sat, 12 Nov 2011 04:04:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 1:02 PM, Peter Bigot <bigotp@acm.org> wrote:
> On Fri, Nov 11, 2011 at 1:51 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>
>> Op 11 nov. 2011, om 20:47 heeft Peter A. Bigot het volgende geschreven:
>>
>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>
>>> The symlink created by x-load.inc for MLO in ${DEPLOY_DIR_IMAGE} includ=
es
>>> ${MACHINE}.
>>
>> This will break SPL builds, a better idea would be to patch the xloader =
recipe to generate a MLO symlink as well. It's on my todo do fix xload, ubo=
ot(spl) and kernel to generate ready-to-use link like uImage, MLO and u-boo=
t.{img,bin}. If someone beats me to it, great :)
>
> As far as I can tell nobody would ever put an unadorned "MLO" into the
> deploy directory (vice the install directory, which does get plain
> MLO), so I can't see how the else branch could ever have worked, at
> least not for MACHINE=3Dbeagleboard. =A0Must be more hidden magic
> somewhere.

I suspect the answer there is lots of building for beaglebone instead
recently.  For beagleboard I'd rather see us pull in my SPL patches
and drop x-load :)

http://patchwork.ozlabs.org/bundle/trini/add-more-framework-to-omap3-spl-v3=
/

--=20
Tom

