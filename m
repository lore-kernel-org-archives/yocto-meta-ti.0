Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8A29E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 14:12:11 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so4752242vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 14:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XHzbWtVtxSITa4v+2sO5OopBUxOWB3RlTzlajMpEpuw=;
	b=rJCkFeYlO3w1aprUoSzfl4IAdTRMXMLPib27z3qlds6tdKswW2zX33ugvmZOrGIDDT
	aup2dLqET0WVtFlB0cBtpi8TAMttXTjrWghRpQdcNLu/kywo21ljvT5PcSZn+fshngNm
	XQ0fks9ISilaDDZTFUkiX8sKH3mmy97LpHW3UlI3+cBt1lKsqneOAjCCFA7BWv31Txgg
	cPpq1QpzQg5Ul52aM+oEyM4H896YrjaUFLSHQuJAipUa+BpWemsESvYejsK9lnVGsnm7
	BItn0XeUAl7IGiDdYi6Wv8JvAKoaA4FXhDx5Glsq9Yhjutuc/D8a1IWAiS1Pfi0TSBcd
	XLcA==
Received: by 10.58.132.239 with SMTP id ox15mr3203861veb.59.1350076330983;
	Fri, 12 Oct 2012 14:12:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Fri, 12 Oct 2012 14:11:50 -0700 (PDT)
In-Reply-To: <20121012205355.GD32601@denix.org>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
	<20121012205355.GD32601@denix.org>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 12 Oct 2012 23:11:50 +0200
Message-ID: <CAOT3miKQiE18HUPtFZBGctYdB4Kb2A_WOjStdy+RegPmOtM3Jw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Fri, 12 Oct 2012 21:12:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 12, 2012 at 10:53 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
> https://github.com/rvfh/meta-ti/commit/6342c03a0dba7d906db09630e57e2372998428df
>
> The recipe itself is quite trivial (I even had my own version in the works)
> and I only have couple minor fixes around SRCREV and its comment... But have
> you compared the defconfigs between those two patches? I know the first
> version of your patch used completely different unofficial defconfig... And
> you didn't specify which one you have in v2. I'd prefer to use the defconfig
> that was validated by the GLP team. Thanks.

i would still prefer that we create a somehow minimalist defconfig, i
don't think using the 'monster' ubuntu defconfig (it has hundreds of
drivers enabled....) makes too much sense for meta-ti. we used that
because it was simpler for now, but I would hold on that patch until
we have a simpler config. in fact we have already a config in the tree
called omap4plus_defconfig, we will base on that one instead.

also we should wait until we have GST and GFX up and running before
merging the kernel, to avoid a couple of iterations.

