Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40A36E00DF1; Wed, 24 Jul 2019 11:50:50 -0700 (PDT)
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
	*      [209.85.160.181 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC235E00D90
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 11:50:49 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id n11so46536044qtl.5
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+iQv3hc6dnVijJRfz21v9dfefKd+KS5dokUq6feUx98=;
	b=HnSIIqeZ63z60V83ZDfvDxXI+YyeSsf+3LmoFXzmENa/WCaRBrKNSnz7sAJuykZnOj
	UVTRIMWLVo2NMC4i9hClO84KiYDmEFs7nsQUa7sHXZus28YGJyMlEurksetoBICyohR3
	OEaeDsZd7YHfAxkyLvCaRWTl9ohjFwXrPOEmMnasHQDfjScbYexytS346xAbUBuWlxBw
	eXTmhzFMNl3QyVMYTNZChavW8UCBQsEJWbCHq21tzzE5m94E19fWTZafHPZQ9ws7K+dH
	XCUNDzngKYfL1LiUBbCWpgxHs5TVchi7Q1Ja867HDmuVI0uKsgjp8lcfMi1gh/aTtomR
	sMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+iQv3hc6dnVijJRfz21v9dfefKd+KS5dokUq6feUx98=;
	b=EFx6/Cua7BFDVZdFFRdkAoTVEN3VD2j7ymVtl48xcEiMtgpgPBKpsw3XiPcDAF8EHY
	xMgSG8ivzZqaFgFtxiZW527yJOvvyjKkspZhL8Rwo1N+F4RTj3VoZamebqj7f+LTTBgT
	ocjAiV7wWQKDyLF8ueyXpfNAGewA8+sUtFm7QtRn5LlFp0qODoXvWhxFrEQP/c8zIfdh
	Z4GfuRoYfTatjJBe/R/hYcS6qgY6iLnrzSCSRsDzkAcYnOwsMhyXjKrPbhFkaQ8j9TLU
	+74EPo01EoUwlw8X7CusECiDLeIQDVRwH64YaR6ttDeNupRGeG44MbeflkebB1OhNOVt
	Enrg==
X-Gm-Message-State: APjAAAWef5F3pInjpWjCrN8dLEMjT1nLcH7EOx3HVO3vbW1/Fhapu/IW
	0LYdn83FwMuZKJuEIuaOQgrrP7VQgTgN5P8aqg0=
X-Google-Smtp-Source: APXvYqz3tw4qpfxYVqrioGJjEdP+BeKlFWtuPtGI619qSzOjGPGdyLkOQf0NoTUSC/WSqwu/WsfmX/K+z85csM3KO/M=
X-Received: by 2002:ad4:4112:: with SMTP id i18mr60698718qvp.175.1563994248701;
	Wed, 24 Jul 2019 11:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srNYsmfwbARgY==LJURLeno6twZd21K9kH4mH7rTkpyhg@mail.gmail.com>
	<20190724183836.GC5700@beryl>
In-Reply-To: <20190724183836.GC5700@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 11:50:22 -0700
Message-ID: <CAMKF1sqZrgMxLWUrVyDHCNX=JjpuN=ZpOYRQPqHs+iY8PvsFsQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: WARNING: ti-cgt6x-1_8.3.2-r0 do_populate_lic: ti-cgt6x: No generic license file exists for: Patrick-Powell in any provider
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
X-List-Received-Date: Wed, 24 Jul 2019 18:50:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 11:38 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> Yes, this is well known. I haven't had much luck finding the proper license
> text when I looked at it quite a while ago, so it's been on back-burner since.
>

OK, thats good to know, It will be good to have it since one can read
through and see
what obligations are needed to fulfilled.

> --
> Denys
>
>
> On Wed, Jul 24, 2019 at 08:51:06AM -0700, Khem Raj wrote:
> > Hi
> >
> > Couple of recipes list Patrick-Powell in LICENSE filed but there is no
> > file pertaining to this license
> > in the license/ folder. This is flagged by build
> >
> > WARNING: ti-cgt6x-1_8.3.2-r0 do_populate_lic: ti-cgt6x: No generic
> > license file exists for: Patrick-Powell in any provider
> >
> > here are recipes
> >
> >
> > recipes-ti/devtools/ti-cgt-arm.inc:LICENSE = "(TI-TSPA &
> > Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
> > Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD &
> > BSD-4-Clause"
> > recipes-ti/devtools/ti-cgt6x_8.3.2.bb:LICENSE = "(TI-TSPA &
> > Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
> > Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
> >
> > Thanks
> > -Khem
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

