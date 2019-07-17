Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7616E00BF7; Tue, 16 Jul 2019 18:28:10 -0700 (PDT)
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
	*      [209.85.222.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADFDEE00B33
	for <meta-ti@yoctoproject.org>; Tue, 16 Jul 2019 18:28:09 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id d15so16182704qkl.4
	for <meta-ti@yoctoproject.org>; Tue, 16 Jul 2019 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tRq2CmYsImmU/EVsFUIB/7h1ZjvsHu9bCXWd6/Fuz/M=;
	b=nc+gm1LyZhCvECYWH3lLqUJThJDnZxffynauonT3Q5qlC7QFCSR7j/mfxLC1s4Cajd
	6HkJhFFlLbdQjLnlBOWXxM9SxMJCUrkrZurIS9yJuPat4hn45p5ZgsSsv50jUd+9U2gX
	WlJqe5dLJ1AoYNjjupogYCAnNuPKp9iMcgH1NFQvuwvi9GuNWS2ehqKDd2penmZHWNbn
	xQLQBW1Tk9YcQ6mRWvh8FFPLMf3kn6+lBOKt/VPRyroRmFCwHhI7XZPOuPRaAXe68U/V
	Q9zVDSpnVbqjWvyxxLmpUwrvSfhrMt6QA3251Cp2zCypD1dJg5ZvR3qRM9Q7mgOCw0+p
	z4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tRq2CmYsImmU/EVsFUIB/7h1ZjvsHu9bCXWd6/Fuz/M=;
	b=JJ5uwYqTdIP8iS/Wu+Q6z0kKrwa8+CLv6bkHuYG+4BzYfMbL5Lrrg4ovDQIintVyzX
	sLgcCEUuahBB0LhmAC4dmrmfAKTPlcImq+IXfuom5DTClqq+zBWsl2rQY8ovsyQcZz7J
	9J3F9rK7bHjZyYWurisMsdoyZ59ItdMa5L6gFJZDbthfpwRMaoAuHe4u+QmhvgIs8Jtj
	wRRyYBS5R7rEQjxmDc9G5i+fT+J24v8G/XF4171AgHSkeGPFVFYeX9OtCU87C9doh9P6
	dnd3jCzsXyjUJzgesfg21UVPfu+1B9WG2fmRHVj2Sw0ZmIVGrKHY1Pn7Hq5nKpdUxRG4
	y9Dw==
X-Gm-Message-State: APjAAAXSfiUu2TJkeTbanI/N1YQJg2raVz+3S8D1/kYhWGFPdkO011W7
	u8Hr+Bgw0YBZ2rqgerfoOUSu0kZ4xv4ZK21oM7w=
X-Google-Smtp-Source: APXvYqyAhdHxQsEmNNWh1WaQ5fiJ9MoJ154OSmSpvCg4dVAT1XHSlbXIzGuF2+iggSgdpFjn1qq7BC67yl7Au3wPwL8=
X-Received: by 2002:a37:c81:: with SMTP id 123mr24752620qkm.474.1563326888580; 
	Tue, 16 Jul 2019 18:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190713005955.6870-1-raj.khem@gmail.com>
	<20190713005955.6870-2-raj.khem@gmail.com>
	<20190715200151.GH9038@beryl>
In-Reply-To: <20190715200151.GH9038@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 18:27:42 -0700
Message-ID: <CAMKF1sr2w=Pd7-ccVTSCbSdjLZtSDXORTk0tyUn+b=1QaB7-CQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] amx3-cm3,u-boot-ti: Pin to gcc compiler
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
X-List-Received-Date: Wed, 17 Jul 2019 01:28:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 15, 2019 at 1:01 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Fri, Jul 12, 2019 at 05:59:55PM -0700, Khem Raj wrote:
> > Using clang as default compiler fails to build these
> > since these packages explicitly asks for gcc as compiler
> > this ensures that we meet that demand
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 2 ++
> >  recipes-bsp/u-boot/u-boot-ti.inc            | 3 +++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> > index 79166ca9..196b11b9 100644
> > --- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> > +++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> > @@ -26,3 +26,5 @@ do_install() {
> >  FILES_${PN} += "${base_libdir}/firmware"
> >
> >  COMPATIBLE_MACHINE = "(ti-soc)"
> > +TOOLCHAIN = "gcc"
> > +
> > diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> > index b66a7a6f..36746826 100644
> > --- a/recipes-bsp/u-boot/u-boot-ti.inc
> > +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> > @@ -370,3 +370,6 @@ do_deploy_append_keystone () {
> >               fi
> >       fi
> >  }
> > +
> > +TOOLCHAIN = "gcc"
> > +
>
> Applying: amx3-cm3,u-boot-ti: Pin to gcc compiler
> .git/rebase-apply/patch:15: new blank line at EOF.
> +
> .git/rebase-apply/patch:26: new blank line at EOF.
> +
> warning: 2 lines add whitespace errors.

usually git can squelch those

